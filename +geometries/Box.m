classdef Box < geometries.Geometry
    % The Box class defines a box structure in a certain layer
    properties (SetAccess = private)
        length uint32                   % The length of the box
        width uint32                    % The width of the box
        center (1, 2) int32             % The center of the box
        direction (1, 2) int32 = [1, 0] % The direction the box is looking at, perpendicular to the width
    end
    
    methods
        function obj = Box(fileHandle, layer, length, width, center, direction)
            % BOX Create an instance of the Box geometry
            % Inputs:
            %   - fileHandle: The file handle to the CIF file
            %   - layer: The layer the geomettry uses
            %   - length: The length of the box
            %   - width: The width of the box
            %   - center: The center of the box
            %   - direction: The direction the box is looking at, perpendicular to the width
            arguments
                fileHandle int32                % The file handle to the CIF file
                layer definitions.Layer         % The layer the geomettry uses
                length (1, 1) uint32            % The length of the box
                width (1, 1) uint32             % The width of the box
                center (1, 2) int32             % The center of the box
                direction (1, 2) int32 = [1, 0] % The direction the box is looking at, perpendicular to the width
            end
            
            obj = obj@geometries.Geometry(fileHandle, layer);
            
            obj.length = length;
            obj.width = width;
            obj.center = center;
            obj.direction = direction;
        end
        
        function obj = setLength(obj, length)
            % SETLENGTH Set the length of the box
            % Inputs:
            %   - length: The length of the box
            arguments
                obj geometries.Box
                length (1, 1) uint32                % The length of the box
            end
            
            obj.length = length;
        end
        
        function obj = setWidth(obj, width)
            % SETWIDTH Set the width of the box
            % Inputs:
            %   - width: The width of the box
            arguments
                obj geometries.Box
                width (1, 1) uint32                 % The width of the box
            end
            
            obj.width = width;
        end
        
        function obj = setCenter(obj, center)
            % SETCENTER Set the center of the box
            % Inputs:
            %   - center: The center of the box [x, y]
            arguments
                obj geometries.Box
                center (1, 2) int32                 % The center of the box
            end
            
            obj.center = center;
        end
        
        function obj = setDirection(obj, direction)
            % SETDIRECTION Set the direction of the box
            % Inputs:
            %   - direction: The direction the box is looking at [x,y], perpendicular to the width
            arguments
                obj geometries.Box
                direction (1, 2) int32          % The direction the box is looking at, perpendicular to the width
            end
            
            obj.direction = direction;
        end
        
        function obj = printFile(obj, lastLayer)
            arguments
                obj geometries.Box
                lastLayer definitions.Layer % The last layer used by the parent symbol
            end
            
            % Check if the layer info has to be printed
            if(lastLayer ~= obj.layer)
                obj.layer.printLayer();
            end
            
            obj.write( ...
                sprintf("B %i %i %i %i %i %i;", ...
                obj.length, ...
                obj.width, ...
                obj.center(1), ...
                obj.center(2), ...
                obj.direction(1), ...
                obj.direction(2)));
        end
    end
    
    % Implemented methods from abstract Geometry
    methods
        function obj = mirror(obj, overAxis)
            arguments
                obj geometries.Box
                overAxis string {ismember(overAxis, ["X", "Y"])} % The axis to mirror over
            end
            if overAxis == "X"
                obj.center(2) = obj.center(2)*-1;
            else
                obj.center(1) = obj.center(1)*-1;
            end
        end
        
        function obj = translate(obj, x, y)
            arguments
                obj geometries.Box
                x (1, 1) double
                y (1, 1) double
            end
            obj.center = obj.center + [x, y];
        end
        
        function obj = centerGeometry(obj)
            obj.center = [0, 0];
        end
        
        function length = getXLength(obj)
            % for [1, 0] -> s
        end
        
        function length = getYLength(obj)
            
        end
        
        function center = getCenter(obj)
            center = obj.center;
        end
    end
end
