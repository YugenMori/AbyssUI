-- Author: Yugen
--
-- Supports any version of wow
--
-- Functions for AbyssUI
--------------------------------------------------------------
-- Init - Tables - Saves
local addonName, addonTable = ...
local GetWoWVersion = ((select(4, GetBuildInfo())))
local L = LibStub("AceLocale-3.0"):GetLocale("AbyssUI")
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
      COLOR_MY_UI[character].Color = { r = 1, g = 1, b = 1}
  end
end)
-- Fontfication
local function AbyssUI_Fontification(globalFont, subFont, damageFont, oldglobalFont)
local locale = GetLocale()
local fontName, fontHeight, fontFlags = MinimapZoneText:GetFont()
local mediaFolder = "Interface\\AddOns\\AbyssUI\\Textures\\font\\"
  if ( locale == "zhCN") then
    globalFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    subFont   = mediaFolder.."zhCN-TW\\senty.ttf"
    damageFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    oldglobalFont = mediaFolder.."zhCN-TW\\senty.ttf"
  elseif ( locale == "zhTW" ) then
    globalFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    subFont   = mediaFolder.."zhCN-TW\\senty.ttf"
    damageFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    oldglobalFont = mediaFolder.."zhCN-TW\\senty.ttf"
  elseif ( locale == "ruRU" ) then
    globalFont  = mediaFolder.."ruRU\\dejavu.ttf"
    subFont   = mediaFolder.."ruRU\\dejavu.ttf"
    damageFont  = mediaFolder.."ruRU\\dejavu.ttf"
    oldglobalFont = mediaFolder.."ruRU\\dejavu.ttf"
  elseif ( locale == "koKR" ) then
    globalFont  = mediaFolder.."koKR\\dxlbab.ttf"
    subFont   = mediaFolder.."koKR\\dxlbab.ttf"
    damageFont  = mediaFolder.."koKR\\dxlbab.ttf"
    oldglobalFont = mediaFolder.."koKR\\dxlbab.ttf"
  elseif ( locale == "frFR" or locale == "deDE" or locale == "enGB" or locale == "enUS" or locale == "itIT" or
    locale == "esES" or locale == "esMX" or locale == "ptBR") then
    globalFont  = mediaFolder.."global.ttf"
    subFont   = mediaFolder.."npcfont.ttf"
    damageFont  = mediaFolder.."damagefont.ttf"
    oldglobalFont = mediaFolder .. "damagefont_classic.ttf"
  else
    globalFont  = fontName
    subFont   = fontName
    damageFont  = fontName
    oldglobalFont = fontName
  end
  return globalFont, subFont, damageFont, oldglobalFont
end
-- declarations
local globalFont, subFont, damageFont, oldglobalFont = AbyssUI_Fontification(globalFont, subFont, damageFont, oldglobalFont)
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
	elseif AbyssUIAddonSettings.UIVertexColorFrames17 == true then
		v:SetVertexColor(51/255, 147/255, 127/255)
	elseif AbyssUIAddonSettings.UIVertexColorFramesColorPicker == true then
		local character = UnitName("player").."-"..GetRealmName()
		v:SetVertexColor(COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b)	
	else
		v:SetVertexColor(.4, .4, .4)
	end
end
local function AbyssUI_RBGColorizationFrameFunction(...)
	local v = ...
	if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
		return 1, 1, 1
	elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
		return .2, .2, .2
	elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
		return 182/255, 42/255, 37/255
	elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
		return 236/255, 193/255, 60/255
	elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
		return 196/255, 31/255, 59/255
	elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
		return 163/255, 48/255, 201/255
	elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
		return 252/255, 163/255, 85/255
	elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
		return 190/255, 221/255, 115/255
	elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
		return 64/255, 220/255, 255/255
	elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
		return 86/255, 255/255, 184/255
	elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
		return 255/255, 155/255, 195/255
	elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
		return 23/255, 28/255, 99/255
	elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
		return 255/255, 255/255, 0/255
	elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
		return 0/255, 112/255, 222/255
	elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
		return 135/255, 135/255, 237/255
	elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
		return 199/255, 156/255, 110/255
	elseif AbyssUIAddonSettings.UIVertexColorFrames17 == true then
		return 51/255, 147/255, 127/255
	elseif AbyssUIAddonSettings.UIVertexColorFramesColorPicker == true then
		local character = UnitName("player").."-"..GetRealmName()
		return COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b	
	else
		return .4, .4, .4
	end
end
-- RegionList
local function AbyssUI_RegionListSize(self, width, height)
	if (GetWoWVersion <= 90500) then
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
end
-- FrameSize
local function AbyssUI_FrameSize(self, width, height)
	if (GetWoWVersion <= 90500) then
		self:SetWidth(width)
		self:SetHeight(height)
	end
end
--------------------------------------------------------------
--------------------------------------------------------------
-- Class Icons
hooksecurefunc("UnitFramePortrait_Update", function(self)
	if self.portrait then
		if UnitIsPlayer(self.unit) then
			local t = CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))]
			if t and AbyssUIAddonSettings.UIClassCircles01 ~= true and 
				AbyssUIAddonSettings.UIClassCircles02 ~= true and 
				AbyssUIAddonSettings.UIClassCircles03 ~= true and 
				AbyssUIAddonSettings.UIClassCircles04 ~= true and 
				AbyssUIAddonSettings.UIClassCircles05 ~= true and 
				AbyssUIAddonSettings.UIClassCircles06 ~= true and 
				AbyssUIAddonSettings.UIClassCircles07 ~= true and 
				AbyssUIAddonSettings.UIClassCircles08 ~= true and 
				AbyssUIAddonSettings.UIClassCircles09 ~= true and 
				AbyssUIAddonSettings.UIClassCircles10 ~= true and 
				AbyssUIAddonSettings.UIClassCircles11 ~= true and 
				AbyssUIAddonSettings.UIClassCircles12 ~= true and
				AbyssUIAddonSettings.UIClassCircles13 ~= true and
				AbyssUIAddonSettings.UIClassCircles14 ~= true and
				AbyssUIAddonSettings.UIClassCircles15 ~= true and
				AbyssUIAddonSettings.UIClassCircles16 ~= true then
				self.portrait:SetTexCoord(0, 1, 0, 1)
			else
				self.portrait:SetTexCoord(0, 1, 0, 1)
			end
			if t and AbyssUIAddonSettings.UIClassCircles01 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_ARTISTIC01")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles02 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_BRIGHT")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles03 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_CLASSIC")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles04 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_ARTISTIC02")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles05 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_DARK")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles06 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_DARK_GRAY")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles07 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_DARK_V2")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles08 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_GRAYSCALE")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles09 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_LIGHT_GRAY")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles10 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_MEDIUM_GRAY")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles11 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_MINIMAL_BLUE")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles12 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_MINIMAL_RED")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles13 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_MUTED")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles14 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_PSYCHEDELIC")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles15 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_RETRO")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles16 == true then
				self.portrait:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\targetingframe\\UI-CLASSES-CIRCLES_VIBRANT")
				self.portrait:SetTexCoord(unpack(t))
			else
				return nil
			end
		else
			self.portrait:SetTexCoord(0, 1, 0, 1)
		end
	end
end)
-- Class HP Colours
local function colour(statusbar, unit)
    local _, class, c
    if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
        _, class = UnitClass(unit)
        if class == "SHAMAN" then
            -- Change the color to Shaman color
            c = RAID_CLASS_COLORS[class]
            statusbar:SetStatusBarColor(c.r, c.g, c.b)
        elseif AbyssUIAddonSettings.ExtraFunctionFriendlyHealthGreen ~= true and not AbyssUIAddonSettings.GreenHealth and not AbyssUIAddonSettings.ExtraFunctionPlayerHealthGreen then
            c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
            statusbar:SetStatusBarColor(c.r, c.g, c.b)
        end
    end
end

hooksecurefunc("UnitFrameHealthBar_Update", colour)
hooksecurefunc("HealthBar_OnValueChanged", function(self)
    colour(self, self.unit)
end)

