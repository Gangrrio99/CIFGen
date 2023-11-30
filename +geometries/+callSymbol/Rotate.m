classdef Rotate < geometries.callSymbol.Transformation
    % The Rotate class is associated to the rotatetransform sub-command used by the CallSymbol command
    properties (SetAccess = private)
        x int32
        y int32
    end
    
    methods
        function obj = Rotate(toX, toY)
            % ROTATE Create an instance of the Rotate transformation
            % Inputs:
            %   - toX: The x location to rotate to
            %   - toY: The y location to rotate to
            arguments
                toX (1, 1) int32                   % The x location to rotate to
                toY (1, 1) int32                   % The y location to rotate to
            end
            
            obj.x = toX;
            obj.y = toY;
        end
        
        function transform = printTransform(obj)
            transform = sprintf("R %i %i", obj.x, obj.y);
        end
    end
end
