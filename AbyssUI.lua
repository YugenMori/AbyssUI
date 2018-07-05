--------------------------------------------------------------------------------
-- Author: SirMarklan
--
-- BFA Version
--
-- Hope you like my addOn ^^
--
-- Minimalist UI for World of Warcraft
--------------------------------------------------------------------------------

--------------------------------------------------------------
-- DarkerUI Core (Need Texture Pack eg. Santa Texture Pack) --
--------------------------------------------------------------

local frame=CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")

frame:SetScript("OnEvent", function(self, event, addon)
	if (addon == "Blizzard_TimeManager") then
		for i, v in pairs({PlayerFrameTexture, TargetFrameTextureFrameTexture,
			PetFrameTexture, PartyMemberFrame1Texture, PartyMemberFrame2Texture,
			PartyMemberFrame3Texture, PartyMemberFrame4Texture,
			PartyMemberFrame1PetFrameTexture, PartyMemberFrame2PetFrameTexture,
			PartyMemberFrame3PetFrameTexture, PartyMemberFrame4PetFrameTexture,
			FocusFrameTextureFrameTexture, TargetFrameToTTextureFrameTexture,
			FocusFrameToTTextureFrameTexture, BonusActionBarFrameTexture0,
			BonusActionBarFrameTexture1, BonusActionBarFrameTexture2,
			BonusActionBarFrameTexture3, BonusActionBarFrameTexture4,
			MainMenuBarTexture0, MainMenuBarTexture1, MainMenuBarTexture2,
			MainMenuBarTexture3, MainMenuMaxLevelBar0, MainMenuMaxLevelBar1,
			MainMenuMaxLevelBar2,	MainMenuMaxLevelBar3, MinimapBorder,
			CastingBarFrameBorder, FocusFrameSpellBarBorder,
			TargetFrameSpellBarBorder, MiniMapTrackingButtonBorder,
			MiniMapLFGFrameBorder, MiniMapBattlefieldBorder,
			MiniMapMailBorder, MinimapBorderTop,
			select(1, TimeManagerClockButton:GetRegions())
		}) do
			v:SetVertexColor(.35, .35, .35)
		end

		for i,v in pairs({ select(2, TimeManagerClockButton:GetRegions()) }) do
			v:SetVertexColor(1, 1, 1)
		end

		self:UnregisterEvent("ADDON_LOADED")
		frame:SetScript("OnEvent", nil)
	end
end)

--[[ Old Interface (Need to keep until BFA Launch)
for i, v in pairs({ MainMenuBarLeftEndCap, MainMenuBarRightEndCap }) do
	v:SetVertexColor(.5, .5, .5)
end
]]

-- New Interface (Action Bar)
for i, v in pairs({ MainMenuBarArtFrame.LeftEndCap,
	MainMenuBarArtFrame.RightEndCap,
	MainMenuBarArtFrameBackground.BackgroundSmall,
	MainMenuBarArtFrameBackground.BackgroundLarge,
}) do
	v:SetVertexColor(.5, .5, .5)
end