----------------------------------------------------
-- Class HP Colours
local function colour(statusbar, unit)
	if(AbyssUIAddonSettings.ExtraFunctionFriendlyHealthGreen ~= true) then
		if (AbyssUIAddonSettings.ExtraFunctionPlayerHealthGreen ~= true) then
			if (AbyssUIAddonSettings.ExtraFunctionHideBackgroundClassColor ~= true) then
				if (GetWoWVersion <= 90500) then
					if (PlayerFrame:IsShown() and not PlayerFrame.bg and AbyssUIAddonSettings.UnitFrameImproved ~= true) then
						local _, class = UnitClass(unit)
						c = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
						local bg = PlayerFrame:CreateTexture()
						bg:SetPoint("TOPLEFT", PlayerFrameBackground)
						bg:SetPoint("BOTTOMRIGHT", PlayerFrameBackground, 0, 22)
						bg:SetTexture(TargetFrameNameBackground:GetTexture())
						if (class == "SHAMAN" and AbyssUIAddonSettings.ExtraFunctionShamanPink ~= true) then
							bg:SetVertexColor(0/255, 112/255, 222/255)
						else
							bg:SetVertexColor(c.r,c.g,c.b)
						end
						PlayerFrame.bg = true
					end
				end
			end
			local _, class, c
			if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
				_, class = UnitClass(unit)
				c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
				statusbar:SetStatusBarColor(c.r, c.g, c.b)
				if ( class == "SHAMAN" and AbyssUIAddonSettings.ExtraFunctionShamanPink ~= true) then
					statusbar:SetStatusBarColor(0/255, 112/255, 222/255)
				else 
					statusbar:SetStatusBarColor(c.r, c.g, c.b)
				end
				--PlayerFrameHealthBar:SetStatusBarColor(0, 1, 0)
			end
		end
	else 
		return nil
	end
end
hooksecurefunc("UnitFrameHealthBar_Update", colour)
hooksecurefunc("HealthBar_OnValueChanged", function(self)
	colour(self, self.unit)
end)
----------------------------------------------------
-- Class colours on players names
local frame = CreateFrame("Frame", "$parentFrame", nil)
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("UNIT_FACTION")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
local function eventHandler(self, event, ...)
	if (GetWoWVersion < 90000) then
		--Thanks to Tz for the player background
		if ( AbyssUIAddonSettings.ExtraFunctionTransparentName ~= true) then
			if ( AbyssUIAddonSettings.ExtraFunctionHideBackgroundClassColor ~= true ) then
				if UnitIsPlayer("target") then
					local _, class2 = UnitClass("target")
					c = RAID_CLASS_COLORS[select(2, UnitClass("target"))]
					TargetFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
					if ( class2 == "SHAMAN" and AbyssUIAddonSettings.ExtraFunctionShamanPink ~= true ) then
						TargetFrameNameBackground:SetVertexColor(0/255, 112/255, 222/255)
					else 
						TargetFrameNameBackground:SetVertexColor(c.r,c.g,c.b)
					end
				else
					return nil
				end
			else
				return nil
			end
		else
			-- Remove background
			TargetFrameNameBackground:SetAlpha(0.5)
			TargetFrameNameBackground:SetVertexColor(0/255, 0/255, 0/255)
		end
	end
end

frame:SetScript("OnEvent", eventHandler)
for _, BarTextures in pairs({TargetFrameNameBackground}) do
	BarTextures:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
end
----------------------------------------------------
-- Minimap Tweaks
if (GetWoWVersion <= 90500) then
	MinimapZoomIn:Hide()
	MinimapZoomOut:Hide()
	Minimap:EnableMouseWheel(true)
	Minimap:SetScript('OnMouseWheel', function(self, delta)
		if delta > 0 then
			Minimap_ZoomIn()
		else
			Minimap_ZoomOut()
		end
	end)
	if (GetWoWVersion > 31400) then
		MiniMapTracking:ClearAllPoints()
		MiniMapTracking:SetPoint("TOPRIGHT", -26, 7)
	end
end
----------------------------------------------------
-- Tooltip Class Color and extras 
local function AbyssUI_TooltipSetUnit()
	if AbyssUIAddonSettings.DefaultTooltipColor ~= true then
		-- OnTooltipSetUnit
		local _, unit = GameTooltip:GetUnit()
		if  UnitIsPlayer(unit) then
			local _, class = UnitClass(unit)
			local color = class and (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
			if (color ~= nil) then
				local text  = GameTooltipTextLeft1:GetText()
				local text2 = GameTooltipTextLeft2:GetText()
				local text3 = GameTooltipTextLeft3:GetText()
				local text4 = GameTooltipTextLeft4:GetText()
				local englishFaction, localizedFaction = UnitFactionGroup(unit)
				if (text ~= nil and text2 ~= nil) then
					GameTooltipTextLeft1:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text:match("|cff\x\x\x\x\x\x(.+)|r") or text)
					GameTooltipTextLeft2:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text2:match("|cff\x\x\x\x\x\x(.+)|r") or text2)
				end
				if (text ~= nil and text2 ~= nil and text3 ~= nil) then
					GameTooltipTextLeft3:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text3:match("|cff\x\x\x\x\x\x(.+)|r") or text3)
				end
				if (text ~= nil and text2 ~= nil and text3 ~= nil and text4 ~= nil) then
					GameTooltipTextLeft4:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text4:match("|cff\x\x\x\x\x\x(.+)|r") or text4)
				end
				if (text ~= nil and text2 ~= nil and text3 ~= nil and text4 ~= nil) then
					local text5 = GameTooltipTextLeft5:GetText()
					if (text5 ~= nil) then
						GameTooltipTextLeft5:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text5:match("|cff\x\x\x\x\x\x(.+)|r") or text5)
					end
				end
				if (text ~= nil and text2 ~= nil and text3 ~= nil and text4 ~= nil and text5 ~= nil) then
					local text6 = GameTooltipTextLeft6:GetText()
					if (text6 ~= nil) then
						GameTooltipTextLeft6:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text6:match("|cff\x\x\x\x\x\x(.+)|r") or text6)
					end
				end
			end
		end
	end
end
if (GetWoWVersion <= 90500) then
	GameTooltip:HookScript("OnUpdate", function(self, elapsed)
	-- Call AbyssUI_TooltipSetUnit() every 0.5 seconds
		if not self.lastUpdate or self.lastUpdate < GetTime() - 0.1 then
			AbyssUI_TooltipSetUnit()
			self.lastUpdate = GetTime()
		end
	end)
end
----------------------------------------------------
-- UnitColor
local UnitColor
local function UnitColor(unit)
	local r, g, b, a
	if ((not UnitIsPlayer(unit)) and ((not UnitIsConnected(unit)) or (UnitIsDeadOrGhost(unit)))) then
		--Color it gray
		r, g, b, a = 0.5, 0.5, 0.5, 1
	elseif (UnitIsPlayer(unit)) then
		--Try to color it by class.
		local localizedClass, englishClass = UnitClass(unit)
		local classColor = RAID_CLASS_COLORS[englishClass]
		if (classColor and not AbyssUIAddonSettings.GreenHealth) then
			r, g, b, a = classColor.r, classColor.g, classColor.b, classColor.a
		else
			if (UnitIsFriend("player", unit)) then
				r, g, b, a = 0.0, 1.0, 0.0, 1
			else
				r, g, b, a = 1.0, 0.0, 0.0, 1
			end
		end
	else	
		r, g, b, a = UnitSelectionColor(unit)
	end
	return r, g, b, a
end
-- Tooltip
-- Tooltip Background and borders
if (GetWoWVersion <= 90500) then
	if (GetWoWVersion >= 40500) then
		local TooltipBackground = GameTooltip:CreateTexture(nil, "LOW", nil)
		TooltipBackground:SetPoint("TOPLEFT", 3, -3)
		TooltipBackground:SetPoint("BOTTOMRIGHT", -3, 3)
		TooltipBackground:SetColorTexture(0.02, 0.02, 0.02)
		TooltipBackground:SetAlpha(0.5, 0.5, 0.5, 0.5)
	end
