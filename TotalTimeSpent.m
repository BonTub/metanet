function gk = TotalTimeSpent(x)
global T lambda L

gk = T*x(9)+T*L*lambda*sum(x(1:4));
end