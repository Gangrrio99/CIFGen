classdef CIFFile < definitions.CIFWriter
    % The CIFFile class can be used to generate Caltech Intermediate Format files using matlab.
    % To get started, all one has to do is create a new instance of this class, providing a path to a new or existing .cif file.
    % By using the methods in this class, layers and symbols can be created.
    properties (SetAccess = private)
        layers (1, :) definitions.Layer     % The layers that are being used in the file
        symbols (1, :) definitions.Symbol    % The symbols that are being used in the file
    end
    
    methods
        function obj = CIFFile(filePath)
            % CIFFile Create an instance of CIFFile, which creates a Caltech Intermediate Format file and can write the structure created using the instance to it.
            % Inputs:
            %   - filePath: The path to the (new) .cif file
            arguments
                filePath string     % The path to where the .cif file should be generated
            end
            
            % First, we create the file handle...
            fId = fopen(filePath, "w");
            % ...and initialize the instance with it
            obj = obj@definitions.CIFWriter(fId);
            
            obj.addComment("CIF generated by CIFGen v1.0.0 - Daan Roos (2023)");
        end
        
        function delete(obj)
            if obj.fileHandle > -1
                obj.close();
            end
        end
        
        function obj = printFile(obj)
            % PRINTFILE Write the contents of the class to the file
            
            % Start by writing the general comments for the file
            obj.writeComments();
            
            % Then, we will have to print the layers
            for layer = obj.layers
                layer.printFile();
            end
            
            % Next, we print the symbols
            for symbol = obj.symbols
                symbol.printFile();
            end
            
            % Finally, we print the closing tag...
            obj.write("E;");
            
            % ...and close the file
            obj.close();
        end
        
        function lObj = createLayer(obj, name, styling)
            % CREATELAYER Create a new layer in the file
            % Inputs:
            %   - name: The name of the layer (as used by CleWin)
            %   - styling: The optional styling of the layer, uses syntax of CleWin, will be updated later
            arguments
                obj CIFFile
                name string                                                 % The name of the layer (as used by CleWin)
                styling (1, 2) string = ["0f808080" "0f808080"]             % The optional styling of the layer, uses syntax of CleWin, will be updated later
            end
            
            % Get the id of the next layer
            layerId = length(obj.layers) + 1;
            
            % Create a new layer...
            lObj = definitions.Layer(obj.fileHandle, layerId, name, styling);
            
            % ...and add the layer to the file
            obj.layers(end + 1) = lObj;
            
            % If this was the first layer, add a comment
            if layerId == 1
                lObj.addComment("Layer definitions");
            end
        end
        
        function sObj = createSymbol(obj, name, normalization)
            % CREATESYMBOL Create a new symbol in the file
            % Inputs:
            %   - name: The name of the symbol
            %   - normalization: The factor by which the geometry is normalized, so each value filled in for lengths is normalized by this factor by the user
            arguments
                obj CIFFile
                name string                     % The name of the symbol
                normalization (1, 1) double     % The factor by which the geometry is normalized, so each value filled in for lengths is normalized by this factor by the user
            end
            
            % Get the id of the next symbol
            symbolId = length(obj.symbols) + 1;
            
            % Create a new symbol...
            sObj = definitions.Symbol(obj.fileHandle, symbolId, name, normalization);
            
            % ...and add the symbol to the file
            obj.symbols(end + 1) = sObj;
            
            % If this was the first symbol, add a comment
            if symbolId == 1
                sObj.addComment("Symbol definitions");
            end
        end
    end
end
