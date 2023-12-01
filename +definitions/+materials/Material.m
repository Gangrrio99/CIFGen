classdef Material < hiddensupers.HiddenHandle
    properties
        fillStyle       definitions.materials.FillStyle     % The style of the fill of the laer
        fillColor       (1, 3) uint8
        outlineStyle    definitions.materials.OutlineStyle
        outlineColor    (1, 3) uint8
    end
    
    methods
        function obj = Material(fillStyle, outlineStyle, r, g, b)
            % MATERIAL Create an instance of a material. By default, the fill color is the same as the background color.
            arguments
                fillStyle       definitions.materials.FillStyle     % The style of the fill of the layer
                outlineStyle    definitions.materials.OutlineStyle  % The style of the outline of the layer
                r               (1, 1) uint8                        % Red value of the layer    0-255
                g               (1, 1) uint8                        % Green value of the layer  0-255
                b               (1, 1) uint8                        % Blue value of the layer   0-255
            end
            
            obj = obj@hiddensupers.HiddenHandle();
            
            obj.fillStyle = fillStyle;
            obj.fillColor = [r, g, b];
            obj.outlineStyle = outlineStyle;
            obj.outlineColor = [r, g, b];
        end
        
        function obj = setFillStyle(obj, fillStyle)
            % SETFILLSTYLE Set the style of the fill of the layer
            arguments
                obj             definitions.materials.Material
                fillStyle       definitions.materials.FillStyle     % The style of the fill of the layer
            end
            
            obj.fillStyle = fillStyle;
        end
        
        function obj = setFillColor(obj, r, g, b)
            % SETFILLCOLOR Set the color of the fill of the layer
            arguments
                obj             definitions.materials.Material
                r               (1, 1) uint8                        % Red value of the layer    0-255
                g               (1, 1) uint8                        % Green value of the layer  0-255
                b               (1, 1) uint8                        % Blue value of the layer   0-255
            end
            
            obj.fillColor = [r, g, b];
        end
        
        function obj = setOutlineStyle(obj, outlineStyle)
            % SETOUTLINESTYLE Set the style of the outline of the layer
            arguments
                obj             definitions.materials.Material
                outlineStyle    definitions.materials.OutlineStyle  % The style of the outline of the layer
            end
            
            obj.outlineStyle = outlineStyle;
        end
        
        function obj = setOutlineColor(obj, r, g, b)
            % SETOUTLINECOLOR Set the color of the outline of the layer
            arguments
                obj             definitions.materials.Material
                r               (1, 1) uint8                        % Red value of the layer    0-255
                g               (1, 1) uint8                        % Green value of the layer  0-255
                b               (1, 1) uint8                        % Blue value of the layer   0-255
            end
            
            obj.outlineColor = [r, g, b];
        end
        
        function styleStr = toString(obj)
            % TOSTRING Convert the Material to a string
            
            % Turn the fillStyle and outlineStyle into hex
            fillStyleHex = dec2hex(uint16(obj.fillStyle));
            outlineStyleHex = dec2hex(uint16(obj.outlineStyle));
            
            % Turn the colors into hex
            fillR = dec2hex(obj.fillColor(1), 2);
            fillG = dec2hex(obj.fillColor(2), 2);
            fillB = dec2hex(obj.fillColor(3), 2);
            
            outlineR = dec2hex(obj.outlineColor(1), 2);
            outlineG = dec2hex(obj.outlineColor(2), 2);
            outlineB = dec2hex(obj.outlineColor(3), 2);
            
            % Create the style string
            styleStr = sprintf("%s%s%s%s%s %s%s%s%s%s", ...
                outlineStyleHex, fillStyleHex, fillR, fillG, fillB, ...
                outlineStyleHex, fillStyleHex, outlineR, outlineG, outlineB ...
                );
        end
    end
end
