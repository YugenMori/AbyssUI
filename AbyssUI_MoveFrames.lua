--------------------------------------------------------------------------------
-- Author: Yugen
--
-- BFA Version
--
-- Hope you like my addOn ^^
--
-- Simple UI Movable for AbyssUI
--------------------------------------------------------------------------------

local f=framename; f:SetMovable(true); f:EnableMouse(true); f:SetUserPlaced(true); f:SetScript("OnMouseDown", f.StartMoving); f:SetScript("OnMouseUp", f.StopMovingOrSizing);