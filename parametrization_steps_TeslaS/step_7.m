R0_LUT_bkpts = [];
counter = 1;
for i=find(ref_curr & ~val_exp)
    R0_LUT_bkpts = [R0_LUT_bkpts R0_LUT(idx',counter)];
    counter = counter+1;
end

[xx,yy,zz] = prepareSurfaceData(1000./T_LUT,SOCbkpts,log(R0_LUT_bkpts));
[R0_vs_T_SOC_fit, gof] = fit([xx,yy],zz,'linearinterp');
% [R0_vs_T_SOC_fit, gof] = fit([xx,yy],zz,'poly12');
[xx1,yy1,zz1] = prepareSurfaceData(T_LUT,SOCbkpts,R0_LUT_bkpts);
[R0_vs_T_SOC_fit1, gof] = fit([xx1,yy1],zz1,'linearinterp');

ex_datasheetbattery_plot_surface