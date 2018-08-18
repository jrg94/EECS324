function direction = sense(site, na, ea, sa, wa, np, ep, sp, wp)
global STAY EMPTY
if (site == EMPTY)
    direction = EMPTY;
    return
end
lst = [np, ep, sp, wp];
% don't allow ant to turn to previous cell, so make value artificially small
if (site < STAY)
    lst(site) = -2;
end
% don't allow ant to turn to cell with another ant, so make value artificially small
neighbors = [na, ea, sa, wa];
for i = 1:4
    if (neighbors(i) > 0)
        lst(i) = -2;
    end
end
mx = max(lst);
if (mx < 0)
    direction = STAY;
else
    posList = find(lst == mx);
    lng = length(posList);
    rndPos = randi(lng);
    direction = posList(rndPos);
end