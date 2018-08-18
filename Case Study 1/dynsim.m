function dynsim(modelname,t0,tf,x0,N,method,epsilon,fixed,plottype)
dxdt=str2func(modelname);
dt=(tf-t0)/N; %n=length(x0);
i=1;t(i)=t0;x(:,i)=x0;
while t(i)< tf
    if fixed==0
        [S,h]=S_h_est(dxdt,x(:,i),t(i),dt,method,epsilon);  %if using adjustable h
    else
        S = S_cal(dxdt,x(:,i),t(i),dt,method);h=dt; %if using fixed h
    end
    t(i+1)=min(tf,t(i)+h);  %To ensure we we won't take a step beyond tf
    h=t(i+1)-t(i);
    x(:,i+1)=x(:,i)+S*h;
    i=i+1;
end
trajectory(t,x,plottype)