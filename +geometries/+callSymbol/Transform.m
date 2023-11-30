classdef Transform < geometries.callSymbol.Transformation
    % The Transform class is associated to the transform sub-command used by the CallSymbol command
    properties (SetAccess = private)
        x int32
        y int32
    end
    
    methods
        function obj = Transform(toX, toY)
            % TRANSFORM Create an instance of the transform transformation
            % Inputs:
            %   - toX: The x location to transform to
            %   - toY: The y location to transform to
            arguments
                toX (1, 1) int32                   % The x location to transform to
                toY (1, 1) int32                   % The y location to transform to
            end
            
            obj.x = toX;
            obj.y = toY;
        end
        
        function transform = printTransform(obj)
            transform = sprintf("T %i %i", obj.x, obj.y);
        end
    end
end
