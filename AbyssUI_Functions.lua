-- Author: Yugen
--
-- Battle for Azeroth
--
-- Hope you like my addOn ^^
--
-- Dark Minimalist UI for World of Warcraft
--------------------------------------------------------------------------------

------------------------------------------------------------------------
-- Action Bar Icon Border Remove
-- Thanks to Spyrö for this script (maybe include some modifications) --
------------------------------------------------------------------------
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
		if _G[Button] then _G[Button.."Icon"]:SetTexCoord(0.05, 0.90, 0.05, 0.90)
		end
	end
end

--------------------------------------------------------
-- Class Icons (Need Flat Icons or some Texture Pack) --
--------------------------------------------------------
hooksecurefunc("UnitFramePortrait_Update", function(self)
	if self.portrait then
		if UnitIsPlayer(self.unit) then
			local t = CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))]
			if t and AbyssUIAddonSettings.UIClassCircles01 ~= true and AbyssUIAddonSettings.UIClassCircles02 ~= true and AbyssUIAddonSettings.UIClassCircles03 ~= true and AbyssUIAddonSettings.UIClassCircles04 ~= true and AbyssUIAddonSettings.UIClassCircles05 ~= true and AbyssUIAddonSettings.UIClassCircles06 ~= true and AbyssUIAddonSettings.UIClassCircles07 ~= true and AbyssUIAddonSettings.UIClassCircles08 ~= true and AbyssUIAddonSettings.UIClassCircles09 ~= true and AbyssUIAddonSettings.UIClassCircles10 ~= true and AbyssUIAddonSettings.UIClassCircles11 ~= true and AbyssUIAddonSettings.UIClassCircles12 ~= true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_BRIGHT_CLASS_COLOR")
				self.portrait:SetTexCoord(unpack(t))
			else
				self.portrait:SetTexCoord(0, 1, 0, 1)
			end
			if t and AbyssUIAddonSettings.UIClassCircles02 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_DARK")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles03 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_DARK_GREY")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles04 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_DARK_V2")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles05 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_DARK_V2_SMALL")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles06 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_LIGHT_GREY")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles07 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_MEDIUM_GREY")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles08 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_MUTED_CLASS_COLOR")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles09 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_PSYCHEDELIC")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles10 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_PSYCHEDELIC_V2")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles11 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_DARK_GRAYSCALE")
				self.portrait:SetTexCoord(unpack(t))
			elseif t and AbyssUIAddonSettings.UIClassCircles12 == true then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_ARTISTIC")
				self.portrait:SetTexCoord(unpack(t))
			else
				return nil
			end
		else
			self.portrait:SetTexCoord(0, 1, 0, 1)
		end
	end
end)

----------------------
-- Class HP Colours --
----------------------
local function colour(statusbar, unit)
	local _, class, c
	if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
		_, class = UnitClass(unit)
		c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
		statusbar:SetStatusBarColor(c.r, c.g, c.b)
		--PlayerFrameHealthBar:SetStatusBarColor(0,1,0)
	end
end

hooksecurefunc("UnitFrameHealthBar_Update", colour)
hooksecurefunc("HealthBar_OnValueChanged", function(self)
	colour(self, self.unit)
end)


------------------------------------
-- Class colours on players names --
------------------------------------
local frame = CreateFrame("FRAME")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
frame:RegisterEvent("UNIT_FACTION")

local function eventHandler(self, event, ...)
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

for _, BarTextures in pairs({TargetFrameNameBackground, FocusFrameNameBackground}) do
	BarTextures:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
end

-----------------------
-- Text round values --
-----------------------
hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", function()
	PlayerFrameHealthBar.TextString:SetText(AbbreviateLargeNumbers(UnitHealth("player")))
	--PlayerFrameManaBar.TextString:SetText(AbbreviateLargeNumbers(UnitMana("player")))

	TargetFrameHealthBar.TextString:SetText(AbbreviateLargeNumbers(UnitHealth("target")))
	--TargetFrameManaBar.TextString:SetText(AbbreviateLargeNumbers(UnitMana("target")))

	FocusFrameHealthBar.TextString:SetText(AbbreviateLargeNumbers(UnitHealth("focus")))
	--FocusFrameManaBar.TextString:SetText(AbbreviateLargeNumbers(UnitMana("focus")))
end)

--------------
-- Cast Bar --
--------------
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

---------------------
-- Minimap Tweaks ---
---------------------
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


