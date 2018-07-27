--------------------------------------------------------------------------------
-- Author: Abyss_Samurai
--
-- Battle for Azeroth
--
-- Hope you like my addOn ^^
--
-- Dark Minimalist UI for World of Warcraft
--------------------------------------------------------------------------------

--------------------------------------------------------------
-- DarkerUI Core (Need Texture Pack e.g Santa Texture Pack) --
--------------------------------------------------------------

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addon)
	if (addon == "AbyssUI") then
		for i, v in pairs({	PlayerFrameTexture,
			TargetFrameTextureFrameTexture,
			PetFrameTexture,
			PartyMemberFrame1Texture,
			PartyMemberFrame2Texture,
			PartyMemberFrame3Texture,
			PartyMemberFrame4Texture,
			PartyMemberFrame1PetFrameTexture,
			PartyMemberFrame2PetFrameTexture,
			PartyMemberFrame3PetFrameTexture,
			PartyMemberFrame4PetFrameTexture,
			FocusFrameTextureFrameTexture,
			TargetFrameToTTextureFrameTexture,
			FocusFrameToTTextureFrameTexture,
			BonusActionBarFrameTexture0,
			BonusActionBarFrameTexture1,
			BonusActionBarFrameTexture2,
			BonusActionBarFrameTexture3,
			BonusActionBarFrameTexture4,
			MainMenuBarTexture0,
			MainMenuBarTexture1,
			MainMenuBarTexture2,
			MainMenuBarTexture3,
			MainMenuMaxLevelBar0,
			MainMenuMaxLevelBar1,
			MainMenuMaxLevelBar2,
			MainMenuMaxLevelBar3,
			MinimapBorder,
			CastingBarFrameBorder,
			FocusFrameSpellBarBorder,
			TargetFrameSpellBarBorder,
			MiniMapTrackingButtonBorder,
			MiniMapLFGFrameBorder,
			MiniMapBattlefieldBorder,
			MiniMapMailBorder,
			MinimapBorderTop,	}) do
			v:SetVertexColor(.35, .35, .35)
		end
		self:UnregisterEvent("ADDON_LOADED")
		frame:SetScript("OnEvent", nil)
	end
end)


------------------------- New Darker Parts -------------------------

