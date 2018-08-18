function trajectory(t,x,type)
[m,n]=size(x);
if type==1    % state x(i,:) v.s. t plot
    for i=1:m
        %for l=1:n, y(l)=1/(1-t(l)^2);end %This is used only for HW9_FO6_P1
        subplot(m,1,i), plot(t,x(i,:),'r-')
        %hold on %This is used only for HW9_FO6_P1
        %subplot(m,1,i), plot(t,y,'b-') %This is used only for HW9_FO6_P1
        %hold off %This is used only for HW9_FO6_P1
        axis([0,t(n),min(x(i,:)),max(x(i,:))])
        ylabel('x(i)')
        n1=round(n/10);
        n
        for j=1:n1:n
        label=int2str(j);
        text(t(j),x(i,j),label)
        end
    label=int2str(n);
    text(t(n),x(i,n),label)
    %error(i)=abs(y(n)-x(i,n)) %This is used only for HW9_FO6_P1
    end
    xlabel('time t')
elseif type==2   % X-Y plot for a general 2-state problem
    n=length(t)
    plot(x(1,:),x(2,:),'r-')
    %hold on
    %plot(t,t,'b-')
    %hold off
    n1=round(n/10);
    for i=1:n1:n
        label=num2str(t(i),3);
        text(x(1,i),x(2,i),label)
    end
    label=num2str(t(n),3);
    text(x(1,n),x(2,n),label)
elseif type==3      %X-Y plot for Satellite' Earth-Moon orbit   
    n=length(t)
    plot(x(1,:),x(2,:),'r-')
    %for i=1:1000:n
    %   label=num2str(t(i)/86400,3);
    %   text(x(1,i),x(2,i),label)
    %end
    days=1;
    for i=1:n 
        if t(i)<days*86400
            continue
        else
            label=int2str(days);
            text(x(1,i),x(2,i),['D' label])
        end
        days=days+1;
    end
    %label(n)=num2str(t(n)/86400,5);
    text(x(1,n),x(2,n),['D' label])
    text(0,-0.02e8,{'O' 'Earth'})
    text(3.84e8,-0.02e8,{'O' 'Moon'})
elseif type==4   % X-Y plot for Satellite's Geosynchronous orbit
    n=length(t)
    plot(x(1,:),x(2,:),'r-')
    hrs=1;
    for i=1:n 
        if t(i)<hrs*3600
            continue
        else
            label=int2str(hrs);
            text(x(1,i),x(2,i),label)
        end
        hrs=hrs+1;
    end
    %label=num2str(t/3600,3);
    text(x(1,n),x(2,n),label)
    text(0,-0.2e7,{'O' 'Earth'})
else
    d=sqrt(x(1,:).^2+(t-x(2,:)).^2);
    plot(t,d,'b')
end
