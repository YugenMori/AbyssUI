-- Author: Yugen
--
-- Shadowlands + Burning Crusade Classic + Classic
--
-- Simple Frame to leave instances for AbyssUI
--------------------------------------------------------------
-- Init - Tables - Saves
local addonName, addonTable = ...
local L = LibStub("AceLocale-3.0"):GetLocale("AbyssUI")
local GetWoWVersion = ((select(4, GetBuildInfo())))
--
local f = CreateFrame("Frame", "AbyssUI_Config", UIParent)
f:SetSize(50, 50)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, ...)
  character = UnitName("player").."-"..GetRealmName()
  -- Config/Panel
	if not AbyssUI_Config then
		local AbyssUI_Config = {}
	end
	-- AddonSettings
	if not AbyssUIAddonSettings then
		AbyssUIAddonSettings = {}
	end
  if not AbyssUIAddonSettings[character] then
    AbyssUIAddonSettings[character] = {}
  end
	-- Color Init
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
local mediaFolder = "Interface\\AddOns\\AbyssUI\\textures\\font\\"
  if (locale == "zhCN") then
    globalFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    subFont   	= mediaFolder.."zhCN-TW\\senty.ttf"
    damageFont  = mediaFolder.."zhCN-TW\\senty.ttf"
  elseif (locale == "zhTW") then
    globalFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    subFont   	= mediaFolder.."zhCN-TW\\senty.ttf"
    damageFont  = mediaFolder.."zhCN-TW\\senty.ttf"
  elseif (locale == "ruRU") then
    globalFont  = mediaFolder.."ruRU\\dejavu.ttf"
    subFont   	= mediaFolder.."ruRU\\dejavu.ttf"
    damageFont  = mediaFolder.."ruRU\\dejavu.ttf"
  elseif (locale == "koKR") then
    globalFont  = mediaFolder.."koKR\\dxlbab.ttf"
    subFont   	= mediaFolder.."koKR\\dxlbab.ttf"
    damageFont  = mediaFolder.."koKR\\dxlbab.ttf"
  elseif (locale == "frFR" or locale == "deDE" or locale == "enGB" or locale == "enUS" or locale == "itIT" or
    locale == "esES" or locale == "esMX" or locale == "ptBR") then
    globalFont  = mediaFolder.."global.ttf"
    subFont   	= mediaFolder.."npcfont.ttf"
    damageFont  = mediaFolder.."damagefont.ttf"
  else
    globalFont  = fontName
    subFont   	= fontName
    damageFont  = fontName
  end
  return globalFont, subFont, damageFont
end
local globalFont, subFont, damageFont = AbyssUI_Fontification(globalFont, subFont, damageFont)
local _G = _G 
local leaveString 		= _G["LEAVE_VEHICLE"]
--local teleportString	= _G["QUESTS_LABEL"]
local closeString 		= _G["CLOSE"]
local dialogFrameTexture 		= "Interface\\Addons\\AbyssUI\\textures\\extra\\dialogFrameTexture"
local dialogFrameTextureBorder 	= "Interface\\DialogFrame\\UI-DialogBox-Background"
--------------------------------------------------------------
-- ApplyFonts
local function AbyssUI_ApplyFonts(self)
  self:SetTextColor(31/255, 31/255, 31/255)
  self:SetFont(globalFont, 13)
  self:SetShadowColor(45/255, 45/255, 45/255)
  self:SetShadowOffset(0, 0)
end
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
AbyssUI_InstanceLeave_DynamicFrame.text:SetAllPoints(AbyssUI_InstanceLeave_DynamicFrame)
AbyssUI_InstanceLeave_DynamicFrame.text:SetText(L["This instance is completed! Want to leave?"..
" You can also teleport out/in or just close this frame"])
AbyssUI_InstanceLeave_DynamicFrame.text:SetFont(globalFont, 16)
AbyssUI_InstanceLeave_DynamicFrame.text:SetTextColor(248/255, 248/255, 248/255)
AbyssUI_InstanceLeave_DynamicFrame.text:SetShadowColor(0, 0, 0)
AbyssUI_InstanceLeave_DynamicFrame.text:SetShadowOffset(1, -1)
AbyssUI_InstanceLeave_DynamicFrame:Hide()
AbyssUI_InstanceLeave_DynamicFrame:SetScript("OnDragStart", AbyssUI_InstanceLeave_DynamicFrame.StartMoving)
AbyssUI_InstanceLeave_DynamicFrame:SetScript("OnDragStop", AbyssUI_InstanceLeave_DynamicFrame.StopMovingOrSizing)

-- Border --
local LeaveBorder = AbyssUI_InstanceLeave_DynamicFrame:CreateTexture(nil, "BACKGROUND")
LeaveBorder:SetTexture(dialogFrameTextureBorder)
LeaveBorder:SetPoint("TOPLEFT", -3, 3)
LeaveBorder:SetPoint("BOTTOMRIGHT", 3, -3)

local BorderBody = AbyssUI_InstanceLeave_DynamicFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture(dialogFrameTextureBorder)
BorderBody:SetAllPoints(AbyssUI_InstanceLeave_DynamicFrame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)

