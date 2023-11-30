classdef RoundFlash < geometries.Geometry
    % The RoundFlash class defines a circular structure at a given position
    properties (SetAccess = private)
        diameter (1, 1) uint32          % The diameter of the round flash
        center (1, 2) int32             % The center of the round flash
    end
    
    methods
        function obj = RoundFlash(fileHandle, layer, diameter, center)
            % ROUNDFLASH Create an instance of the RoundFlash Geometry
            % Inputs:
            %   - fileHandle: The file handle to the CIF file
            %   - layer: The layer the geomettry uses
            %   - diameter: The diameter of the round flash
            %   - center: The center of the round flash
            arguments
                fileHandle int32                % The file handle to the CIF file
                layer definitions.Layer         % The layer the geomettry uses
                diameter (1, 1) uint32          % The diameter of the round flash
                center (1, 2) int32             % The center of the round flash
            end
            
            obj = obj@geometries.Geometry(fileHandle, layer);
            
            obj.diameter = diameter;
            obj.center = center;
        end
        
        function obj = setDiameter(obj, diameter)
            % SETDIAMETER Set the diameter of the circle
            % Inputs:
            %   - diameter: The diameter of the round flash
            arguments
                obj geometries.RoundFlash
                diameter (1, 1) uint32          % The diameter of the round flash
            end
            
            obj.diameter = diameter;
        end
        
        function obj = setCenter(obj, center)
            % SETCENTER Set the center of the circle
            %   - center: The center of the circle
            arguments
                obj geometries.RoundFlash
                center (1, 2) int32             % The center of the round flash
            end
            
            obj.center = center;
        end
        
        function obj = printFile(obj, lastLayer)
            arguments
                obj geometries.RoundFlash
                lastLayer definitions.Layer % The last layer used by the parent symbol
            end
            
            % Check if the layer info has to be printed
            if(lastLayer ~= obj.layer)
                obj.layer.printLayer();
            end
            
            obj.write( ...
                sprintf("R %i %i %i;", ...
                obj.diameter, ...
                obj.center(1), ...
                obj.center(2)));
        end
    end
end
