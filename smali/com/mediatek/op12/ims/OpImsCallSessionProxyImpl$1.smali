.class Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl$1;
.super Landroid/os/Handler;
.source "OpImsCallSessionProxyImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;


# direct methods
.method constructor <init>(Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;Landroid/os/Looper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;
    .param p2, "arg0"    # Landroid/os/Looper;

    .line 98
    iput-object p1, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl$1;->this$0:Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "handleMessage(): "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Op12ImsCallSessionProxyImpl"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 105
    :cond_0
    iget-object v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl$1;->this$0:Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;

    invoke-static {v0}, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->access$000(Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;)V

    .line 106
    nop

    .line 110
    :goto_0
    return-void
.end method