end
-- Tooltip Class Color Health
GameTooltip:HookScript("OnUpdate", function(self, elapsed)
	local _, unit = self:GetUnit()
	if unit == nil then return end
	if (AbyssUIAddonSettings ~= nil and AbyssUIAddonSettings.DisableTooltipHealth ~= true) then
		GameTooltipStatusBar:SetAlpha(1)
		if UnitIsPlayer(unit) then
			local _, class = UnitClass(unit)
			local color = class and (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
			if color then
				GameTooltipStatusBar:SetStatusBarColor(color.r, color.g, color.b)
			end		
		else
			GameTooltipStatusBar:SetStatusBarColor(UnitColor(unit))
		end
	else
		GameTooltipStatusBar:SetAlpha(0)
	end
end)
----------------------------------------------------
-- StatsFrame
-- Many thanks to Syiana for part of this
local StatsFrame = CreateFrame("Frame", "$parentStatsFrame", UIParent)
local movable = true
local frame_anchor = "TOP"
local pos_x = -250
local pos_y = -6
StatsFrame:SetPoint('BOTTOMLEFT', UIParent, "BOTTOMLEFT", 5, 5)
StatsFrame:SetMovable(true)
StatsFrame:EnableMouse(true)
StatsFrame:SetClampedToScreen(true)
StatsFrame:RegisterForDrag("LeftButton")
StatsFrame:SetScript("OnDragStart", StatsFrame.StartMoving)
StatsFrame:SetScript("OnDragStop", StatsFrame.StopMovingOrSizing)

local CF = CreateFrame("Frame", "$parentFrame", nil)
CF:RegisterEvent("PLAYER_LOGIN")
CF:SetScript("OnEvent", function(self, event)
	if (AbyssUIAddonSettings.HideFPSMSFrame ~= nil and AbyssUIAddonSettings.HideFPSMSFrame == true) then
		StatsFrame:ClearAllPoints()
		StatsFrame:SetPoint('BOTTOMLEFT', UIParent, "BOTTOMLEFT", 5, 5)
	end
	local color
	if customColor == false then
		color = { r = 1, g = 1, b = 1 }
	else
		local _, class = UnitClass("player")
		color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
	end
	local function numFormat(v)
		if v > 1E10 then
			return (floor(v/1E9)).."b"
		elseif v > 1E9 then
			return (floor((v/1E9)*10)/10).."b"
		elseif v > 1E7 then
			return (floor(v/1E6)).."m"
		elseif v > 1E6 then
			return (floor((v/1E6)*10)/10).."m"
		elseif v > 1E4 then
			return (floor(v/1E3)).."k"
		elseif v > 1E3 then
			return (floor((v/1E3)*10)/10).."k"
		else
			return v
		end
	end
	local function ColorGradient(perc, ...)
		if (perc > 1) then
			local r, g, b = select(select('#', ...) - 2, ...) return r, g, b
		elseif (perc < 0) then
			local r, g, b = ... return r, g, b
		end

		local num = select('#', ...) / 3

		local segment, relperc = math.modf(perc*(num-1))
		local r1, g1, b1, r2, g2, b2 = select((segment*3)+1, ...)

		return r1 + (r2-r1)*relperc, g1 + (g2-g1)*relperc, b1 + (b2-b1)*relperc
	end
	local function RGBGradient(num)
		local r, g, b = ColorGradient(num, unpack(gradientColor))
		return r, g, b
	end
	local function RGBToHex(r, g, b)
		r = r <= 1 and r >= 0 and r or 0
		g = g <= 1 and g >= 0 and g or 0
		b = b <= 1 and b >= 0 and b or 0
		return string.format('|cff%02x%02x%02x', r*255, g*255, b*255)
	end
	local function getFPS()
		return "|c00ffffff" .. floor(GetFramerate()+0.5) .. "|r fps"
	end
	local function getLatencyWorldRaw()
		return select(4, GetNetStats())
	end
	local function getLatencyWorld()
		return "|c00ffffff" .. getLatencyWorldRaw() .. "|r ms"
	end
	local function getLatencyRaw()
		return select(3, GetNetStats())
	end
	local function getLatency()
		return "|c00ffffff" .. getLatencyRaw() .. "|r ms"
	end
	local function getTime()
		if use12 == true then
			local t = date("%I:%M")
			local ampm = date("%p")
			return "|c00ffffff"..t.."|r "..strlower(ampm)
		else
			local t = date("%H:%M")
			return "|c00ffffff"..t.."|r"
		end
	end
	StatsFrame:SetWidth(50)
	StatsFrame:SetHeight(18)

	StatsFrame.text = StatsFrame:CreateFontString(nil, 'BACKGROUND')
	StatsFrame.text:SetPoint("BOTTOMLEFT", StatsFrame)
	StatsFrame.text:SetFont(damageFont, 12)
	StatsFrame.text:SetShadowColor(0, 0, 0)
	StatsFrame.text:SetShadowOffset(1, -1)
	if useShadow then
		StatsFrame.text:SetShadowOffset(1, -1)
		StatsFrame.text:SetShadowColor(0, 0, 0)
	end
	StatsFrame.text:SetTextColor(color.r, color.g, color.b)
	local lastUpdate = 0
	local function update(self, elapsed)
		lastUpdate = lastUpdate + elapsed
		if lastUpdate > 1 then
			lastUpdate = 0
			if showClock == true then
				StatsFrame.text:SetText(getFPS().." "..getLatency().." ")
			else
				StatsFrame.text:SetText(getFPS().." "..getLatency().." ")
			end
			self:SetWidth(StatsFrame.text:GetStringWidth())
			self:SetHeight(StatsFrame.text:GetStringHeight())
		end
	end
	if (AbyssUIAddonSettings.SquareMinimap ~= true) then
		StatsFrame:SetScript("OnUpdate", update)
	else
		return nil
	end
end)
local StatsFrameCheck_ = CreateFrame("CheckButton", "$parentStatsFrameCheck_", UIParent, "ChatConfigCheckButtonTemplate")
StatsFrameCheck_:RegisterEvent("PLAYER_ENTERING_WORLD")
StatsFrameCheck_:SetScript("OnEvent", function(self, event, ...)
	if (AbyssUIAddonSettings.HideFPSMSFrame == true or AbyssUIAddonSettings.FadeUI == true) then
		StatsFrame:Hide()
	else
		StatsFrame:Show()
	end
end)
----------------------------------------------------
-- Auto Repair/Sell Grey
local AbyssUI_AutoSell = CreateFrame("Frame", "$parentAbyssUI_AutoSell", nil)
AbyssUI_AutoSell:RegisterEvent("MERCHANT_SHOW")
AbyssUI_AutoSell:SetScript("OnEvent", function()
	if ( AbyssUIAddonSettings.ExtraFunctionSellGray == true ) then
		local bag, slot
		for bag = 0, 4 do
	    	for slot = 0, C_Container.GetContainerNumSlots(bag) do
	        	local link = C_Container.GetContainerItemLink(bag, slot)
	       		if link and (select(3, GetItemInfo(link)) == 0) then
	            	C_Container.UseContainerItem(bag, slot)
	        	end
	    	end
		end
	end
	if ( AbyssUIAddonSettings.ExtraFunctionRepair == true ) then
	    if( CanMerchantRepair() ) then
	        local cost = GetRepairAllCost()
	        if cost > 0 then
	            local money = GetMoney()
	            if money > cost then
	            	RepairAllItems()
	            	print(format("|cffead000Repair cost: %.1fg|r", cost * 0.0001))
	            else
	            	print("Not enough gold for repair.")
	            end
	    	end
		end
	end
end)
----------------------------------------------------
-- Target Mob(Enemy) Health Bar Color
local frame = CreateFrame("Frame", "$parentFrame", nil)
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
if (GetWoWVersion > 20000) then
	frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
end
local function eventHandler(self, event, ...)
	if (event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_FOCUS_CHANGED") then
		if (GetWoWVersion <= 90500) then
			_, class = UnitClass("Target")
			if (AbyssUIAddonSettings.UnitFrameImproved ~= true) then
				if (UnitAffectingCombat("target") and not UnitPlayerControlled("target")) then
					TargetFrameHealthBar:SetStatusBarColor(255/255, 10/255, 10/255)
				elseif (AbyssUIAddonSettings.ExtraFunctionPlayerHealthGreen == true and UnitPlayerControlled("target")) then
					TargetFrameHealthBar:SetStatusBarColor(10/255, 255/255, 10/255)
				elseif (AbyssUIAddonSettings.ExtraFunctionFriendlyHealthGreen == true) then
					TargetFrameHealthBar:SetStatusBarColor(10/255, 255/255, 10/255)
				else
					if (class == "SHAMAN" and AbyssUIAddonSettings.ExtraFunctionShamanPink ~= true) then
						TargetFrameHealthBar:SetStatusBarColor(0/255, 112/255, 222/255)
					else			
						TargetFrameHealthBar:SetStatusBarColor(UnitColor("target"))
					end
					if (GetWoWVersion > 20000) then
						FocusFrameHealthBar:SetStatusBarColor(UnitColor("focus"))
					end
				end
			end
			if (class == "SHAMAN" and AbyssUIAddonSettings.ExtraFunctionShamanPink ~= true) then
				TargetFrameToTHealthBar:SetStatusBarColor(0/255, 112/255, 222/255)
			else
				TargetFrameToTHealthBar:SetStatusBarColor(UnitColor("targettarget"))
			end
			if (GetWoWVersion > 20000) then
				FocusFrameToTHealthBar:SetStatusBarColor(UnitColor("focustarget"))
			end
		end	
	end
end

frame:SetScript("OnEvent", eventHandler)
for _, BarTextures in pairs({ TargetFrameNameBackground, FocusFrameNameBackground, }) do
	BarTextures:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
end


----------------------------------------------------
-- Keep the color when health changes
hooksecurefunc("HealthBar_OnValueChanged", function()
    if (AbyssUIAddonSettings.UnitFrameImproved ~= true and GetWoWVersion <= 90500) then
        _, class = UnitClass("Target")
        local healthPercentage = ceil(((UnitHealth("target") / UnitHealthMax("target")) * 1000) /10)
        if (AbyssUIAddonSettings.UnitFrameImproved ~= true) then
            if (UnitAffectingCombat("target") and not UnitPlayerControlled("target")) then
                TargetFrameHealthBar:SetStatusBarColor(255/255, 10/255, 10/255)
            elseif (AbyssUIAddonSettings.ExtraFunctionPlayerHealthGreen == true and UnitPlayerControlled("target")) then
                TargetFrameHealthBar:SetStatusBarColor(10/255, 255/255, 10/255)
            elseif (AbyssUIAddonSettings.ExtraFunctionFriendlyHealthGreen == true) then
                TargetFrameHealthBar:SetStatusBarColor(10/255, 255/255, 10/255)
            else
                if (class == "SHAMAN" and AbyssUIAddonSettings.ExtraFunctionShamanPink ~= true) then
                    TargetFrameHealthBar:SetStatusBarColor(0/255, 112/255, 222/255)
                else            
                    TargetFrameHealthBar:SetStatusBarColor(UnitColor("target"))
                end
                if (GetWoWVersion > 20000) then
                    FocusFrameHealthBar:SetStatusBarColor(UnitColor("focus"))
                end
            end
        end
        if (class == "SHAMAN" and AbyssUIAddonSettings.ExtraFunctionShamanPink ~= true) then
            TargetFrameToTHealthBar:SetStatusBarColor(0/255, 112/255, 222/255)
        else
            TargetFrameToTHealthBar:SetStatusBarColor(UnitColor("targettarget"))
        end
        if (GetWoWVersion > 20000) then
            FocusFrameToTHealthBar:SetStatusBarColor(UnitColor("focustarget"))
        end
    end    
end)

----------------------------------------------------
-- UI Scale Elements (On Load)
local ScaleElements = CreateFrame("Frame", "$parentScaleElements", nil)
ScaleElements:RegisterEvent("ADDON_LOADED")
ScaleElements:RegisterEvent("PLAYER_LOGOUT")
ScaleElements:SetScript("OnEvent", function(self, event, arg1)
	if (event == "ADDON_LOADED" and arg1 == "AbyssUI" and GetWoWVersion <= 90500) then
		CastingBarFrame:SetScale(1.05)
	else 
		return nil
	end
end)
----------------------------------------------------
-- Color Picker 
-- Many thanks to Fizz for part of this :thumbsup:
local character
local function ColorPicker_Cancelled()
    local color = ColorPickerFrame.previousValues
    COLOR_MY_UI[character].Color = color
end

local function ColorPicker_Changed(self)
    local r, g, b = ColorPickerFrame:GetColorRGB()
    local color = { r = r, g = g, b = b }
    COLOR_MY_UI[character].Color = color
	--ColorPickerFrame:SetColorRGB(COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b)
end
-- Global Color Function
function AbyssUI_ShowColorPicker()
	if ColorPickerFrame:IsShown() then return end
	ColorPickerFrame.previousValues = COLOR_MY_UI[character].Color
	ColorPickerFrame.cancelFunc = ColorPicker_Cancelled
	ColorPickerFrame.opacityFunc = ColorPicker_Changed
	ColorPickerFrame.func = ColorPicker_Changed
	ColorPickerFrame.swatchFunc = ColorPicker_Changed
	ColorPickerFrame:ClearAllPoints()
	ColorPickerFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", GetCursorPosition())
	ShowUIPanel(ColorPickerFrame)
end
-- Color Save
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
----------------------------------------------------
-- ConfirmPopUps
local AbyssUI_ConfirmPopUps = CreateFrame("Button", '$parentAbyssUI_ConfirmPopUps', nil)
AbyssUI_ConfirmPopUps:RegisterForClicks("AnyDown")
AbyssUI_ConfirmPopUps:SetScript("OnEvent", function()
	SetBindingClick("CTRL-'", AbyssUI_ConfirmPopUps:GetName())
end)
AbyssUI_ConfirmPopUps:RegisterEvent("PLAYER_LOGIN")
AbyssUI_ConfirmPopUps:SetScript("OnClick", function()
	if (AbyssUIAddonSettings.ExtraFunctionConfirmPopUps == true) then
		StaticPopup1Button1:Click()
		StaticPopup2Button1:Click()
		StaticPopup3Button1:Click()
		StaticPopup4Button1:Click()
		QuestFrameAcceptButton:Click()
		QuestFrameCompleteQuestButton:Click()
		QuestFrameCompleteButton:Click()
		LFGDungeonReadyDialogEnterDungeonButton:Click()
		if (GetWoWVersion <= 90500) then
			GossipFrameGreetingGoodbyeButton:Click()
		end
		--PVPReadyDialogEnterBattleButton:Click()
	else
		return nil
	end
end)
----------------------------------------------------
-- Hide ObjectiveTracker in Combat
local objectiveFrame1 = CreateFrame("Frame", "$parentObjectiveFrame1", nil)
objectiveFrame1:RegisterEvent("PLAYER_REGEN_DISABLED")
objectiveFrame1:RegisterEvent("PLAYER_REGEN_ENABLED")
objectiveFrame1:SetScript("OnEvent", function(self, event, ...)
	local isPVPMap = C_PvP.IsPVPMap()
	local inInstance, instanceType = IsInInstance()
	if (GetWoWVersion > 31400) then 
		if (event == "PLAYER_REGEN_DISABLED" and AbyssUIAddonSettings.ExtraFunctionHideInCombat == true and isPVPMap == false and (instanceType == "none" or instanceType == "party")) then
			UIFrameFadeIn(ObjectiveTrackerFrame, 1, 1, 0)
		elseif (event == "PLAYER_REGEN_ENABLED" and AbyssUIAddonSettings.ExtraFunctionHideInCombat == true and isPVPMap == false and (instanceType == "none" or instanceType == "party")) then
			UIFrameFadeIn(ObjectiveTrackerFrame, 1, 0, 1)
		end
		else
			if (event == "PLAYER_REGEN_DISABLED" and AbyssUIAddonSettings.ExtraFunctionHideInCombat == true and isPVPMap == false and (instanceType == "none" or instanceType == "party")) then
			UIFrameFadeIn(QuestWatchFrame, 1, 1, 0)
		elseif (event == "PLAYER_REGEN_ENABLED" and AbyssUIAddonSettings.ExtraFunctionHideInCombat == true and isPVPMap == false and (instanceType == "none" or instanceType == "party")) then
			UIFrameFadeIn(QuestWatchFrame, 1, 0, 1)
		end
	end
end)
-- Entering World / PvP
local objectiveFrame2 = CreateFrame("Frame", "$parentObjectiveFrame2", nil)
objectiveFrame2:RegisterEvent("PLAYER_ENTERING_WORLD")
objectiveFrame2:SetScript("OnEvent", function(self, event, ...)
	local isPVPMap = C_PvP.IsPVPMap()
	if (event == "PLAYER_ENTERING_WORLD" and AbyssUIAddonSettings.ExtraFunctionHideInCombat == true and isPVPMap == true) then
		UIFrameFadeIn(ObjectiveTrackerFrame, 1, 1, 0)		
	else 
		UIFrameFadeIn(ObjectiveTrackerFrame, 1, 0, 1)
	end
end)
-- Inspect Target
local AbyssUI_InspectTarget = CreateFrame("Button", '$parentAbyssUI_InspectTarget', nil)
AbyssUI_InspectTarget:RegisterForClicks("AnyDown")
AbyssUI_InspectTarget:SetScript("OnEvent", function()
	SetBindingClick("SHIFT-'", AbyssUI_InspectTarget:GetName())
end)
AbyssUI_InspectTarget:RegisterEvent("PLAYER_LOGIN")
AbyssUI_InspectTarget:SetScript("OnClick", function()
    if AbyssUIAddonSettings.ExtraFunctionInspectTarget == true then
    	if (UnitPlayerControlled("target") and not UnitIsUnit("player", "target")) then
			InspectUnit("target")
		elseif (UnitPlayerControlled("mouseover") and not UnitIsUnit("player", "mouseover")) then
			InspectUnit("mouseover")
		end
    else
      return nil
    end
end)
-- Auto Screenshot
local AbyssUI_ScreenshotLevelUp = CreateFrame("Button", '$parentAbyssUI_ScreenshotLevelUp', nil)
AbyssUI_ScreenshotLevelUp:RegisterEvent("PLAYER_LEVEL_UP")
AbyssUI_ScreenshotLevelUp:SetScript("OnEvent", function(self, event, ...)
    if AbyssUIAddonSettings.ExtraFunctionScreenshotLevelUp == true then
    	 C_Timer.After(1, function ()
    	 	Screenshot()
    	 end)
    end
end)
-- Minimal Action Bar
local AbyssUI_MinimalActionBar = CreateFrame("Button", '$parentAbyssUI_MinimalActionBar', nil)
AbyssUI_MinimalActionBar:RegisterEvent("PLAYER_ENTERING_WORLD")
AbyssUI_MinimalActionBar:SetScript("OnEvent", function(self, event, ...)
	if (AbyssUIAddonSettings.HideMicroMenu ~= true or AbyssUIAddonSettings.HideGryphons ~= true ) then
	    if (AbyssUIAddonSettings.MinimalActionBar == true) then
	    	C_Timer.After(1, function()
	    		if (GetWoWVersion > 31400) then
		    		for i, v in pairs ({
		   				MainMenuBarArtFrame.LeftEndCap,
			    		MainMenuBarArtFrame.RightEndCap,
			    		MainMenuBarArtFrameBackground,
			    		MicroButtonAndBagsBar.MicroBagBar,
			    		MicroButtonAndBagsBar,
			    		ActionBarUpButton,
			    		ActionBarDownButton,
			    		MainMenuBarArtFrame.PageNumber,
					    MainMenuMicroButton,
					    EJMicroButton,
					    CollectionsMicroButton,
					    LFDMicroButton,
					    GuildMicroButton,
					    QuestLogMicroButton,
					    TalentMicroButton,
					    SpellbookMicroButton,
					    CharacterMicroButton,
		    		}) do
		    			AchievementMicroButton:SetAlpha(0)
			    		StoreMicroButton:SetAlpha(0)
			    		StatusTrackingBarManager:SetAlpha(0)
		    			v:Hide() 
			    	end
			    else
			    	for i, v in pairs ({
  						MainMenuBarLeftEndCap,
							MainMenuBarRightEndCap,
			    		MainMenuBarArtFrameBackground,
			    		ActionBarUpButton,
			    		ActionBarDownButton,
			    		MainMenuBarArtFrame.PageNumber,
					    MainMenuMicroButton,
					    EJMicroButton,
					    CollectionsMicroButton,
					    LFDMicroButton,
					    GuildMicroButton,
					    QuestLogMicroButton,
					    TalentMicroButton,
					    SpellbookMicroButton,
					    CharacterMicroButton,
					    SocialsMicroButton,	
					    WorldMapMicroButton,
					    HelpMicroButton,
					    CharacterBag0Slot,
					    CharacterBag1Slot,
					    CharacterBag2Slot,
					    CharacterBag3Slot,
					    MainMenuBarBackpackButton,
					  }) do
	    				v:Hide()
			    	end
			    end
	    	end)
	    else
			return nil
	    end
	else
		return nil
	end
end)
-- Elite Portrait
local AbyssUI_ElitePortrait = CreateFrame("Button", '$parentAbyssUI_ElitePortrait', nil)
AbyssUI_ElitePortrait:RegisterEvent("PLAYER_ENTERING_WORLD")
AbyssUI_ElitePortrait:SetScript("OnEvent", function(self, event, ...)
    if (AbyssUIAddonSettings.ElitePortrait == true and AbyssUIAddonSettings.RarePortrait ~= true and AbyssUIAddonSettings.UnitFrameImproved ~= true and GetWoWVersion <= 90500) then
    	--PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite")
    	PlayerFrameTexture:SetTexture("Interface\\Addons\\AbyssUI\\textures\\backup\\UI-TargetingFrame-Rare-Elite-Normal")
    elseif (AbyssUIAddonSettings.ElitePortrait ~= true and AbyssUIAddonSettings.RarePortrait ~= true and AbyssUIAddonSettings.UnitFrameImproved ~= true and GetWoWVersion <= 90500) then
    	PlayerFrameTexture:SetTexture("Interface\\Addons\\AbyssUI\\textures\\backup\\UI-TargetingFrame-Normal")
	else
		return nil
	end
end)
-- Rare Portrait
local AbyssUI_ElitePortrait = CreateFrame("Button", '$parentAbyssUI_ElitePortrait', nil)
AbyssUI_ElitePortrait:RegisterEvent("PLAYER_ENTERING_WORLD")
AbyssUI_ElitePortrait:SetScript("OnEvent", function(self, event, ...)
    if (AbyssUIAddonSettings.RarePortrait == true and AbyssUIAddonSettings.ElitePortrait ~= true and AbyssUIAddonSettings.UnitFrameImproved ~= true and GetWoWVersion <= 90500) then
    	--PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite")
    	PlayerFrameTexture:SetTexture("Interface\\Addons\\AbyssUI\\textures\\backup\\UI-TargetingFrame-Rare-Normal")
    elseif (AbyssUIAddonSettings.RarePortrait ~= true and AbyssUIAddonSettings.ElitePortrait ~= true and AbyssUIAddonSettings.UnitFrameImproved ~= true and GetWoWVersion <= 90500) then
    	PlayerFrameTexture:SetTexture("Interface\\Addons\\AbyssUI\\textures\\backup\\UI-TargetingFrame-Normal")
	else
		return nil
	end
end)
-- DK Ally Portrait
local AbyssUI_DKPortrait = CreateFrame("Button", '$parentAbyssUI_DKPortrait', nil)
AbyssUI_DKPortrait:RegisterEvent("PLAYER_ENTERING_WORLD")
AbyssUI_DKPortrait:SetScript("OnEvent", function(self, event, ...)
    if (AbyssUIAddonSettings.DKAllyPortrait == true and AbyssUIAddonSettings.UnitFrameImproved ~= true and GetWoWVersion <= 90500) then
    	PlayerFrameTexture:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\UI-PlayerFrame-Deathknight-Alliance")
	else
		return nil
	end
end)
-- DK Horde Portrait
local AbyssUI_DKPortrait = CreateFrame("Button", '$parentAbyssUI_DKPortrait', nil)
AbyssUI_DKPortrait:RegisterEvent("PLAYER_ENTERING_WORLD")
AbyssUI_DKPortrait:SetScript("OnEvent", function(self, event, ...)
    if (AbyssUIAddonSettings.DKHordePortrait == true and AbyssUIAddonSettings.UnitFrameImproved ~= true and GetWoWVersion <= 90500) then
    	PlayerFrameTexture:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\UI-PlayerFrame-Deathknight-Horde")
    	PlayerStatusTexture:SetTexture("Interface\\Addons\\AbyssUI\\textures\\UI-Player-StatusDKH")
    	PlayerFrameHealthBar:SetWidth(105)
	else
		return nil
	end
end)
-- Demon Hunter Portrait
local AbyssUI_DKPortrait = CreateFrame("Button", '$parentAbyssUI_DKPortrait', nil)
AbyssUI_DKPortrait:RegisterEvent("PLAYER_ENTERING_WORLD")
AbyssUI_DKPortrait:SetScript("OnEvent", function(self, event, ...)
	if (AbyssUIAddonSettings.DemonHunterPortrait == true and AbyssUIAddonSettings.UnitFrameImproved ~= true and GetWoWVersion <= 90500) then
    	PlayerFrameTexture:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\UI-TargetingFrame-DemonHunter")
    	PlayerFrameTexture:SetVertexColor(1, 1, 1)
	else
		return nil
	end
end)
local checkRune = CreateFrame("Frame", nil)
checkRune:RegisterEvent("PLAYER_ENTERING_WORLD")
checkRune:SetScript("OnEvent", function()
	if (AbyssUIAddonSettings.DKHordePortrait == true or 
		AbyssUIAddonSettings.DKAllyPortrait == true or 
		AbyssUIAddonSettings.DemonHunterPortrait == true) then
		PetFrame:SetFrameLevel(4)
		if (GetWoWVersion > 31400 and GetWoWVersion <= 90500) then
			PlayerFrameAlternateManaBar:SetFrameLevel(4)
		end
	else
		return nil
	end
	if (GetWoWVersion > 31400 and GetWoWVersion <= 90500) then
		if (AbyssUIAddonSettings.DKHordePortrait == true) then
			RuneFrame:ClearAllPoints()
			RuneFrame:SetPoint("TOP", PlayerFrame, "BOTTOM", 50, 20)
			RuneFrame:SetFrameLevel(1)
		elseif (AbyssUIAddonSettings.DKAllyPortrait == true) then
			RuneFrame:ClearAllPoints()
			RuneFrame:SetPoint("TOP", PlayerFrame, "BOTTOM", 44, 15)
			RuneFrame:SetFrameLevel(6)
		elseif (AbyssUIAddonSettings.DemonHunterPortrait == true) then
			RuneFrame:ClearAllPoints()
			RuneFrame:SetPoint("TOP", PlayerFrame, "BOTTOM", 50, 20)
			RuneFrame:SetFrameLevel(1)
		else
			return nil
		end
	end
end)
----------------------------------------------------
local _G = _G
--local honorString 		= _G["HONOR"]
--local levelString 		= _G["LEVEL"]
--local timeStringLabel 	= _G["TIME_LABEL"]
local fichaString 			= _G["TOKEN_FILTER_LABEL"]
local versionString 		= _G["GAME_VERSION_LABEL"]
local latestString     		= _G["KBASE_RECENTLY_UPDATED"] 
-- DailyInfo Function
----------------------------------------------------
-- nonMilitaryClock
local function nonMilitaryClock(time)
	if (time == 13) then
		time = 1
	elseif (time == 14) then
		time = 2
	elseif (time == 15) then
		time = 3
	elseif (time == 16) then
		time = 4
	elseif (time == 17) then
		time = 5
	elseif (time == 18) then
		time = 6
	elseif (time == 19) then
		time = 7
	elseif (time == 20) then
		time = 8
	elseif (time == 21) then
		time = 9
	elseif (time == 22) then
		time = 10
	elseif (time == 23) then
		time = 11
	elseif (time == 00) then
		time = 12
	end
	return time
end
-- Extra functions
local function squareminimapExtras()
	-- WatchFrame
	if (GetWoWVersion >= 20000) then
		WatchFrame:SetScript("OnUpdate", function()
			if MultiBarRight:IsShown() and MultiBarLeft:IsShown() then
				WatchFrame:ClearAllPoints()
				WatchFrame:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", -100, -50)
			elseif MultiBarRight:IsShown() then
				WatchFrame:ClearAllPoints()
				WatchFrame:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", -50, -50)
			else
				WatchFrame:ClearAllPoints()
				WatchFrame:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", -25, -50)
			end
		end)
	else
		QuestWatchFrame:SetScript("OnUpdate", function()
			if MultiBarRight:IsShown() and MultiBarLeft:IsShown() then
				QuestWatchFrame:ClearAllPoints()
				QuestWatchFrame:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", -100, -50)
			elseif MultiBarRight:IsShown() then
				QuestWatchFrame:ClearAllPoints()
				QuestWatchFrame:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", -50, -50)
			else
				QuestWatchFrame:ClearAllPoints()
				QuestWatchFrame:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", -25, -50)
			end
		end)
	end
end
-- Square minimap
local SquareMinimap_ = CreateFrame("CheckButton", "$parentSquareMinimap_", UIParent, "ChatConfigCheckButtonTemplate")
SquareMinimap_:RegisterEvent("PLAYER_ENTERING_WORLD")
SquareMinimap_:SetScript("OnEvent", function(self, event, ...)	
	if (AbyssUIAddonSettings.DisableSquareMinimap ~= true and AbyssUIAddonSettings.HideMinimap ~= true and GetWoWVersion <= 90600) then
		local position = "TOPRIGHT"     	
		local position_x = -8       		
		local position_y = -20  

		-- achievement/quest tracker position
		local qparent = UIParent
		local qanchor = "TOPRIGHT"  	 
		local qposition_x = -60           
		local qposition_y = -260         
		local qheight = 400             

		local useInfoPanel = false
		local showclock = true	
		local AddonNumb = 30			

		local mediaFolder = "Interface\\AddOns\\AbyssUI\\Textures\\minimap\\"
		local texture = "Interface\\AddOns\\AbyssUI\\Textures\\minimap\\WHITE8x8"
		local backdrop = {bgFile = texture, edgeFile = texture, edgeSize = 1, insets = { left = -1, right = -1, top = -1, bottom = -1}}
		local backdrop = {edgeFile = texture, edgeSize = 8}

		local mailicon = mediaFolder.."mail"
		local font = subFont
		local fontSize = 11
		local fontFlag = "THINOUTLINE"

		local backdropcolor = {0/255, 0/255, 0/255}			-- backdrop color	
		local brdcolor = {0/255, 0/255, 0/255}				-- backdrop border color
		--local infocolor = {41/255, 41/255, 41/255}		-- info panel color
		--local IpanelBGalpha = 0.5							-- info panel background alpha

		local classColoredBorder = true
		local scale = 1

		-- style --
		local _, class = UnitClass('player')
		local color = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]			
		
		Minimap:SetSize(182*scale, 182*scale)
		Minimap:SetMaskTexture(mediaFolder.."rectangle")
		Minimap:SetHitRectInsets(0, 0, scale, scale)
		Minimap:ClearAllPoints()
		Minimap:SetPoint(position, UIParent, position_x, position_y)
		Minimap:SetScale(scale)
		Minimap:SetFrameLevel(6)
		if (GetWoWVersion < 30000) then
			MiniMapTrackingFrame:SetFrameLevel(10)
		end		

		-- New Border
		local frame = Minimap -- replace this with your frame
		local frameborder = CreateFrame("Frame", nil, frame)
		frameborder:SetAllPoints(frame)
		frameborder:SetFrameStrata("LOW")
		frameborder:SetFrameLevel(8)
	
		frameborder.texture = frameborder:CreateTexture(nil, "BACKGROUND")
		frameborder.texture:SetAllPoints(frameborder)
		frameborder.texture:SetTexture("Interface\\AddOns\\AbyssUI\\Textures\\minimap\\abyssminimapborder")
		AbyssUI_ColorizationFrameFunction(frameborder.texture)
		-- hide some stuff --
		--MinimapBackdrop:Hide()
		MinimapBorder:Hide()
		MinimapBorderTop:Hide()
		MinimapZoomIn:Hide()
		MinimapZoomOut:Hide()	
		GameTimeFrame:Hide()		
		--MiniMapTracking:Hide()
		if (GetWoWVersion >= 20000) then
			MiniMapTrackingBackground:Hide()		
			MiniMapTrackingButtonBorder:Hide()		
			MiniMapTrackingIconOverlay:Hide()
			MiniMapTracking:ClearAllPoints()
			MiniMapTracking:SetPoint("TOPRIGHT", Minimap, -5, -5)
		end
		MiniMapMailBorder:Hide()	
		--MiniMapVoiceChatFrame:Hide()
		--MinimapZoneTextButton:Hide()	
		--MinimapNorthTag:SetAlpha(0)
		--MiniMapInstanceDifficulty:SetAlpha(0)
		--GuildInstanceDifficulty:SetAlpha(0)

		if showclock then
			LoadAddOn('Blizzard_TimeManager')
			local clockFrame, clockTime = TimeManagerClockButton:GetRegions()
			clockFrame:Hide()
			clockTime:Show()
			clockTime:SetFont(font, fontSize, fontFlag)
			TimeManagerClockButton:SetPoint("BOTTOM", Minimap, 0, 0)
		else
			LoadAddOn('Blizzard_TimeManager')
			TimeManagerClockButton.Show = TimeManagerClockButton.Hide
			local region = TimeManagerClockButton:GetRegions()
			region:Hide()	
			TimeManagerClockButton:ClearAllPoints()	
			TimeManagerClockButton:Hide()	
		end
		--MiniMapMailFrame:ClearAllPoints()
		--MiniMapMailFrame:SetPoint("TOPRIGHT", Minimap, 1, -20)
		--MiniMapMailFrame:SetFrameLevel(10)
		MiniMapMailIcon:SetTexture(mailicon)
		MiniMapWorldMapButton:Hide()
		DropDownList1:SetClampedToScreen(true)	
		
		squareminimapExtras()

		-- mousewheel zoom --
		Minimap:EnableMouseWheel(true)
		Minimap:SetScript("OnMouseWheel", function(self, direction)
			if(direction > 0) then
				Minimap_ZoomIn()
			else
				Minimap_ZoomOut()
			end
		end)

		-- options/dropdown
		Minimap:SetScript('OnMouseUp', function(self, button)
			Minimap:StopMovingOrSizing()
			if (GetWoWVersion >= 20000) then
				if (button == 'RightButton') then
					ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, self, - (Minimap:GetWidth() * 0.7), -3)
				elseif (button == 'MiddleButton') then
					ToggleCalendar()
				else
					Minimap_OnClick(self)
				end
			else
				Minimap_OnClick(self)
			end
		end)

		local function GetMinimapShape() return 'SQUARE' end

		-- style Battlefield Minimap
		local function hide(f)
			f:SetTexture()
			f.SetTexture = function() end
		end
		hooksecurefunc("LoadAddOn", function(addon)
			if addon ~= "Blizzard_BattlefieldMinimap" then return end

			BattlefieldMinimapBackground:Hide()
			BattlefieldMinimapCorner:Hide()
			BattlefieldMinimapCloseButton:Hide()
			BattlefieldMinimapTab:Hide()
			
			BBorderFrame = CreateFrame("Frame", nil, BattlefieldMinimap)
			BBorderFrame:SetPoint("TOPLEFT", BattlefieldMinimap, "TOPLEFT", -1, 1)
			BBorderFrame:SetPoint("BOTTOMRIGHT", BattlefieldMinimap, "BOTTOMRIGHT", -5, 3)	
			BBorderFrame:SetBackdrop(backdrop)
			if not classColoredBorder then
				BBorderFrame:SetBackdropBorderColor(unpack(brdcolor))
			else
				local r, g, b = AbyssUI_RBGColorizationFrameFunction(BorderFrame)
				BorderFrame:SetBackdropBorderColor(r, g, b)
			end	
			BBorderFrame:SetBackdropColor(unpack(backdropcolor))
			BBorderFrame:SetFrameLevel(6)		
		end)
	else
		Minimap:SetMaskTexture("Interface\\AddOns\\AbyssUI\\Textures\\minimap\\round")
	end
end)
-- Tooltip on cursor
local function cursorSetPoint(self)
	local scale = self:GetEffectiveScale()
	local x, y = GetCursorPosition()
	self:ClearAllPoints()
	self:SetPoint("BOTTOMLEFT", UIParent, x / scale + 16, (y / scale - self:GetHeight() - 16))