-- Texture --
local Texture = AbyssUI_InstanceLeave_DynamicFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture(dialogFrameTextureBorder)
Texture:SetAllPoints(AbyssUI_InstanceLeave_DynamicFrame)
AbyssUI_InstanceLeave_DynamicFrame.texture = Texture

-- Button --
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function() 
	local FrameButton = CreateFrame("Button","$parentFrameButton", AbyssUI_InstanceLeave_DynamicFrame, "UIPanelButtonTemplate")
	FrameButton:SetHeight(24)
	FrameButton:SetWidth(100)
	FrameButton:SetPoint("BOTTOM", AbyssUI_InstanceLeave_DynamicFrame, "BOTTOM", -150, 10)
	FrameButton.text = FrameButton.text or FrameButton:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
	--FrameButton.text:SetFont(globalFont, 14)
	FrameButton.text:SetPoint("CENTER", FrameButton, "CENTER", 0, 0)
	FrameButton.text:SetText(leaveString)
		if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
		  AbyssUI_ApplyFonts(FrameButton.text)
		else
		  FrameButton.text:SetFont(globalFont, 14)
		  FrameButton.text:SetTextColor(248/255, 248/255, 248/255)
		  FrameButton.text:SetShadowColor(0, 0, 0)
		  FrameButton.text:SetShadowOffset(1, -1)
		end
	FrameButton:SetScript("OnClick", function()
		DoEmote("THANK","none")
		local isComplete = IsLFGComplete()
		local inInstance, instanceType = IsInInstance()
		if (isComplete and (instanceType == "party" or instanceType == "raid")) then 
			C_PartyInfo.LeaveParty()
			UIFrameFadeIn(AbyssUI_InstanceLeave_DynamicFrame, 1, 1, 0)
			C_Timer.After(2, function()
				AbyssUI_InstanceLeave_DynamicFrame:Hide()
		    end)
		elseif (not instanceType == "none" and not (instanceType == "party" or instanceType == "raid")) then 
			UIFrameFadeIn(AbyssUI_InstanceLeave_DynamicFrame, 1, 1, 0)
			C_Timer.After(2, function()
				AbyssUI_InstanceLeave_DynamicFrame:Hide()
		    end)
		elseif (isComplete and instanceType == "pvp") then 
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
	--FrameButton.text:SetFont(globalFont, 14)
	FrameButton.text:SetPoint("CENTER", FrameButton, "CENTER", 0, 0)
	FrameButton.text:SetText(L["Teleport"])
	    if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
	      AbyssUI_ApplyFonts(FrameButton.text)
	    else
	      FrameButton.text:SetFont(globalFont, 14)
	      FrameButton.text:SetTextColor(248/255, 248/255, 248/255)
	      FrameButton.text:SetShadowColor(0, 0, 0)
	      FrameButton.text:SetShadowOffset(1, -1)
	    end
	FrameButton:SetScript("OnClick", function()
		local isDg  = IsInLFGDungeon()
		local isPt  = IsInGroup()
		local isLFG = IsPartyLFG()
		if (isDg and isLFG and isPt) then LFGTeleport(isDg)
		elseif (isLFG and isPt and not isDg) then LFGTeleport(isDg)
		elseif (not isDg and not isLFG and not isPt) then AbyssUI_InstanceLeave_DynamicFrame:Hide()
		else
			AbyssUI_InstanceLeave_DynamicFrame:Hide()
		end
	end)


	local FrameButton = CreateFrame("Button","$parentFrameButton", AbyssUI_InstanceLeave_DynamicFrame, "UIPanelButtonTemplate")
	FrameButton:SetHeight(24)
	FrameButton:SetWidth(100)
	FrameButton:SetPoint("BOTTOM", AbyssUI_InstanceLeave_DynamicFrame, "BOTTOM", 150, 10)
	FrameButton.text = FrameButton.text or FrameButton:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
	--FrameButton.text:SetFont(globalFont, 14)
	FrameButton.text:SetPoint("CENTER", FrameButton, "CENTER", 0, 0)
	FrameButton.text:SetText(closeString)
	    if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
	      AbyssUI_ApplyFonts(FrameButton.text)
	    else
	   	  FrameButton.text:SetFont(globalFont, 14)
	      FrameButton.text:SetTextColor(248/255, 248/255, 248/255)
	      FrameButton.text:SetShadowColor(0, 0, 0)
	      FrameButton.text:SetShadowOffset(1, -1)
	    end
	FrameButton:SetScript("OnClick", function()
		AbyssUI_InstanceLeave_DynamicFrame:Hide()
	end)
end)
-- DynamicFrame --
if (GetWoWVersion > 11401) then
	local frame = CreateFrame("Frame", "$parentFrame", nil)
	frame:RegisterEvent("LFG_COMPLETION_REWARD")
	frame:SetScript("OnEvent", function(self, event)
		if (event == "LFG_COMPLETION_REWARD" and AbyssUIAddonSettings.ExtraFunctionInstanceLeave == true) then
			UIFrameFadeIn(AbyssUI_InstanceLeave_DynamicFrame, 1, 0, 1)
		else 
			return nil
		end
	end)
end
-- End
