-- Author: Yugen
--
-- Shadowlands
--
-- Simple Frame to leave instances for AbyssUI
--------------------------------------------------------------
-- Make sure to init everything again
local addonName, addonTable = ...
if not AbyssUI_Config then
  local AbyssUI_Config = {}
end
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event)
    character = UnitName("player").."-"..GetRealmName()
    if not COLOR_MY_UI then
        COLOR_MY_UI = {}
    end
    if not COLOR_MY_UI[character] then
        COLOR_MY_UI[character] = {}
    end
    if not COLOR_MY_UI[character].Color then
        COLOR_MY_UI[character].Color = { r = 1, g = 1, b = 1 }
    end
end)
local function AbyssUI_Fontification(globalFont, subFont, damageFont)
local locale = GetLocale()
local fontName, fontHeight, fontFlags = MinimapZoneText:GetFont()
local mediaFolder = "Interface\\AddOns\\AbyssUI\\Textures\\font\\"
  if ( locale == "zhCN") then
    globalFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    subFont   = mediaFolder.."zhCN-TW\\senty.ttf"
    damageFont  = mediaFolder.."zhCN-TW\\senty.ttf"
  elseif ( locale == "zhTW" ) then
    globalFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    subFont   = mediaFolder.."zhCN-TW\\senty.ttf"
    damageFont  = mediaFolder.."zhCN-TW\\senty.ttf"
  elseif ( locale == "ruRU" ) then
    globalFont  = mediaFolder.."ruRU\\dejavu.ttf"
    subFont   = mediaFolder.."ruRU\\dejavu.ttf"
    damageFont  = mediaFolder.."ruRU\\dejavu.ttf"
  elseif ( locale == "koKR" ) then
    globalFont  = mediaFolder.."koKR\\dxlbab.ttf"
    subFont   = mediaFolder.."koKR\\dxlbab.ttf"
    damageFont  = mediaFolder.."koKR\\dxlbab.ttf"
  elseif ( locale == "frFR" or locale == "deDE" or locale == "enGB" or locale == "enUS" or locale == "itIT" or
    locale == "esES" or locale == "esMX" or locale == "ptBR") then
    globalFont  = mediaFolder.."global.ttf"
    subFont   = mediaFolder.."npcfont.ttf"
    damageFont  = mediaFolder.."damagefont.ttf"
  else
    globalFont  = fontName
    subFont   = fontName
    damageFont  = fontName
  end
  return globalFont, subFont, damageFont
end
local globalFont, subFont, damageFont = AbyssUI_Fontification(globalFont, subFont, damageFont)
local _G = _G 
local leaveString 		= _G["LEAVE_VEHICLE"]
local teleportString	= _G["QUESTS_LABEL"]
local closeString 		= _G["CLOSE"]
--------------------------------------------------------------
local AbyssUI_InstanceLeave_DynamicFrame = CreateFrame("Frame", "$parentAbyssUI_InstanceLeave_DynamicFrame", UIParent)
AbyssUI_InstanceLeave_DynamicFrame:SetClampedToScreen(true)
AbyssUI_InstanceLeave_DynamicFrame:SetMovable(true)
AbyssUI_InstanceLeave_DynamicFrame:EnableMouse(true)
AbyssUI_InstanceLeave_DynamicFrame:SetWidth(420)
AbyssUI_InstanceLeave_DynamicFrame:SetHeight(120)
AbyssUI_InstanceLeave_DynamicFrame:RegisterForDrag("LeftButton")
AbyssUI_InstanceLeave_DynamicFrame:SetFrameLevel(300)
AbyssUI_InstanceLeave_DynamicFrame:SetFrameStrata("HIGH")
AbyssUI_InstanceLeave_DynamicFrame:SetPoint("CENTER", 0, -140)
AbyssUI_InstanceLeave_DynamicFrame.text = AbyssUI_InstanceLeave_DynamicFrame.text or AbyssUI_InstanceLeave_DynamicFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUI_InstanceLeave_DynamicFrame.text:SetAllPoints(true)
AbyssUI_InstanceLeave_DynamicFrame.text:SetJustifyH("CENTER")
AbyssUI_InstanceLeave_DynamicFrame.text:SetJustifyV("CENTER")
AbyssUI_InstanceLeave_DynamicFrame.text:SetText("This instance is completed! Want to leave?")
AbyssUI_InstanceLeave_DynamicFrame.text:SetFont("Fonts\\FRIZQT__.TTF", 16, "THICKOUTLINE")
AbyssUI_InstanceLeave_DynamicFrame:Hide()
AbyssUI_InstanceLeave_DynamicFrame:SetScript("OnDragStart", AbyssUI_InstanceLeave_DynamicFrame.StartMoving)
AbyssUI_InstanceLeave_DynamicFrame:SetScript("OnDragStop", AbyssUI_InstanceLeave_DynamicFrame.StopMovingOrSizing)

-- Border --
local LeaveBorder = AbyssUI_InstanceLeave_DynamicFrame:CreateTexture(nil, "BACKGROUND")
LeaveBorder:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
LeaveBorder:SetPoint("TOPLEFT", -3, 3)
LeaveBorder:SetPoint("BOTTOMRIGHT", 3, -3)
LeaveBorder:SetVertexColor(0.2, 0.2, 0.2, 0.6)