end
local TooltipOnCursor = CreateFrame("Frame", nil)
TooltipOnCursor:RegisterEvent("PLAYER_ENTERING_WORLD")
TooltipOnCursor:SetScript("OnEvent", function()
	if (AbyssUIAddonSettings.TooltipOnCursor == true) then
		hooksecurefunc("GameTooltip_SetDefaultAnchor", function(tooltip, parent)
			if GetMouseFocus() ~= WorldFrame then return end
			tooltip:SetOwner(parent, "ANCHOR_CURSOR")
			cursorSetPoint(tooltip)
			-- tooltip.default = 1
		end)
	end
end)
-- Talking Head Move
local function RemoveAnchor()
	for i, alertSubSystem in pairs(AlertFrame.alertFrameSubSystems) do
	  if alertSubSystem.anchorFrame == THF then
		tremove(AlertFrame.alertFrameSubSystems, i)
		return 
	  end
	end
  end  
  
  local function TalkingHeadFrameMover()
	MoveTalkingHeadDB = MoveTalkingHeadDB or {}
	TalkingHeadFrame:SetMovable(true)
	TalkingHeadFrame:SetClampedToScreen(true)
	TalkingHeadFrame.ignoreFramePositionManager = true -- important
	TalkingHeadFrame:RegisterForDrag("LeftButton")
	TalkingHeadFrame:SetScript("OnDragStart", function(self)
	  if IsModifierKeyDown() then -- allow ctrl/shift/alt
		self:StartMoving()
	  end
	end)
	TalkingHeadFrame:SetScript("OnDragStop", function(self)
	  self:StopMovingOrSizing()
	  if not MoveTalkingHeadDB.point then
		RemoveAnchor()
	  end
	  local point, _, relPoint, dx, dy = self:GetPoint()
	  MoveTalkingHeadDB.point = point
	  MoveTalkingHeadDB.relPoint = relPoint
	  MoveTalkingHeadDB.dx = dx
	  MoveTalkingHeadDB.dy = dy
	end)
  
	if MoveTalkingHeadDB.point then
	  TalkingHeadFrame:ClearAllPoints()
	  TalkingHeadFrame:SetPoint(MoveTalkingHeadDB.point, nil, MoveTalkingHeadDB.relPoint, MoveTalkingHeadDB.dx, MoveTalkingHeadDB.dy)
	  RemoveAnchor() -- only remove the anchor if the frame has been moved
	end
  end
  local f = CreateFrame("Frame")
  f:RegisterEvent("ADDON_LOADED")
  f:SetScript("OnEvent", function(self, event, ...)
	  local addon = ...
	  if addon == "Blizzard_TalkingHeadUI" then
		TalkingHeadFrameMover()
		self:UnregisterAllEvents()
	  end
  end)

