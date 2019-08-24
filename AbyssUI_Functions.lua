-- Author: Yugen
--
-- Battle for Azeroth
--
-- Hope you like my addOn ^^
--
-- Functions for AbyssUI
--------------------------------------------------------------------------------
-- Action Bar Icon Border Remove
-- Many thanks to Spyrö for part of this
hooksecurefunc("ActionButton_ShowGrid", function(Button)
	_G[Button:GetName().."NormalTexture"]:SetVertexColor(.4, .4, .4)
end)

for _, Bar in pairs({ "Action",
	"MultiBarBottomLeft",
	"MultiBarBottomRight",
	"MultiBarLeft",
	"MultiBarRight",
	"PetAction",
	"Buff", }) do
for i = 1, 12 do
	local Button = Bar.."Button"..i
		if _G[Button] then _G[Button.."Icon"]:SetTexCoord(0.05, 0.95, 0.05, 0.95)
		end
	end
end
----------------------------------------------------
-- Class Icons (Need the texture pack)
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
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_ARTISTIC")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles02 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_BRIGHT")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles03 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_CLASSIC")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles04 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_CREST")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles05 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_DARK")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles06 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_DARK_GRAY")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles07 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_DARK_V2")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles08 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_GRAYSCALE")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles09 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_LIGHT_GRAY")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles10 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_MEDIUM_GRAY")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles11 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_MINIMAL_BLUE")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles12 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_MINIMAL_RED")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles13 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_MUTED")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles14 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_PSYCHEDELIC")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles15 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_RETRO")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles16 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_VIBRANT")
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
		c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
		statusbar:SetStatusBarColor(c.r, c.g, c.b)
		--PlayerFrameHealthBar:SetStatusBarColor(0, 1, 0)
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
frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
frame:RegisterEvent("UNIT_FACTION")

local function eventHandler(self, event, ...)
	--Thanks to Tz for the player background update
	if PlayerFrame:IsShown() and not PlayerFrame.bg then
		c = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
		local bg = PlayerFrame:CreateTexture()
		bg:SetPoint("TOPLEFT", PlayerFrameBackground)
		bg:SetPoint("BOTTOMRIGHT", PlayerFrameBackground, 0, 22)
		bg:SetTexture(TargetFrameNameBackground:GetTexture())
		bg:SetVertexColor(c.r,c.g,c.b)
		PlayerFrame.bg = true
	end
	if UnitIsPlayer("target") then
		c = RAID_CLASS_COLORS[select(2, UnitClass("target"))]
		TargetFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
	end
	if UnitIsPlayer("focus") then
		c = RAID_CLASS_COLORS[select(2, UnitClass("focus"))]
		FocusFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
	end
end

frame:SetScript("OnEvent", eventHandler)

for _, BarTextures in pairs({ PlayerFrameNameBackground, TargetFrameNameBackground, FocusFrameNameBackground, }) do
	BarTextures:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
end
----------------------------------------------------
-- Text round values
hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", function()
	PlayerFrameHealthBar.TextString:SetText(AbbreviateLargeNumbers(UnitHealth("player")))
	--PlayerFramePower.TextString:SetText(AbbreviateLargeNumbers(UnitMana("player")))

	TargetFrameHealthBar.TextString:SetText(AbbreviateLargeNumbers(UnitHealth("target")))
	--TargetFrameManaBar.TextString:SetText(AbbreviateLargeNumbers(UnitMana("target")))

	FocusFrameHealthBar.TextString:SetText(AbbreviateLargeNumbers(UnitHealth("focus")))
	--FocusFrameManaBar.TextString:SetText(AbbreviateLargeNumbers(UnitMana("focus")))
end)
----------------------------------------------------
-- Cast Bar
-- Timer
CastingBarFrame.timer = CastingBarFrame:CreateFontString(nil)
CastingBarFrame.timer:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
CastingBarFrame.timer:SetPoint("TOP", CastingBarFrame, "BOTTOM", 0, 0)
CastingBarFrame.update = .1

