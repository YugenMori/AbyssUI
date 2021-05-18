-- Author: Yugen
--
-- Shadowlands + BCC
--
-- Classic module for AbyssUI
--------------------------------------------------------------
-- Init - Tables - Saves
local addonName, addonTable = ...
local GetWoWVersion = ((select(4, GetBuildInfo())))
local L = LibStub("AceLocale-3.0"):GetLocale("AbyssUI")
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
-- Fontfication
local function AbyssUI_Fontification(globalFont, subFont, damageFont)
local locale = GetLocale()
local fontName, fontHeight, fontFlags = MinimapZoneText:GetFont()
local mediaFolder = "Interface\\AddOns\\AbyssUI\\textures\\font\\"
	if (locale == "zhCN") then
		globalFont	= mediaFolder.."zhCN-TW\\senty.ttf"
		subFont 	= mediaFolder.."zhCN-TW\\senty.ttf"
		damageFont 	= mediaFolder.."zhCN-TW\\senty.ttf"
	elseif (locale == "zhTW") then
		globalFont	= mediaFolder.."zhCN-TW\\senty.ttf"
		subFont 	= mediaFolder.."zhCN-TW\\senty.ttf"
		damageFont 	= mediaFolder.."zhCN-TW\\senty.ttf"
	elseif (locale == "ruRU") then
		globalFont	= mediaFolder.."ruRU\\dejavu.ttf"
		subFont 	= mediaFolder.."ruRU\\dejavu.ttf"
		damageFont 	= mediaFolder.."ruRU\\dejavu.ttf"
	elseif (locale == "koKR") then
		globalFont	= mediaFolder.."koKR\\dxlbab.ttf"
		subFont 	= mediaFolder.."koKR\\dxlbab.ttf"
		damageFont 	= mediaFolder.."koKR\\dxlbab.ttf"
	elseif (locale == "frFR" or locale == "deDE" or locale == "enGB" or locale == "enUS" or locale == "itIT" or
		locale == "esES" or locale == "esMX" or locale == "ptBR") then
		globalFont	= mediaFolder.."global.ttf"
		subFont 	= mediaFolder.."npcfont.ttf"
		damageFont 	= mediaFolder.."damagefont.ttf"
	else
		globalFont	= fontName
		subFont 	= fontName
		damageFont 	= fontName
	end
	return globalFont, subFont, damageFont
