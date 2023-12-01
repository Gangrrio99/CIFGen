classdef Polygon < geometries.Geometry
    % The Polygon class defines a polygon structure in a certain layer
    properties (SetAccess = private)
        coords (:, 2) int32 = []
    end
    
    methods
        function obj = Polygon(fileHandle, layer, initialXYs)
            % POLYGON Create an instance of the Polygon geometry
            % Inputs:
            %   - fileHandle: The file handle to the CIF file
            %   - layer: The layer the geometry uses
            %   - initialXYs: Optional list with x and y coordinates of the polygon path
            arguments
                fileHandle int32                % The file handle to the CIF file
                layer definitions.Layer         % The layer the geometry uses
                initialXYs (:, 2) int32 = []    % Optional list with x and y coordinates of the polygon path
            end
            
            obj = obj@geometries.Geometry(fileHandle, layer);
            
            obj.coords = initialXYs;
        end
        
        function obj = addPoint(obj, pointX, pointY)
            % ADDPOINT Add a single point to the polygon structure
            % Inputs:
            %   - pointX: The x coordinate of the point
            %   - pointY: The y coordinate of the point
            arguments
                obj geometries.Polygon
                pointX (1, 1) int32
                pointY (1, 1) int32
            end
            
            obj.coords(end+1, :) = [pointX, pointY];
        end
        
        function obj = addPoints(obj, pointsX, pointsY)
            % ADDPOINTS Add multiple points to the polygon structure
            % Inputs:
            %   - pointsX: The x coordinates of the points
            %   - pointsY: The y coordinates of the points
            arguments
                obj geometries.Polygon
                pointsX (:, 1) int32
                pointsY (:, 1) int32
            end
            if(length(pointsX) ~= length(pointsY))
                error("The number of x and y values is not equal!");
            end
            
            obj.coords(end+1:end+length(pointsX), :) = [pointsX, pointsY];
        end
        
        function obj = clearPoints(obj)
            % CLEARPOINTS Clear all the points in the polygon
            obj.coords = [];
        end
        
        function obj = printFile(obj, lastLayer)
            arguments
                obj geometries.Polygon
                lastLayer definitions.Layer % The last layer used by the parent symbol
            end
            
            % Check if the layer info has to be printed
            if(lastLayer ~= obj.layer)
                obj.layer.printLayer();
            end
            
            % Create the polygon data
            polyString = join(join(string(obj.coords), " "), " ");
            
            obj.write(sprintf("P %s;", polyString));
        end
    end
end
