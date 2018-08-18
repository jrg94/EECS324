function [S,h]=S_h_est(dxdt,x,t,h0,method,epsilon)
R=0.001;dt=h0;
while R<=1
    [S_full,p]=S_cal(dxdt,x,t,dt,method);
    x1step=x+S_full*dt;
    xh=x+S_full*0.5*dt;
    S_half=S_cal(dxdt,xh,t+0.5*dt,0.5*dt,method);
    x2step=xh+S_half*0.5*dt;
    delx=norm(x2step-x1step);
    if delx < epsilon*(1+norm(x2step))
       break
    else
        R=(epsilon*(1+norm(x2step)/delx))^(1/(p+1));
        dt=0.9*R*dt;
        if dt < epsilon
            break
        else
        end
    end
end
S=S_full;h=dt;