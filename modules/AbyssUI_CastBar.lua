-- Author: Yugen
--
-- Supports any version of wow
--
-- CastBar functions for AbyssUI
--------------------------------------------------------------
-- Init - Tables - Saves
local addonName, addonTable = ...
local GetWoWVersion = ((select(4, GetBuildInfo())))
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
-- Cast bars
local function CheckCastBarText()
	if (not CastingBarFrame.Border:IsShown() and GetWoWVersion <= 90500) then
		local c = CastingBarFrame
		c.Icon:Show()
		c.Icon:SetWidth(21)
		c.Icon:SetHeight(21)
		c.Icon:ClearAllPoints()
		c.Icon:SetPoint("LEFT", c, "LEFT", -1, 0)
		c.Text = c:CreateFontString(nil)
		c.Text:SetFont(globalFont, 12)
		c.Text:SetShadowColor(0, 0, 0)
		c.Text:SetShadowOffset(1, -1)
		c.Text:ClearAllPoints()
		c.Text:SetPoint("TOP", c, "TOP", 0, 15)
	end
end
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event)
	if (AbyssUIAddonSettings.NewCastBar ~= true and GetWoWVersion <= 90500) then
		if (GetWoWVersion ~= 30401 and GetWoWVersion ~= 30402) then
			CastingBarFrame.Border:Hide()
			PetCastingBarFrame.Border:Hide()
			MirrorTimer1Border:Hide()
			MirrorTimer2Border:Hide()
			MirrorTimer3Border:Hide()
			local c = CreateFrame("Frame", "$parentAbyssUI_CastingBarFrameBorder", CastingBarFrame)
			c:SetFrameStrata("HIGH")
			c:SetWidth(256)
			c:SetHeight(72)
			c:SetPoint("CENTER", 0, 5)
			local t = c:CreateTexture(nil, "HIGH")
			t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\castingbar\\UI-CastingBar-Border")
			t:SetAllPoints(c)
			CastingBarFrame.Flash:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\castingbar\\UI-CastingBar-Flash")
			PetCastingBarFrame.Flash:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\castingbar\\UI-CastingBar-Flash")
			for i, v in pairs({
				MirrorTimer1,
				MirrorTimer2,
				MirrorTimer3,
				PetCastingBarFrame,
			}) do
				AbyssUI_RegionListSize(v, 200, 20)
			end
			for i, v in pairs({	
				CastingBarFrame, 
				PetCastingBarFrame,
				MirrorTimer1StatusBar, 
				MirrorTimer2StatusBar, 
				MirrorTimer3StatusBar, }) do
				AbyssUI_FrameSize(v, 200, 20)
			end
			CheckCastBarText()
		end
	end
end)
-- Timer
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event)
	if (GetWoWVersion <= 90500) then
		local c = CastingBarFrame
		c.timer = c:CreateFontString(nil)
		c.timer:SetFont(globalFont, 12)
		c.timer:SetShadowColor(0, 0, 0)
		c.timer:SetShadowOffset(1, -1)
		if (AbyssUIAddonSettings.NewCastBar == true) then
			c.timer:SetPoint("TOP", c, "BOTTOM", 0, 0)
		else
			c.timer:SetPoint("RIGHT", c, "RIGHT", 0, 0)
		end
		c.update = .1
		c:HookScript("OnUpdate", function(self, elapsed)
			if (AbyssUIAddonSettings.HideCastTimer ~= true) then
	    	if not self.timer then return end
		    	if self.update and self.update < elapsed then
		        if self.casting then
		            self.timer:SetText(format("%2.1f/%1.1f", max(self.maxValue - self.value, 0), self.maxValue))
		        elseif self.channeling then
		            self.timer:SetText(format("%.1f", max(self.value, 0)))
		        else
		            self.timer:SetText("")
		        end
		        self.update = .1
		    else
		        self.update = self.update - elapsed
		    end
			else
				return nil
			end
		end)
	end
end)
-- TimerTracker fixes
if (GetWoWVersion >= 30600 and GetWoWVersion <= 90500) then
	TimerTracker:HookScript("OnEvent", function(self, event, timerType, timeSeconds, totalTime)
	  if event ~= "START_TIMER" then return end
	  AbyssUI_FrameSize(TimerTrackerTimer1StatusBar, 200, 20)
	  AbyssUI_RegionListSize(TimerTrackerTimer1StatusBar, 200, 20)
		TimerTrackerTimer1StatusBarBorder:Hide()
	end)
else
	return nil
end