end
local globalFont, subFont, damageFont = AbyssUI_Fontification(globalFont, subFont, damageFont)
local function AbyssUI_ColorizationFrameFunction(...)
	local v = ...
	if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
		v:SetVertexColor(1, 1, 1)
	elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
		v:SetVertexColor(.2, .2, .2)
	elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
		v:SetVertexColor(182/255, 42/255, 37/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
		v:SetVertexColor(236/255, 193/255, 60/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
		v:SetVertexColor(196/255, 31/255, 59/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
		v:SetVertexColor(163/255, 48/255, 201/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
		v:SetVertexColor(252/255, 163/255, 85/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
		v:SetVertexColor(190/255, 221/255, 115/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
		v:SetVertexColor(64/255, 220/255, 255/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
		v:SetVertexColor(86/255, 255/255, 184/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
		v:SetVertexColor(255/255, 155/255, 195/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
		v:SetVertexColor(23/255, 28/255, 99/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
		v:SetVertexColor(255/255, 255/255, 0/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
		v:SetVertexColor(0/255, 112/255, 222/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
		v:SetVertexColor(135/255, 135/255, 237/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
		v:SetVertexColor(199/255, 156/255, 110/255)
	elseif AbyssUIAddonSettings.UIVertexColorFramesColorPicker == true then
		local character = UnitName("player").."-"..GetRealmName()
		v:SetVertexColor(COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b)	
	else
		v:SetVertexColor(.4, .4, .4)
	end
end
-- RegionList
local function AbyssUI_RegionListSize(self, width, height)
	local regionList = { 
		self:GetRegions() } 
	for i, self in ipairs(regionList) do 
	    local regionType = self:GetObjectType() 
	    if regionType == "Texture" and not self:GetTexture() then  -- the region with no texture, just black colour
	        self:SetWidth(width)
			self:SetHeight(height)
	        break 
	    end  
	end
end
-- FrameSize
local function AbyssUI_FrameSize(self, width, height)
	self:SetWidth(width)
	self:SetHeight(height)
end
--------------------------------------------------------------
-- UnitColor
local UnitColor
local function UnitColor(unit)
  if (AbyssUIAddonSettings.UnitFrameImproved == true) then
    local r, g, b
    if ((not UnitIsPlayer(unit)) and ((not UnitIsConnected(unit)) or (UnitIsDeadOrGhost(unit)))) then
      --Color it gray
      r, g, b = 0.5, 0.5, 0.5
    elseif (UnitIsPlayer(unit)) then
      --Try to color it by class.
      local localizedClass, englishClass = UnitClass(unit)
      local classColor = RAID_CLASS_COLORS[englishClass]
      if (classColor and not AbyssUIAddonSettings.GreenHealth) then
        r, g, b = classColor.r, classColor.g, classColor.b
      else
        if (UnitIsFriend("player", unit)) then
          r, g, b = 0.0, 1.0, 0.0
        else
          r, g, b = 1.0, 0.0, 0.0
        end
      end
    else
      r, g, b = UnitSelectionColor(unit)
    end
    return r, g, b
  end
end
---------------------------- Classic Modules ----------------------------------


---------------------------- Classic Frames ----------------------------------
local ClassicFrames = CreateFrame("Frame")
ClassicFrames:RegisterEvent("ADDON_LOADED")
ClassicFrames:SetScript("OnEvent", function(self, event, addon)
	if (addon == "AbyssUI") then
		if (GetWoWVersion == 20501) then
			-- General
			for i, v in pairs({ 
				MiniMapTrackingBorder,
				GameTimeTexture,
				MainMenuXPBarTexture0,
				MainMenuXPBarTexture1,
				MainMenuXPBarTexture2,
				MainMenuXPBarTexture3,
				ReputationWatchBar.StatusBar.WatchBarTexture0,
				ReputationWatchBar.StatusBar.WatchBarTexture1,
				ReputationWatchBar.StatusBar.WatchBarTexture2,
				ReputationWatchBar.StatusBar.WatchBarTexture3,
				ChatFrame1EditBoxLeft,
				ChatFrame1EditBoxMid,
				ChatFrame1EditBoxRight,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			--GameMenuFrame
			for i, v in pairs({ 
				GameMenuFrame.BottomEdge,
				GameMenuFrame.BottomLeftCorner,
				GameMenuFrame.BottomRightCorner,
				GameMenuFrame.Center,
				GameMenuFrame.LeftEdge,
				GameMenuFrame.RightEdge,
				GameMenuFrame.TopLeftCorner,
				GameMenuFrame.TopRightCorner,
				GameMenuFrameHeader,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- HelpFrame
			for i, v in pairs({ 
				HelpFrameTopBorder,
				HelpFrameTopLeftCorner,
				HelpFrameTopRightCorner,
				HelpFrameBotLeftCorner,
				HelpFrameBotRightCorner,
				HelpFrameLeftBorder,
				HelpFrameRightBorder,
				HelpFrameBottomBorder,
				HelpFrameBtnCornerLeft,
				HelpFrameBtnCornerRight,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- InterfaceOptionsFrame
			for i, v in pairs({ 
				InterfaceOptionsFrame.BottomEdge,
				InterfaceOptionsFrame.BottomLeftCorner,
				InterfaceOptionsFrame.BottomRightCorner,
				InterfaceOptionsFrame.Center,
				InterfaceOptionsFrame.LeftEdge,
				InterfaceOptionsFrame.RightEdge,
				InterfaceOptionsFrame.TopEdge,
				InterfaceOptionsFrame.TopLeftCorner,
				InterfaceOptionsFrame.TopRightCorner,
				InterfaceOptionsFrameHeader,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- VideoOptionsFrame
			for i, v in pairs({ 
				VideoOptionsFrame.BottomEdge,
				VideoOptionsFrame.BottomLeftCorner,
				VideoOptionsFrame.BottomRightCorner,
				VideoOptionsFrame.Center,
				VideoOptionsFrame.LeftEdge,
				VideoOptionsFrame.RightEdge,
				VideoOptionsFrame.TopEdge,
				VideoOptionsFrame.TopLeftCorner,
				VideoOptionsFrame.TopRightCorner,
				VideoOptionsFrameHeader,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- AddonList
			for i, v in pairs({ 
				AddonListTopBorder,
				AddonListTopLeftCorner,
				AddonListTopRightCorner,
				AddonListBotLeftCorner,
				AddonListBotRightCorner,
				AddonListLeftBorder,
				AddonListRightBorder,
				AddonListBottomBorder,
				AddonListButtonBottomBorder,
				AddonListBtnCornerLeft,
				AddonListBtnCornerRight,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- ContainerFrame1
			for i, v in pairs({ 
				ContainerFrame1Background1Slot,
				ContainerFrame1BackgroundBottom,
				ContainerFrame1BackgroundMiddle1,
				ContainerFrame1BackgroundMiddle2,
				ContainerFrame1BackgroundTop,
				ContainerFrame1BackgroundPortrait,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- ContainerFrame2
			for i, v in pairs({ 
				ContainerFrame2Background1Slot,
				ContainerFrame2BackgroundBottom,
				ContainerFrame2BackgroundMiddle1,
				ContainerFrame2BackgroundMiddle2,
				ContainerFrame2BackgroundTop,
				ContainerFrame2BackgroundPortrait,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- ContainerFrame3
			for i, v in pairs({ 
				ContainerFrame3Background1Slot,
				ContainerFrame3BackgroundBottom,
				ContainerFrame3BackgroundMiddle1,
				ContainerFrame3BackgroundMiddle2,
				ContainerFrame3BackgroundTop,
				ContainerFrame3BackgroundPortrait,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- ContainerFrame4
			for i, v in pairs({ 
				ContainerFrame4Background1Slot,
				ContainerFrame4BackgroundBottom,
				ContainerFrame4BackgroundMiddle1,
				ContainerFrame4BackgroundMiddle2,
				ContainerFrame4BackgroundTop,
				ContainerFrame4BackgroundPortrait,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- ContainerFrame5
			for i, v in pairs({ 
				ContainerFrame5Background1Slot,
				ContainerFrame5BackgroundBottom,
				ContainerFrame5BackgroundMiddle1,
				ContainerFrame5BackgroundMiddle2,
				ContainerFrame5BackgroundTop,
				ContainerFrame5BackgroundPortrait,
		 	 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- StaticPopUp ("LogoutFrame")
			for i, v in pairs({	
				StaticPopup1.BottomEdge,
				StaticPopup1.BottomLeftCorner,
				StaticPopup1.BottomRightCorner,
				StaticPopup1.Center,
				StaticPopup1.LeftEdge,
				StaticPopup1.RightEdge,
				StaticPopup1.TopEdge,
				StaticPopup1.TopLeftCorner,
				StaticPopup1.TopRightCorner,
				StaticPopup2.BottomEdge,
				StaticPopup2.BottomLeftCorner,
				StaticPopup2.BottomRightCorner,
				StaticPopup2.Center,
				StaticPopup2.LeftEdge,
				StaticPopup2.RightEdge,
				StaticPopup2.TopEdge,
				StaticPopup2.TopLeftCorner,
				StaticPopup2.TopRightCorner,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					if (not InCombatLockdown()) then
						AbyssUI_ColorizationFrameFunction(v)
					end
				end
			end
			-- FriendsFrame
			for i, v in pairs({ 
				FriendsFrameTopBorder,
				FriendsFrameTopLeftCorner,
				FriendsFrameTopRightCorner,
				FriendsFrameBotLeftCorner,
				FriendsFrameBotRightCorner,
				FriendsFrameLeftBorder,
				FriendsFrameRightBorder,
				FriendsFrameBottomBorder,
				FriendsFrameButtonBottomBorder,
				FriendsFrameBtnCornerLeft,
				FriendsFrameBtnCornerRight,
				FriendsFramePortraitFrame,
				FriendsFrameTab1Left,
				FriendsFrameTab1LeftDisabled,
				FriendsFrameTab1Middle,
				FriendsFrameTab1MiddleDisabled,
				FriendsFrameTab1Right,
				FriendsFrameTab1RightDisabled,
				FriendsFrameTab2Left,
				FriendsFrameTab2LeftDisabled,
				FriendsFrameTab2Middle,
				FriendsFrameTab2MiddleDisabled,
				FriendsFrameTab2Right,
				FriendsFrameTab2RightDisabled,
				FriendsFrameTab3Left,
				FriendsFrameTab3LeftDisabled,
				FriendsFrameTab3Middle,
				FriendsFrameTab3MiddleDisabled,
				FriendsFrameTab3Right,
				FriendsFrameTab3RightDisabled,
				FriendsFrameTab4Left,
				FriendsFrameTab4LeftDisabled,
				FriendsFrameTab4Middle,
				FriendsFrameTab4MiddleDisabled,
				FriendsFrameTab4Right,
				FriendsFrameTab4RightDisabled,
				FriendsFrameBattlenetFrame.BroadcastFrame.BottomEdge,
				FriendsFrameBattlenetFrame.BroadcastFrame.BottomLeftCorner,
				FriendsFrameBattlenetFrame.BroadcastFrame.BottomRightCorner,
				FriendsFrameBattlenetFrame.BroadcastFrame.Center,
				FriendsFrameBattlenetFrame.BroadcastFrame.LeftEdge,
				FriendsFrameBattlenetFrame.BroadcastFrame.RightEdge,
				FriendsFrameBattlenetFrame.BroadcastFrame.TopEdge,
				FriendsFrameBattlenetFrame.BroadcastFrame.TopLeftCorner,
				FriendsFrameBattlenetFrame.BroadcastFrame.TopRightCorner,
				DropDownList1Backdrop.BottomEdge,
				DropDownList1Backdrop.BottomLeftCorner,
				DropDownList1Backdrop.BottomRightCorner,
				DropDownList1Backdrop.Center,
				DropDownList1Backdrop.LeftEdge,
				DropDownList1Backdrop.RightEdge,
				DropDownList1Backdrop.TopEdge,
				DropDownList1Backdrop.TopLeftCorner,
				DropDownList1Backdrop.TopRightCorner,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end

		else
			return nil
		end
	end		
end)
---------------------------- Classic Functions ----------------------------------
-- KeyBindingFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_BindingUI" and GetWoWVersion == 20501 then
		for i, v in pairs({
			KeyBindingFrame.BottomEdge,
			KeyBindingFrame.BottomLeftCorner,
			KeyBindingFrame.BottomRightCorner,
			KeyBindingFrame.Center,
			KeyBindingFrame.LeftEdge,
			KeyBindingFrame.RightEdge,
			KeyBindingFrame.TopEdge,
			KeyBindingFrame.TopLeftCorner,
			KeyBindingFrame.TopRightCorner,
			KeyBindingFrameHeader, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- MacroFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_MacroUI" and GetWoWVersion == 20501 then
		for i, v in pairs({
			MacroFramePortraitFrame,
			MacroFrameTopBorder,
			MacroFrameTopLeftCorner,
			MacroFrameTopRightCorner,
			MacroFrameBotLeftCorner,
			MacroFrameBotRightCorner,
			MacroFrameLeftBorder,
			MacroFrameRightBorder,
			MacroFrameBottomBorder,
			MacroFrameButtonBottomBorder,
			MacroFrameBtnCornerLeft,
			MacroFrameBtnCornerRight, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- TimeManagerFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TimeManager" and GetWoWVersion == 20501 then
		for i, v in pairs({
			TimeManagerFrameTopBorder,
			TimeManagerFrameTopLeftCorner,
			TimeManagerFrameTopRightCorner,
			TimeManagerFrameBotLeftCorner,
			TimeManagerFrameBotRightCorner,
			TimeManagerFrameLeftBorder,
			TimeManagerFrameRightBorder,
			TimeManagerFrameBottomBorder,
			TimeManagerFrameButtonBottomBorder,
			TimeManagerFrameBtnCornerLeft,
			TimeManagerFrameBtnCornerRight,
			TimeManagerFramePortraitFrame, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
			
---------------------------- Classic Dynamically ----------------------------------
-- PaperDollFrame
--[[
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "AbyssUI" and GetWoWVersion == 20501 then
		hooksecurefunc("PaperDollFrame_OnLoad", function(self, texture)
	     if string.find(texture, "PaperDoll") then
	        self.SetVertexColor(0,0,0)
	     end
		end)
end)
--]]