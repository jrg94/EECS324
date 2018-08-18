function grid = initPherGrid(n)
% INITPHERGRID - initialization of n+2-byn+2
array for pheromone distribution
global MAXPHER
grid = ones(n+2,n+2)*(-0.01);
grid(2:n+1,2:n+1) = zeros(n, n);
mid = round(n/2) + 1;
for i = 1:n
   grid(mid, i+1) = MAXPHER * i / n;
end