classdef OutlineStyle < uint16
    % OUTLINESTYLE An enumeration class that defines the outline-style of the material as used in CleWin
    enumeration
        Solid      (0)  % ____
        LDash      (1)  % _ _
        SDash      (2)  % ----
        LSDash     (3)  % _-_-
        LSSDash    (4)  % _--_
    end
end