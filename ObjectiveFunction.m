function g = ObjectiveFunction(x)
g = 0;
for k = 1:11:11*59+1
    g = g + TotalTimeSpent(x(k:k+10));
end
end