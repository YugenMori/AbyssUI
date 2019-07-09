--------------------------------------------------------------------------------
-- Author: Yugen, Fizzlemizz
--
-- BFA Version
--
-- Hope you like my addOn ^^
--
-- Simple frame mover for AbyssUI
--------------------------------------------------------------------------------
-- Frame Stuff
local UnLocked
local Moveframes = { ObjectiveTrackerFrame, MinimapCluster, } -- So we don't create a new table each time
for i , v in pairs (Moveframes) do
    local f = v
    f:SetMovable(true) -- only set thes conditions once when you start up
    f:EnableMouse(true)
    f:SetClampedToScreen(true)
    f:RegisterForDrag("LeftButton")
    --[[
    if self == MainMenuBar then
        self:SetUserPlaced(true)
    end
    --]]
    f:SetScript("OnDragStart", function(self)
        if not UnLocked then return end -- set the condition that will let dragging run
        self:StartMoving()
    end)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)
    f.Movetex = f:CreateTexture("ARTWORK") -- only create the texture(s) once 
    f.Movetex:SetAllPoints() 
--  f.Movetex:SetTexture(1.0, 0.5, 0) -- SetTexture no longer does colors
    f.Movetex:SetTexture("Interface/BUTTONS/WHITE8X8")
    f.Movetex:SetColorTexture(1.0, 0.5, 0)
    f.Movetex:SetAlpha(0.5)
    f.Movetex:Hide() -- and hide it
end
 
local function AbyssUIMoveFrames_Function(show)
    for i , v in pairs (Moveframes) do
        local f = v
        f.Movetex:SetShown(show)
        UnLocked = show
    end
end
-- Reset
local function AbyssUIMoveFrames_Reset()
	for i , v in pairs (Moveframes) do
	    local f = v
	    f:ClearAllPoints()
	    f.ClearAllPoints = function() end
	end
	MinimapCluster:SetPoint("TOPRIGHT", "UIParent", "TOPRIGHT", 10, 10)
	C_Timer.After(1, function()
		ObjectiveTrackerFrame:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOM", 45, -5)
	end)
end
-- Slash Commands
-- Handler
local function AbyssUIMoveFrames_Slashhandler()
    print("|cffa5f6f3AbyssUI Command List|r")
    print("|cffa5f6f3Type /abyssui |r|cffffcc00'command name'|r")
    print("/abyssui |cffffcc00config|r ~configuration panel")
    print("/abyssui |cffffcc00unlock|r ~unlock UI frames")
    print("/abyssui |cffffcc00lock|r ~lock UI frames that was changed")
    print("/abyssui |cffffcc00reset|r ~reset UI frames to default positions")
    print("/abyssui |cffffcc00daily|r ~AbyssUI daily info")
end
-- Function
local function AbyssUIMoveFrames_Slash(msg)
    if ( msg ~= "" ) then
        if ( msg == "config" ) then
            InterfaceOptionsFrame_Show()
            InterfaceOptionsFrame_OpenToCategory(AbyssUI_Config)
            InterfaceOptionsFrame_OpenToCategory(AbyssUI_Config)
        elseif (msg == "unlock") then
            AbyssUIMoveFrames_Function(true)
        elseif (msg == "lock") then
            AbyssUIMoveFrames_Function(false)
        elseif (msg == "reset") then
          	AbyssUIMoveFrames_Reset()
        elseif (msg == "daily") then
  			AbyssUIDailyInfo()
        else
            return nil
        end
    else 
        return AbyssUIMoveFrames_Slashhandler()
    end
end
-- Slash
SLASH_ABUI1 = '/abyssui'
function SlashCmdList.ABUI(msg, editbox)
    AbyssUIMoveFrames_Slash(msg)
end
--End