-- Author: Yugen
--
-- Shadowlands
--
-- Functions for AbyssUI
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
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_ARTISTIC01")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles02 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_BRIGHT")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles03 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_CLASSIC")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles04 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_ARTISTIC02")
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
		if( AbyssUIAddonSettings.ExtraFunctionFriendlyHealthGreen ~= true ) then
			_, class = UnitClass(unit)
			c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
			statusbar:SetStatusBarColor(c.r, c.g, c.b)
			--PlayerFrameHealthBar:SetStatusBarColor(0, 1, 0)
		else 
			return nil
		end
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
--frame:RegisterEvent("UNIT_FACTION")
local function eventHandler(self, event, ...)
	--Thanks to Tz for the player background update
	if ( AbyssUIAddonSettings.ExtraFunctionTransparentName ~= true ) then
		if ( AbyssUIAddonSettings.ExtraFunctionHideBackgroundClassColor ~= true ) then
			if ( PlayerFrame:IsShown() and not PlayerFrame.bg and AbyssUIAddonSettings.UnitFrameImproved ~= true ) then
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
		else
			return nil
		end
	else
		-- Remove background
		TargetFrameNameBackground:SetAlpha(0.5)
		TargetFrameNameBackground:SetVertexColor(0/255, 0/255, 0/255)
		FocusFrameNameBackground:SetAlpha(0.5)
		FocusFrameNameBackground:SetVertexColor(0/255, 0/255, 0/255)
	end
end

frame:SetScript("OnEvent", eventHandler)
for _, BarTextures in pairs({ PlayerFrameNameBackground, TargetFrameNameBackground, FocusFrameNameBackground, }) do
	BarTextures:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
end
----------------------------------------------------
-- Cast Bar
CastingBarFrame.text = CastingBarFrame:CreateFontString(nil)
CastingBarFrame.text:SetFont("Interface\\AddOns\\AbyssUI\\Textures\\font\\global.ttf", 12)
CastingBarFrame.text:SetShadowColor(0, 0, 0)
CastingBarFrame.text:SetShadowOffset(1, -1)
CastingBarFrame.text:ClearAllPoints()
CastingBarFrame.text:SetPoint("CENTER", CastingBarFrame, "CENTER", 0, 2)
-- Timer
CastingBarFrame.timer = CastingBarFrame:CreateFontString(nil)
CastingBarFrame.timer:SetFont("Interface\\AddOns\\AbyssUI\\Textures\\font\\global.ttf", 12)
CastingBarFrame.timer:SetShadowColor(0, 0, 0)
CastingBarFrame.timer:SetShadowOffset(1, -1)
CastingBarFrame.timer:SetPoint("TOP", CastingBarFrame, "BOTTOM", 0, 0)
CastingBarFrame.update = .1
CastingBarFrame:HookScript("OnUpdate", function(self, elapsed)
	if ( AbyssUIAddonSettings.HideCastTimer ~= true ) then
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
			local text4 = GameTooltipTextLeft4:GetText()
			local englishFaction, localizedFaction = UnitFactionGroup(unit)
			if ( text ~= nil and text2 ~= nil ) then
				GameTooltipTextLeft1:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text:match("|cff\x\x\x\x\x\x(.+)|r") or text)
				GameTooltipTextLeft2:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text2:match("|cff\x\x\x\x\x\x(.+)|r") or text2)
			end
			if ( text ~= nil and text2 ~= nil and text3 ~= nil ) then
				GameTooltipTextLeft3:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text3:match("|cff\x\x\x\x\x\x(.+)|r") or text3)
			end
			if ( text ~= nil and text2 ~= nil and text3 ~= nil and text4 ~= nil ) then
				GameTooltipTextLeft4:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text4:match("|cff\x\x\x\x\x\x(.+)|r") or text4)
			end
			if ( text ~= nil and text2 ~= nil and text3 ~= nil and text4 ~= nil ) then
				local text5 = GameTooltipTextLeft5:GetText()
				if ( text5 ~= nil ) then
					GameTooltipTextLeft5:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text5:match("|cff\x\x\x\x\x\x(.+)|r") or text5)
				end
			end
		end
	end
end)
----------------------------------------------------
-- Tooltip Background and borders
local TooltipBackground = GameTooltip:CreateTexture(nil, "LOW", nil, 1)
TooltipBackground:SetPoint("TOPLEFT", 3, -3)
TooltipBackground:SetPoint("BOTTOMRIGHT", -3, 3)
TooltipBackground:SetColorTexture(0.02, 0.02, 0.02)
TooltipBackground:SetAlpha(0.5, 0.5, 0.5, 0.5)
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
local movable = true
local frame_anchor = "TOP"
local pos_x = -250
local pos_y = -6
StatsFrame:SetPoint('TOPLEFT', UIParent, "TOPLEFT", 5, -5)
StatsFrame:SetMovable(true)
StatsFrame:EnableMouse(true)
StatsFrame:SetClampedToScreen(true)
StatsFrame:RegisterForDrag("LeftButton")
StatsFrame:SetScript("OnDragStart", StatsFrame.StartMoving)
StatsFrame:SetScript("OnDragStop", StatsFrame.StopMovingOrSizing)

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
	StatsFrame.text:SetFont("Interface\\AddOns\\AbyssUI\\Textures\\font\\npcfont.ttf", 12)
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
	if ( AbyssUIAddonSettings.DisableSquareMinimap == true ) then
		StatsFrame:SetScript("OnUpdate", update)
	else
		return nil
	end