CastingBarFrame:HookScript("OnUpdate", function(self, elapsed)
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
end)
----------------------------------------------------
-- Minimap Tweaks
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
MiniMapTracking:ClearAllPoints()
MiniMapTracking:SetPoint("TOPRIGHT", -26, 7)
----------------------------------------------------
-- Tooltip Class Color and extras 
GameTooltip:HookScript("OnTooltipSetUnit", function(self, elapsed)
	-- OnTooltipSetUnit
	local _, unit = GameTooltip:GetUnit()
	if  UnitIsPlayer(unit) then
		local _, class = UnitClass(unit)
		local color = class and (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
		if ( color ~= nil ) then
			local text  = GameTooltipTextLeft1:GetText()
			local text2 = GameTooltipTextLeft2:GetText()
			local text3 = GameTooltipTextLeft3:GetText()
			local inGuild = GetGuildInfo("mouseover")
			local englishFaction, localizedFaction = UnitFactionGroup("mouseover")
			-- Class Color
			GameTooltipTextLeft1:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text:match("|cff\x\x\x\x\x\x(.+)|r") or text)
			if ( inGuild ~= nil ) then
				GameTooltipTextLeft2:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text2:match("|cff\x\x\x\x\x\x(.+)|r") or text2)
				GameTooltipTextLeft3:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text3:match("|cff\x\x\x\x\x\x(.+)|r") or text3)
				if ( englishFaction ~= "Neutral" and englishFaction == "Horde" ) then
					GameTooltipTextLeft4:SetTextColor(255, 0.1, 0)
				elseif ( englishFaction ~= "Neutral" and englishFaction == "Alliance" ) then
					GameTooltipTextLeft4:SetTextColor(0, 0.5, 255)
				else 
					return nil
				end
			elseif ( inGuild == nil ) then
				GameTooltipTextLeft2:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text2:match("|cff\x\x\x\x\x\x(.+)|r") or text2)
				if ( englishFaction ~= "Neutral" and englishFaction == "Horde" ) then
					GameTooltipTextLeft3:SetTextColor(255, 0.1, 0)
				elseif ( englishFaction ~= "Neutral" and englishFaction == "Alliance" ) then
					GameTooltipTextLeft3:SetTextColor(0, 0.5, 255)
				else 
					return nil
				end
			else
				return nil
			end
		end
	end
end)
local ONUPDATE_INTERVAL = 0.1
local TimeSinceLastUpdate = 0
GameTooltip:HookScript("OnUpdate", function(self, elapsed)
	TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed
	if TimeSinceLastUpdate >= ONUPDATE_INTERVAL then
		TimeSinceLastUpdate = 0
		local _, unit = GameTooltip:GetUnit()
		if  UnitIsPlayer(unit) then
			local _, class = UnitClass(unit)
			local color = class and (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
			if ( color ~= nil ) then
				local text  = GameTooltipTextLeft1:GetText()
				local text2 = GameTooltipTextLeft2:GetText()
				local text3 = GameTooltipTextLeft3:GetText()
				local inGuild = GetGuildInfo("mouseover")
				local englishFaction, localizedFaction = UnitFactionGroup("mouseover")
				-- Class Color
				GameTooltipTextLeft1:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text:match("|cff\x\x\x\x\x\x(.+)|r") or text)
				if ( inGuild ~= nil ) then
					GameTooltipTextLeft2:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text2:match("|cff\x\x\x\x\x\x(.+)|r") or text2)
					GameTooltipTextLeft3:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text3:match("|cff\x\x\x\x\x\x(.+)|r") or text3)
					if ( englishFaction ~= "Neutral" and englishFaction == "Horde" ) then
						GameTooltipTextLeft4:SetTextColor(255, 0.1, 0)
					elseif ( englishFaction ~= "Neutral" and englishFaction == "Alliance" ) then
						GameTooltipTextLeft4:SetTextColor(0, 0.5, 255)
					else 
						return nil
					end
				elseif ( inGuild == nil ) then
					GameTooltipTextLeft2:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text2:match("|cff\x\x\x\x\x\x(.+)|r") or text2)
					if ( englishFaction ~= "Neutral" and englishFaction == "Horde" ) then
						GameTooltipTextLeft3:SetTextColor(255, 0.1, 0)
					elseif ( englishFaction ~= "Neutral" and englishFaction == "Alliance" ) then
						GameTooltipTextLeft3:SetTextColor(0, 0.5, 255)
					else 
						return nil
					end
				else
					return nil
				end
			end
		end
	end
