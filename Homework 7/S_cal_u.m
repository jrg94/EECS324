function [S,p]=S_cal_u(dxdt,x,u,t,h,method)
S1=dxdt(x,u(t),t);
if strcmp(method,'euler')
    S=S1;p=1;
elseif strcmp(method,'midpoint')
    S=dxdt(x+0.5*h*S1,u(t+0.5*h),t+0.5*h);p=2;
elseif strcmp(method,'huen')
    S_hat=dxdt(x+h*S1,u,t+h);
    S=(S1+S_hat)/2;p=2;
elseif strcmp(method,'BS23')
    S2=dxdt(x+0.5*h*S1,u(t+0.5*h),t+0.5*h);
    S3=dxdt(x+0.75*h*S2,u(t+0.75*h),t+0.75*h);
    S=(2*S1+3*S2+4*S3)/9;p=3;
else   %method=='RK4'
    S2=dxdt(x+0.5*h*S1,u(t+0.5*h),t+0.5*h);
    S3=dxdt(x+0.5*h*S2,u(t+0.5*h),t+0.5*h);
    S4=dxdt(x+h*S3,u(t+h),t+h);
    S=(S1+2*S2+2*S3+S4)/6;p=4;
end
    
    