-- NamePlate Style
--  Move nametag
if (GetWoWVersion > 30600) then
	hooksecurefunc("DefaultCompactNamePlateFrameAnchorInternal", function(frame)
		if (not frame:IsForbidden() and AbyssUIAddonSettings.ExtraFunctionNameplateChanges ~= true) then
			frame.name:ClearAllPoints()
			PixelUtil.SetPoint(frame.name, "BOTTOM", frame.healthBar, "TOP", 0, 4)
		end
	end)
else 
	return nil
end
----------------------------------------------
-- Nameplate Health Percent
hooksecurefunc("CompactUnitFrame_UpdateStatusText", function(frame)
	if (AbyssUIAddonSettings ~= nil) then
		if (AbyssUIAddonSettings.ExtraFunctionNameplateChanges ~= true) then
			if (not frame:IsForbidden() and not UnitIsFriend("player", frame.displayedUnit)) then
				if (not frame.healthBar.percent) then
					frame.healthBar.percent = frame.healthBar:CreateFontString(nil,"OVERLAY")
					frame.healthBar.percent:SetPoint("LEFT", frame.healthBar)
					frame.healthBar.percent:SetFont(damageFont, 10)
					frame.healthBar.percent:SetShadowColor(0, 0, 0)
					frame.healthBar.percent:SetShadowOffset(1, -0.25)
				end
				local percentcalc = ceil(((UnitHealth(frame.displayedUnit) / UnitHealthMax(frame.displayedUnit)) * 1000) /10)
				if (percentcalc == 0) then return end
				frame.healthBar.percent:SetFormattedText("%d%%", percentcalc)
				frame.healthBar.percent:Show()
			elseif (UnitIsFriend("player", frame.displayedUnit)) then
				if (frame.healthBar.percent) then
					frame.healthBar.percent:Hide()
				end
			end
		end
	end
end)
-- Nameplate colorization
-- Player
hooksecurefunc("CompactUnitFrame_UpdateHealthColor", function(self)
	if (AbyssUIAddonSettings ~= nil) then
		if (not self:IsForbidden() and AbyssUIAddonSettings.ExtraFunctionNameplateChanges ~= true and not AbyssUIAddonSettings.GreenHealth) then
	    local _, class = UnitClass('player')
	    local color = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
			local unitIsPlayer = UnitIsPlayer('player')
			if self.optionTable.colorNameBySelection and not self:IsForbidden() then
				-- Player
			 	if (unitIsPlayer == true) then
					if C_NamePlate.GetNamePlateForUnit(self.unit) == C_NamePlate.GetNamePlateForUnit('player') then
						local healthPercentage = ceil(((UnitHealth(self.displayedUnit) / UnitHealthMax(self.displayedUnit)) * 1000) /10)
						if (healthPercentage == 0) then return end
	    			if (healthPercentage == 100) then
	      			self.healthBar:SetStatusBarColor(color.r, color.g, color.b)
						elseif healthPercentage < 100 and healthPercentage > 21 then
							self.healthBar:SetStatusBarColor(color.r, color.g, color.b)
						elseif healthPercentage < 21 then
							self.healthBar:SetStatusBarColor(255/255, 255/255, 255/255)
						end
					end
				end
			end
		else
			return nil
		end
	end
end)
-- Target
hooksecurefunc("CompactUnitFrame_UpdateHealthColor", function(self)
	if (AbyssUIAddonSettings ~= nil) then
		if (not self:IsForbidden() and AbyssUIAddonSettings.ExtraFunctionNameplateChanges ~= true and not AbyssUIAddonSettings.GreenHealth) then
			local unitTarget = UnitIsPlayer("target")
			local reaction = UnitReaction("player", "target") or 4
			if self.optionTable.colorNameBySelection and not self:IsForbidden() then
				-- Mobs
			 	if  (unitTarget ~= true and reaction < 5) then
					if C_NamePlate.GetNamePlateForUnit(self.unit) == C_NamePlate.GetNamePlateForUnit("target") then
						local healthPercentage = ceil(((UnitHealth(self.displayedUnit) / UnitHealthMax(self.displayedUnit)) * 1000) /10)
						if (healthPercentage == 0) then return end
						if healthPercentage == 100 then
							-- do nothing keep frame color
						elseif healthPercentage < 100 and healthPercentage > 21 then
	            self.healthBar:SetStatusBarColor(UnitColor(self.unit))
	          elseif healthPercentage < 21 then
	            self.healthBar:SetStatusBarColor(255/255, 255/255, 255/255)
	          end
					end
				end
			end
		else
			return nil
		end
	end
end)
-- Border
hooksecurefunc("CompactUnitFrame_UpdateHealthBorder", function(frame)
	if frame.optionTable.selectedBorderColor and UnitIsUnit(frame.displayedUnit, "target") then
		if (not InCombatLockdown) then
			for i, v in pairs ({
				frame.healthBar.border.Bottom,
				frame.healthBar.border.Top,
				frame.healthBar.border.Left,
				frame.healthBar.border.Right,
			}) do
				AbyssUI_ColorizationFrameFunction(v)
			end
		end
	end
end)
-- FirstPerson Cam
local AbyssUI_FirstPerson = CreateFrame("Frame", nil)
AbyssUI_FirstPerson:RegisterEvent("PLAYER_ENTERING_WORLD")
AbyssUI_FirstPerson:RegisterEvent("PLAYER_REGEN_DISABLED")
AbyssUI_FirstPerson:SetScript("OnEvent", function()
  if (AbyssUIAddonSettings.FirstPerson == true) then
  	SetView(5) -- Reset cam
  	SetView(5)
    SetView(3)
  else
    return nil
  end
end)
-- Player Classic Name
local AbyssUI_PlayerClassicName = CreateFrame("Frame", nil)
AbyssUI_PlayerClassicName:RegisterEvent("PLAYER_ENTERING_WORLD")
AbyssUI_PlayerClassicName:SetScript("OnEvent", function()
	if(AbyssUIAddonSettings.UnitFrameImproved ~= true) then
		for i, v in pairs({
			PlayerName,
			TargetFrameTextureFrameName,
			FocusFrameTextureFrameName,
			PlayerFrameHealthBarText,
			PlayerFrameManaBarText,
			TargetFrameTextureFrameHealthBarText,
			TargetFrameTextureFrameManaBarText,
			FocusFrameTextureFrameHealthBarText,
			FocusFrameTextureFrameManaBarText,
		}) do
			v:SetVertexColor(248/255, 248/255, 248/255)
			v:SetShadowColor(0, 0, 0)
			v:SetShadowOffset(1, -0.8)
			PetFrameHealthBarText:SetFont(globalFont, 8, "THINOUTLINE")
			PetFrameManaBarText:SetFont(globalFont, 8, "THINOUTLINE")
		end
	else
		return nil
	end
end)
-- Hide CompactRaid Borders
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event)
	for i, v in pairs({
		CompactRaidFrameManagerBorderTopLeft,
		CompactRaidFrameManagerBorderTop,
		CompactRaidFrameManagerBorderTopRight,
		CompactRaidFrameManagerBorderRight,
		CompactRaidFrameManagerBorderBottomRight,
		CompactRaidFrameManagerBorderBottom,
	CompactRaidFrameManagerBorderBottomLeft, }) do
		v:SetAlpha(0)
	end