-- More/New Darker Parts
--[

-- CharacterFrame
for i, v in pairs({ CharacterFrameRightBorder, CharacterFrameLeftBorder,
	CharacterFrameTopBorder, CharacterFrameBottomBorder,
	CharacterFramePortraitFrame, CharacterFrameTopRightCorner,
	CharacterFrameBotLeftCorner, CharacterFrameBotRightCorner, }) do
	v:SetVertexColor(.4, .4, .4)
end
-- SpellBook
for i, v in pairs({ SpellBookFrameTopBorder, SpellBookFrameRightBorder,
	SpellBookFrameLeftBorder, SpellBookFrameBottomBorder,
	SpellBookFramePortraitFrame, SpellBookFrameTopRightCorner,
	SpellBookFrameBotLeftCorner, SpellBookFrameBotRightCorner, }) do
	v:SetVertexColor(.4, .4, .4)
end
-- PvE
for i, v in pairs({ PVEFrameTopBorder, PVEFrameRightBorder, PVEFrameLeftBorder,
	PVEFrameBottomBorder, PVEFramePortraitFrame, PVEFrameTopRightCorner,
	PVEFrameBotLeftCorner, PVEFrameBotRightCorner, LFDParentFrameBtnCornerRight,
}) do
	v:SetVertexColor(.4, .4, .4)
end
-- Friends
for i, v in pairs({ FriendsFrameTopBorder, FriendsFrameRightBorder,
	FriendsFrameLeftBorder, FriendsFrameBottomBorder, FriendsFramePortraitFrame,
	FriendsFrameTopRightCorner, FriendsFrameBtnCornerLeft,
	FriendsFrameBtnCornerRight, }) do
	v:SetVertexColor(.4, .4, .4)
end
-- Map
for i, v in pairs({ WorldMapFrameTopBorder, WorldMapFrameRightBorder,
	WorldMapFrameLeftBorder,WorldMapFrameBottomBorder, WorldMapFramePortraitFrame,
	WorldMapFrameTopRightCorner, WorldMapFrameBotLeftCorner,
	WorldMapFrameBotRightCorner, }) do
	v:SetVertexColor(.4, .4, .4)
end
-- Channels
for i, v in pairs({ ChannelFrameTopBorder, ChannelFrameRightBorder,
	ChannelFrameLeftBorder, ChannelFrameBottomBorder,
	ChannelFramePortraitFrame, ChannelFrameTopRightCorner,
	ChannelFrameBtnCornerLeft, ChannelFrameBtnCornerRight,
	ChannelFrameBotLeftCorner, ChannelFrameBotRightCorner, }) do
	v:SetVertexColor(.4, .4, .4)
end
-- Chat
for i, v in pairs({ ChatFrame1EditBoxLeft, ChatFrame1EditBoxRight,
ChatFrame1EditBoxMid, ChatFrame2EditBoxLeft, ChatFrame2EditBoxRight,
ChatFrame2EditBoxMid, ChatFrame3EditBoxLeft, ChatFrame3EditBoxRight,
ChatFrame3EditBoxMid, ChatFrame4EditBoxLeft, ChatFrame4EditBoxRight,
ChatFrame4EditBoxMid, ChatFrame5EditBoxLeft, ChatFrame5EditBoxRight,
ChatFrame5EditBoxMid, ChatFrame6EditBoxLeft, ChatFrame6EditBoxRight,
ChatFrame6EditBoxMid, ChatFrame7EditBoxLeft, ChatFrame7EditBoxRight,
ChatFrame7EditBoxMid, }) do
	v:SetVertexColor(.4, .4, .4)
end
-- Specialization (need review)
for i, v in pairs({ PlayerTalentFrameTopBorder, PlayerTalentFrameRightBorder,
	PlayerTalentFrameLeftBorder, PlayerTalentFrameBottomBorder,
	PlayerTalentFramePortraitFrame, PlayerTalentFrameTopRightCorner,
	PlayerTalentFrameBtnCornerLeft, PlayerTalentFrameBtnCornerRight,
	PlayerTalentFrameBg, PlayerTalentFrameBotLeftCorner,
	PlayerTalentFrameBotRightCorner, }) do
	v:SetVertexColor(.4, .4, .4)
end
-- Collections (need review)
for i, v in pairs({ CollectionsJounalTopBorder, CollectionsJounalRightBorder,
	CollectionsJounalLeftBorder, CollectionsJounalBottomBorder,
	CollectionsJounalPortraitFrame, CollectionsJounalTopRightCorner,
	CollectionsJounalBotLeftCorner, CollectionsJounalBotRightCorner,
	CollectionsJounalParentFrameBtnCornerRight, }) do
	v:SetVertexColor(.4, .4, .4)
end
-- AdvGuide (need review)
for i, v in pairs({ EncounterJournalTopBorder, EncounterJournalRightBorder,
	EncounterJournalLeftBorder, EncounterJournalBottomBorder,
	EncounterJournalPortraitFrame, EncounterJournalTopRightCorner,
	EncounterJournalBtnCornerLeft, EncounterJournalBtnCornerRight,
	EncounterJournalBotLeftCorner, EncounterJournalBotRightCorner, }) do
	v:SetVertexColor(.4, .4, .4)
end
-- Communities (need review)
for i, v in pairs({ CommunitiesFrameTopBorder, CommunitiesFrameRightBorder,
	CommunitiesFrameBottomBorder, CommunitiesFrameLeftBorder,
	CommunitiesFrameTopRightCorner, CommunitiesFrameBotRightCorner,
	CommunitiesFrameBotLeftCorner, CommunitiesFrameBtnCornerLeft,
	CommunitiesFramePortrait, }) do
	v:SetVertexColor(.4, .4, .4)
end


--]]


--------------------------------------------------------
-- Class Icons (Need Flat Icons or some Texture Pack) --
--------------------------------------------------------