end)
local StatsFrameCheck_ = CreateFrame("CheckButton", "$parentStatsFrameCheck_", UIParent, "ChatConfigCheckButtonTemplate")
StatsFrameCheck_:RegisterEvent("PLAYER_ENTERING_WORLD")
StatsFrameCheck_:SetScript("OnEvent", function(self, event, ...)
	if ( AbyssUIAddonSettings.HideFPSMSFrame == true or AbyssUIAddonSettings.FadeUI == true ) then
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
	        for slot = 0, GetContainerNumSlots(bag) do
	            local link = GetContainerItemLink(bag, slot)
	            if link and (select(3, GetItemInfo(link)) == 0) then
	                UseContainerItem(bag, slot)
	            end
	        end
	    end
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
	else 
		return nil
	end
end)
----------------------------------------------------
-- Target Mob(Enemy) Health Bar Color
local frame = CreateFrame("Frame", "$parentFrame", nil)
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
local function eventHandler(self, event, ...)
	if ( AbyssUIAddonSettings.UnitFrameImproved ~= true ) then
		if ( event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_FOCUS_CHANGED" ) then
			if ( UnitReaction("player", "target") ~= nil ) then
				local target = UnitReaction("player", "target")
				local utarget = UnitIsPlayer("target")
				if utarget == false and target < 3 then
					TargetFrameHealthBar:SetStatusBarColor(255/255, 0/255, 0/255)
				elseif ( utarget == false and target == 3 ) then
					TargetFrameHealthBar:SetStatusBarColor(242/255, 96/255, 0/255)
				elseif ( utarget == false and target == 4 ) then
					TargetFrameHealthBar:SetStatusBarColor(255/255, 255/255, 0/255)
				elseif ( utarget == false and target > 4 ) then
					TargetFrameHealthBar:SetStatusBarColor(51/255, 255/255, 51/255)
				else
					return nil
				end
			else 
				return nil
			end
			if ( UnitReaction("player", "focus") ~= nil ) then
				local focus = UnitReaction("player", "focus")
				local ufocus = UnitIsPlayer("focus")
				if ufocus == false and focus < 4 then
					FocusFrameHealthBar:SetStatusBarColor(255/255, 0/255, 0/255)
				elseif ( ufocus == false and target == 3 ) then
					FocusFrameHealthBar:SetStatusBarColor(242/255, 96/255, 0/255)
				elseif ( ufocus == false and focus == 4 ) then
					FocusFrameHealthBar:SetStatusBarColor(255/255, 255/255, 0/255)
				elseif ( ufocus == false and focus > 4 ) then
					FocusFrameHealthBar:SetStatusBarColor(51/255, 255/255, 51/255)
				else
					return nil
				end
			else 
				return nil
			end
		else
			return nil
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
	if ( AbyssUIAddonSettings.UnitFrameImproved ~= true ) then
		if ( UnitReaction("player", "target") ~= nil ) then
			local target = UnitReaction("player", "target")
			local utarget = UnitIsPlayer("target")
			if utarget == false and target < 3 then
				TargetFrameHealthBar:SetStatusBarColor(255/255, 0/255, 0/255)
			elseif ( utarget == false and target == 3 ) then
				TargetFrameHealthBar:SetStatusBarColor(242/255, 96/255, 0/255)
			elseif ( utarget == false and target == 4 ) then
				TargetFrameHealthBar:SetStatusBarColor(255/255, 255/255, 0/255)
			elseif ( utarget == false and target > 4 ) then
				TargetFrameHealthBar:SetStatusBarColor(51/255, 255/255, 51/255)
			else
				return nil
			end
		else 
			return nil
		end
		if ( UnitReaction("player", "focus") ~= nil ) then
			local focus = UnitReaction("player", "focus")
			local ufocus = UnitIsPlayer("focus")
			if ufocus == false and focus < 4 then
				FocusFrameHealthBar:SetStatusBarColor(255/255, 0/255, 0/255)
			elseif ( ufocus == false and target == 3 ) then
				FocusFrameHealthBar:SetStatusBarColor(242/255, 96/255, 0/255)
			elseif ( ufocus == false and focus == 4 ) then
				FocusFrameHealthBar:SetStatusBarColor(255/255, 255/255, 0/255)
			elseif ( ufocus == false and focus > 4 ) then
				FocusFrameHealthBar:SetStatusBarColor(51/255, 255/255, 51/255)
			else
				return nil
			end
		else 
			return nil
		end
	else
		return nil
	end
end)
----------------------------------------------------
-- Start Function
function AbyssUIStart()
	AbyssUIFirstFrame:Show()
