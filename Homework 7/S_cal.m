function [S,p]=S_cal(dxdt,x,t,h,method)
S1=dxdt(x,t);
if strcmp(method,'euler')
    S=S1;p=1;
elseif strcmp(method,'midpoint')
    S=dxdt(x+0.5*h*S1,t+0.5*h);p=2;
elseif strcmp(method,'huen')
    S_hat=dxdt(x+h*S1,t+h);
    S=(S1+S_hat)/2;p=2;
elseif strcmp(method,'BS23')
    S2=dxdt(x+0.5*h*S1,t+0.5*h);
    S3=dxdt(x+0.75*h*S2,t+0.75*h);
    S=(2*S1+3*S2+4*S3)/9;p=3;
else   %method=='RK4'
    S2=dxdt(x+0.5*h*S1,t+0.5*h);
    S3=dxdt(x+0.5*h*S2,t+0.5*h);
    S4=dxdt(x+h*S3,t+h);
    S=(S1+2*S2+2*S3+S4)/6;p=4;
end
    
    