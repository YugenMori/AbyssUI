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
		-- Character
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
		-- StatusBar (ExpBar)
		for i, v in pairs({ StatusTrackingBarManager.SingleBarLarge,
			StatusTrackingBarManager.SingleBarSmall,
			StatusTrackingBarManager.SingleBarLargeUpper,
			StatusTrackingBarManager.SingleBarSmallUpper,	}) do
			v:SetVertexColor(.4, .4, .4)
		end
		-- Mail
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
		-- Merchant
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
		-- Gossip (e.g NPC dialog frame and interactions)
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
		-- Bank
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
		-- Quest
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
		-- Taxi
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
			TaxiFrame.InsetBorderLeft,
		 	TaxiFrame.InsetBorderBottomRight, }) do
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
			PetJournalRightInsetInsetBotRightCorner,
		 	ToyBoxInsetBottomBorder,
			ToyBoxInsetLeftBorder,
			ToyBoxInsetBotLeftCorner,
			ToyBoxInsetBotRightCorner,
			HeirloomsJournalInsetBottomBorder,
			HeirloomsJournalInsetLeftBorder,
			HeirloomsJournalInsetBotLeftCorner,
			HeirloomsJournalInsetBotRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- Honor (Extra from PVE)
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
-- AdventureGuide
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
			CommunitiesFrameTopLeftCorner,
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
-- AuctionHouse
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
-- FlightMap
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_FlightMap" then
		for i, v in pairs({ FlightMapFrameTopBorder,
			FlightMapFrameRightBorder,
			FlightMapFrameBottomBorder,
			FlightMapFrameLeftBorder,
			FlightMapFramePortraitFrame,
			FlightMapFrameTopRightCorner,
			FlightMapFrameBtnCornerLeft,
			FlightMapFrameBtnCornerRight,
			FlightMapFrameBotLeftCorner,
			FlightMapFrameBotRightCorner,	}) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- TradeSkill
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TradeSkillUI" then
		for i, v in pairs({ TradeSkillFrameTopBorder,
			TradeSkillFrameRightBorder,
			TradeSkillFrameBottomBorder,
			TradeSkillFrameLeftBorder,
			TradeSkillFramePortraitFrame,
			TradeSkillFrameTopRightCorner,
			TradeSkillFrameBtnCornerLeft,
			TradeSkillFrameBtnCornerRight,
			TradeSkillFrameBotLeftCorner,
			TradeSkillFrameBotRightCorner,
		 	TradeSkillFrameInsetBottomBorder,
			TradeSkillFrameInsetBotLeftCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- Inspect
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_InspectUI" then
		for i, v in pairs({ InspectFrameTopBorder,
			InspectFrameRightBorder,
			InspectFrameBottomBorder,
			InspectFrameLeftBorder,
			InspectFramePortraitFrame,
			InspectFrameTopRightCorner,
			InspectFrameBtnCornerLeft,
			InspectFrameBtnCornerRight,
			InspectFrameBotLeftCorner,
			InspectFrameBotRightCorner,
		 	InspectFrameInsetInsetBottomBorder,
			InspectFrameInsetInsetBotLeftCorner,
			InspectFrameInsetInsetBotRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- Wardrobe/Transmogrify (Some parts missing)
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" or name == "Blizzard_Wardrobe" then
		for i, v in pairs({ WardrobeFrameTopBorder,
			WardrobeFrameRightBorder,
			WardrobeFrameBottomBorder,
			WardrobeFrameLeftBorder,
			WardrobeFramePortraitFrame,
			WardrobeFrameTopRightCorner,
			WardrobeFrameBtnCornerLeft,
			WardrobeFrameBtnCornerRight,
			WardrobeFrameBotLeftCorner,
			WardrobeFrameBotRightCorner,
		 	WardrobeTransmogFrameInsetBottomBorder,
			WardrobeTransmogFrameInsetBotLeftCorner,
		  WardrobeTransmogFrameInsetBotRightCorner,
			WardrobeCollectionFrameInsetLeftBorder,
			WardrobeCollectionFrameInsetBottomBorder,
			WardrobeCollectionFrameInsetBotLeftCorner,
			WardrobeCollectionFrameInsetBotRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- ClassTrainer/FlightMaster
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TrainerUI" then
		for i, v in pairs({ ClassTrainerFrameTopBorder,
			ClassTrainerFrameRightBorder,
			ClassTrainerFrameBottomBorder,
			ClassTrainerFrameLeftBorder,
			ClassTrainerFramePortraitFrame,
			ClassTrainerFrameTopRightCorner,
			ClassTrainerFrameBtnCornerLeft,
			ClassTrainerFrameBtnCornerRight,
			ClassTrainerFrameBotLeftCorner,
			ClassTrainerFrameBotRightCorner,
		 	ClassTrainerFrameButtonBottomBorder,
			ClassTrainerFrameBottomInsetInsetBottomBorder, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- Achievement
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AchievementUI" then
		for i, v in pairs({ AchievementFrameHeaderRight,
	 		AchievementFrameHeaderLeft,
			AchievementFrameWoodBorderTopLeft,
			AchievementFrameWoodBorderBottomLeft,
			AchievementFrameWoodBorderTopRight,
			AchievementFrameWoodBorderBottomRight,
		 	AchievementFrameMetalBorderBottom,
			AchievementFrameMetalBorderBottomLeft,
			AchievementFrameMetalBorderBottomRight,
			AchievementFrameMetalBorderLeft,
			AchievementFrameMetalBorderRight,
			AchievementFrameMetalBorderTop,
			AchievementFrameMetalBorderTopLeft,
			AchievementFrameMetalBorderTopRight, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- Azerite
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
			AzeriteEmpoweredItemUIBotTopRightCorner,
		 	AzeriteEmpoweredItemUITopRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- AlliedRaces
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AlliedRacesUI" then
		for i, v in pairs({ AlliedRacesFrameTopBorder,
			AlliedRacesFrameRightBorder,
			AlliedRacesFrameBottomBorder,
			AlliedRacesFrameLeftBorder,
			AlliedRacesFramePortraitFrame,
			AlliedRacesFrameBotLeftCorner,
			AlliedRacesFrameBotRightCorner,
			AlliedRacesFrameBotTopRightCorner,
		 	AlliedRacesFrameTopRightCorner,
		 	AlliedRacesFrameBtnCornerLeft,
		 	AlliedRacesFrameBtnCornerRight,
			AlliedRacesFrameButtonBottomBorder, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- DressUP (not working)
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "DressUpFrames" then
		for i, v in pairs({ DressUpFrameTopBorder,
			DressUpFrameRightBorder,
			DressUpFrameBottomBorder,
			DressUpFrameLeftBorder,
			DressUpFramePortraitFrame,
			DressUpFrameTopRightCorner,
			DressUpFrameBtnCornerLeft,
			DressUpFrameBtnCornerRight,
			DressUpFrameBotLeftCorner,
			DressUpFrameBotRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- Inslands
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_IslandsQueueUI" then
		for i, v in pairs({ IslandsQueueFrameTopBorder,
			IslandsQueueFrameRightBorder,
			IslandsQueueFrameBottomBorder,
			IslandsQueueFrameLeftBorder,
			IslandsQueueFramePortraitFrame,
			IslandsQueueFrameTopRightCorner,
			IslandsQueueFrameBtnCornerLeft,
			IslandsQueueFrameBtnCornerRight,
			IslandsQueueFrameBotLeftCorner,
			IslandsQueueFrameBotRightCorner,
		 	IslandsQueueFrame.ArtOverlayFrame.PortraitFrame, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
-- GarrisonCapacitive
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_GarrisonUI" then
		for i, v in pairs({ GarrisonCapacitiveDisplayFrameTopBorder,
			GarrisonCapacitiveDisplayFrameRightBorder,
			GarrisonCapacitiveDisplayFrameBottomBorder,
			GarrisonCapacitiveDisplayFrameLeftBorder,
			GarrisonCapacitiveDisplayFramePortraitFrame,
			GarrisonCapacitiveDisplayFrameTopRightCorner,
			GarrisonCapacitiveDisplayFrameBtnCornerLeft,
			GarrisonCapacitiveDisplayFrameBtnCornerRight,
			GarrisonCapacitiveDisplayFrameBotLeftCorner,
			GarrisonCapacitiveDisplayFrameBotRightCorner, }) do
			v:SetVertexColor(.4, .4, .4)
		end
	end
end)
----------------------------------------------------


----------------------------- Needs Review -----------------------------
--[[
------------------------------------------------------------------------


------------------------------------------------------------------------
--]]

-----------------------------
-- Hide MicroMenu Function --
-----------------------------
--[[
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if event == "ADDON_LOADED" then
		for i, v in pairs({ MicroButtonAndBagsBar.MicroBagBar,
			MicroButtonAndBagsBar, MainMenuBarPerformanceBar, MainMenuMicroButton,
			EJMicroButton, CollectionsMicroButton, LFDMicroButton,
			GuildMicroButtonTabard, GuildMicroButton, QuestLogMicroButton,
			AchievementMicroButton, TalentMicroButton, SpellbookMicroButton,
			CharacterMicroButton, StoreMicroButton, }) do
			v:Hide()
			StoreMicroButton:SetScript("OnShow", StoreMicroButton.Hide)
			StoreMicroButton.Show = function() end
			StoreMicroButton:Hide()
		end
	end
end)
--]]
----------------------------------------------------

------- Scripts that need to be tested/fixed or are not used (not trash) -------

--[[
if not AbyssUI.modifyUnitTooltips then
	return
end
--]]

--[[
-- Target Cast Top Frame
 Not Used because its being messy in boss encounters
TargetFrameSpellBar:ClearAllPoints()
TargetFrameSpellBar:SetPoint("BOTTOM", TargetFrame, "TOP", -35, 0)
TargetFrameSpellBar.SetPoint = function() end
----------------------------------------------------
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

-- End
