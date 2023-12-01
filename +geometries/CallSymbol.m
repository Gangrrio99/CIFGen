classdef CallSymbol < geometries.Geometry
    % The CallSymbol class allows the user to call an already existing symbol to be used in the design
    properties (SetAccess=private)
        symbol definitions.Symbol                                       % The Symbol that should be called
        transformations (1, :) geometries.callSymbol.Transformation     % The transformations that should be applied
    end
    
    methods
        function obj = CallSymbol(fileHandle, symbol)
            % CALLSYMBOL Create an instance of the CallSymbol geometry
            % Inputs:
            %   - fileHandle: The file handle to the CIF file
            %   - symbol: The Symbol that should be called
            arguments
                fileHandle int32            % The file handle to the CIF file
                symbol definitions.Symbol   % The Symbol that should be called
            end
            
            obj = obj@geometries.Geometry(fileHandle, definitions.Layer.NoLayer());
            
            obj.symbol = symbol;
        end
        
        function obj = printFile(obj, lastLayer)
            if ~isempty(obj.transformations)
                % We first have to make the transformation string
                transforms = arrayfun(@(transform) transform.printTransform(), obj.transformations);
                transformString = join(transforms, " ");
                
                % Then, we print the call command
                obj.write(sprintf("C%i %s;", obj.symbol.symbolId, transformString));
            else
                % No transforms, so just print the call command
                obj.write(sprintf("C%i;", obj.symbol.symbolId));
            end
        end
        
        function obj = transform(obj, toX, toY)
            % TRANSFORM Transform the symbol to a given set of coordinates
            % Inputs:
            %   - toX: The x location to transform to
            %   - toY: The y location to transform to
            arguments
                obj geometries.CallSymbol
                toX (1, 1) int32                   % The x location to transform to
                toY (1, 1) int32                   % The y location to transform to
            end
            
            obj.transformations(end+1) = geometries.callSymbol.Transform(toX, toY);
        end
        
        function obj = mirror(obj, overAxis)
            % MIRROR Mirror the symbol over the given axis (multiplies that coordinate by -1)
            % Inputs:
            %   - overAxis: The axis to mirror over, can be "X" or "Y"
            arguments
                obj geometries.CallSymbol
                overAxis string {ismember(overAxis, ["X", "Y"])} % The axis to mirror over
            end
            
            obj.transformations(end+1) = geometries.callSymbol.Mirror(overAxis);
        end
        
        function obj = rotate(obj, toX, toY)
            % ROTATE Rotate the symbol over to the given coordinates
            % Inputs:
            %   - toX: The x location to rotate to
            %   - toY: The y location to rotate to
            arguments
                obj geometries.CallSymbol
                toX (1, 1) int32                   % The x location to rotate to
                toY (1, 1) int32                   % The y location to rotate to
            end
            
            obj.transformations(end+1) = geometries.callSymbol.Rotate(toX, toY);
        end
    end
end