end)
GameTooltip:SetScript("OnShow", function(self)
	TimeSinceLastUpdate = 0
end)
----------------------------------------------------
-- Tooltip Background and borders
local TooltipBackground = GameTooltip:CreateTexture(nil, "BACKGROUND", nil, 1)
TooltipBackground:SetPoint("TOPLEFT", 3, -3)
TooltipBackground:SetPoint("BOTTOMRIGHT", -3, 3)
TooltipBackground:SetColorTexture(0.02, 0.02, 0.02)
TooltipBackground:SetAlpha(0.5, 0.5, 0.5, 0.8)
-- Tooltip Class Color Health
GameTooltip:HookScript("OnUpdate", function(self, elapsed)
	local _, unit = GameTooltip:GetUnit()
	if UnitIsPlayer(unit) then
		local _, class = UnitClass(unit)
		local color = class and (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
		if color then
			GameTooltipStatusBar:SetStatusBarColor(color.r, color.g, color.b)
		end
	end
end)
----------------------------------------------------
-- StatsFrame
-- Many thanks to Syiana for part of this
local StatsFrame = CreateFrame("Frame", "$parentStatsFrame", UIParent)

local movable = false
local frame_anchor = "TOP"
local pos_x = -250
local pos_y = -6
StatsFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
StatsFrame:RegisterEvent("PET_BAR_UPDATE_COOLDOWN")
StatsFrame:SetScript("OnEvent", function(self, event, ...)
	if ( event == "PLAYER_ENTERING_WORLD" or event == "PET_BAR_UPDATE_COOLDOWN" ) then
		if movable == false then
			StatsFrame:ClearAllPoints()
			StatsFrame:SetPoint('TOPLEFT', UIParent, "TOPLEFT", 5, -5)
		end
	end
end)

local CF = CreateFrame("Frame", "$parentFrame", nil)
CF:RegisterEvent("PLAYER_LOGIN")
CF:SetScript("OnEvent", function(self, event)

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
		return "|c00ffffff" .. floor(GetFramerate()) .. "|r fps"
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
	StatsFrame.text:SetFont(STANDARD_TEXT_FONT,12,"OUTLINE")
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
	StatsFrame:SetScript("OnUpdate", update)
end)
-- Hide
function AbyssUI_StatsFrames1Hide()
	StatsFrame:Hide()
end
-- Show
function AbyssUI_StatsFrames1Show()
	StatsFrame:Show()
end
----------------------------------------------------
-- UI Scale Elements
local ScaleElements = CreateFrame("Frame", "$parentScaleElements", nil)
ScaleElements:RegisterEvent("ADDON_LOADED")
ScaleElements:RegisterEvent("PLAYER_LOGOUT")
ScaleElements:SetScript("OnEvent", function(self, event, arg1)
	if ( event == "ADDON_LOADED" and arg1 == "AbyssUI" ) then
		CastingBarFrame:SetScale(1.05)
		else return nil
	end
end)
--------------------------------------------------------------------------
-- Tooltip Instant Fade
-- Many thanks to sacrife for part of this
GameTooltip.FadeOut = function(self)
	GameTooltip:Hide()
end

local hasUnit
local updateFrame = CreateFrame("Frame", "$parentUpdateFrame", nil)
updateFrame:SetScript("OnUpdate", function(self)
	local _, unit = GameTooltip:GetUnit()
	if hasUnit and not unit then
		GameTooltip:Hide()
		hasUnit = nil
	elseif unit then
		hasUnit = true
	end
end)
----------------------------------------------------
-- Auto Repair/Sell Grey
local g = CreateFrame("Frame", "$parentFrame", nil)
g:RegisterEvent("MERCHANT_SHOW")

g:SetScript("OnEvent", function()
    local bag, slot
    for bag = 0, 4 do
        for slot = 0, GetContainerNumSlots(bag) do
            local link = GetContainerItemLink(bag, slot)
            if link and (select(3, GetItemInfo(link)) == 0) then
                UseContainerItem(bag, slot)
            end
        end
    end
	if ( AbyssUIAddonSettings.ExtraFunctionSellGray == true ) then
    if( CanMerchantRepair() ) then
        local cost = GetRepairAllCost()
        if cost > 0 then
            local money = GetMoney()
            if IsInGuild() then
            local guildMoney = GetGuildBankWithdrawMoney()
            if guildMoney > GetGuildBankMoney() then
              guildMoney = GetGuildBankMoney()
            end
            if guildMoney > cost and CanGuildBankRepair() then
              RepairAllItems(1)
              print(format("|cfff07100Repair cost paid by Guild: %.1fg|r", cost * 0.0001))
              return
            end
            end
            if money > cost then
            	RepairAllItems()
            	print(format("|cffead000Repair cost: %.1fg|r", cost * 0.0001))
            else
            	print("Not enough gold for repair.")
            end
    	end
	end
		else return nil
	end
end)
----------------------------------------------------
-- Target Mob(Enemy) Health Bar Color
local frame = CreateFrame("Frame", "$parentFrame", nil)
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("PLAYER_FOCUS_CHANGED")

local function eventHandler(self, event, ...)
	if ( event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_FOCUS_CHANGED" ) then
		if UnitIsEnemy("player", "target") and not UnitIsFriend("player", "target") and not UnitIsPlayer("target") then
			TargetFrameHealthBar:SetStatusBarColor(208/255, 23/255, 42/255)
		elseif not UnitIsEnemy("player", "target") and not UnitIsFriend("player", "target") and not UnitIsPlayer("target") and UnitReaction("player", "target") == 4 then
			TargetFrameHealthBar:SetStatusBarColor(244/255, 243/255, 119/255)
		end
		if UnitIsEnemy("player", "focus") and not UnitIsFriend("player", "focus") and not UnitIsPlayer("focus") then
			FocusFrameHealthBar:SetStatusBarColor(208/255, 23/255, 42/255)
		elseif not UnitIsEnemy("player", "focus") and not UnitIsFriend("player", "focus") and not UnitIsPlayer("focus") and UnitReaction("player", "focus") == 4 then
			FocusFrameHealthBar:SetStatusBarColor(244/255, 243/255, 119/255)
		end
	else
		return nil
	end
end
frame:SetScript("OnEvent", eventHandler)
for _, BarTextures in pairs({ TargetFrameNameBackground, FocusFrameNameBackground, }) do
	BarTextures:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
end
----------------------------------------------------
-- Keep the color when health changes
hooksecurefunc("HealthBar_OnValueChanged", function()
	if ( UnitIsEnemy("player", "target") and not UnitIsFriend("player", "target") and not UnitIsPlayer("target") ) then
		TargetFrameHealthBar:SetStatusBarColor(208/255, 23/255, 42/255)
	elseif not UnitIsEnemy("player", "target") and not UnitIsFriend("player", "target") and not UnitIsPlayer("target") and UnitReaction("player", "target") == 4 then
		TargetFrameHealthBar:SetStatusBarColor(244/255, 243/255, 119/255)
	else
		return nil
	end

	if ( UnitIsEnemy("player", "focus") and not UnitIsFriend("player", "focus") and not UnitIsPlayer("focus") ) then
		FocusFrameHealthBar:SetStatusBarColor(208/255, 23/255, 42/255)
	elseif not UnitIsEnemy("player", "focus") and not UnitIsFriend("player", "focus") and not UnitIsPlayer("focus") and UnitReaction("player", "focus") == 4 then
		FocusFrameHealthBar:SetStatusBarColor(244/255, 243/255, 119/255)
	else 
		return nil
	end
end)
----------------------------------------------------
-- Percent Health 
local FrameList = {"Player", "Target", "Focus"}
local _G = _G
local function AbyssUI_UpdateHealthValues(...)
for i = 1, select("#", unpack(FrameList)) do
	local FrameName = (select(i, unpack(FrameList)))
	local Health = AbbreviateLargeNumbers(UnitHealth(FrameName))
	local checkMaxHealth = UnitHealthMax(FrameName)
		if checkMaxHealth > 0 then
			local HealthPercent = ((UnitHealth(FrameName) / UnitHealthMax(FrameName))*100)
			if HealthPercent > 0 then
				_G[FrameName.."FrameHealthBar"].TextString:SetText(Health.." / " .. " ("..format("%.0f", HealthPercent).."%)")
			else
				_G[FrameName.."FrameHealthBar"].TextString:SetText("")
			end
		else 
			return nil
		end
	end
end
hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", AbyssUI_UpdateHealthValues)
-- Percent Mana
local FrameList = {"Player", "Target", "Focus"}
local _G = _G
local function AbyssUI_UpdateManaValues(...)
for i = 1, select("#", unpack(FrameList)) do
	local FrameName = (select(i, unpack(FrameList)))
	local Mana = AbbreviateLargeNumbers(UnitPower(FrameName))
	local checkMaxMana = UnitPowerMax(FrameName)
		if checkMaxMana > 0 then
			local ManaPercent = ((UnitPower(FrameName) / UnitPowerMax(FrameName))*100)
			if ManaPercent > 0 then
				_G[FrameName.."FrameManaBar"].TextString:SetText(Mana.." / " .. " ("..format("%.0f", ManaPercent).."%)")
			else
				_G[FrameName.."FrameManaBar"].TextString:SetText("")
			end
		else 
			return nil
		end
	end
end
hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", AbyssUI_UpdateManaValues)
----------------------------------------------------
-- Start Function
function AbyssUIStart()
	AbyssUIFirstFrame:Show()
end
----------------------------------------------------
-- ActionBarScale and Minimap
hooksecurefunc(MultiBarRight, "SetScale", function(self, scale)
	if scale < 1 then self:SetScale(1) end
end)

hooksecurefunc(MultiBarLeft, "SetScale", function(self, scale)
	if scale < 1 then self:SetScale(1) end
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
end
-- Global Color Function
function AbyssUI_ShowColorPicker()
	if ColorPickerFrame:IsShown() then return end
	ColorPickerFrame.previousValues = COLOR_MY_UI[character].Color
	ColorPickerFrame.cancelFunc = ColorPicker_Cancelled
	ColorPickerFrame.opacityFunc = ColorPicker_Changed
	ColorPickerFrame.func = ColorPicker_Changed
	ColorPickerFrame:SetColorRGB( COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b )
	ColorPickerFrame:ClearAllPoints()
	ColorPickerFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", GetCursorPosition())
	ColorPickerFrame:Show()
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
	if ( AbyssUIAddonSettings.ExtraFunctionConfirmPopUps == true ) then
		StaticPopup1Button1:Click()
		StaticPopup2Button1:Click()
		StaticPopup3Button1:Click()
		StaticPopup4Button1:Click()
		QuestFrameAcceptButton:Click()
		QuestFrameCompleteQuestButton:Click()
		QuestFrameCompleteButton:Click()
		LFGDungeonReadyDialogEnterDungeonButton:Click()
		GossipFrameGreetingGoodbyeButton:Click()
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
	if ( event == "PLAYER_REGEN_DISABLED" and AbyssUIAddonSettings.ExtraFunctionHideInCombat == true and isPVPMap == false and (instanceType == "none" or instanceType == "party")) then
		UIFrameFadeIn(ObjectiveTrackerFrame, 1, 1, 0)
	elseif ( event == "PLAYER_REGEN_ENABLED" and AbyssUIAddonSettings.ExtraFunctionHideInCombat == true and isPVPMap == false and (instanceType == "none" or instanceType == "party")) then
		UIFrameFadeIn(ObjectiveTrackerFrame, 1, 0, 1)
	else 
		return nil
	end
end)
-- Entering World / PvP
local objectiveFrame2 = CreateFrame("Frame", "$parentObjectiveFrame2", nil)
objectiveFrame2:RegisterEvent("PLAYER_ENTERING_WORLD")
objectiveFrame2:SetScript("OnEvent", function(self, event, ...)
	local isPVPMap = C_PvP.IsPVPMap()
	--local isArena = C_PvP.IsArena() 
	--local isBattleground = C_PvP.IsBattleground() 
	--local isRatedMap = C_PvP.IsRatedMap() 
	--or isArena == true or isBattleground == true or isRatedMap == true
	if ( event == "PLAYER_ENTERING_WORLD" and AbyssUIAddonSettings.ExtraFunctionHideInCombat == true and isPVPMap == true) then
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
    	if ( UnitPlayerControlled("target") and not UnitIsUnit("player", "target") ) then
			InspectUnit("target")
		elseif ( UnitPlayerControlled("mouseover") and not UnitIsUnit("player", "mouseover") ) then
			InspectUnit("mouseover")
		end
    else
      return nil
    end
end)
----------------------------------------------------
-- DailyInfo Function
C_WowTokenPublic.UpdateMarketPrice()
function AbyssUIDailyInfo()
	print("\n|cfff2dc7f<< AbyssUI Daily Info >>|r")
	if C_WowTokenPublic.GetCurrentMarketPrice() ~= nil then
		print("|cfff2dc7fToken Price: |r" .. GetMoneyString(C_WowTokenPublic.GetCurrentMarketPrice()))
	else
		print("|cfff2dc7fToken Price:|r Not available right now!")
	end
	if ( AbyssUIAddonSettings.ExtraFunctionAmericanClock == true ) then
		print("|cfff2dc7fDate:|r " .. date("%H:%M |cffffcc00%m/%d/%y|r "))
	else
		print("|cfff2dc7fDate:|r " .. date("%H:%M |cffffcc00%d/%m/%y|r "))
	end
	print("|cfff2dc7fHonor Level: |r|cffffcc00" .. UnitHonorLevel("player") .. "|r")
	--print("|cfff2dc7fLocation: |r" .. GetMinimapZoneText() .. "|cffffcc00, " .. GetZoneText() .. "|r")
	print("|cfff2dc7fWoW Version: |r|cffffcc00" .. select(1, GetBuildInfo()) .. "|r")
	local AddonVersion = GetAddOnMetadata("AbyssUI", "Version")
	print("|cfff2dc7fAbyssUI Version: |r|cffffcc00" .. AddonVersion .. "|r")
end
----------------------------------------------------
-- End
