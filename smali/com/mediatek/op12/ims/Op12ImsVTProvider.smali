.class public Lcom/mediatek/op12/ims/Op12ImsVTProvider;
.super Lcom/mediatek/ims/internal/ImsVTProvider;
.source "Op12ImsVTProvider.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Op12ImsVT"


# instance fields
.field private mIsResumedDuringBG:Z

.field private mNeedSendPause:Z

.field private mNeedSendResume:Z

.field private mPauseResumeProfile:Landroid/telecom/VideoProfile;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 56
    invoke-direct {p0}, Lcom/mediatek/ims/internal/ImsVTProvider;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mNeedSendPause:Z

    .line 51
    iput-boolean v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mNeedSendResume:Z

    .line 52
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mPauseResumeProfile:Landroid/telecom/VideoProfile;

    .line 53
    iput-boolean v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mIsResumedDuringBG:Z

    .line 57
    const-string v0, "Op12ImsVT"

    const-string v1, "Create Op12ImsVTProvider done"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    return-void
.end method

.method private sendBgPauseOrFgResume()V
    .locals 10

    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[ID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] [sendBgPauseOrFgResume] Start mIsAudioCall: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mIsAudioCall:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Op12ImsVT"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "] [sendBgPauseOrFgResume] mPauseResumeProfile:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mPauseResumeProfile:Landroid/telecom/VideoProfile;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    iget-boolean v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mIsAudioCall:Z

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz v0, :cond_0

    .line 136
    iput-object v3, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mPauseResumeProfile:Landroid/telecom/VideoProfile;

    .line 137
    iput-boolean v4, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mNeedSendPause:Z

    .line 138
    iput-boolean v4, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mNeedSendResume:Z

    .line 139
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] [sendBgPauseOrFgResume] return due to mIsAudioCall: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mIsAudioCall:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    return-void

    .line 143
    :cond_0
    iget-object v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mPauseResumeProfile:Landroid/telecom/VideoProfile;

    if-nez v0, :cond_1

    .line 144
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] [sendBgPauseOrFgResume] return due to mPauseResumeProfile: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mPauseResumeProfile:Landroid/telecom/VideoProfile;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    return-void

    .line 148
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "] [sendBgPauseOrFgResume] mMode: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mMode:I

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " mNeedSendPause: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v5, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mNeedSendPause:Z

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v5, " mNeedSendResume: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v5, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mNeedSendResume:Z

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v5, " mCurrentProfile: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mCurrentProfile:Landroid/telecom/VideoProfile;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    iget v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mMode:I

    const/4 v5, 0x1

    if-ne v5, v0, :cond_3

    iget-boolean v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mNeedSendPause:Z

    if-eqz v0, :cond_3

    .line 151
    iget-object v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mPauseResumeProfile:Landroid/telecom/VideoProfile;

    .line 152
    .local v0, "pauseProfile":Landroid/telecom/VideoProfile;
    iget-object v6, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mCurrentProfile:Landroid/telecom/VideoProfile;

    if-eqz v6, :cond_2

    .line 153
    iget-object v6, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mCurrentProfile:Landroid/telecom/VideoProfile;

    invoke-virtual {v6}, Landroid/telecom/VideoProfile;->getVideoState()I

    move-result v6

    .line 154
    .local v6, "realToState":I
    or-int/lit8 v6, v6, 0x4

    .line 155
    new-instance v7, Landroid/telecom/VideoProfile;

    invoke-virtual {v0}, Landroid/telecom/VideoProfile;->getQuality()I

    move-result v8

    invoke-direct {v7, v6, v8}, Landroid/telecom/VideoProfile;-><init>(II)V

    move-object v0, v7

    .line 157
    .end local v6    # "realToState":I
    :cond_2
    invoke-virtual {p0, v5}, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->setDuringSessionRequest(Z)V

    .line 158
    iput-object v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mLastRequestVideoProfile:Landroid/telecom/VideoProfile;

    .line 159
    iget v5, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    sget-object v6, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mVTProviderUtil:Lcom/mediatek/ims/internal/ImsVTProviderUtil;

    invoke-virtual {v6, v0}, Lcom/mediatek/ims/internal/ImsVTProviderUtil;->packFromVdoProfile(Landroid/telecom/VideoProfile;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->nRequestPeerConfig(ILjava/lang/String;)I

    .line 160
    iput-boolean v4, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mNeedSendPause:Z

    .line 161
    iput-object v3, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mPauseResumeProfile:Landroid/telecom/VideoProfile;

    .end local v0    # "pauseProfile":Landroid/telecom/VideoProfile;
    goto :goto_1

    .line 163
    :cond_3
    iget v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mMode:I

    if-nez v0, :cond_7

    iget-boolean v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mNeedSendResume:Z

    if-eqz v0, :cond_7

    .line 164
    iget-object v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mPauseResumeProfile:Landroid/telecom/VideoProfile;

    .line 165
    .local v0, "resumeProfile":Landroid/telecom/VideoProfile;
    iget-object v6, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mCurrentProfile:Landroid/telecom/VideoProfile;

    if-eqz v6, :cond_4

    .line 166
    iget-object v6, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mCurrentProfile:Landroid/telecom/VideoProfile;

    invoke-virtual {v6}, Landroid/telecom/VideoProfile;->getVideoState()I

    move-result v6

    .line 167
    .restart local v6    # "realToState":I
    and-int/lit8 v6, v6, -0x5

    .line 168
    new-instance v7, Landroid/telecom/VideoProfile;

    invoke-virtual {v0}, Landroid/telecom/VideoProfile;->getQuality()I

    move-result v8

    invoke-direct {v7, v6, v8}, Landroid/telecom/VideoProfile;-><init>(II)V

    move-object v0, v7

    .line 184
    .end local v6    # "realToState":I
    :cond_4
    iget-boolean v6, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mIsResumedDuringBG:Z

    if-eqz v6, :cond_5

    .line 185
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "] [sendBgPauseOrFgResume] No need to add Rx when in call swap"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    iput-boolean v4, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mIsResumedDuringBG:Z

    goto :goto_0

    .line 189
    :cond_5
    invoke-virtual {v0}, Landroid/telecom/VideoProfile;->getVideoState()I

    move-result v6

    .line 190
    .local v6, "toState":I
    invoke-static {v6}, Landroid/telecom/VideoProfile;->isReceptionEnabled(I)Z

    move-result v7

    if-nez v7, :cond_6

    .line 191
    or-int/lit8 v7, v6, 0x2

    .line 193
    .local v7, "realToState":I
    new-instance v8, Landroid/telecom/VideoProfile;

    .line 195
    invoke-virtual {v0}, Landroid/telecom/VideoProfile;->getQuality()I

    move-result v9

    invoke-direct {v8, v7, v9}, Landroid/telecom/VideoProfile;-><init>(II)V

    move-object v0, v8

    .line 199
    .end local v6    # "toState":I
    .end local v7    # "realToState":I
    :cond_6
    :goto_0
    invoke-virtual {p0, v5}, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->setDuringSessionRequest(Z)V

    .line 200
    iput-object v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mLastRequestVideoProfile:Landroid/telecom/VideoProfile;

    .line 201
    iget v5, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    sget-object v6, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mVTProviderUtil:Lcom/mediatek/ims/internal/ImsVTProviderUtil;

    invoke-virtual {v6, v0}, Lcom/mediatek/ims/internal/ImsVTProviderUtil;->packFromVdoProfile(Landroid/telecom/VideoProfile;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->nRequestPeerConfig(ILjava/lang/String;)I

    .line 202
    iput-boolean v4, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mNeedSendResume:Z

    .line 203
    iput-object v3, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mPauseResumeProfile:Landroid/telecom/VideoProfile;

    goto :goto_2

    .line 163
    .end local v0    # "resumeProfile":Landroid/telecom/VideoProfile;
    :cond_7
    :goto_1
    nop

    .line 205
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] [sendBgPauseOrFgResume] Finish"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    return-void
.end method


# virtual methods
.method public notifyResume()V
    .locals 3

    .line 123
    iget v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ID="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] [notifyResume] Receive resume when in BG"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Op12ImsVT"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    iput-boolean v1, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mIsResumedDuringBG:Z

    .line 129
    :cond_0
    return-void
.end method

.method public receiveSessionModifyResponseInternal(ILandroid/telecom/VideoProfile;Landroid/telecom/VideoProfile;)V
    .locals 1
    .param p1, "status"    # I
    .param p2, "requestedProfile"    # Landroid/telecom/VideoProfile;
    .param p3, "responseProfile"    # Landroid/telecom/VideoProfile;

    .line 104
    invoke-super {p0, p1, p2, p3}, Lcom/mediatek/ims/internal/ImsVTProvider;->receiveSessionModifyResponseInternal(ILandroid/telecom/VideoProfile;Landroid/telecom/VideoProfile;)V

    .line 106
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 107
    iput-object p3, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mCurrentProfile:Landroid/telecom/VideoProfile;

    .line 109
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->sendBgPauseOrFgResume()V

    .line 110
    return-void
.end method

.method protected sendFgBgSessionModifyRequestInternal(Landroid/telecom/VideoProfile;Landroid/telecom/VideoProfile;IZ)V
    .locals 5
    .param p1, "fromProfile"    # Landroid/telecom/VideoProfile;
    .param p2, "toProfile"    # Landroid/telecom/VideoProfile;
    .param p3, "mode"    # I
    .param p4, "needNotify"    # Z

    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[ID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] [sendFgBgSessionModifyRequestInternal] Start mode = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Op12ImsVT"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "] [sendFgBgSessionModifyRequestInternal] fromProfile:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/telecom/VideoProfile;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "] [sendFgBgSessionModifyRequestInternal] toProfile:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroid/telecom/VideoProfile;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    const/4 v0, 0x0

    invoke-super {p0, p1, p2, p3, v0}, Lcom/mediatek/ims/internal/ImsVTProvider;->sendFgBgSessionModifyRequestInternal(Landroid/telecom/VideoProfile;Landroid/telecom/VideoProfile;IZ)V

    .line 70
    invoke-virtual {p0}, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->isDuringNotAppDowngrade()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] [sendFgBgSessionModifyRequestInternal] During Not App Downgrade"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    return-void

    .line 75
    :cond_0
    const/4 v3, 0x1

    if-ne p3, v3, :cond_1

    .line 76
    iput-boolean v3, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mNeedSendPause:Z

    .line 77
    iput-object p2, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mPauseResumeProfile:Landroid/telecom/VideoProfile;

    goto :goto_0

    .line 78
    :cond_1
    if-nez p3, :cond_3

    .line 80
    iget-boolean v4, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mNeedSendPause:Z

    if-eqz v4, :cond_2

    .line 81
    iput-boolean v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mNeedSendPause:Z

    .line 82
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mPauseResumeProfile:Landroid/telecom/VideoProfile;

    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] [sendFgBgSessionModifyRequestInternal] Cancel send Pause"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    return-void

    .line 86
    :cond_2
    iput-boolean v3, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mNeedSendResume:Z

    .line 87
    iput-object p2, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mPauseResumeProfile:Landroid/telecom/VideoProfile;

    .line 91
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->isDuringSessionModify()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] [sendFgBgSessionModifyRequestInternal] Return due to during session modify"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    return-void

    .line 95
    :cond_4
    invoke-direct {p0}, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->sendBgPauseOrFgResume()V

    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] [sendFgBgSessionModifyRequestInternal] Finish"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    return-void
.end method

.method public sendSessionModifyResponseInternal(Landroid/telecom/VideoProfile;)V
    .locals 0
    .param p1, "responseProfile"    # Landroid/telecom/VideoProfile;

    .line 115
    invoke-super {p0, p1}, Lcom/mediatek/ims/internal/ImsVTProvider;->sendSessionModifyResponseInternal(Landroid/telecom/VideoProfile;)V

    .line 117
    iput-object p1, p0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->mCurrentProfile:Landroid/telecom/VideoProfile;

    .line 118
    invoke-direct {p0}, Lcom/mediatek/op12/ims/Op12ImsVTProvider;->sendBgPauseOrFgResume()V

    .line 119
    return-void
.end method
