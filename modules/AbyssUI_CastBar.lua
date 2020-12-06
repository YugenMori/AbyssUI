-- Author: Yugen
--
-- Shadowlands
--
-- CastBar functions for AbyssUI
--------------------------------------------------------------
-- Init - Tables - Saves
local addonName, addonTable = ...
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
-- Cast bars
local function CheckCastBarText()
	if (not CastingBarFrame.Border:IsShown()) then
		local c = CastingBarFrame 
		c.Icon:Show()
		c.Icon:SetWidth(22)
		c.Icon:SetHeight(22)
		c.Icon:ClearAllPoints()
		c.Icon:SetPoint("LEFT", c, "LEFT", 0, 0)
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
	if (AbyssUIAddonSettings.NewCastBar ~= true) then
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
end)
-- Timer
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event)
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
end)
-- TimerTracker fixes
TimerTracker:HookScript("OnEvent", function(self, event, timerType, timeSeconds, totalTime)
  if event ~= "START_TIMER" then return end
  AbyssUI_FrameSize(TimerTrackerTimer1StatusBar, 200, 20)
  AbyssUI_RegionListSize(TimerTrackerTimer1StatusBar, 200, 20)
	TimerTrackerTimer1StatusBarBorder:Hide()
end)


--[[
--	Original codebase:
--		oUF_Castbar by starlon.
--		http://svn.wowace.com/wowace/trunk/oUF_Castbar/

--	Elements handled: .Castbar
--	Sub-elements: .Text, .Icon, .Time, .SafeZone, .Spark
--	Notes: This element will not work on units that require a OnUpdate.
--	(eventless units).

--	Functions that can be overridden from within a layout:
--	 - :CustomDelayText(duration)
--	 - :CustomTimeText(duration)

local parent, ns = ...
local oUF = ns.oUF

local noop = function() end
local UnitName = UnitName
local GetTime = GetTime
local UnitCastingInfo = UnitCastingInfo
local UnitChannelInfo = UnitChannelInfo

local UNIT_SPELLCAST_SENT = function(self, event, unit, spell, spellrank)
	if(self.unit ~= unit) then return end

	self.Castbar.sentTime = GetTime()
end

local UNIT_SPELLCAST_START = function(self, event, unit, spell, spellrank)
	if(self.unit ~= unit) then return end

	local castbar = self.Castbar
	local name, rank, text, texture, startTime, endTime, _, castid, interrupt = UnitCastingInfo(unit)
	if(not name) then
		castbar:Hide()
		return
	end

	endTime = endTime / 1e3
	startTime = startTime / 1e3
	local max = endTime - startTime
	local now = GetTime()
	
	castbar.castid = castid
	castbar.duration = now - startTime
	castbar.max = max
	castbar.delay = 0
	castbar.casting = true
	castbar.interrupt = interrupt

	if (castbar.sentTime) then
		local latency = now - castbar.sentTime
		castbar.latency = latency
	else
		castbar.latency = 0
	end
	
	castbar:SetMinMaxValues(0, max)
	castbar:SetValue(0)

	if(castbar.Text) then castbar.Text:SetText(text) end
	if(castbar.Icon) then castbar.Icon:SetTexture(texture) end
	if(castbar.Time) then castbar.Time:SetText() end

	local sf = castbar.SafeZone
	if(sf) then
		sf:ClearAllPoints()
		sf:SetPoint'RIGHT'
		sf:SetPoint'TOP'
		sf:SetPoint'BOTTOM'
	end

	if(self.PostCastStart) then self:PostCastStart(event, unit, name, rank, text, castid, interrupt) end
	castbar:Show()
end

local UNIT_SPELLCAST_FAILED = function(self, event, unit, spellname, spellrank, castid)
	if(self.unit ~= unit) then return end

	local castbar = self.Castbar
	if(castbar.castid ~= castid) then
		return
	end

	castbar.casting = nil
	castbar.interrupt = nil
	castbar:SetValue(0)
	castbar:Hide()

	if(self.PostCastFailed) then
		return self:PostCastFailed(event, unit, spellname, spellrank, castid)
	end
end

local UNIT_SPELLCAST_INTERRUPTED = function(self, event, unit, spellname, spellrank, castid)
	if(self.unit ~= unit) then return end

	local castbar = self.Castbar
	if(castbar.castid ~= castid) then
		return
	end
	castbar.casting = nil
	castbar.channeling = nil

	castbar:SetValue(0)
	castbar:Hide()

	if(self.PostCastInterrupted) then
		return self:PostCastInterrupted(event, unit, spellname, spellrank, castid)
	end
end

local UNIT_SPELLCAST_DELAYED = function(self, event, unit, spellname, spellrank)
	if(self.unit ~= unit) then return end

	local name, rank, text, texture, startTime, endTime = UnitCastingInfo(unit)
	if(not startTime) then return end

	local castbar = self.Castbar
	local duration = GetTime() - (startTime / 1000)
	if(duration < 0) then duration = 0 end

	castbar.delay = castbar.delay + castbar.duration - duration
	castbar.duration = duration

	castbar:SetValue(duration)

	if(self.PostCastDelayed) then
		return self:PostCastDelayed(event, unit, name, rank, text)
	end
end

local UNIT_SPELLCAST_STOP = function(self, event, unit, spellname, spellrank, castid)
	if(self.unit ~= unit) then return end

	local castbar = self.Castbar
	if(castbar.castid ~= castid) then
		return
	end

	castbar.casting = nil
	castbar.interrupt = nil
	castbar:SetValue(0)
	castbar:Hide()

	if(self.PostCastStop) then
		return self:PostCastStop(event, unit, spellname, spellrank, castid)
	end
end

local UNIT_SPELLCAST_CHANNEL_START = function(self, event, unit, spellname, spellrank)
	if(self.unit ~= unit) then return end

	local castbar = self.Castbar
	local name, rank, text, texture, startTime, endTime, isTrade, interrupt = UnitChannelInfo(unit)
	if(not name) then
		return
	end

	endTime = endTime / 1e3
	startTime = startTime / 1e3
	local max = (endTime - startTime)
	local duration = endTime - GetTime()

	castbar.duration = duration
	castbar.max = max
	castbar.delay = 0
	castbar.channeling = true
	castbar.interrupt = interrupt

	castbar:SetMinMaxValues(0, max)
	castbar:SetValue(duration)

	if(castbar.Text) then castbar.Text:SetText(name) end
	if(castbar.Icon) then castbar.Icon:SetTexture(texture) end
	if(castbar.Time) then castbar.Time:SetText() end

	local sf = castbar.SafeZone
	if(sf) then
		sf:ClearAllPoints()
		sf:SetPoint'LEFT'
		sf:SetPoint'TOP'
		sf:SetPoint'BOTTOM'
	end

	if(self.PostChannelStart) then self:PostChannelStart(event, unit, name, rank, text, interrupt) end
	castbar:Show()
end

local UNIT_SPELLCAST_CHANNEL_UPDATE = function(self, event, unit, spellname, spellrank)
	if(self.unit ~= unit) then return end

	local name, rank, text, texture, startTime, endTime, oldStart = UnitChannelInfo(unit)
	if(not name) then
		return
	end

	local castbar = self.Castbar
	local duration = (endTime / 1000) - GetTime()

	castbar.delay = castbar.delay + castbar.duration - duration
	castbar.duration = duration
	castbar.max = (endTime - startTime) / 1000

	castbar:SetMinMaxValues(0, castbar.max)
	castbar:SetValue(duration)

	if(self.PostChannelUpdate) then
		return self:PostChannelUpdate(event, unit, name, rank, text)
	end
end

local UNIT_SPELLCAST_CHANNEL_STOP = function(self, event, unit, spellname, spellrank)
	if(self.unit ~= unit) then return end

	local castbar = self.Castbar
	if(castbar:IsShown()) then
		castbar.channeling = nil
		castbar.interrupt = nil

		castbar:SetValue(castbar.max)
		castbar:Hide()

		if(self.PostChannelStop) then
			return self:PostChannelStop(event, unit, spellname, spellrank)
		end
	end
end

local onUpdate = function(self, elapsed)
	if self.casting then
		local duration = self.duration + elapsed
		if (duration >= self.max) then
			self.casting = nil
			self:Hide()

			-- We temporary get our parent to do this.
			local parent = self:GetParent()
			if(parent.PostCastStop) then parent:PostCastStop('OnUpdate', parent.unit) end

			return
		end

		if self.SafeZone then
			local width = self:GetWidth() * self.latency / self.max
			if (width < 1) then width = 1 end
			self.SafeZone:SetWidth(width);
		end

		if self.Time then
			if self.delay ~= 0 then
				if(self.CustomDelayText) then
					self:CustomDelayText(duration)
				else
					self.Time:SetFormattedText("%.1f|cffff0000-%.1f|r", duration, self.delay)
				end
			else
				if(self.CustomTimeText) then
					self:CustomTimeText(duration)
				else
					self.Time:SetFormattedText("%.1f", duration)
				end
			end
		end

		self.duration = duration
		self:SetValue(duration)

		if self.Spark then
			self.Spark:SetPoint("CENTER", self, "LEFT", (duration / self.max) * self:GetWidth(), 0)
		end
	elseif self.channeling then
		local duration = self.duration - elapsed

		if(duration <= 0) then
			self.channeling = nil
			self:Hide()

			-- We temporary get our parent to do this.
			local parent = self:GetParent()
			if(parent.PostChannelStop) then parent:PostChannelStop('OnUpdate', parent.unit) end

			return
		end

		if(self.SafeZone) then
			local width = self:GetWidth() * self.latency / self.max
			if (width < 1) then width = 1 end
			self.SafeZone:SetWidth(width);
		end


		if self.Time then
			if self.delay ~= 0 then
				if(self.CustomDelayText) then
					self:CustomDelayText(duration)
				else
					self.Time:SetFormattedText("%.1f|cffff0000-%.1f|r", duration, self.delay)
				end
			else
				if(self.CustomTimeText) then
					self:CustomTimeText(duration)
				else
					self.Time:SetFormattedText("%.1f", duration)
				end
			end
		end

		self.duration = duration
		self:SetValue(duration)
		if self.Spark then
			self.Spark:SetPoint("CENTER", self, "LEFT", (duration / self.max) * self:GetWidth(), 0)
		end
	else
		self.unitName = nil
		self.channeling = nil
		self:SetValue(1)
		self:Hide()
	end
end

local Enable = function(object, unit)
	local castbar = object.Castbar

	if(castbar) then
		if(not (unit and unit:match'%wtarget$')) then
			object:RegisterEvent("UNIT_SPELLCAST_SENT", UNIT_SPELLCAST_SENT)
			object:RegisterEvent("UNIT_SPELLCAST_START", UNIT_SPELLCAST_START)
			object:RegisterEvent("UNIT_SPELLCAST_FAILED", UNIT_SPELLCAST_FAILED)
			object:RegisterEvent("UNIT_SPELLCAST_STOP", UNIT_SPELLCAST_STOP)
			object:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED", UNIT_SPELLCAST_INTERRUPTED)
			object:RegisterEvent("UNIT_SPELLCAST_DELAYED", UNIT_SPELLCAST_DELAYED)
			object:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START", UNIT_SPELLCAST_CHANNEL_START)
			object:RegisterEvent("UNIT_SPELLCAST_CHANNEL_UPDATE", UNIT_SPELLCAST_CHANNEL_UPDATE)
			object:RegisterEvent("UNIT_SPELLCAST_CHANNEL_INTERRUPTED", 'UNIT_SPELLCAST_INTERRUPTED')
			object:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP", UNIT_SPELLCAST_CHANNEL_STOP)
		end

		castbar:SetScript("OnUpdate", object.OnCastbarUpdate or onUpdate)

		if object.unit == "player" then
			CastingBarFrame:UnregisterAllEvents()
			CastingBarFrame.Show = noop
			CastingBarFrame:Hide()
		elseif(object.unit == 'pet') then
			PetCastingBarFrame:UnregisterAllEvents()
			PetCastingBarFrame.Show = noop
			PetCastingBarFrame:Hide()
		end

		if(not castbar:GetStatusBarTexture()) then
			castbar:SetStatusBarTexture("Interface\TargetingFrame\UI-StatusBar")
		end

		local spark = castbar.Spark
		if(spark and spark:IsObjectType'Texture' and not spark:GetTexture()) then
			spark:SetTexture("Interface\CastingBar\UI-CastingBar-Spark")
		end

		local sz = castbar.SafeZone
		if(sz and sz:IsObjectType'Texture' and not sz:GetTexture()) then
			sz:SetTexture(1, 0, 0, 0.25)
		end

		castbar:Hide()

		return true
	end
end

local Disable = function(object, unit)
	local castbar = object.Castbar

	if(castbar) then
		object:UnregisterEvent("UNIT_SPELLCAST_SENT", UNIT_SPELLCAST_SENT)
		object:UnregisterEvent("UNIT_SPELLCAST_START", UNIT_SPELLCAST_START)
		object:UnregisterEvent("UNIT_SPELLCAST_FAILED", UNIT_SPELLCAST_FAILED)
		object:UnregisterEvent("UNIT_SPELLCAST_STOP", UNIT_SPELLCAST_STOP)
		object:UnregisterEvent("UNIT_SPELLCAST_INTERRUPTED", UNIT_SPELLCAST_INTERRUPTED)
		object:UnregisterEvent("UNIT_SPELLCAST_DELAYED", UNIT_SPELLCAST_DELAYED)
		object:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_START", UNIT_SPELLCAST_CHANNEL_START)
		object:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_UPDATE", UNIT_SPELLCAST_CHANNEL_UPDATE)
		object:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_INTERRUPTED", UNIT_SPELLCAST_CHANNEL_INTERRUPTED)
		object:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_STOP", UNIT_SPELLCAST_CHANNEL_STOP)

		castbar:SetScript("OnUpdate", nil)
	end
end

oUF:AddElement('Castbar', function(...)
	UNIT_SPELLCAST_START(...)
	return UNIT_SPELLCAST_CHANNEL_START(...)
end, Enable, Disable)

--]]