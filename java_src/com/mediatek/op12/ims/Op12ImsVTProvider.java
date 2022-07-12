package com.mediatek.op12.ims;

import android.telecom.VideoProfile;
import android.util.Log;
import com.mediatek.ims.internal.ImsVTProvider;

public class Op12ImsVTProvider extends ImsVTProvider {
    private static final String TAG = "Op12ImsVT";
    private boolean mIsResumedDuringBG = false;
    private boolean mNeedSendPause = false;
    private boolean mNeedSendResume = false;
    private VideoProfile mPauseResumeProfile = null;

    public Op12ImsVTProvider() {
        Log.d(TAG, "Create Op12ImsVTProvider done");
    }

    /* access modifiers changed from: protected */
    public void sendFgBgSessionModifyRequestInternal(VideoProfile fromProfile, VideoProfile toProfile, int mode, boolean needNotify) {
        Log.d(TAG, "[ID=" + this.mId + "] [sendFgBgSessionModifyRequestInternal] Start mode = " + mode);
        Log.d(TAG, "[ID=" + this.mId + "] [sendFgBgSessionModifyRequestInternal] fromProfile:" + fromProfile.toString());
        Log.d(TAG, "[ID=" + this.mId + "] [sendFgBgSessionModifyRequestInternal] toProfile:" + toProfile.toString());
        Op12ImsVTProvider.super.sendFgBgSessionModifyRequestInternal(fromProfile, toProfile, mode, false);
        if (isDuringNotAppDowngrade()) {
            Log.d(TAG, "[ID=" + this.mId + "] [sendFgBgSessionModifyRequestInternal] During Not App Downgrade");
            return;
        }
        if (mode == 1) {
            this.mNeedSendPause = true;
            this.mPauseResumeProfile = toProfile;
        } else if (mode == 0) {
            if (this.mNeedSendPause) {
                this.mNeedSendPause = false;
                this.mPauseResumeProfile = null;
                Log.d(TAG, "[ID=" + this.mId + "] [sendFgBgSessionModifyRequestInternal] Cancel send Pause");
                return;
            }
            this.mNeedSendResume = true;
            this.mPauseResumeProfile = toProfile;
        }
        if (isDuringSessionModify()) {
            Log.d(TAG, "[ID=" + this.mId + "] [sendFgBgSessionModifyRequestInternal] Return due to during session modify");
            return;
        }
        sendBgPauseOrFgResume();
        Log.d(TAG, "[ID=" + this.mId + "] [sendFgBgSessionModifyRequestInternal] Finish");
    }

    public void receiveSessionModifyResponseInternal(int status, VideoProfile requestedProfile, VideoProfile responseProfile) {
        Op12ImsVTProvider.super.receiveSessionModifyResponseInternal(status, requestedProfile, responseProfile);
        if (status == 1) {
            this.mCurrentProfile = responseProfile;
        }
        sendBgPauseOrFgResume();
    }

    public void sendSessionModifyResponseInternal(VideoProfile responseProfile) {
        Op12ImsVTProvider.super.sendSessionModifyResponseInternal(responseProfile);
        this.mCurrentProfile = responseProfile;
        sendBgPauseOrFgResume();
    }

    public void notifyResume() {
        if (this.mMode == 1) {
            Log.d(TAG, "[ID=" + this.mId + "] [notifyResume] Receive resume when in BG");
            this.mIsResumedDuringBG = true;
        }
    }

    private void sendBgPauseOrFgResume() {
        Log.d(TAG, "[ID=" + this.mId + "] [sendBgPauseOrFgResume] Start mIsAudioCall: " + this.mIsAudioCall);
        Log.d(TAG, "[ID=" + this.mId + "] [sendBgPauseOrFgResume] mPauseResumeProfile:" + this.mPauseResumeProfile);
        if (this.mIsAudioCall) {
            this.mPauseResumeProfile = null;
            this.mNeedSendPause = false;
            this.mNeedSendResume = false;
            Log.d(TAG, "[ID=" + this.mId + "] [sendBgPauseOrFgResume] return due to mIsAudioCall: " + this.mIsAudioCall);
        } else if (this.mPauseResumeProfile == null) {
            Log.d(TAG, "[ID=" + this.mId + "] [sendBgPauseOrFgResume] return due to mPauseResumeProfile: " + this.mPauseResumeProfile);
        } else {
            Log.d(TAG, "[ID=" + this.mId + "] [sendBgPauseOrFgResume] mMode: " + this.mMode + " mNeedSendPause: " + this.mNeedSendPause + " mNeedSendResume: " + this.mNeedSendResume + " mCurrentProfile: " + this.mCurrentProfile);
            if (1 == this.mMode && this.mNeedSendPause) {
                VideoProfile pauseProfile = this.mPauseResumeProfile;
                if (this.mCurrentProfile != null) {
                    pauseProfile = new VideoProfile(this.mCurrentProfile.getVideoState() | 4, pauseProfile.getQuality());
                }
                setDuringSessionRequest(true);
                this.mLastRequestVideoProfile = pauseProfile;
                nRequestPeerConfig(this.mId, mVTProviderUtil.packFromVdoProfile(pauseProfile));
                this.mNeedSendPause = false;
                this.mPauseResumeProfile = null;
            } else if (this.mMode == 0 && this.mNeedSendResume) {
                VideoProfile resumeProfile = this.mPauseResumeProfile;
                if (this.mCurrentProfile != null) {
                    resumeProfile = new VideoProfile(this.mCurrentProfile.getVideoState() & -5, resumeProfile.getQuality());
                }
                if (this.mIsResumedDuringBG) {
                    Log.d(TAG, "[ID=" + this.mId + "] [sendBgPauseOrFgResume] No need to add Rx when in call swap");
                    this.mIsResumedDuringBG = false;
                } else {
                    int toState = resumeProfile.getVideoState();
                    if (!VideoProfile.isReceptionEnabled(toState)) {
                        resumeProfile = new VideoProfile(toState | 2, resumeProfile.getQuality());
                    }
                }
                setDuringSessionRequest(true);
                this.mLastRequestVideoProfile = resumeProfile;
                nRequestPeerConfig(this.mId, mVTProviderUtil.packFromVdoProfile(resumeProfile));
                this.mNeedSendResume = false;
                this.mPauseResumeProfile = null;
            }
            Log.d(TAG, "[ID=" + this.mId + "] [sendBgPauseOrFgResume] Finish");
        }
    }
}
