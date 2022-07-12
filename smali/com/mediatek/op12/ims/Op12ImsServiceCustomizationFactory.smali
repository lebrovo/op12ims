.class public Lcom/mediatek/op12/ims/Op12ImsServiceCustomizationFactory;
.super Lcom/mediatek/ims/ext/OpImsServiceCustomizationFactoryBase;
.source "Op12ImsServiceCustomizationFactory.java"


# instance fields
.field private mPluginContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 51
    invoke-direct {p0}, Lcom/mediatek/ims/ext/OpImsServiceCustomizationFactoryBase;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/mediatek/op12/ims/Op12ImsServiceCustomizationFactory;->mPluginContext:Landroid/content/Context;

    .line 53
    return-void
.end method


# virtual methods
.method public makeImsVtProvider()Lcom/mediatek/ims/internal/ImsVTProvider;
    .locals 1

    .line 68
    new-instance v0, Lcom/mediatek/op12/ims/Op12ImsVTProvider;

    invoke-direct {v0}, Lcom/mediatek/op12/ims/Op12ImsVTProvider;-><init>()V

    return-object v0
.end method

.method public makeOpImsCallSessionProxy()Lcom/mediatek/ims/ext/OpImsCallSessionProxy;
    .locals 2

    .line 57
    const-string v0, "OpFactory"

    const-string v1, "makeOpImsCallSessionProxy: op12"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    new-instance v0, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;

    iget-object v1, p0, Lcom/mediatek/op12/ims/Op12ImsServiceCustomizationFactory;->mPluginContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/mediatek/op12/ims/OpImsCallSessionProxyImpl;-><init>(Landroid/content/Context;)V

    return-object v0
.end method
