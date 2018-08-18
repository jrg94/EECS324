function dyncsim(modelname,controlname,t0,tf,x0,N,method,epsilon,fixed,plottype)
dxdt=str2func(modelname);u=str2func(controlname);
dt=(tf-t0)/N;
i=1;t(i)=t0;x(:,i)=x0;bomber(:,i)=u(t(i));dist(i)=norm(x(:,i)-bomber(:,i));
while t(i)< tf
    if fixed==0
        [S,h]=S_h_est_u(dxdt,x(:,i),u,t(i),dt,method,epsilon);  %if using adjustable h
    else
        S = S_cal_u(dxdt,x(:,i),u,t(i),dt,method);h=dt; %if using fixed h
    end
    t(i+1)=min(tf,t(i)+h);bomber(:,i+1)=u(t(i+1));  %To ensure we we won't take a step beyond tf
    h=t(i+1)-t(i);
    x(:,i+1)=x(:,i)+S*h;dist(i+1)=norm(x(:,i+1)-bomber(:,i+1));
    i=i+1;
end
%trajectory(t,x,plottype)
subplot(2,1,1), plot(bomber(1,:),bomber(2,:),'b-')
hold on
subplot(2,1,1), plot(x(1,:),x(2,:),'r-')
hold off
subplot(2,1,2), plot(t,dist,'r-')
