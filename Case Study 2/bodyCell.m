classdef bodyCell
    properties
        type
        timeActive
    end
    methods
        function obj=bodyCell(type, timeActive)
            obj.type = type;
            obj.timeActive = timeActive;
        end
    end
end