end
----------------------------------------------------
-- UI Scale Elements (On Load)
local ScaleElements = CreateFrame("Frame", "$parentScaleElements", nil)
ScaleElements:RegisterEvent("ADDON_LOADED")
ScaleElements:RegisterEvent("PLAYER_LOGOUT")
ScaleElements:SetScript("OnEvent", function(self, event, arg1)
	if ( event == "ADDON_LOADED" and arg1 == "AbyssUI" ) then
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
	if ( AbyssUIAddonSettings.HideMicroMenu ~= true or AbyssUIAddonSettings.HideGryphons ~= true  ) then
	    if ( AbyssUIAddonSettings.MinimalActionBar == true ) then
	    	C_Timer.After(1, function()
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
    if ( AbyssUIAddonSettings.ElitePortrait == true and AbyssUIAddonSettings.UnitFrameImproved ~= true ) then
    	PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite")
    	TargetFrameTextureFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-RareMob")
    	FocusFrameTextureFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-RareMob")
	elseif ( AbyssUIAddonSettings.ElitePortrait == true and AbyssUIAddonSettings.UnitFrameImproved == true ) then
		PlayerFrameTexture:SetTexture("Interface\\AddOns\\AbyssUI\\Textures\\UI-TargetingFrame-Elite")
	    TargetFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\AbyssUI\\Textures\\UI-TargetingFrame-Rare")
	    FocusFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\AbyssUI\\Textures\\UI-TargetingFrame-Rare")
	else
		return nil
	end
end)
----------------------------------------------------
local _G = _G
local fichaString 			= _G["TOKEN_FILTER_LABEL"]
local honorString 			= _G["HONOR"]
local levelString 			= _G["LEVEL"]
local versionString 		= _G["GAME_VERSION_LABEL"]
local timeStringLabel 	= _G["TIME_LABEL"]
-- DailyInfo Function
----------------------------------------------------
local AbyssUIDailyInfo = CreateFrame("Frame")
AbyssUIDailyInfo:RegisterEvent("PLAYER_LOGIN")
AbyssUIDailyInfo:SetScript("OnEvent", function(self, event, arg1)
C_WowTokenPublic.UpdateMarketPrice()
	C_Timer.After(3, function()
		print("Thank you for choosing |cff0d75d4AbyssUI|r")
		print("The improved World of Warcraft user interface.")
	end)
	C_Timer.After(4, function()
		local HonorLevel = UnitHonorLevel("player")
		local AddonVersion = GetAddOnMetadata("AbyssUI", "Version")
		print("|cfff2dc7f~ AbyssUI Daily Info ~|r")
		if C_WowTokenPublic.GetCurrentMarketPrice() ~= nil then
			print("|cfff2dc7f"..fichaString..": |r" .. GetMoneyString(C_WowTokenPublic.GetCurrentMarketPrice()))
		else
			print("|cfff2dc7f"..fichaString..": |r".."Not available right now!")
		end
		if ( AbyssUIAddonSettings.ExtraFunctionAmericanClock == true ) then
			print("|cfff2dc7f"..timeStringLabel.."|r " .. date("%H:%M |cffffcc00%m/%d/%y|r "))
		else
			print("|cfff2dc7f"..timeStringLabel.."|r " .. date("%H:%M |cffffcc00%d/%m/%y|r "))
		end
		print("|cfff2dc7f"..honorString.." "..levelString..": |r|cffffcc00"..HonorLevel.."|r")
		--print("|cfff2dc7fLocation: |r" .. GetMinimapZoneText() .. "|cffffcc00, " .. GetZoneText() .. "|r")
		print("|cfff2dc7fWoW "..versionString..": |r|cffffcc00" .. select(1, GetBuildInfo()) .. "|r")
		print("|cfff2dc7fAbyssUI "..versionString..": |r|cffffcc00" .. AddonVersion .. "|r")
		if ( AbyssUIProfile ~= nil) then 
			local name, elapsed = UnitName("player"), time() - AbyssUIProfile
			print("|cfff2dc7fTime since last login: |r" .. name .. " you were gone for |cffffcc00" .. SecondsToTime(elapsed) .. "|r")
			print("Type |cffffcc00/abyssui|r for a list of commands")
		end
	end)
end)
--[[
/run local f = _G["BONUS_ROLL_CURRENT_COUNT"] print(f)
--]]
----------------------------------------------------
-- End
