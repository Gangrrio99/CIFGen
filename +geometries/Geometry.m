classdef (Abstract) Geometry < definitions.CIFWriter & matlab.mixin.Heterogeneous
    properties (SetAccess = private)
        layer definitions.Layer     % The layer the geometry uses
    end
    
    methods (Abstract)
        obj = printFile(obj, lastLayer)
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