--------------------------------------------
-- Disable spam healing over player frame --
--------------------------------------------
PlayerHitIndicator:SetText(nil)
PlayerHitIndicator.SetText = function() end

PetHitIndicator:SetText(nil)
PetHitIndicator.SetText = function() end


--------------------------------------------------------------------------
-- Chat Hide Button
-- Thanks to Syncrow for this script (maybe include some modifications) --
--------------------------------------------------------------------------
local ChatHideFrame = CreateFrame("Button", nil, UIParent)
ChatHideFrame:SetSize(30, 30)
ChatHideFrame.t = ChatHideFrame:CreateTexture(nil, "BORDER")
ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
ChatHideFrame.t:SetAllPoints(ChatHideFrame)
ChatHideFrame:SetPoint("BOTTOM","ChatFrame1ButtonFrame","BOTTOM",0,-35)
ChatHideFrame:Show()

local ChatHide = false

ChatHideFrame:SetScript("OnMouseDown", function(self, Button)
	if ChatHide == false then
		if Button == "LeftButton" then
			ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Down.blp")
		end
	elseif ChatHide == true then
		if Button == "LeftButton" then
			ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Maximize-Down.blp")
		end
	end
end)

ChatHideFrame:SetScript("OnMouseUp", function(self, Button)
	if ChatHide == false then
		if Button == "LeftButton" then
			ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
		end
	elseif ChatHide == true then
		if Button == "LeftButton" then
			ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Maximize-Up.blp")
		end
	end
end)

ChatHideFrame:SetScript("OnClick", function(self, Button)
	if ChatHide == false then
		ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Maximize-Up.blp")
		QuickJoinToastButton:Hide()
		GeneralDockManager:Hide()
		ChatFrameMenuButton:Hide()
		ChatFrameChannelButton:Hide()
		--ChatFrameToggleVoiceDeafenButton.Icon:Hide()
		--ChatFrameToggleVoiceMuteButton.Icon:Hide()
		ChatFrame1EditBox:Hide()

		for i = 1, NUM_CHAT_WINDOWS do
			_G["ChatFrame"..i..""]:SetAlpha(0)
			_G["ChatFrame"..i.."ButtonFrame"]:Hide()
			_G["ChatFrame"..i.."EditBox"]:SetAlpha(0)
		end
		ChatHide = true
	elseif ChatHide == true then
		ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
		QuickJoinToastButton:Show()
		GeneralDockManager:Show()
		ChatFrameMenuButton:Show()
		ChatFrameChannelButton:Show()
		--ChatFrameToggleVoiceDeafenButton.Icon:Show()
		--ChatFrameToggleVoiceMuteButton.Icon:Show()
		ChatFrame1EditBox:Show()

		for i = 1 , NUM_CHAT_WINDOWS do
			_G["ChatFrame"..i..""]:SetAlpha(1)
			_G["ChatFrame"..i.."ButtonFrame"]:Show()
			_G["ChatFrame"..i.."EditBox"]:SetAlpha(1)
		end
		ChatHide = false
	end
end)

------------------------------------------------------------------------
-- Tooltip Class Color Name
-- Thanks to Phanx for this script (maybe include some modifications) --
------------------------------------------------------------------------
GameTooltip:HookScript("OnTooltipSetUnit", function(GameTooltip)
	--print("OnTooltipSetUnit")
	local _, unit = GameTooltip:GetUnit()
	--print(unit)
	if UnitIsPlayer(unit) then
		--print("UnitIsPlayer")
		local _, class = UnitClass(unit)
		--print(class)
		local color = class and (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
		if color then
			local text = GameTooltipTextLeft1:GetText()
			--print(text)
			GameTooltipTextLeft1:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text:match("|cff\x\x\x\x\x\x(.+)|r") or text)
		end
	end
end)