local BorderBody = AbyssUI_InstanceLeave_DynamicFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUI_InstanceLeave_DynamicFrame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)

-- Texture --
local Texture = AbyssUI_InstanceLeave_DynamicFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUI_InstanceLeave_DynamicFrame)
AbyssUI_InstanceLeave_DynamicFrame.texture = Texture

-- Button --
local FrameButton = CreateFrame("Button","$parentFrameButton", AbyssUI_InstanceLeave_DynamicFrame, "UIPanelButtonTemplate")
FrameButton:SetHeight(24)
FrameButton:SetWidth(100)
FrameButton:SetPoint("BOTTOM", AbyssUI_InstanceLeave_DynamicFrame, "BOTTOM", -150, 10)
FrameButton.text = FrameButton.text or FrameButton:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
FrameButton.text:SetFont(globalFont, 12)
FrameButton.text:SetPoint("CENTER", FrameButton, "CENTER", 0, 0)
FrameButton.text:SetText("|cff3e3535"..leaveString.."|r")
FrameButton:SetScript("OnClick", function()
	local isDg = IsInLFGDungeon()
	local isComplete = IsLFGComplete()
	local isPt = IsInGroup()
	local isLFG = IsPartyLFG()
	if ( isComplete and isDg and isPt ) then 
		LeaveParty() 
		LeaveBattlefield() 
		UIFrameFadeIn(AbyssUI_InstanceLeave_DynamicFrame, 1, 1, 0)
		C_Timer.After(2, function()
			AbyssUI_InstanceLeave_DynamicFrame:Hide()
	    end)
	elseif ( not isDg and not isLFG and not isPt ) then 
		UIFrameFadeIn(AbyssUI_InstanceLeave_DynamicFrame, 1, 1, 0)
		C_Timer.After(2, function()
			AbyssUI_InstanceLeave_DynamicFrame:Hide()
	    end)
	elseif ( isComplete and not isDg and isPt ) then 
		LeaveParty() 
		LeaveBattlefield() 
		UIFrameFadeIn(AbyssUI_InstanceLeave_DynamicFrame, 1, 1, 0)
		C_Timer.After(2, function()
			AbyssUI_InstanceLeave_DynamicFrame:Hide()
	    end)
	else
		UIFrameFadeIn(AbyssUI_InstanceLeave_DynamicFrame, 1, 1, 0)
		C_Timer.After(2, function()
			AbyssUI_InstanceLeave_DynamicFrame:Hide()
	    end)
	end
end)

local FrameButton = CreateFrame("Button","$parentFrameButton", AbyssUI_InstanceLeave_DynamicFrame, "UIPanelButtonTemplate")
FrameButton:SetHeight(24)
FrameButton:SetWidth(100)
FrameButton:SetPoint("BOTTOM", AbyssUI_InstanceLeave_DynamicFrame, "BOTTOM", 0, 10)
FrameButton.text = FrameButton.text or FrameButton:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
FrameButton.text:SetFont(globalFont, 12)
FrameButton.text:SetPoint("CENTER", FrameButton, "CENTER", 0, 0)
FrameButton.text:SetText("|cff3e3535"..teleportString.."|r")
FrameButton:SetScript("OnClick", function()
	local isDg  = IsInLFGDungeon()
	local isPt  = IsInGroup()
	local isLFG = IsPartyLFG()
	if ( isDg and isLFG and isPt ) then LFGTeleport(isDg)
	elseif ( isLFG and isPt and not isDg ) then LFGTeleport(isDg)
	elseif ( not isDg and not isLFG and not isPt ) then AbyssUI_InstanceLeave_DynamicFrame:Hide()
	else
		AbyssUI_InstanceLeave_DynamicFrame:Hide()
	end
end)

local FrameButton = CreateFrame("Button","$parentFrameButton", AbyssUI_InstanceLeave_DynamicFrame, "UIPanelButtonTemplate")
FrameButton:SetHeight(24)
FrameButton:SetWidth(100)
FrameButton:SetPoint("BOTTOM", AbyssUI_InstanceLeave_DynamicFrame, "BOTTOM", 150, 10)
FrameButton.text = FrameButton.text or FrameButton:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
FrameButton.text:SetFont(globalFont, 12)
FrameButton.text:SetPoint("CENTER", FrameButton, "CENTER", 0, 0)
FrameButton.text:SetText("|cff3e3535"..closeString.."|r")
FrameButton:SetScript("OnClick", function()
	AbyssUI_InstanceLeave_DynamicFrame:Hide()
end)

-- DynamicFrame --
local frame = CreateFrame("Frame", "$parentFrame", nil)
frame:RegisterEvent("LFG_COMPLETION_REWARD")
frame:SetScript("OnEvent", function(self, event)
	if ( event == "LFG_COMPLETION_REWARD" and AbyssUIAddonSettings.ExtraFunctionInstanceLeave == true ) then
		UIFrameFadeIn(AbyssUI_InstanceLeave_DynamicFrame, 1, 0, 1)
	else 
		return nil
	end
end)
-- End
