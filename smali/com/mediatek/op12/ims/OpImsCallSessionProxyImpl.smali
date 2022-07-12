.class public Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;
.super Lcom/mediatek/ims/ext/OpImsCallSessionProxyBase;
.source "OpImsCallSessionProxyImpl.java"


# static fields
.field private static final CALL_DIRECTION_MO:I = 0x0

.field private static final CALL_DIRECTION_MT:I = 0x1

.field private static final CALL_STATUS_ACTIVE:I = 0x1

.field private static final CALL_STATUS_ATTEMPTING:I = 0x2

.field private static final CALL_STATUS_HOLD:I = 0x3

.field private static final CALL_STATUS_INACTIVE:I = 0x0

.field private static final CALL_TYPE_EMERGENCY:I = 0x0

.field private static final CALL_TYPE_VIDEO:I = 0x2

.field private static final CALL_TYPE_VOICE:I = 0x1

.field private static final EVENT_BUSY_TONE_TIMEOUT:I = 0x1

.field private static final EVENT_INCOMING_CALL_INDICATION:I = 0x2

.field private static final MDMI_SUPPORT:Z = false

.field private static final RAT_INFO_CDMA:I = 0x4

.field private static final RAT_INFO_GSM:I = 0x1

.field private static final RAT_INFO_LTE:I = 0x3

.field private static final RAT_INFO_NO_SERVICE:I = 0x0

.field private static final RAT_INFO_UMTS:I = 0x2

.field private static final RAT_INFO_WIFI:I = 0x5

.field private static final TAG:Ljava/lang/String; = "Op12ImsCallSessionProxyImpl"

.field private static final TONE_RELATIVE_VOLUME_HIPRI:I = 0x50


# instance fields
.field private mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

.field private mBluetoothProfileServiceListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

.field private mBusyToneTimeout:I

.field mCallStatus:I

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mHandlingCallStartFailed:Z

.field private mImsRIL:Lcom/mediatek/ims/ril/ImsCommandsInterface;

.field private mMtkImsCallSession:Lcom/mediatek/ims/internal/IMtkImsCallSession;

.field private mSipErrCode:I

.field private mToneGenerator:Landroid/media/ToneGenerator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 119
    invoke-direct {p0}, Lcom/mediatek/ims/ext/OpImsCallSessionProxyBase;-><init>()V

    .line 68
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mCallStatus:I

    .line 88
    const/16 v0, 0x7530

    iput v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mBusyToneTimeout:I

    .line 91
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mSipErrCode:I

    .line 98
    new-instance v0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl$1;-><init>(Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mHandler:Landroid/os/Handler;

    .line 212
    new-instance v0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl$2;

    invoke-direct {v0, p0}, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl$2;-><init>(Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;)V

    iput-object v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mBluetoothProfileServiceListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

    .line 120
    iput-object p1, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mContext:Landroid/content/Context;

    .line 121
    const-string v0, "Op12ImsCallSessionProxyImpl"

    const-string v1, "OpImsCallSessionProxyImpl"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;

    .line 65
    invoke-direct {p0}, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->processCallTerminated()V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;)Landroid/bluetooth/BluetoothHeadset;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;

    .line 65
    iget-object v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    return-object v0
.end method

.method static synthetic access$102(Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;Landroid/bluetooth/BluetoothHeadset;)Landroid/bluetooth/BluetoothHeadset;
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;
    .param p1, "x1"    # Landroid/bluetooth/BluetoothHeadset;

    .line 65
    iput-object p1, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    return-object p1
.end method

.method private processCallTerminated()V
    .locals 3

    .line 168
    iget-object v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 169
    invoke-direct {p0}, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->stopBusyTone()V

    .line 170
    invoke-direct {p0}, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->unregisterForIncomingCall()V

    .line 171
    iget-object v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mMtkImsCallSession:Lcom/mediatek/ims/internal/IMtkImsCallSession;

    if-eqz v0, :cond_0

    .line 173
    :try_start_0
    invoke-interface {v0}, Lcom/mediatek/ims/internal/IMtkImsCallSession;->callTerminated()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    goto :goto_0

    .line 174
    :catch_0
    move-exception v0

    .line 175
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "Op12ImsCallSessionProxyImpl"

    const-string v2, "RemoteException callTerminated()"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_0
    :goto_0
    return-void
.end method