----------------------------------
-- Tooltip Faction Color Change --
----------------------------------
GameTooltip:HookScript("OnTooltipSetUnit", function(GameTooltip)
	local _, factionGroup
	local englishFaction, localizedFaction = UnitFactionGroup("player")
	-- Horde
		if englishFaction == "Horde" then
			if GameTooltipTextLeft3:GetText() == "Horde" or GameTooltipTextLeft3:GetText() == "Horda" then
				GameTooltipTextLeft3:SetTextColor(255, 0.1, 0)
			elseif GameTooltipTextLeft4:GetText() == "Horde" or GameTooltipTextLeft4:GetText() == "Horda" then
				GameTooltipTextLeft4:SetTextColor(255, 0.1, 0)
			elseif GameTooltipTextLeft3:GetText() == "Alliance" or GameTooltipTextLeft3:GetText() == "Aliança" then
				GameTooltipTextLeft3:SetTextColor(0, 0.5, 255)
			elseif GameTooltipTextLeft4:GetText() == "Alliance" or GameTooltipTextLeft4:GetText() == "Aliança" then
				GameTooltipTextLeft4:SetTextColor(0, 0.5, 255)
			else
				GameTooltipTextLeft3:SetTextColor(255, 255, 255)
				GameTooltipTextLeft4:SetTextColor(255, 255, 255)
			end
		end
  -- Alliance
	if englishFaction == "Alliance" then
		if GameTooltipTextLeft3:GetText() == "Alliance" or GameTooltipTextLeft3:GetText() == "Aliança" then
			GameTooltipTextLeft3:SetTextColor(0, 0.5, 255)
		elseif GameTooltipTextLeft4:GetText() == "Alliance" or GameTooltipTextLeft4:GetText() == "Aliança" then
			GameTooltipTextLeft4:SetTextColor(0, 0.5, 255)
		elseif GameTooltipTextLeft3:GetText() == "Horde" or GameTooltipTextLeft3:GetText() == "Horda" then
			GameTooltipTextLeft3:SetTextColor(255, 0.1, 0)
		elseif GameTooltipTextLeft4:GetText() == "Horde" or GameTooltipTextLeft4:GetText() == "Horda" then
			GameTooltipTextLeft4:SetTextColor(255, 0.1, 0)
		else
			GameTooltipTextLeft3:SetTextColor(255, 255, 255)
			GameTooltipTextLeft4:SetTextColor(255, 255, 255)
		end
	end
end)

-----------------------------
-- Tooltip Dark background --
-----------------------------
local TooltipBackground = GameTooltip:CreateTexture(nil, "BACKGROUND", nil, 1)
TooltipBackground:SetPoint("TOPLEFT", 3, -3)
TooltipBackground:SetPoint("BOTTOMRIGHT", -3, 3)
TooltipBackground:SetColorTexture(0.02, 0.02, 0.02)
TooltipBackground:SetAlpha(.05, .05, .05)

--------------------------------
-- Tooltip Class Color Health --
--------------------------------
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

-------------------------------------------------------------------------
-- StatsFrame
-- Thanks to Syiana for this script (maybe include some modifications) --
-------------------------------------------------------------------------
local StatsFrame = CreateFrame('Frame', 'Stats', UIParent)

local movable = false
local frame_anchor = "TOP"
local pos_x = -250
local pos_y = -6
if movable == false then
	StatsFrame:ClearAllPoints()
	StatsFrame:SetPoint('BOTTOMLEFT', UIParent, "BOTTOMLEFT", 10, 10)
end

local CF = CreateFrame("Frame")
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

-----------------------
-- UI Scale Elements --
-----------------------
local ScaleElements = CreateFrame("Frame")
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
-- Thanks to sacrife for this script (maybe include some modifications) --
--------------------------------------------------------------------------
GameTooltip.FadeOut = function(self)
	GameTooltip:Hide()
end

local hasUnit
local updateFrame = CreateFrame("Frame")
updateFrame:SetScript("OnUpdate", function(self)
	local _, unit = GameTooltip:GetUnit()
	if hasUnit and not unit then
		GameTooltip:Hide()
		hasUnit = nil
	elseif unit then
		hasUnit = true
	end
end)

---------------------------
-- Auto Repair/Sell Grey --
---------------------------
local g = CreateFrame("Frame")
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

----------------------------------------
-- Target Mob(Enemy) Health Bar Color --
----------------------------------------
local frame = CreateFrame("FRAME")
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
		elseif not UnitIsEnemy("player", "target") and not UnitIsFriend("player", "target") and not UnitIsPlayer("target") and UnitReaction("player", "target") == 4 then
			FocusFrameHealthBar:SetStatusBarColor(244/255, 243/255, 119/255)
		end
	else
		return nil
	end
end

frame:SetScript("OnEvent", eventHandler)

for _, BarTextures in pairs({ TargetFrameNameBackground, FocusFrameNameBackground }) do
	BarTextures:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
end

