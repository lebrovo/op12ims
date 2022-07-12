.class Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl$2;
.super Ljava/lang/Object;
.source "OpImsCallSessionProxyImpl.java"

# interfaces
.implements Landroid/bluetooth/BluetoothProfile$ServiceListener;


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
.method constructor <init>(Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;

    .line 213
    iput-object p1, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl$2;->this$0:Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(ILandroid/bluetooth/BluetoothProfile;)V
    .locals 2
    .param p1, "profile"    # I
    .param p2, "proxy"    # Landroid/bluetooth/BluetoothProfile;

    .line 215
    iget-object v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl$2;->this$0:Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;

    move-object v1, p2

    check-cast v1, Landroid/bluetooth/BluetoothHeadset;

    invoke-static {v0, v1}, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->access$102(Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;Landroid/bluetooth/BluetoothHeadset;)Landroid/bluetooth/BluetoothHeadset;

    .line 216
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "got BluetoothHeadset: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl$2;->this$0:Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;

    invoke-static {v1}, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->access$100(Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;)Landroid/bluetooth/BluetoothHeadset;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Op12ImsCallSessionProxyImpl"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    return-void
.end method

.method public onServiceDisconnected(I)V
    .locals 2
    .param p1, "profile"    # I

    .line 220
    iget-object v0, p0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl$2;->this$0:Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;->access$102(Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;Landroid/bluetooth/BluetoothHeadset;)Landroid/bluetooth/BluetoothHeadset;

    .line 221
    return-void
.end method
