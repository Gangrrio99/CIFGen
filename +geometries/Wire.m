classdef Wire < geometries.Geometry
    % The Wire class defines a wire structure in a certain layer
    properties (SetAccess = private)
        coords (:, 2) int32 = []
    end
    
    methods
        function obj = Wire(fileHandle, layer, initialXYs)
            arguments
                fileHandle int32                % The file handle to the CIF file
                layer definitions.Layer         % The layer the geomettry uses
                initialXYs (:, 2) int32 = []    % Optional list with x and y coordinates of the wire path
            end
            
            obj = obj@geometries.Geometry(fileHandle, layer);
            
            obj.coords = initialXYs;
        end
        
        function obj = addPoint(obj, pointX, pointY)
            % ADDPOINT Add a single point to the wire structure
            arguments
                obj geometries.Wire
                pointX (1, 1) int32
                pointY (1, 1) int32
            end
            
            obj.coords(end+1, :) = [pointX, pointY];
        end
        
        function obj = addPoints(obj, pointsX, pointsY)
            % ADDPOINTS Add multiple points to the wire structure
            arguments
                obj geometries.Wire
                pointsX (:, 1) int32
                pointsY (:, 1) int32
            end
            if(length(pointsX) ~= length(pointsY))
                error("The number of x and y values is not equal!");
            end
            
            obj.coords(end+1:end+length(pointsX), :) = [pointsX, pointsY];
        end
        
        function obj = clearPoints(obj)
            % CLEARPOINTS Clear all the points in the wire
            obj.coords = [];
        end
        
        function obj = printFile(obj, lastLayer)
            arguments
                obj geometries.Wire
                lastLayer definitions.Layer % The last layer used by the parent symbol
            end
            
            % Check if the layer info has to be printed
            if(lastLayer ~= obj.layer)
                obj.layer.printLayer();
            end
            
            % Create the wire data
            polyString = join(join(string(obj.coords), " "), " ");
            
            obj.write(sprintf("W %s;", polyString));
        end
    end
end
