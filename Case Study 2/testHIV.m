function [newCell, newTime] = testHIV(probInfect, probReplace, rankLevel, probRespond, site, time, N, NE, E, SE, S, SW, W, NW)
global HEALTHY INFECTEDA1 INFECTEDA2 DEAD RESPONSETIME
RESPONSETIME = 4;

% Array syntax
neighbors = [N NE E SE S SW W NW];
countA2 = 0;
countA1 = 0;

% If this site is healthy
if site == HEALTHY
    newTime = 0;
    % Check all sides for an infected cell
    for i = 1:8
        % If a nearby cell is INFECTEDA1 -> this cell becomes INFECTEDA1
        if neighbors(i) == INFECTEDA1
            countA1 = countA1 + 1;
            % Healthy cell with rank level or more INFECTEDA1 neighbors
            if countA1 >= rankLevel
                if rand < ((1 - probRespond) * rankLevel/8)
                    newCell = INFECTEDA1;
                    return;
                else 
                    newCell = site;
                end
            % Otherwise, keep this cell
            else
                newCell = site;
            end
        % If a nearby cell is INFECTEDA2 -> Increment count
        elseif neighbors(i) == INFECTEDA2
            countA2 = countA2 + 1;
            % If this cell is surrounded by 3 or more INFECTEDA2 -> this cell
            % becomes INFECTEDA1
            if countA2 >= 3
                newCell = INFECTEDA1;
                return;
            end
        %elseif rand < probInfect
        %    newCell = INFECTEDA1;
        %    return;
        else
            newCell = site;        
        end
    end
% If this site is INFECTEDA1
elseif site == INFECTEDA1
    newTime = time + 1;
    if newTime > RESPONSETIME - 1
        newCell = INFECTEDA2;
        newTime = 0;
        return;
    else
        newCell = site;
        return;
    end
% If this sit is INFECTEDA2
elseif site == INFECTEDA2
    newTime = 0;
    newCell = DEAD;
    return;
% If this site is DEAD
elseif site == DEAD
    newTime = 0;
    % If this DEAD cell becomes HEALTHY by chance
    if rand < probReplace
        newCell = HEALTHY;
        % If this new HEALTHY cell becomes infected by chance
        if rand < probInfect
            newCell = INFECTEDA1;
            return;
        end
        return;
    else
        newCell = site;
        return;
    end
end
    
 
    