classdef Symbol < definitions.CIFWriter
    properties (SetAccess = private)
        symbolId int32                          % The id of the symbol
        name string                             % The name of the symbol
        normalization double                    % The factor by which the geometry is normalized, so each value filled in for lengths is normalized by this factor by the user
        geometries (1, :) geometries.Geometry   % All defined geometries in the symbol
    end
    
    methods
        function obj = Symbol(fileHandle, symbolId, name, normalization)
            % SYMBOL Create an instance of a Symbol object that is responsible for managing the information about a symbol in the CIF design
            arguments
                fileHandle (1, 1) int32         % The file handle to the CIF file
                symbolId (1, 1) int32           % The id of the symbol
                name string                     % The name of the symbol
                normalization (1, 1) double     % The factor by which the geometry is normalized, so each value filled in for lengths is normalized by this factor by the user
            end
            
            % Construct the superclass
            obj = obj@definitions.CIFWriter(fileHandle);
            
            obj.symbolId = symbolId;
            obj.name = name;
            obj.normalization = normalization;
        end
        
        function obj = printFile(obj)
            % Write the contents of the specialized class to the CIF file
            arguments
                obj definitions.Symbol
            end
            
            % Calculate the values for the a and b factors as normalization = a/b * distance where distance = 0.01 um
            distance = 1e-6;
            factor = obj.normalization / distance;
            
            [aFactor, bFactor] = rat(factor);
            
            % Variable that stores the last layer ID
            lastLayer = definitions.Layer.NoLayer();
            
            % First, write the symbol header
            symbolHeader = sprintf("DS%i %i %i;", obj.symbolId, aFactor, bFactor);
            symbolName = sprintf("9 %s;", obj.name);
            
            obj.write(symbolHeader);
            obj.write(symbolName);
            
            % Next, go over all geometries and write them
            for geometry = obj.geometries
                geometry.printFile(lastLayer);
                
                lastLayer = geometry.layer;
            end
            
            % Write the close keyword
            obj.write("DF;");
        end
        
        function csObj = callSymbol(obj, symbol)
            % CALLSYMBOL Call a given symbol. Adds the symbol to the parent symbol and returns a new CallSymbol object to apply transformations
            arguments
                obj definitions.Symbol
                symbol definitions.Symbol   % The Symbol that should be called
            end
            
            % Create the geometry
            csObj = geometries.CallSymbol(obj.fileHandle, symbol); %#ok<PROPLC>
            
            % And add it to the list of geometries
            obj.geometries(end+1) = csObj;
        end
        
        function pObj = createPolygon(obj, layer, initialXYs)
            % CREATEPOLYGON Create a polygon and add it to the symbol
            arguments
                obj definitions.Symbol
                layer definitions.Layer         % The layer the geomettry uses
                initialXYs (:, 2) int32 = []    % Optional list with x and y coordinates of the polygon path
            end
            
            % Create the geometry
            pObj = geometries.Polygon(obj.fileHandle, layer, initialXYs); %#ok<PROPLC>
            
            % And add it to the list of geometries
            obj.geometries(end+1) = pObj;
        end
        
        function bObj = createBox(obj, layer, length, width, center, direction)
            % CREATEBOX Create a box and add it to the symbol
            arguments
                obj definitions.Symbol
                layer definitions.Layer         % The layer the geomettry uses
                length (1, 1) uint32                   % The length of the box
                width (1, 1) uint32                    % The width of the box
                center (1, 2) int32             % The center of the box
                direction (1, 2) int32 = [1, 0] % The direction the box is looking at, perpendicular to the width
            end
            
            % Create the geometry
            bObj = geometries.Box(obj.fileHandle, layer, length, width, center, direction); %#ok<PROPLC>
            
            % And add it to the list of geometries
            obj.geometries(end+1) = bObj;
        end
        
        function rObj = createRoundFlash(obj, layer, diameter, center)
            % CREATEROUNDFLASH Create a circle and add it to the symbol
            arguments
                obj definitions.Symbol
                layer definitions.Layer         % The layer the geomettry uses
                diameter (1, 1) uint32          % The diameter of the round flash
                center (1, 2) int32             % The center of the round flash
            end
            
            % Create the geometry
            rObj = geometries.RoundFlash(obj.fileHandle, layer, diameter, center); %#ok<PROPLC>
            
            % And add it to the list of geometries
            obj.geometries(end+1) = rObj;
        end
    end
end