hooksecurefunc("UnitFramePortrait_Update",function(self)
	if self.portrait then
		if UnitIsPlayer(self.unit) then
			local t = CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))]
			if t then
				self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
				self.portrait:SetTexCoord(unpack(t))
			end
		else
			self.portrait:SetTexCoord(0,1,0,1)
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


--[[ Gryphons hide

MainMenuBarLeftEndCap:Hide()
MainMenuBarRightEndCap:Hide()
]]


---------------------
-- Cast timer text --
---------------------

CastingBarFrame.timer = CastingBarFrame:CreateFontString(nil);
CastingBarFrame.timer:SetFont(STANDARD_TEXT_FONT,12,"OUTLINE");
CastingBarFrame.timer:SetPoint("TOP", CastingBarFrame, "BOTTOM", 0, 0);
CastingBarFrame.update = .1;

hooksecurefunc("CastingBarFrame_OnUpdate", function(self, elapsed)
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


-----------------------------------
-- Minimap plus things (tweaks) --
-----------------------------------

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


----------------------
-- Chat Hide Button --
----------------------

local f = CreateFrame("Button",nil,UIParent)
f:SetSize(30,30)
f.t=f:CreateTexture(nil,"BORDER")
f.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
f.t:SetAllPoints(f)
f:SetPoint("BOTTOM","ChatFrame1ButtonFrame","BOTTOM",0,-35)
f:Show()

local ChatHide = false

f:SetScript("OnMouseDown", function(self, Button)
	if ChatHide == false then
		if Button == "LeftButton" then
			f.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Down.blp")
		end
	elseif ChatHide == true then
		if Button == "LeftButton" then
			f.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Maximize-Down.blp")
		end
	end
end)

f:SetScript("OnMouseUp", function(self, Button)
	if ChatHide == false then
		if Button == "LeftButton" then
			f.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
		end
	elseif ChatHide == true then
		if Button == "LeftButton" then
			f.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Maximize-Up.blp")
		end
	end
end)

f:SetScript("OnClick", function(self, Button)
	if ChatHide == false then
		f.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Maximize-Up.blp")
		QuickJoinToastButton:Hide()
		GeneralDockManager:Hide()
		ChatFrameMenuButton:Hide()
		ChatFrameChannelButton:Hide()
		ChatFrame1EditBox:Hide()
		ChatFrame2EditBox:SetAlpha(0.0)
		ChatFrame3EditBox:SetAlpha(0.0)
		ChatFrame4EditBox:SetAlpha(0.0)
		ChatFrame5EditBox:SetAlpha(0.0)
		ChatFrame6EditBox:SetAlpha(0.0)
		ChatFrame7EditBox:SetAlpha(0.0)

		for i=1, NUM_CHAT_WINDOWS do
			_G["ChatFrame"..i..""]:SetAlpha(0)
			_G["ChatFrame"..i.."ButtonFrame"]:Hide()
		end
		ChatHide = true
	elseif ChatHide == true then
		f.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
		QuickJoinToastButton:Show()
		GeneralDockManager:Show()
		ChatFrameMenuButton:Show()
		ChatFrameChannelButton:Show()
		ChatFrame1EditBox:Show()
		ChatFrame2EditBox:SetAlpha(1.0)
		ChatFrame3EditBox:SetAlpha(1.0)
		ChatFrame4EditBox:SetAlpha(1.0)
		ChatFrame5EditBox:SetAlpha(1.0)
		ChatFrame6EditBox:SetAlpha(1.0)
		ChatFrame7EditBox:SetAlpha(1.0)

		for i=1, NUM_CHAT_WINDOWS do
			_G["ChatFrame"..i..""]:SetAlpha(1)
			_G["ChatFrame"..i.."ButtonFrame"]:Show()
		end
		ChatHide = false
	end
end)


------------------------------------------------------------------------------------------------
-- Tooltip Class Color
-- Thanks to Phanx for this script all credits for her/him (maybe include some modifications) --
------------------------------------------------------------------------------------------------

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


------------------------------------------------------------------------------------------------
-- Tooltip Dark background
-- Thanks to Gello for this script all credits for her/him (maybe include some modifications) --
------------------------------------------------------------------------------------------------

local TooltipBackground = GameTooltip:CreateTexture(nil,"BACKGROUND",nil,1)
TooltipBackground:SetPoint("TOPLEFT",3,-3)
TooltipBackground:SetPoint("BOTTOMRIGHT",-3,3)
TooltipBackground:SetColorTexture(0.08,0.08,0.08)


-------------------------------------------------------------------------------------------------
-- StatsFrame
-- Thanks to Syiana for this script all credits for her/him (maybe include some modifications) --
-------------------------------------------------------------------------------------------------

local StatsFrame = CreateFrame('Frame', 'Stats', UIParent)

local movable = false
local frame_anchor = "TOP"
local pos_x = -250
local pos_y = -6
if movable == false then
	StatsFrame:ClearAllPoints()
	StatsFrame:SetPoint('BOTTOMLEFT', UIParent, "BOTTOMLEFT", 10, 10)
end

local CF=CreateFrame("Frame")
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

	local function update(self,elapsed)
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


--------------------------
-- Save and Extra Stuff --
--------------------------

-- AbyssUIFirstFrame
AbyssUIFirstFrame = CreateFrame("Frame",nil,UIParent);
AbyssUIFirstFrame:Hide();
AbyssUIFirstFrame:SetWidth(400);
AbyssUIFirstFrame:SetHeight(140);
AbyssUIFirstFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 200);
AbyssUIFirstFrame:EnableMouse(true);
AbyssUIFirstFrame:SetFrameStrata("BACKGROUND");
AbyssUIFirstFrame.text = AbyssUIFirstFrame.text or AbyssUIFirstFrame:CreateFontString(nil,"ARTWORK","QuestFont_Shadow_Huge");
AbyssUIFirstFrame.text:SetAllPoints(true);
AbyssUIFirstFrame.text:SetJustifyH("CENTER");
AbyssUIFirstFrame.text:SetJustifyV("CENTER");
AbyssUIFirstFrame.text:SetText(" Thanks for using AbyssUI!\n The Dark Blizzard UI revamp.\nCheck my other addons:\n EasyLeave, EasyConfirm and HideonCombat. ");
----------------------------------------------------
LeaveBorder = AbyssUIFirstFrame:CreateTexture(nil,"BACKGROUND");
LeaveBorder:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background");
LeaveBorder:SetPoint("TOPLEFT", -3, 3);
LeaveBorder:SetPoint("BOTTOMRIGHT", 3, -3);
LeaveBorder:SetVertexColor(0.2, 0.2, 0.2, 0.6);
----------------------------------------------------
BorderBody = AbyssUIFirstFrame:CreateTexture(nil,"ARTWORK");
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background");
BorderBody:SetAllPoints(AbyssUIFirstFrame);
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7);
----------------------------------------------------
Texture = AbyssUIFirstFrame:CreateTexture(nil,"BACKGROUND");
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background");
Texture:SetAllPoints(AbyssUIFirstFrame);
AbyssUIFirstFrame.texture = Texture
----------------------------------------------------
FrameButton = CreateFrame("Button","FrameButton", AbyssUIFirstFrame, "UIPanelButtonTemplate");
FrameButton:SetHeight(24);
FrameButton:SetWidth(70);
FrameButton:SetPoint("BOTTOM", AbyssUIFirstFrame, "BOTTOM", 0, 10);
FrameButton:SetText("Close");
FrameButton:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background");
----------------------------------------------------
BorderButton = FrameButton:CreateTexture(nil,"ARTWORK");
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background");
BorderButton:SetAllPoints(FrameButton);
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7);
FrameButton:SetScript("OnClick", function()
	AbyssUIFirstFrame:Hide();
end)

function AbyssUIStart()
	AbyssUIFirstFrame:Show();
end


-------------------------- Save --------------------------
local AbyssUISave = CreateFrame("Frame")
AbyssUISave:RegisterEvent("ADDON_LOADED")
AbyssUISave:RegisterEvent("PLAYER_LOGOUT")
AbyssUISave:SetScript("OnEvent", function(self, event, arg1)
	if ( event == "ADDON_LOADED" and arg1 == "AbyssUI" ) then
		if ( AbyssUICount == nil ) then
			AbyssUICount = 0;
		end
		if ( AbyssUIProfile == nil ) then
			AbyssUICount = AbyssUICount + 1;
			AbyssUIStart();
		else
			local name, elapsed = UnitName("player"), time() - AbyssUIProfile
			print("Thanks for using AbyssUI! " .. name .. " you leave for " .. SecondsToTime(elapsed));
			AbyssUIFirstFrame:Hide();
		end
	elseif ( event == "PLAYER_LOGOUT" ) then
		AbyssUIProfile = time();
	end
end)

-- End