end)
-- Change Health Bar Fill
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event)
if (GetWoWVersion <= 90500) then
		local TEXTURE = "Interface\\AddOns\\AbyssUI\\textures\\Raid-Bar-Hp-Fill"
		local UnitFrames = {
		  PlayerFrame,
		  PetFrame,
		  TargetFrame,
		  TargetFrameToT,
		  FocusFrame,
		  FocusFrameToT,
		  PartyMemberFrame1,
		  PartyMemberFrame2,
		  PartyMemberFrame3,
		  PartyMemberFrame4,
		}
		local UnitFrameRegions = {
		  "healthbar",
		  "myHealPredictionBar",
		  "otherHealPredictionBar",
		  "healAbsorbBar",
		  "totalAbsorbBar",
		  --"manabar",
		  "myManaCostPredictionBar",
		  "spellbar",
		}
		local OtherStatusBars = {
		  CastingBarFrame,
		  MirrorTimer1StatusBar,
		  MirrorTimer2StatusBar,
		  MirrorTimer3StatusBar,
		}
		if (AbyssUIAddonSettings.FlatHealth == true) then
			for _, frame in next, UnitFrames do
		    for _, region in next, UnitFrameRegions do
		      local bar = frame[region]
		      if bar and bar.SetStatusBarTexture then
		        bar:SetStatusBarTexture(TEXTURE)
		        bar:GetStatusBarTexture():SetHorizTile(true)
		      elseif bar and bar.SetTexture then
		        bar:SetTexture(TEXTURE)
		        bar:SetHorizTile(true)
		      end
		    end
			end
			for _, bar in next, OtherStatusBars do
		    bar:SetStatusBarTexture(TEXTURE)
		    bar:GetStatusBarTexture():SetHorizTile(true)
			end
		end
	end
