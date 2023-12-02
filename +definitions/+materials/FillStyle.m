classdef FillStyle < uint16
    % FILLSTYLE An enumeration class that defines the fill-style of the material as used in CleWin
    enumeration
        Solid           (15)
        DiagonalRight   (3)
        DiagonalLeft    (2)
        DiagonalCross   (5)
        Horizontal      (0)
        Vertical        (1)
        Cross           (4)
        Transparant     (6)
    end
end