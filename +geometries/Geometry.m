classdef (Abstract) Geometry < definitions.CIFWriter & matlab.mixin.Heterogeneous
    properties (SetAccess = private)
        layer definitions.Layer     % The layer the geometry uses
    end
    
    methods (Abstract)
        obj = printFile(obj, lastLayer)
        
        % Mirror the current state of the geometry
        obj = mirror(obj, overAxis)
        
        % Translate the current state of the geometry to [x, y]
        obj = translate(obj, x, y)
        
        % Center the current state of the geometry to [0, 0]
        obj = centerGeometry(obj)
        
        % Get the length along X
        length = getXLength(obj)
        
        % Get the length along Y
        length = getYLength(obj)
        
        % Get the current center of the geometry
        center = getCenter(obj)
    end
    
    methods
        function obj = Geometry(fileHandle, layer)
            arguments
                fileHandle int32        % The file handle to the CIF file
                layer definitions.Layer % The layer the geometry uses
            end
            
            obj = obj@definitions.CIFWriter(fileHandle);
            
            obj.layer = layer;
        end
    end
end
