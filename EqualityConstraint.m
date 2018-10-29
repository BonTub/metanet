function [c, ceq]=EqualityConstraint(x)
global x0

c=[];
ceq=zeros(11*60,1);
count = 0;

for k=1:11:11*59+1
    count = count+1;
    if count == 1
        ceq(k:k+8)=x(k:k+8)-x0;
        ceq(k+10)=x(k+10)-1;
    else
        ceq(k:k+10)=buildf(x(k-11:k-1), x(k:k+10), count-1);
    end
end
end