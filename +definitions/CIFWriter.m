classdef (Abstract) CIFWriter
    % CIFWriter Base class for writing data to the CIF file
    properties (Access = private)
        fileHandle int32            % File handle to the file where the CIF data should be written to
    end
    
    methods (Access = protected)
        function obj = write(obj, line)
            % write Write the generated line to the CIF file
            arguments
                obj CIFWriter
                line string
            end
            fprintf(obj.fileHandle, "%s\n", line);
        end
    end
    
    methods (Abstract)
        % Write the contents of the specialized class to the CIF file
        obj = printFile(obj)
    end
    
    methods
        function obj = CIFWriter(fileHandle)
            arguments
                fileHandle int32
            end
            
            obj.fileHandle = fileHandle;
        end
    end
end
