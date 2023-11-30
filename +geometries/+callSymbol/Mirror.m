classdef Mirror < geometries.callSymbol.Transformation
    % The Mirror class is associated to the mirror sub-command used by the CallSymbol command
    properties (SetAccess = private)
        type string {ismember(type, ["X", "Y"])}
    end
    
    methods
        function obj = Mirror(overAxis)
            % MIRROR Create an instance of the Mirror transformation
            % Inputs:
            %   - overAxis: The axis to mirror over ("X" or "Y")
            arguments
                overAxis string {ismember(overAxis, ["X", "Y"])} % The axis to mirror over
            end
            
            obj.type = overAxis;
        end
        
        function transform = printTransform(obj)
            transform = sprintf("M %s", obj.type);
        end
    end
end
