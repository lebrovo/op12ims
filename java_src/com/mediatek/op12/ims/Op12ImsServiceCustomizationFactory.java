package com.mediatek.op12.ims;

import android.content.Context;
import android.telephony.Rlog;
import com.mediatek.ims.ext.OpImsCallSessionProxy;
import com.mediatek.ims.ext.OpImsServiceCustomizationFactoryBase;
import com.mediatek.ims.internal.ImsVTProvider;

public class Op12ImsServiceCustomizationFactory extends OpImsServiceCustomizationFactoryBase {
    private Context mPluginContext;

    public Op12ImsServiceCustomizationFactory(Context context) {
        this.mPluginContext = context;
    }

    public OpImsCallSessionProxy makeOpImsCallSessionProxy() {
        Rlog.d("OpFactory", "makeOpImsCallSessionProxy: op12");
        return new OpImsCallSessionProxyImpl(this.mPluginContext);
    }

    public ImsVTProvider makeImsVtProvider() {
        return new Op12ImsVTProvider();
    }
}
