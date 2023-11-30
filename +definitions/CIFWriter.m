classdef (Abstract) CIFWriter < hiddensupers.HiddenHandle
    % CIFWriter Base class for writing data to the CIF file
    properties (SetAccess = private, GetAccess = protected)
        fileHandle double           % File handle to the file where the CIF data should be written to
        comments (1, :) string      % The comments that should be printed
    end
    
    methods (Access = private, Hidden)
        function obj = writeComments(obj)
            % WRITECOMMENTS Write the stored comments to the file
            
            % Write each comment
            for comment = obj.comments
                fprintf(obj.fileHandle, "(%s);\n", comment);
            end
            
            % Flush the comments
            obj.flushComments();
        end
    end
    
    methods (Access = protected, Hidden)
        function obj = write(obj, line)
            % write Write the generated line to the CIF file
            arguments
                obj definitions.CIFWriter
                line string
            end
            % First we check whether there are comments to be written
            if ~isempty(obj.comments)
                obj.writeComments();
            end
            
            % Then we write the line to the file
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
        
        function obj = addComment(obj, comment)
            % ADDCOMMENT Add a comment to the list. Will print the comment next time CIFWriter.write is called
            arguments
                obj definitions.CIFWriter
                comment string
            end
            
            obj.comments(end+1) = comment;
        end
        
        function obj = flushComments(obj)
            % FLUSHCOMMENTS Remove all stored comments (called automatically after calling CIFWriter.write)
            obj.comments = [];
        end
    end
end
