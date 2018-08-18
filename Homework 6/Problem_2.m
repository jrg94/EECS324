t0=0;
tf=86400;
dt=1; % seconds
n=(tf-t0)/dt; % number of discrete periods 

x(:,1)=[-3e7;0;0;-4941.5];
for t=1:n,
x(:,t+1)=x(:,t)+Slope(t,x(:,t),dt)*dt;
end

% X-Y plot for Satellite's Geosynchronous orbit
plot(x(1,:),x(2,:),'r-')
hrs=1;
for i=1:n
if t(i)<hrs*3600, continue
else
label=int2str(hrs);
text(x(1,i),x(2,i),[label ':00'])
end
hrs=hrs+1;
end
%label=num2str(t/3600,3);
text(x(1,n),x(2,n),[label ':00'])
text(0,-0.2e7,{'O' 'Earth'})