-- Keep the color when health changes
hooksecurefunc("HealthBar_OnValueChanged", function()
	if UnitIsEnemy("player", "target") and not UnitIsFriend("player", "target") and not UnitIsPlayer("target") then
		TargetFrameHealthBar:SetStatusBarColor(208/255, 23/255, 42/255)
	elseif not UnitIsEnemy("player", "target") and not UnitIsFriend("player", "target") and not UnitIsPlayer("target") and UnitReaction("player", "target") == 4 then
		TargetFrameHealthBar:SetStatusBarColor(244/255, 243/255, 119/255)
	else
		return nil
	end
	if UnitIsEnemy("player", "focus") and not UnitIsFriend("player", "focus") and not UnitIsPlayer("focus") then
		FocusFrameHealthBar:SetStatusBarColor(208/255, 23/255, 42/255)
	elseif not UnitIsEnemy("player", "target") and not UnitIsFriend("player", "target") and not UnitIsPlayer("target") and UnitReaction("player", "target") == 4 then
		FocusFrameHealthBar:SetStatusBarColor(244/255, 243/255, 119/255)
	else
		return nil
	end
end)

------------------------------
-- Percent at target health --
------------------------------
local FrameList = {"Target", "Focus"}
function AbyssUI_UpdateHealthValues(...)
for i = 1, select("#", unpack(FrameList)) do
	local FrameName = (select(i, unpack(FrameList)))
	local Health = AbbreviateLargeNumbers(UnitHealth(FrameName))
	local HealthPercent = (UnitHealth(FrameName)/UnitHealthMax(FrameName))*100
		if HealthPercent > 0 then
			_G[FrameName.."FrameHealthBar"].TextString:SetText(Health.." / " .. " ("..format("%.0f", HealthPercent).."%)")
		else
			_G[FrameName.."FrameHealthBar"].TextString:SetText("")
		end
	end
end
hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", AbyssUI_UpdateHealthValues)
----------------------------------------------------

-- AFK Camera
local AbyssUI_AFKCamera = CreateFrame("FRAME")
AbyssUI_AFKCamera:RegisterEvent("PLAYER_FLAGS_CHANGED")
AbyssUI_AFKCamera:RegisterEvent("PLAYER_ENTERING_WORLD")
AbyssUI_AFKCamera:SetScript("OnEvent", function(self, event, ...)
	local inInstance, instanceType = IsInInstance()
	if ( event == "PLAYER_FLAGS_CHANGED" or event == "PLAYER_ENTERING_WORLD" ) then
		local isAFK = UnitIsAFK("player")
		if isAFK == true and inInstance ~= true then
			AbyssUI_UpdateAFKCameraData()
			UIFrameFadeIn(AbyssUI_AFKCameraFrame, 3, 0, 1)
		elseif isAFK == false and inInstance ~= true then
			AbyssUI_AFKCameraFrame:Hide()
		elseif isAFK == true and inInstance == true then
			AbyssUI_AFKCameraFrame:Hide()
		elseif isAFK == false and inInstance == true then
			AbyssUI_AFKCameraFrame:Hide()
		else
			AbyssUI_AFKCameraFrame:Hide()
		end
	end
end)

-- Start Function
function AbyssUIStart()
	AbyssUIFirstFrame:Show()
end
----------------------------------------------------

-- DailyInfo Function
C_WowTokenPublic.UpdateMarketPrice()
function AbyssUIDailyInfo()
	print("\n|cffa5f6f3<< AbyssUI Daily Info >>|r")
	if C_WowTokenPublic.GetCurrentMarketPrice() ~= nil then
		print("|cffa5f6f3Token Price: |r" .. GetMoneyString(C_WowTokenPublic.GetCurrentMarketPrice()))
	else
		print("|cffa5f6f3Token Price:|r Not available right now!")
	end
	print("|cffa5f6f3Date:|r " .. date("%H:%M |cffffcc00%m/%d/%y|r "))
	print("|cffa5f6f3Honor Level: |r|cffffcc00" .. UnitHonorLevel("player") .. "|r")
	--print("|cffa5f6f3Location: |r" .. GetMinimapZoneText() .. "|cffffcc00, " .. GetZoneText() .. "|r")
	print("|cffa5f6f3WoW Version: |r|cffffcc00" .. select(1, GetBuildInfo()) .. "|r")
	local AddonVersion = GetAddOnMetadata("AbyssUI", "Version")
	print("|cffa5f6f3AbyssUI Version: |r|cffffcc00" .. AddonVersion .. "|r")
end
----------------------------------------------------
-- End