end)
-- Daily
local AbyssUIDailyInfo = CreateFrame("Frame")
AbyssUIDailyInfo:RegisterEvent("PLAYER_LOGIN")
AbyssUIDailyInfo:SetScript("OnEvent", function(self, event, arg1)
	local nonMilitaryHour = date("%H")
	local nonMilitaryMinutes = date("%M |cffffcc00%m/%d/%y|r" )
	C_WowTokenPublic.UpdateMarketPrice()
	C_Timer.After(3, function()
		print(L["Thank you for choosing Abyss|cff0d75d4UI|r!"])
		print(L["The improved World of Warcraft user interface."])
	end)
	C_Timer.After(4, function()
		local AddonVersion = GetAddOnMetadata("AbyssUI", "Version")
		print(L["|cfff2dc7fAbyssUI Daily Info|r"])
		if C_WowTokenPublic.GetCurrentMarketPrice() ~= nil then
			print("|cfff2dc7f"..fichaString..": |r" .. GetMoneyString(C_WowTokenPublic.GetCurrentMarketPrice()))
		else
			print("|cfff2dc7f"..fichaString..": |r"..L["Not available right now!"])
		end
		if (AbyssUIAddonSettings.ExtraFunctionAmericanClock == true) then
			print("|cfff2dc7f"..L["Current Time"].."|r " .. (nonMilitaryClock(tonumber(nonMilitaryHour))..":"..nonMilitaryMinutes))
		else
			print("|cfff2dc7f"..L["Current Time"].."|r " .. date("%H:%M |cffffcc00%d/%m/%y|r "))
		end
		if (GetWoWVersion >= 40500) then
			local HonorLevel = UnitHonorLevel("player")
			print("|cfff2dc7f"..L["Honor Level"]..": |r|cffffcc00"..HonorLevel.."|r")
		end
		print(L["|cfff2dc7fWoW Version"]..": |r|cffffcc00" .. select(1, GetBuildInfo()) .."|r".." ".."("..(GetWoWVersion)..")")
		print(L["|cfff2dc7fAbyssUI Version"]..": |r|cffffcc00" .. AddonVersion .. "|r")
		if (AbyssUIProfile ~= nil) then 
			local name, elapsed = UnitName("player"), time() - AbyssUIProfile
			print(L["|cfff2dc7fTime since last login: |r"] .. name .. L[" you were gone for |cffffcc00"] .. SecondsToTime(elapsed) .. "|r")
			print(L["|cfff2dc7fEnjoying AbyssUI? |rRecommend to a friend!"])
     		print(L["|cfff2dc7fBuy me a coffee!|r"].." -> ko-fi.com/yugensan")
			print("|cfff2dc7f"..L["Supporters:"].."|r".." Addict, CampeonBlack, Digitaljdr, Ikonick")
			print(L["Type |cffffcc00/abyssui|r for a list of commands"])
		end
	end)
end)
----------------------------------------------------
-- End