.method private registerForIncomingCall()V
    .locals 4

    .line 181
    iget-object v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mImsRIL:Lcom/mediatek/ims/ril/ImsCommandsInterface;

    if-nez v0, :cond_0

    return-void

    .line 182
    :cond_0
    iget-object v1, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/mediatek/ims/ril/ImsCommandsInterface;->setOnIncomingCallIndication(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 183
    return-void
.end method

.method private startBusyTone()V
    .locals 5

    .line 191
    const-string v0, "Op12ImsCallSessionProxyImpl"

    const-string v1, "startBusyTone()"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    const/16 v0, 0x11

    .line 194
    .local v0, "toneType":I
    const/16 v1, 0x50

    .line 195
    .local v1, "toneVolume":I
    const/4 v2, 0x0

    .line 196
    .local v2, "stream":I
    iget-object v3, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothHeadset;->isAudioOn()Z

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 197
    const/4 v2, 0x6

    .line 200
    :cond_0
    new-instance v3, Landroid/media/ToneGenerator;

    invoke-direct {v3, v2, v1}, Landroid/media/ToneGenerator;-><init>(II)V

    iput-object v3, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mToneGenerator:Landroid/media/ToneGenerator;

    .line 201
    invoke-virtual {v3, v0}, Landroid/media/ToneGenerator;->startTone(I)Z

    .line 202
    return-void
.end method

.method private stopBusyTone()V
    .locals 2

    .line 205
    const-string v0, "Op12ImsCallSessionProxyImpl"

    const-string v1, "stopBusyTone()"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    iget-object v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mToneGenerator:Landroid/media/ToneGenerator;

    if-nez v0, :cond_0

    return-void

    .line 207
    :cond_0
    invoke-virtual {v0}, Landroid/media/ToneGenerator;->stopTone()V

    .line 208
    iget-object v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mToneGenerator:Landroid/media/ToneGenerator;

    invoke-virtual {v0}, Landroid/media/ToneGenerator;->release()V

    .line 209
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mToneGenerator:Landroid/media/ToneGenerator;

    .line 210
    return-void
.end method

.method private unregisterForIncomingCall()V
    .locals 2

    .line 186
    iget-object v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mImsRIL:Lcom/mediatek/ims/ril/ImsCommandsInterface;

    if-nez v0, :cond_0

    return-void

    .line 187
    :cond_0
    iget-object v1, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mHandler:Landroid/os/Handler;

    invoke-interface {v0, v1}, Lcom/mediatek/ims/ril/ImsCommandsInterface;->unsetOnIncomingCallIndication(Landroid/os/Handler;)V

    .line 188
    return-void
.end method


# virtual methods
.method public getImsReasonInfo(Lcom/mediatek/ims/SipMessage;)Landroid/telephony/ims/ImsReasonInfo;
    .locals 5
    .param p1, "sipMsg"    # Lcom/mediatek/ims/SipMessage;

    .line 126
    const/4 v0, 0x0

    .line 127
    .local v0, "info":Landroid/telephony/ims/ImsReasonInfo;
    invoke-virtual {p1}, Lcom/mediatek/ims/SipMessage;->getMethod()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 128
    invoke-virtual {p1}, Lcom/mediatek/ims/SipMessage;->getCode()I

    move-result v1

    iput v1, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mSipErrCode:I

    .line 129
    invoke-virtual {p1}, Lcom/mediatek/ims/SipMessage;->getCode()I

    move-result v1

    const/16 v2, 0x1e6

    if-ne v1, v2, :cond_0

    .line 130
    new-instance v1, Landroid/telephony/ims/ImsReasonInfo;

    const/16 v2, 0x152

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/mediatek/ims/SipMessage;->getReasonHeader()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Landroid/telephony/ims/ImsReasonInfo;-><init>(IILjava/lang/String;)V

    move-object v0, v1

    .line 134
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getImsReasonInfo(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Op12ImsCallSessionProxyImpl"

    invoke-static {v2, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    return-object v0
.end method

.method public handleCallStartFailed(Lcom/mediatek/ims/internal/IMtkImsCallSession;Ljava/lang/Object;Z)Z
    .locals 4
    .param p1, "imsCallSession"    # Lcom/mediatek/ims/internal/IMtkImsCallSession;
    .param p2, "imsRILAdapter"    # Ljava/lang/Object;
    .param p3, "hasHoldingCall"    # Z

    .line 141
    iget v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mSipErrCode:I

    const/16 v1, 0x1e6

    if-eq v0, v1, :cond_0

    .line 142
    const/4 v0, 0x0

    return v0

    .line 144
    :cond_0
    const-string v0, "Op12ImsCallSessionProxyImpl"

    const-string v1, "handleCallStartFailed()"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mHandlingCallStartFailed:Z

    .line 146
    iput-object p1, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mMtkImsCallSession:Lcom/mediatek/ims/internal/IMtkImsCallSession;

    .line 147
    move-object v1, p2

    check-cast v1, Lcom/mediatek/ims/ril/ImsCommandsInterface;

    iput-object v1, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mImsRIL:Lcom/mediatek/ims/ril/ImsCommandsInterface;

    .line 148
    invoke-direct {p0}, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->registerForIncomingCall()V

    .line 149
    if-eqz p3, :cond_1

    .line 150
    const/16 v1, 0x1388

    iput v1, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mBusyToneTimeout:I

    .line 152
    :cond_1
    invoke-direct {p0}, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->startBusyTone()V

    .line 153
    iget-object v1, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mHandler:Landroid/os/Handler;

    iget v2, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mBusyToneTimeout:I

    int-to-long v2, v2

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 154
    return v0
.end method

.method public handleHangup()Z
    .locals 2

    .line 159
    iget-boolean v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->mHandlingCallStartFailed:Z

    if-nez v0, :cond_0

    .line 160
    const/4 v0, 0x0

    return v0

    .line 162
    :cond_0
    const-string v0, "Op12ImsCallSessionProxyImpl"

    const-string v1, "handleHangup()"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    invoke-direct {p0}, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->processCallTerminated()V

    .line 164
    const/4 v0, 0x1

    return v0
.end method

.method public sendCallEventWithRat(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "extras"    # Landroid/os/Bundle;

    .line 228
    return-void
.end method
