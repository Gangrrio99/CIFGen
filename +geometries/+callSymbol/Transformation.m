classdef (Abstract) Transformation < matlab.mixin.Heterogeneous
    % The Transformation abstract class is an interface for different transformation types to apply to a CallSymbol class
    
    methods (Abstract)
        % PRINTTRANSFORM Return the string that is associated to the transform command
        transform = printTransform(obj)
    end
    
    methods
        function obj = Transformation()
        end
    end
end