-- New Interface Action Bar
local NewFrames = CreateFrame("Frame")
NewFrames:RegisterEvent("ADDON_LOADED")
NewFrames:SetScript("OnEvent", function(self, event, addon)
	if (addon == "AbyssUI") then
		for i, v in pairs({ MainMenuBarArtFrame.LeftEndCap,
			MainMenuBarArtFrame.RightEndCap,
			MainMenuBarArtFrameBackground.BackgroundSmall,
			MainMenuBarArtFrameBackground.BackgroundLarge, }) do
			v:SetVertexColor(.5, .5, .5)
		end
		-- CharacterFrame
		for i, v in pairs({ CharacterFrameRightBorder,
			CharacterFrameLeftBorder,
			CharacterFrameTopBorder,
			CharacterFrameBottomBorder,
			CharacterFramePortraitFrame,
			CharacterFrameTopRightCorner,
			CharacterFrameBotLeftCorner,
			CharacterFrameBotRightCorner,
			CharacterFrameInsetInsetLeftBorder,
			CharacterFrameInsetInsetBottomBorder,
			CharacterFrameInsetInsetBotLeftCorner,
			CharacterFrameInsetInsetBotRightCorner,
			CharacterFrameInsetRightInsetBottomBorder,
			CharacterFrameInsetRightInsetLeftBorder,
			CharacterFrameInsetRightInsetBotRightCorner,
			CharacterFrameInsetRightInsetBotLeftCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
		-- SpellBook
		for i, v in pairs({ SpellBookFrameTopBorder,
			SpellBookFrameRightBorder,
			SpellBookFrameLeftBorder,
			SpellBookFrameBottomBorder,
			SpellBookFramePortraitFrame,
			SpellBookFrameTopRightCorner,
			SpellBookFrameBotLeftCorner,
			SpellBookFrameBotRightCorner,
			SpellBookFrameInsetInsetBottomBorder,
			SpellBookFrameInsetInsetRightBorder,
			SpellBookFrameInsetInsetBotRightCorner,
			SpellBookFrameInsetInsetBotLeftCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
		-- PvE
		for i, v in pairs({ PVEFrameTopBorder,
			PVEFrameRightBorder,
			PVEFrameLeftBorder,
			PVEFrameBottomBorder,
			PVEFramePortraitFrame,
			PVEFrameTopRightCorner,
			PVEFrameBotLeftCorner,
			PVEFrameBotRightCorner,
			LFDParentFrameBtnCornerRight,
			PVEFrameLeftInsetInsetBottomBorder,
			PVEFrameLeftInsetInsetBotLeftCorner,
			LFDParentFrameButtonBottomBorder,
			RaidFinderFrameBtnCornerRight,
			RaidFinderFrameButtonBottomBorder,
			LFDParentFrameInsetInsetBottomBorder,
			RaidFinderFrameBottomInsetInsetBottomBorder,
			LFGListFrameInsetBottomBorder,
			LFDParentFrameInsetInsetBotLeftCorner,
			LFGListFrameInsetBotLeftCorner,
			RaidFinderFrameBottomInsetInsetBotLeftCorner,	}) do
			v:SetVertexColor(.4, .4, .4)
		end
		-- Friends
		for i, v in pairs({ FriendsFrameTopBorder,
			FriendsFrameRightBorder,
			FriendsFrameLeftBorder,
			FriendsFrameBottomBorder,
			FriendsFramePortraitFrame,
			FriendsFrameTopRightCorner,
			FriendsFrameBtnCornerLeft,
			FriendsFrameBtnCornerRight,	}) do
			v:SetVertexColor(.4, .4, .4)
		end
		-- Map
		for i, v in pairs({ WorldMapFrameTopBorder,
			WorldMapFrameRightBorder,
			WorldMapFrameLeftBorder,
			WorldMapFrameBottomBorder,
			WorldMapFramePortraitFrame,
			WorldMapFrameTopRightCorner,
			WorldMapFrameBotLeftCorner,
			WorldMapFrameBotRightCorner,
			WorldMapFrame.BorderFrame.ButtonFrameEdge, }) do
			v:SetVertexColor(.4, .4, .4)
		end
		-- Channels
		for i, v in pairs({ ChannelFrameTopBorder,
			ChannelFrameRightBorder,
			ChannelFrameLeftBorder,
			ChannelFrameBottomBorder,
			ChannelFramePortraitFrame,
			ChannelFrameTopRightCorner,
			ChannelFrameBtnCornerLeft,
			ChannelFrameBtnCornerRight,
			ChannelFrameBotLeftCorner,
			ChannelFrameBotRightCorner,	}) do
			v:SetVertexColor(.4, .4, .4)
		end
		-- Chat
		for i, v in pairs({ ChatFrame1EditBoxLeft,
			ChatFrame1EditBoxRight,
			ChatFrame1EditBoxMid,
			ChatFrame2EditBoxLeft,
			ChatFrame2EditBoxRight,
			ChatFrame2EditBoxMid,
			ChatFrame3EditBoxLeft,
			ChatFrame3EditBoxRight,
			ChatFrame3EditBoxMid,
			ChatFrame4EditBoxLeft,
			ChatFrame4EditBoxRight,
			ChatFrame4EditBoxMid,
			ChatFrame5EditBoxLeft,
			ChatFrame5EditBoxRight,
			ChatFrame5EditBoxMid,
			ChatFrame6EditBoxLeft,
			ChatFrame6EditBoxRight,
			ChatFrame6EditBoxMid,
			ChatFrame7EditBoxLeft,
			ChatFrame7EditBoxRight,
			ChatFrame7EditBoxMid,	}) do
			v:SetVertexColor(.4, .4, .4)
		end
		-- StatusBarBorder (ExpBar)
		for i, v in pairs({ StatusTrackingBarManager.SingleBarLarge,
			StatusTrackingBarManager.SingleBarSmall,
			StatusTrackingBarManager.SingleBarLargeUpper,
			StatusTrackingBarManager.SingleBarSmallUpper,	}) do
			v:SetVertexColor(.4, .4, .4)
		end
		-- MailBorder
		for i, v in pairs({ MailFrameTopBorder,
			MailFrameRightBorder,
			MailFrameBottomBorder,
			MailFrameLeftBorder,
			MailFramePortraitFrame,
			MailFrameTopRightCorner,
			MailFrameBtnCornerLeft,
			MailFrameBtnCornerRight,
			MailFrameBotLeftCorner,
			MailFrameBotRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
		-- Merchant Frame
		for i, v in pairs({ MerchantFrameTopBorder,
			MerchantFrameRightBorder,
			MerchantFrameBottomBorder,
			MerchantFrameLeftBorder,
			MerchantFramePortraitFrame,
			MerchantFrameTopRightCorner,
			MerchantFrameBtnCornerLeft,
			MerchantFrameBtnCornerRight,
			MerchantFrameBotLeftCorner,
			MerchantFrameBotRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
		-- Gossip Frame (e.g NPC dialog frame and interactions)
		for i, v in pairs({ GossipFrameTopBorder,
			GossipFrameRightBorder,
			GossipFrameBottomBorder,
			GossipFrameLeftBorder,
			GossipFramePortraitFrame,
			GossipFrameTopRightCorner,
			GossipFrameBtnCornerLeft,
			GossipFrameBtnCornerRight,
			GossipFrameBotLeftCorner,
			GossipFrameBotRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
		-- Bank Frame
		for i, v in pairs({ BankFrameTopBorder,
			BankFrameRightBorder,
			BankFrameBottomBorder,
			BankFrameLeftBorder,
			BankFramePortraitFrame,
			BankFrameTopRightCorner,
			BankFrameBtnCornerLeft,
			BankFrameBtnCornerRight,
			BankFrameBotLeftCorner,
			BankFrameBotRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
		-- Quest Frame
		for i, v in pairs({ QuestFrameTopBorder,
			QuestFrameRightBorder,
			QuestFrameBottomBorder,
			QuestFrameLeftBorder,
			QuestFramePortraitFrame,
			QuestFrameTopRightCorner,
			QuestFrameBtnCornerLeft,
			QuestFrameBtnCornerRight,
			QuestFrameBotLeftCorner,
			QuestFrameBotRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
		-- Taxi Frame
		for i, v in pairs({ TaxiFrame.TopBorder,
			TaxiFrame.RightBorder,
			TaxiFrame.BottomBorder,
			TaxiFrame.LeftBorder,
			TaxiFrame.TopRightCorner,
			TaxiFrame.TopLeftCorner,
			TaxiFrame.BtnCornerLeft,
			TaxiFrame.BtnCornerRight,
			TaxiFrame.BotLeftCorner,
			TaxiFrame.BotRightCorner,
			TaxiFrame.InsetBorderBottom,
			TaxiFrame.InsetBorderBottomLeft,
			TaxiFrame.InsetBorderLeft, }) do
			v:SetVertexColor(.4, .4, .4)
		end
		-- Micro Menu and Bag Bar
		for i, v in pairs({ MicroButtonAndBagsBar.MicroBagBar, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	-- End
	self:UnregisterEvent("ADDON_LOADED")
	NewFrames:SetScript("OnEvent", nil)
	end
end)
----------------------------------------------------


-------------- Frames that need a load to work properly --------------
-- Specialization
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
		if name == "Blizzard_TalentUI" then
			for i, v in pairs({ PlayerTalentFrameTopBorder,
				PlayerTalentFrameRightBorder,
				PlayerTalentFrameLeftBorder,
				PlayerTalentFrameBottomBorder,
				PlayerTalentFramePortraitFrame,
				PlayerTalentFrameTopRightCorner,
				PlayerTalentFrameBtnCornerLeft,
				PlayerTalentFrameBtnCornerRight,
				PlayerTalentFrameBotLeftCorner,
				PlayerTalentFrameBotRightCorner,
				PlayerTalentFrameButtonBottomBorder,
				PlayerTalentFrameInsetInsetBottomBorder, }) do
				v:SetVertexColor(.4, .4, .4)
			end
		end
end)
-- Collections
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" then
		for i, v in pairs({ CollectionsJournalTopBorder,
			CollectionsJournalRightBorder,
			CollectionsJournalLeftBorder,
			CollectionsJounalBottomBorder,
			CollectionsJournalPortraitFrame,
			CollectionsJournalTopRightCorner,
			CollectionsJournalBotLeftCorner,
			CollectionsJournalBotRightCorner,
			CollectionsJournalParentFrameBtnCornerRight,
			CollectionsJournalBottomBorder,
		 	MountJournalInsetBottomBorder,
			MountJournalInsetBotLeftCorner,
			MountJournalInsetBotRightCorner,
			PetJournalLeftInsetInsetBottomBorder,
			PetJournalRightInsetInsetBottomBorder,
			PetJournalLeftInsetInsetBotLeftCorner,
		 	PetJournalLeftInsetInsetBotRightCorner,
			PetJournalRightInsetInsetBotLeftCorner,
			PetJournalRightInsetInsetBotRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- Azerite (needs review)
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AzeriteUI" then
		for i, v in pairs({ AzeriteEmpoweredItemUITopBorder,
			AzeriteEmpoweredItemUIRightBorder,
			AzeriteEmpoweredItemUIBottomBorder,
			AzeriteEmpoweredItemUILeftBorder,
			AzeriteEmpoweredItemUIPortraitFrame,
			AzeriteEmpoweredItemUIBotLeftCorner,
			AzeriteEmpoweredItemUIBotRightCorner,
			AzeriteEmpoweredItemUIBotTopRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- Honor Extra
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_PVPUI" then
		for i, v in pairs({ HonorFrameInsetBottomBorder,
		HonorFrameInsetBotLeftCorner,
		HonorFrameInsetBotRightCorner,
		HonorFrameInsetLeftBorder,
		PVPQueueFrameInsetBottomBorder,
		PVPQueueFrameInsetBotLeftCorner,
		PVPQueueFrameInsetBotRightCorner,
		ConquestFrameInsetBottomBorder,
		ConquestFrameInsetLeftBorder,
		ConquestFrameInsetBotLeftCorner,
		ConquestFrameInsetBotRightCorner,
		LFGListFrameInsetLeftBorder,
	 	LFGListFrameInsetBotRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- AdvGuide
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_EncounterJournal" then
		for i, v in pairs({ EncounterJournalTopBorder,
			EncounterJournalRightBorder,
			EncounterJournalLeftBorder,
			EncounterJournalBottomBorder,
			EncounterJournalPortraitFrame,
			EncounterJournalTopRightCorner,
			EncounterJournalBtnCornerLeft,
			EncounterJournalBtnCornerRight,
			EncounterJournalBotLeftCorner,
			EncounterJournalBotRightCorner,
		 	EncounterJournalInsetInsetBottomBorder, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- Communities
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Communities" then
		for i, v in pairs({ CommunitiesFrameTopBorder,
			CommunitiesFrameRightBorder,
			CommunitiesFrameBottomBorder,
			CommunitiesFrameLeftBorder,
			CommunitiesFrameTopRightCorner,
			CommunitiesFrameBotRightCorner,
			CommunitiesFrameBotLeftCorner,
			CommunitiesFrameBtnCornerLeft,
			CommunitiesFramePortraitFrame,
			CommunitiesFrameBtnCornerRight,
		 	CommunitiesFrameButtonBottomBorder,
			CommunitiesFrameInsetInsetLeftBorder,
		 	CommunitiesFrameInsetInsetBottomBorder,
			CommunitiesFrame.PortraitOverlay.PortraitFrame,
		 	CommunitiesFrameCommunitiesListInsetLeftBorder,
		 	CommunitiesFrameCommunitiesListInsetBottomBorder,
			CommunitiesFrameInsetBottomBorder,
		 	CommunitiesFrameCommunitiesListInsetBotLeftCorner,
			CommunitiesFrameCommunitiesListInsetBotRightCorner,
			CommunitiesFrameInsetBotLeftCorner,
			CommunitiesFrameInsetBotRightCorner,
			CommunitiesFrame.ChatEditBox.Mid,
			CommunitiesFrame.ChatEditBox.Right,
		 	CommunitiesFrame.ChatEditBox.Left,
			CommunitiesFrame.GuildBenefitsFrame.InsetBorderLeft,
		 	CommunitiesFrame.GuildBenefitsFrame.InsetBorderBottomLeft,
			CommunitiesFrame.GuildBenefitsFrame.InsetBorderBottomLeft2,
			CommunitiesFrame.GuildBenefitsFrame.InsetBorderBottomRight,
			CommunitiesFrameGuildDetailsFrame.InsetBorderLeft,
			CommunitiesFrameGuildDetailsFrame.InsetBorderBottomLeft,
			CommunitiesFrameGuildDetailsFrame.InsetBorderBottomLeft2,
			CommunitiesFrameGuildDetailsFrame.InsetBorderBottomRight, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- Macro
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_MacroUI" then
		for i, v in pairs({ MacroFrameTopBorder,
			MacroFrameRightBorder,
			MacroFrameBottomBorder,
			MacroFrameLeftBorder,
			MacroFramePortraitFrame,
			MacroFrameBtnCornerLeft,
			MacroFrameBtnCornerRight,
			MacroFrameBotLeftCorner,
			MacroFrameBotRightCorner,
		 	MacroFrameButtonBottomBorder,
			MacroFrameInsetInsetBottomBorder,
			MacroFrameTopRightCorner, }) do
			v: SetVertexColor(.4, .4, .4)
		end
	end
end)
-- Auction House (needs review)
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AuctionUI" then
		for i, v in pairs({ AuctionFrameTop, AuctionFrameTopLeft, AuctionFrameTopRight,
			AuctionFrameBot, AuctionFrameBotLeft, AuctionFrameBotRight, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- Flight Map needs review
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_FlightMap" then
		for i, v in pairs({ FlightMapFrameTopBorder, FlightMapFrameRightBorder,
			FlightMapFrameBottomBorder, FlightMapFrameLeftBorder,
			FlightMapFramePortraitFrame, FlightMapFrameTopRightCorner,
			FlightMapFrameBtnCornerLeft, FlightMapFrameBtnCornerRight,
			FlightMapFrameBotLeftCorner, FlightMapFrameBotRightCorner	}) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- Trade Skill Frame (needs review)
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TradeSkillUI" then
		for i, v in pairs({ TradeSkillFrameTopBorder, TradeSkillFrameRightBorder,
			TradeSkillFrameBottomBorder, TradeSkillFrameLeftBorder,
			TradeSkillFramePortraitFrame, TradeSkillFrameTopRightCorner,
			TradeSkillFrameBtnCornerLeft, TradeSkillFrameBtnCornerRight,
			TradeSkillFrameBotLeftCorner, TradeSkillFrameBotRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- Inspect Frame needs review
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_InspectUI" then
		for i, v in pairs({ InspectFrameTopBorder, InspectFrameRightBorder,
			InspectFrameBottomBorder, InspectFrameLeftBorder,
			InspectFramePortraitFrame, InspectFrameTopRightCorner,
			InspectFrameBtnCornerLeft, InspectFrameBtnCornerRight,
			InspectFrameBotLeftCorner, InspectFrameBotRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)


------ Need Review (Not Working or Blizzard doesn't allow changes for now)------
--[[
-- Wardrobe Frame aka Transmogrify (needs review)
for i, v in pairs({ WardrobeFrameTopBorder, WardrobeFrameRightBorder,
	WardrobeFrameBottomBorder, WardrobeFrameLeftBorder,
	WardrobeFramePortraitFrame,	WardrobeFrameTopRightCorner,
	WardrobeFrameBtnCornerLeft,	WardrobeFrameBtnCornerRight,
	WardrobeFrameBotLeftCorner,	WardrobeFrameBotRightCorner, }) do
	v:SetVertexColor(.4, .4, .4)
end
-- Class Trainer Frame aka Flight Master and others (needs review)
for i, v in pairs({ ClassTrainerFrameTopBorder, ClassTrainerFrameRightBorder,
	ClassTrainerFrameBottomBorder, ClassTrainerFrameLeftBorder,
	ClassTrainerFramePortraitFrame, ClassTrainerFrameTopRightCorner,
	ClassTrainerFrameBtnCornerLeft, ClassTrainerFrameBtnCornerRight,
	ClassTrainerFrameBotLeftCorner, ClassTrainerFrameBotRightCorner, }) do
	v:SetVertexColor(.4, .4, .4)
end
--]]


--------------------------------------------------------
-- Class Icons (Need Flat Icons or some Texture Pack) --
--------------------------------------------------------

hooksecurefunc("UnitFramePortrait_Update", function(self)
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
----------------------------------------------------

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
----------------------------------------------------

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
----------------------------------------------------

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
----------------------------------------------------

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

-- Target Cast Top Frame
--[[ Not Used because being messy in boss encounters
TargetFrameSpellBar:ClearAllPoints()
TargetFrameSpellBar:SetPoint("BOTTOM", TargetFrame, "TOP", -35, 0)
TargetFrameSpellBar.SetPoint = function() end
----------------------------------------------------
--]]


-----------------------------------
-- Minimap plus things (tweaks) ---
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
----------------------------------------------------

--------------------------------------------
-- Disable spam healing over player frame --
--------------------------------------------

PlayerHitIndicator:SetText(nil)
PlayerHitIndicator.SetText = function() end

PetHitIndicator:SetText(nil)
PetHitIndicator.SetText = function() end
----------------------------------------------------

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
----------------------------------------------------

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
----------------------------------------------------

----------------------------------
-- Tooltip Faction Color Change --
----------------------------------

GameTooltip:HookScript("OnTooltipSetUnit", function(GameTooltip)
	local _, factionGroup
	-- Horde
		if UnitFactionGroup("player") == "Horde" then
			if GameTooltipTextLeft3:GetText() == "Horde" then
				GameTooltipTextLeft3:SetTextColor(255, 0.1, 0)
			elseif GameTooltipTextLeft4:GetText() == "Horde"then
				GameTooltipTextLeft4:SetTextColor(255, 0.1, 0)
			elseif GameTooltipTextLeft3:GetText() == "Alliance"then
				GameTooltipTextLeft3:SetTextColor(0, 0.5, 255)
			elseif GameTooltipTextLeft4:GetText() == "Alliance"then
				GameTooltipTextLeft4:SetTextColor(0, 0.5, 255)
			else
				GameTooltipTextLeft3:SetTextColor(255, 255, 255)
				GameTooltipTextLeft4:SetTextColor(255, 255, 255)
			end
		end
  -- Alliance
	if UnitFactionGroup("player") == "Alliance" then
		if GameTooltipTextLeft3:GetText() == "Alliance" then
			GameTooltipTextLeft3:SetTextColor(0, 0.5, 255)
		elseif GameTooltipTextLeft4:GetText() == "Alliance"then
			GameTooltipTextLeft4:SetTextColor(0, 0.5, 255)
		elseif GameTooltipTextLeft3:GetText() == "Horde"then
			GameTooltipTextLeft3:SetTextColor(255, 0.1, 0)
		elseif GameTooltipTextLeft4:GetText() == "Horde"then
			GameTooltipTextLeft4:SetTextColor(255, 0.1, 0)
		else
			GameTooltipTextLeft3:SetTextColor(255, 255, 255)
			GameTooltipTextLeft4:SetTextColor(255, 255, 255)
		end
	end
end)
----------------------------------------------------

-----------------------------
-- Tooltip Dark background --
-----------------------------

local TooltipBackground = GameTooltip:CreateTexture(nil, "BACKGROUND", nil, 1)
TooltipBackground:SetPoint("TOPLEFT", 3, -3)
TooltipBackground:SetPoint("BOTTOMRIGHT", -3, 3)
TooltipBackground:SetColorTexture(0.02, 0.02, 0.02)
TooltipBackground:SetAlpha(.05, .05, .05)
----------------------------------------------------

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
----------------------------------------------------


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
----------------------------------------------------

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
----------------------------------------------------


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
----------------------------------------------------


------- Scripts that need to be tested/fixed or are not used (not trash) -------
--[[
-- Gryphons hide
MainMenuBarLeftEndCap:Hide()
MainMenuBarRightEndCap:Hide()
--]]

--[[
if not AbyssUI.modifyUnitTooltips then
	return
end
--]]


--[[
--------------------------
-- Tooltip Faction Icon --
--------------------------

-- Faction Frame
FactionFrameIcon = CreateFrame("Button","FrameButton", GameTooltip, "UIPanelButtonTemplate")
FactionFrameIcon:SetHeight(20)
FactionFrameIcon:SetWidth(20)
FactionFrameIcon:SetPoint("BOTTOM", GameTooltip, "BOTTOMRIGHT", -13, 3.8)
FactionFrameIcon:Hide()

GameTooltip:HookScript("OnUpdate", function(GameTooltip)
	if GameTooltipTextLeft3:GetText() == "Horde" or GameTooltipTextLeft4:GetText() == "Horde" then
		FactionFrameIcon:SetNormalTexture("Interface\\ICONS\\pvpcurrency-honor-horde")
		FactionFrameIcon:Show()
	elseif GameTooltipTextLeft3:GetText() == "Alliance" or GameTooltipTextLeft4:GetText() == "Alliance" then
		FactionFrameIcon:SetNormalTexture("Interface\\ICONS\\pvpcurrency-honor-alliance")
		FactionFrameIcon:Show()
	else
		FactionFrameIcon:Hide()
	end
end)
----------------------------------------------------
--]]


--[[
-----------------------
-- Tooltip Spec Icon --
-----------------------

-- Spec Frame
SpecializationFrameIcon = CreateFrame("Button","FrameButton", GameTooltip, "UIPanelButtonTemplate")
SpecializationFrameIcon:SetHeight(20)
SpecializationFrameIcon:SetWidth(20)
SpecializationFrameIcon:SetPoint("BOTTOM", GameTooltip, "BOTTOMRIGHT", -35, 3.8)
SpecializationFrameIcon:Hide()

local unit = GameTooltip:GetUnit()
local currentSpec = GetSpecialization(unit)
local currentSpecName = GetSpecializationInfo(currentSpec)
function SpecializationIconFunction()
	-- Druid
	if currentSpecName == "Balance" and UnitIsPlayer(unit) and UnitClass(unit) == "Druid" then
		SpecializationFrameIcon:SetNormalTexture("Interface\\ICONS\\talentspec_druid_balance")
		SpecializationFrameIcon:Show()
	elseif currentSpecName == "Feral" and UnitIsPlayer(unit) and UnitClass(unit) == "Druid" then
		SpecializationFrameIcon:SetNormalTexture("Interface\\ICONS\\talentspec_druid_feral_cat")
		SpecializationFrameIcon:Show()
	elseif currentSpecName == "Guardian" and UnitIsPlayer(unit) and UnitClass(unit) == "Druid" then
		SpecializationFrameIcon:SetNormalTexture("Interface\\ICONS\\talentspec_druid_feral_bear")
		SpecializationFrameIcon:Show()
	elseif currentSpecName == "Restoration" and UnitIsPlayer(unit) and UnitClass(unit) == "Druid" then
		SpecializationFrameIcon:SetNormalTexture("Interface\\ICONS\\talentspec_druid_restoration")
		SpecializationFrameIcon:Show()
	-- Hunter
	-- Mage
	elseif currentSpecName == "Arcane" and UnitIsPlayer(unit) and UnitClass(unit) == "Mage" then
		SpecializationFrameIcon:SetNormalTexture("Interface\\ICONS\\spell_shaman_improvedstormstrike")
		SpecializationFrameIcon:Show()
	elseif currentSpecName == "Fire" and UnitIsPlayer(unit) and UnitClass(unit) == "Mage" then
		SpecializationFrameIcon:SetNormalTexture("Interface\\ICONS\\spell_nature_lightning")
		SpecializationFrameIcon:Show()
	elseif currentSpecName == "Frost" and UnitIsPlayer(unit) and UnitClass(unit) == "Mage" then
		SpecializationFrameIcon:SetNormalTexture("Interface\\ICONS\\spell_nature_healingwavelesser")
		SpecializationFrameIcon:Show()
	-- Paladin
	-- Priest
	-- Rogue
	-- Shaman
	elseif currentSpecName == "Enhancement" and UnitIsPlayer(unit) and UnitClass(unit) == "Shaman" then
		SpecializationFrameIcon:SetNormalTexture("Interface\\ICONS\\spell_shaman_improvedstormstrike")
		SpecializationFrameIcon:Show()
	elseif currentSpecName == "Elemental" and UnitIsPlayer(unit) and UnitClass(unit) == "Shaman" then
		SpecializationFrameIcon:SetNormalTexture("Interface\\ICONS\\spell_nature_lightning")
		SpecializationFrameIcon:Show()
	elseif currentSpecName == "Restoration" and UnitIsPlayer(unit) and UnitClass(unit) == "Shaman" then
		SpecializationFrameIcon:SetNormalTexture("Interface\\ICONS\\spell_nature_healingwavelesser")
		SpecializationFrameIcon:Show()
	-- Warlock
	-- Warrior
	-- Monk
	-- Death Knight
	-- Demon Hunter
	else SpecializationFrameIcon:Hide()
	end
end

GameTooltip:HookScript("OnUpdate", function(GameTooltip)
	SpecializationIconFunction()
end)
----------------------------------------------------
--]]


-------------------------- Save and Extra Stuff --------------------------

-- AbyssUIFirstFrame
AbyssUIFirstFrame = CreateFrame("Frame", nil, UIParent)
AbyssUIFirstFrame:Hide()
AbyssUIFirstFrame:SetWidth(400)
AbyssUIFirstFrame:SetHeight(140)
AbyssUIFirstFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 200)
AbyssUIFirstFrame:EnableMouse(true)
AbyssUIFirstFrame:SetFrameStrata("BACKGROUND")
AbyssUIFirstFrame.text = AbyssUIFirstFrame.text or AbyssUIFirstFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUIFirstFrame.text:SetScale(1.5)
AbyssUIFirstFrame.text:SetAllPoints(true)
AbyssUIFirstFrame.text:SetJustifyH("CENTER")
AbyssUIFirstFrame.text:SetJustifyV("CENTER")
AbyssUIFirstFrame.text:SetText("Thanks for using |cff0d75d4AbyssUI!|r\nThe |cff5f545eDark|r Blizzard UI revamp.\nCheck my other addons:\nEasyLeave, EasyConfirm and HideonCombat.")
----------------------------------------------------
local AbyssUIBorder = AbyssUIFirstFrame:CreateTexture(nil, "BACKGROUND")
AbyssUIBorder:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
AbyssUIBorder:SetPoint("TOPLEFT", -3, 3)
AbyssUIBorder:SetPoint("BOTTOMRIGHT", 3, -3)
AbyssUIBorder:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUIFirstFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUIFirstFrame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUIFirstFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUIFirstFrame)
AbyssUIFirstFrame.texture = Texture
----------------------------------------------------
local FrameButton = CreateFrame("Button", "FrameButton", AbyssUIFirstFrame, "UIPanelButtonTemplate")
FrameButton:SetHeight(24)
FrameButton:SetWidth(70)
FrameButton:SetPoint("BOTTOM", AbyssUIFirstFrame, "BOTTOM", 0, 10)
FrameButton:SetText("Close")
FrameButton:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
----------------------------------------------------
local BorderButton = FrameButton:CreateTexture(nil, "ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButton)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)
FrameButton:SetScript("OnClick", function()
	AbyssUIFirstFrame:Hide()
end)
----------------------------------------------------


-- Start Function
function AbyssUIStart()
	AbyssUIFirstFrame:Show()
end
----------------------------------------------------


-- DailyInfo Function
C_WowTokenPublic.UpdateMarketPrice()
function AbyssUIDailyInfo()
	print("\n|cffcc0000<< AbyssUI Daily Info >>|r")
	if C_WowTokenPublic.GetCurrentMarketPrice() ~= nil then
		print("|cffcc0000Token Price: |r" .. GetMoneyString(C_WowTokenPublic.GetCurrentMarketPrice()))
	else
		print("|cffcc0000Token Price:|r Not available right now!")
	end
	print("|cffcc0000Date:|r " .. date("|cffffcc00%m/%d/%y|r %H:%M:%S"))
	print("|cffcc0000Honor Level: |r|cffffcc00" .. UnitHonorLevel("player") .. "|r")
	--print("|cffcc0000Location: |r" .. GetMinimapZoneText() .. "|cffffcc00, " .. GetZoneText() .. "|r")
	print("|cffcc0000WoW Version: |r|cffffcc00" .. select(1, GetBuildInfo()) .. "|r")
end
----------------------------------------------------


--------------------------------- Save ---------------------------------
local AbyssUISave = CreateFrame("Frame")
AbyssUISave:RegisterEvent("ADDON_LOADED")
AbyssUISave:RegisterEvent("PLAYER_LOGOUT")
AbyssUISave:SetScript("OnEvent", function(self, event, arg1)
	if ( event == "ADDON_LOADED" and arg1 == "AbyssUI" ) then
		if ( AbyssUICount == nil ) then
			AbyssUICount = 0
		end
		if ( AbyssUIProfile == nil ) then
			AbyssUICount = AbyssUICount + 1
				AbyssUIStart()
		else
			local name, elapsed = UnitName("player"), time() - AbyssUIProfile
			C_Timer.After(4, function()
				print("Thanks for using |cff0d75d4AbyssUI!|r The |cff5f545eDark|r Blizzard UI revamp.")
			end)
			C_Timer.After(5, function()
				AbyssUIDailyInfo()
				print("|cffcc0000Time since last login: |r" .. name .. " you leave for |cffffcc00" .. SecondsToTime(elapsed) .. "|r")
			end)
			AbyssUIFirstFrame:Hide()
		end
	elseif ( event == "PLAYER_LOGOUT" ) then
		AbyssUIProfile = time()
	end
end)

-- End
