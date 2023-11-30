classdef (Abstract) Geometry < definitions.CIFWriter
    properties (SetAccess = private)
        layer definitions.Layer     % The layer the geometry uses
    end
    
    methods
        function obj = Geometry(fileHandle, layer)
            arguments
                fileHandle int32        % The file handle to the CIF file
                layer definitions.Layer % The layer the geomettry uses
            end
            
            obj = obj@definitions.CIFWriter(fileHandle);
            
            obj.layer = layer;
        end
        
        function obj = printFile(obj, lastLayer)
            arguments
                obj
                lastLayer int32     % The layer id of the last called layer
            end
            disp(lastLayer);
        end
    end
end