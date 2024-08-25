-- Author: Yugen
--
-- Supports any version of wow
--
-- Simple frame mover for AbyssUI
--------------------------------------------------------------
-- Frame Stuff
-- Thanks to Fizz for part of this
-- ObjectiveTrackerFrame

local addonName, addonTable = ...
local L = LibStub("AceLocale-3.0"):GetLocale("AbyssUI")
local GetWoWVersion = ((select(4, GetBuildInfo())))
-- Slash Commands
-- Handler
local function AbyssUIMoveFrames_Slashhandler()
    print(L["|cfff2dc7fAbyssUI Command List|r"])
    print(L["|cfff2dc7fType /abyssui |r|cffffcc00'command name'|r"])
    print(L["/abyssui |cffffcc00config|r ~configuration panel"])
    print(L["/abyssui |cffffcc00setup|r ~show the setup frame"])
    print(L["/abyssui |cffffcc00reset|r ~reset UI frames to default positions"])
    print(L["/abyssui |cffffcc00daily|r ~daily info"])
    print(L["/abyssui |cffffcc00reload|r ~reload the interface"])
    print(L["/abyssui |cffffcc00more|r ~for more commands"])
end
-- DailyInfo Function (For Slash)
local function AbyssUIDailyInfo_Slash()
C_WowTokenPublic.UpdateMarketPrice()
    local HonorLevel = UnitHonorLevel("player")
    local AddonVersion = C_AddOns.GetAddOnMetadata("AbyssUI", "Version")
    print(L["|cfff2dc7fAbyssUI Daily Info|r"])
    if C_WowTokenPublic.GetCurrentMarketPrice() ~= nil then
        print(L["|cfff2dc7fToken Price: |r"] .. GetMoneyString(C_WowTokenPublic.GetCurrentMarketPrice()))
    else
        print(L["|cfff2dc7fToken Price:|r Not available right now!"])
    end
    if (AbyssUIAddonSettings.ExtraFunctionAmericanClock == true) then
        print(L["|cfff2dc7fDate:|r "] .. date("%H:%M |cffffcc00%m/%d/%y|r "))
    else
        print(L["|cfff2dc7fDate:|r "] .. date("%H:%M |cffffcc00%d/%m/%y|r "))
    end
    print(L["|cfff2dc7fHonor Level: |r|cffffcc00"] .. HonorLevel .. "|r")
    --print("|cfff2dc7fLocation: |r" .. GetMinimapZoneText() .. "|cffffcc00, " .. GetZoneText() .. "|r")
    print(L["|cfff2dc7fWoW Version: |r|cffffcc00"] .. select(1, GetBuildInfo()) .. "|r")
    print(L["|cfff2dc7fAbyssUI Version: |r|cffffcc00"] .. AddonVersion .. "|r")
end
-- Function
local function AbyssUIMoveFrames_Slash(msg)
    if (msg ~= "") then
        if (msg == "config" or msg == "options" or msg == "op" or msg == "configuration") then
            if (GetWoWVersion <= 90500) then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("Abyss|cff0d75d4UI|r")
                InterfaceOptionsFrame_OpenToCategory("Abyss|cff0d75d4UI|r")
            else
                SettingsPanel:Show()
            end
        elseif (msg == "setup") then
            AbyssUISecondFrame:Show()
        elseif (msg == "reset") then
            UIErrorsFrame:AddMessage("Function disabled after Dragonflight", 1.0, 0.1, 0.1, 1.0)
        elseif (msg == "daily") then
  			AbyssUIDailyInfo_Slash()
        elseif (msg == "reload") then
  			ReloadUI()
        elseif (msg == "more") then
        	print(L["/abyssui |cffffcc00clc|r ~clear CombatLog entries"])
        	print(L["/abyssui |cffffcc00gm|r ~custumer support"])
        	print(L["/abyssui |cffffcc00rc|r ~ready check"])
        	print(L["/abyssui |cffffcc00cr|r ~check role poll"])
            print(L["/abyssui |cffffcc00unlock|r ~unlock some frames"])
            print(L["/abyssui |cffffcc00lock|r ~lock unlocked frames"])
        elseif (msg == "unlock") then
            AbyssUIMoveFrames_Function(true)
        elseif (msg == "lock") then
            AbyssUIMoveFrames_Function(false)
            print(L["|cfff2dc7fConsider reload the UI to make sure frames are locked|r '|cffffcc00/reload|r'"])
  		elseif (msg == "clc") then
  			CombatLogClearEntries()
  		elseif (msg == "gm") then
  			ToggleHelpFrame()
  		elseif (msg == "rc") then
  			DoReadyCheck()
  		elseif (msg == "cr") then
  			InitiateRolePoll()
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