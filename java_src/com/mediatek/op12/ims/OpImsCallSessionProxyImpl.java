package com.mediatek.op12.ims;

import android.bluetooth.BluetoothHeadset;
import android.bluetooth.BluetoothProfile;
import android.content.Context;
import android.media.ToneGenerator;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.telephony.Rlog;
import android.telephony.ims.ImsReasonInfo;
import com.mediatek.ims.SipMessage;
import com.mediatek.ims.ext.OpImsCallSessionProxyBase;
import com.mediatek.ims.internal.IMtkImsCallSession;
import com.mediatek.ims.ril.ImsCommandsInterface;

public class OpImsCallSessionProxyImpl extends OpImsCallSessionProxyBase {
    private static final int CALL_DIRECTION_MO = 0;
    private static final int CALL_DIRECTION_MT = 1;
    private static final int CALL_STATUS_ACTIVE = 1;
    private static final int CALL_STATUS_ATTEMPTING = 2;
    private static final int CALL_STATUS_HOLD = 3;
    private static final int CALL_STATUS_INACTIVE = 0;
    private static final int CALL_TYPE_EMERGENCY = 0;
    private static final int CALL_TYPE_VIDEO = 2;
    private static final int CALL_TYPE_VOICE = 1;
    private static final int EVENT_BUSY_TONE_TIMEOUT = 1;
    private static final int EVENT_INCOMING_CALL_INDICATION = 2;
    private static final boolean MDMI_SUPPORT = false;
    private static final int RAT_INFO_CDMA = 4;
    private static final int RAT_INFO_GSM = 1;
    private static final int RAT_INFO_LTE = 3;
    private static final int RAT_INFO_NO_SERVICE = 0;
    private static final int RAT_INFO_UMTS = 2;
    private static final int RAT_INFO_WIFI = 5;
    private static final String TAG = "Op12ImsCallSessionProxyImpl";
    private static final int TONE_RELATIVE_VOLUME_HIPRI = 80;
    private BluetoothHeadset mBluetoothHeadset;
    private BluetoothProfile.ServiceListener mBluetoothProfileServiceListener = new BluetoothProfile.ServiceListener() {
        /* class com.mediatek.op12.ims.OpImsCallSessionProxyImpl.AnonymousClass2 */

        public void onServiceConnected(int profile, BluetoothProfile proxy) {
            OpImsCallSessionProxyImpl.this.mBluetoothHeadset = (BluetoothHeadset) proxy;
            Rlog.d(OpImsCallSessionProxyImpl.TAG, "got BluetoothHeadset: " + OpImsCallSessionProxyImpl.this.mBluetoothHeadset);
        }

        public void onServiceDisconnected(int profile) {
            OpImsCallSessionProxyImpl.this.mBluetoothHeadset = null;
        }
    };
    private int mBusyToneTimeout = 30000;
    int mCallStatus = 0;
    private Context mContext;
    private Handler mHandler = new Handler(Looper.getMainLooper()) {
        /* class com.mediatek.op12.ims.OpImsCallSessionProxyImpl.AnonymousClass1 */

        public void handleMessage(Message msg) {
            Rlog.d(OpImsCallSessionProxyImpl.TAG, "handleMessage(): " + msg.what);
            int i = msg.what;
            if (i == 1 || i == 2) {
                OpImsCallSessionProxyImpl.this.processCallTerminated();
            }
        }
    };
    private boolean mHandlingCallStartFailed;
    private ImsCommandsInterface mImsRIL;
    private IMtkImsCallSession mMtkImsCallSession;
    private int mSipErrCode = -1;
    private ToneGenerator mToneGenerator;

    public OpImsCallSessionProxyImpl(Context context) {
        this.mContext = context;
        Rlog.d(TAG, "OpImsCallSessionProxyImpl");
    }

    public ImsReasonInfo getImsReasonInfo(SipMessage sipMsg) {
        ImsReasonInfo info = null;
        if (sipMsg.getMethod() == 1) {
            this.mSipErrCode = sipMsg.getCode();
            if (sipMsg.getCode() == 486) {
                info = new ImsReasonInfo(338, 0, sipMsg.getReasonHeader());
            }
        }
        Rlog.d(TAG, "getImsReasonInfo(): " + info);
        return info;
    }

    public boolean handleCallStartFailed(IMtkImsCallSession imsCallSession, Object imsRILAdapter, boolean hasHoldingCall) {
        if (this.mSipErrCode != 486) {
            return MDMI_SUPPORT;
        }
        Rlog.d(TAG, "handleCallStartFailed()");
        this.mHandlingCallStartFailed = true;
        this.mMtkImsCallSession = imsCallSession;
        this.mImsRIL = (ImsCommandsInterface) imsRILAdapter;
        registerForIncomingCall();
        if (hasHoldingCall) {
            this.mBusyToneTimeout = 5000;
        }
        startBusyTone();
        this.mHandler.sendEmptyMessageDelayed(1, (long) this.mBusyToneTimeout);
        return true;
    }

    public boolean handleHangup() {
        if (!this.mHandlingCallStartFailed) {
            return MDMI_SUPPORT;
        }
        Rlog.d(TAG, "handleHangup()");
        processCallTerminated();
        return true;
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void processCallTerminated() {
        this.mHandler.removeCallbacksAndMessages(null);
        stopBusyTone();
        unregisterForIncomingCall();
        IMtkImsCallSession iMtkImsCallSession = this.mMtkImsCallSession;
        if (iMtkImsCallSession != null) {
            try {
                iMtkImsCallSession.callTerminated();
            } catch (RemoteException e) {
                Rlog.e(TAG, "RemoteException callTerminated()");
            }
        }
    }

    private void registerForIncomingCall() {
        ImsCommandsInterface imsCommandsInterface = this.mImsRIL;
        if (imsCommandsInterface != null) {
            imsCommandsInterface.setOnIncomingCallIndication(this.mHandler, 2, (Object) null);
        }
    }

    private void unregisterForIncomingCall() {
        ImsCommandsInterface imsCommandsInterface = this.mImsRIL;
        if (imsCommandsInterface != null) {
            imsCommandsInterface.unsetOnIncomingCallIndication(this.mHandler);
        }
    }

    private void startBusyTone() {
        Rlog.d(TAG, "startBusyTone()");
        int stream = 0;
        BluetoothHeadset bluetoothHeadset = this.mBluetoothHeadset;
        if (bluetoothHeadset != null && bluetoothHeadset.isAudioOn()) {
            stream = 6;
        }
        ToneGenerator toneGenerator = new ToneGenerator(stream, TONE_RELATIVE_VOLUME_HIPRI);
        this.mToneGenerator = toneGenerator;
        toneGenerator.startTone(17);
    }

    private void stopBusyTone() {
        Rlog.d(TAG, "stopBusyTone()");
        ToneGenerator toneGenerator = this.mToneGenerator;
        if (toneGenerator != null) {
            toneGenerator.stopTone();
            this.mToneGenerator.release();
            this.mToneGenerator = null;
        }
    }

    public void sendCallEventWithRat(Bundle extras) {
    }
}
