-- Author: Yugen
--
-- Battle for Azeroth
--
-- Hope you like my addOn ^^
--
-- Frames for AbyssUI
--------------------------------------------------------------------------------
local addonName, addonTable = ...
-- AbyssUI_AFKCameraFrame
local AbyssUI_AFKCameraFrame = CreateFrame("Frame", "$parentAbyssUI_AFKCameraFrame", UIParent)
AbyssUI_AFKCameraFrame:SetFrameStrata("HIGH")
AbyssUI_AFKCameraFrame:SetWidth(GetScreenWidth())
AbyssUI_AFKCameraFrame:SetHeight(GetScreenHeight())
AbyssUI_AFKCameraFrame:SetClampedToScreen(true)
AbyssUI_AFKCameraFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
AbyssUI_AFKCameraFrame.text = AbyssUI_AFKCameraFrame.text or AbyssUI_AFKCameraFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUI_AFKCameraFrame.text:SetScale(3)
AbyssUI_AFKCameraFrame.text:SetAllPoints(true)
AbyssUI_AFKCameraFrame.text:SetJustifyH("CENTER")
AbyssUI_AFKCameraFrame.text:SetJustifyV("CENTER")
AbyssUI_AFKCameraFrame.text:SetWidth(GetScreenWidth()/4)
AbyssUI_AFKCameraFrame.text:SetHeight(GetScreenHeight()/2)
AbyssUI_AFKCameraFrame.text:SetText("|cff0d75d4AbyssUI|r\nMove to leave AFK Mode")
AbyssUI_AFKCameraFrame:Hide()
----------------------------------------------------
local AbyssUIBorder = AbyssUI_AFKCameraFrame:CreateTexture(nil, "BACKGROUND")
AbyssUIBorder:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
AbyssUIBorder:SetPoint("TOPLEFT", -3, 3)
AbyssUIBorder:SetPoint("BOTTOMRIGHT", 3, -3)
AbyssUIBorder:SetVertexColor(0.7, 0.7, 0.7, 0.7)
----------------------------------------------------
local BorderBody = AbyssUI_AFKCameraFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUI_AFKCameraFrame)
BorderBody:SetVertexColor(0.7, 0.7, 0.7, 0.7)
----------------------------------------------------
local Texture = AbyssUI_AFKCameraFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUI_AFKCameraFrame)
AbyssUI_AFKCameraFrame.texture = Texture
----------------------------------------------------
-- AFK Camera Function
local AbyssUI_AFKCamera = CreateFrame("Frame", "$parentAbyssUI_AFKCamera", nil)
AbyssUI_AFKCamera:RegisterEvent("PLAYER_FLAGS_CHANGED")
AbyssUI_AFKCamera:RegisterEvent("PLAYER_ENTERING_WORLD")
----------------------------------------------------
-- ModelFrameAFKMode
-- Model1
local AbyssUI_ModelFrameAFKMode = CreateFrame("Frame", "$parentAbyssUI_ModelFrameAFKMode", AbyssUI_AFKCameraFrame)
AbyssUI_ModelFrameAFKMode:SetPoint("TOPLEFT", 0, 0)
AbyssUI_ModelFrameAFKMode:SetWidth(GetScreenWidth()/4)
AbyssUI_ModelFrameAFKMode:SetHeight(GetScreenHeight()/2)
AbyssUI_ModelFrameAFKMode:SetAlpha(1)

local ModelFrame_Model1 = CreateFrame("PlayerModel", "$parentModelFrame_Model1", AbyssUI_ModelFrameAFKMode)
ModelFrame_Model1:SetUnit("player")
ModelFrame_Model1:SetAlpha(1)
ModelFrame_Model1:SetAllPoints(AbyssUI_ModelFrameAFKMode)
ModelFrame_Model1:SetCustomCamera(1)
local x, y, z = ModelFrame_Model1:GetCameraPosition()
----------------------------------------------------
-- PlayerInfoAFKMode
-- Name
local PlayerInfo_Name1 = CreateFrame("Frame", "$parentPlayerInfo_Name1", AbyssUI_AFKCameraFrame)
local playerName = UnitName("player")
PlayerInfo_Name1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Name1:SetScale(3)
PlayerInfo_Name1.text = PlayerInfo_Name1.text or PlayerInfo_Name1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Name1.text:SetPoint("TOPRIGHT", 0, -10)
PlayerInfo_Name1.text:SetText(playerName)
-- Level
local PlayerInfo_Level1 = CreateFrame("Frame", "$parentPlayerInfo_Level1", AbyssUI_AFKCameraFrame)
local level = UnitLevel("player")
PlayerInfo_Level1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Level1:SetScale(3)
PlayerInfo_Level1.text = PlayerInfo_Level1.text or PlayerInfo_Level1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Level1.text:SetPoint("TOPRIGHT", 0, -20)
PlayerInfo_Level1.text:SetText(level)
-- Race
local PlayerInfo_Race1 = CreateFrame("Frame", "$parentPlayerInfo_Race1", AbyssUI_AFKCameraFrame)
local race, raceEn = UnitRace("player")
PlayerInfo_Race1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Race1:SetScale(3)
PlayerInfo_Race1.text = PlayerInfo_Race1.text or PlayerInfo_Race1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Race1.text:SetPoint("TOPRIGHT", 0, -30)
PlayerInfo_Race1.text:SetText(raceEn)
-- Class
local PlayerInfo_Class1 = CreateFrame("Frame", "$parentPlayerInfo_Class1", AbyssUI_AFKCameraFrame)
local playerClass, englishClass = UnitClass("player")
PlayerInfo_Class1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Class1:SetScale(3)
PlayerInfo_Class1.text = PlayerInfo_Class1.text or PlayerInfo_Class1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Class1.text:SetPoint("TOPRIGHT", 0, -40)
PlayerInfo_Class1.text:SetText(playerClass)
-- Class colorization (all player info)
 if ( englishClass == "DEATHKNIGHT" ) then
 	for i, v in pairs({ PlayerInfo_Name1, 
 		PlayerInfo_Level1, 
 		PlayerInfo_Race1, 
 		PlayerInfo_Class1, }) do
 		v.text:SetVertexColor(196/255, 30/255, 59/255)
 	end 
 elseif ( englishClass == "DEMONHUNTER" ) then
 	 for i, v in pairs({ PlayerInfo_Name1, 
 		PlayerInfo_Level1, 
 		PlayerInfo_Race1, 
 		PlayerInfo_Class1, }) do
 		v.text:SetVertexColor(163/255, 48/255, 201/255)
 	end 
 elseif ( englishClass == "DRUID" ) then
 	 for i, v in pairs({ PlayerInfo_Name1, 
 		PlayerInfo_Level1, 
 		PlayerInfo_Race1, 
 		PlayerInfo_Class1, }) do
 		v.text:SetVertexColor(255/255, 125/255, 10/255)
 	end 
 elseif ( englishClass == "HUNTER" ) then
  	 for i, v in pairs({ PlayerInfo_Name1, 
 		PlayerInfo_Level1, 
 		PlayerInfo_Race1, 
 		PlayerInfo_Class1, }) do
 		v.text:SetVertexColor(171/255, 212/255, 115/255)
 	end 
 elseif ( englishClass == "MAGE" ) then
  	 for i, v in pairs({ PlayerInfo_Name1, 
 		PlayerInfo_Level1, 
 		PlayerInfo_Race1, 
 		PlayerInfo_Class1, }) do
 		v.text:SetVertexColor(105/255, 204/255, 240/255)
 	end 
 elseif ( englishClass == "MONK" ) then
  	 for i, v in pairs({ PlayerInfo_Name1, 
 		PlayerInfo_Level1, 
 		PlayerInfo_Race1, 
 		PlayerInfo_Class1, }) do
 		v.text:SetVertexColor(0/255, 255/255, 150/255)
 	end 
 elseif ( englishClass == "PALADIN" ) then
  	 for i, v in pairs({ PlayerInfo_Name1, 
 		PlayerInfo_Level1, 
 		PlayerInfo_Race1, 
 		PlayerInfo_Class1, }) do
 		v.text:SetVertexColor(245/255, 140/255, 186/255)
 	end 
 elseif ( englishClass == "PRIEST" ) then
  	 for i, v in pairs({ PlayerInfo_Name1, 
 		PlayerInfo_Level1, 
 		PlayerInfo_Race1, 
 		PlayerInfo_Class1, }) do
 		v.text:SetVertexColor(255/255, 255/255, 255/255)
 	end 
 elseif ( englishClass == "ROGUE" ) then
  	 for i, v in pairs({ PlayerInfo_Name1, 
 		PlayerInfo_Level1, 
 		PlayerInfo_Race1, 
 		PlayerInfo_Class1, }) do
 		v.text:SetVertexColor(255/255, 245/255, 105/255)
 	end 
 elseif ( englishClass == "SHAMAN" ) then
  	 for i, v in pairs({ PlayerInfo_Name1, 
 		PlayerInfo_Level1, 
 		PlayerInfo_Race1, 
 		PlayerInfo_Class1, }) do
 		v.text:SetVertexColor(0/255, 112/255, 222/255)
 	end 
 elseif ( englishClass == "WARLOCK" ) then
  	 for i, v in pairs({ PlayerInfo_Name1, 
 		PlayerInfo_Level1, 
 		PlayerInfo_Race1, 
 		PlayerInfo_Class1, }) do
 		v.text:SetVertexColor(148/255, 130/255, 201/255)
 	end 
 elseif ( englishClass == "WARRIOR" ) then
  	 for i, v in pairs({ PlayerInfo_Name1, 
 		PlayerInfo_Level1, 
 		PlayerInfo_Race1, 
 		PlayerInfo_Class1, }) do
 		v.text:SetVertexColor(199/255, 156/255, 110/255)
 	end 
 else
 	return nil
 end
-- Faction
local PlayerInfo_Faction1 = CreateFrame("Frame", "$parentPlayerInfo_Faction1", AbyssUI_AFKCameraFrame)
local englishFaction, localizedFaction = UnitFactionGroup("player")
PlayerInfo_Faction1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Faction1:SetScale(3)
PlayerInfo_Faction1.text = PlayerInfo_Faction1.text or PlayerInfo_Faction1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Faction1.text:SetPoint("TOPRIGHT", 0, -50)
PlayerInfo_Faction1.text:SetText(localizedFaction)
-- Faction Color
 if ( englishFaction == "Horde" ) then
 	PlayerInfo_Faction1.text:SetVertexColor(196/255, 30/255, 59/255)
 elseif ( englishFaction == "Alliance" ) then
 	PlayerInfo_Faction1.text:SetVertexColor(0/255, 112/255, 222/255)
 elseif ( englishFaction == "Neutral" ) then
	PlayerInfo_Faction1.text:SetVertexColor(255/255, 255/255, 255/255)
 else
 	return nil
 end
 -- Gold Amount
local PlayerInfo_GoldAmount1 = CreateFrame("Frame", "$parentPlayerInfo_GoldAmount1", AbyssUI_AFKCameraFrame)
PlayerInfo_GoldAmount1:RegisterEvent("PLAYER_FLAGS_CHANGED")
PlayerInfo_GoldAmount1:RegisterEvent("PLAYER_ENTERING_WORLD")
local money = GetCoinTextureString(GetMoney())
PlayerInfo_GoldAmount1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_GoldAmount1:SetScale(2)
PlayerInfo_GoldAmount1.text = PlayerInfo_GoldAmount1.text or PlayerInfo_GoldAmount1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_GoldAmount1.text:SetPoint("BOTTOMLEFT", 0, 0)
PlayerInfo_GoldAmount1.text:SetText("  "..money)
-- ExtraInfoAFKMode
-- CLock
local ExtraInfo_Clock1 = CreateFrame("Frame", "$parentExtraInfo_Clock1", AbyssUI_AFKCameraFrame)
ExtraInfo_Clock1:SetAllPoints(AbyssUI_AFKCameraFrame)
ExtraInfo_Clock1:SetScale(3)
ExtraInfo_Clock1.text = ExtraInfo_Clock1.text or ExtraInfo_Clock1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
ExtraInfo_Clock1.text:SetPoint("BOTTOMRIGHT", 0, 0)
function ExtraInfo_Clock1:onUpdate(sinceLastUpdate)
	self.sinceLastUpdate = (self.sinceLastUpdate or 0) + sinceLastUpdate
	if ( self.sinceLastUpdate >= 5 ) then
		if ( AbyssUIAddonSettings.ExtraFunctionAmericanClock == true ) then
			local dataTime = date("%H:%M |cffffcc00%m/%d/%y|r ")
		else
			local dataTime = date("%H:%M |cffffcc00%d/%m/%y|r ")
		end
		ExtraInfo_Clock1.text:SetText(dataTime)
		self.sinceLastUpdate = 0
	end
end
ExtraInfo_Clock1:SetScript("OnUpdate", ExtraInfo_Clock1.onUpdate)
local function AbyssUI_UpdateAFKCameraData()
	-- Get
	playerName = UnitName("player")
	level = UnitLevel("player")
	race, raceEn = UnitRace("player")
	playerClass, englishClass = UnitClass("player")
	if ( AbyssUIAddonSettings.ExtraFunctionAmericanClock == true ) then
	 	dataTime = date("%H:%M |cffffcc00%m/%d/%y|r ")
	else
	 	dataTime = date("%H:%M |cffffcc00%d/%m/%y|r ")
	end
	englishFaction, localizedFaction = UnitFactionGroup("player")
	money = GetCoinTextureString(GetMoney())
	-- Set
	PlayerInfo_Name1.text:SetText(playerName)
	PlayerInfo_Level1.text:SetText(level)
	PlayerInfo_Race1.text:SetText(race)
	PlayerInfo_Class1.text:SetText(playerClass)
	ExtraInfo_Clock1.text:SetText(dataTime)
	PlayerInfo_Faction1.text:SetText(localizedFaction)
	PlayerInfo_GoldAmount1.text:SetText("  "..money)
end
-- AbyssUI_AFKCamera SetScript
AbyssUI_AFKCamera:SetScript("OnEvent", function(self, event, ...)
	local inInstance, instanceType = IsInInstance()
	if ( AbyssUIAddonSettings.AFKCammeraFrame ~= true ) then
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
	else
		return nil
	end
end)
--------------------------------------------
-- YouDied Frame
local AbyssUI_YouDiedFrame = CreateFrame("Frame", "$parentAbyssUI_YouDiedFrame", UIParent)
AbyssUI_YouDiedFrame:RegisterEvent("PLAYER_DEAD")
AbyssUI_YouDiedFrame:SetFrameStrata("HIGH")
AbyssUI_YouDiedFrame:SetWidth(GetScreenWidth())
AbyssUI_YouDiedFrame:SetHeight(GetScreenHeight()/4)
AbyssUI_YouDiedFrame:SetClampedToScreen(true)
AbyssUI_YouDiedFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
AbyssUI_YouDiedFrame.text = AbyssUI_YouDiedFrame.text or AbyssUI_YouDiedFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUI_YouDiedFrame.text:SetScale(10)
AbyssUI_YouDiedFrame.text:SetAllPoints(true)
AbyssUI_YouDiedFrame.text:SetJustifyH("CENTER")
AbyssUI_YouDiedFrame.text:SetJustifyV("CENTER")
AbyssUI_YouDiedFrame.text:SetText("|cff8b0000YOU DIED|r")
AbyssUI_YouDiedFrame.text:SetWidth(GetScreenWidth())
AbyssUI_YouDiedFrame.text:SetHeight(GetScreenHeight()/4)
AbyssUI_YouDiedFrame:Hide()
AbyssUI_YouDiedFrame:SetScript("OnEvent", function(self, event, ...)
	if ( AbyssUIAddonSettings.HideYouDiedLevelUpFrame ~= true ) then
		if ( event == "PLAYER_DEAD" ) then
			UIFrameFadeIn(AbyssUI_YouDiedFrame, 2, 0, 1)
			C_Timer.After(4, function()
				UIFrameFadeIn(AbyssUI_YouDiedFrame, 4, 1, 0)
			end)
			C_Timer.After(10, function()
				AbyssUI_YouDiedFrame:Hide()
			end)
		else
			return nil
		end
	else
		return nil
	end
end)
----------------------------------------------------
local AbyssUIBorder = AbyssUI_YouDiedFrame:CreateTexture(nil, "BACKGROUND")
AbyssUIBorder:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
AbyssUIBorder:SetPoint("TOPLEFT", -3, 3)
AbyssUIBorder:SetPoint("BOTTOMRIGHT", 3, -3)
AbyssUIBorder:SetVertexColor(0.6, 0.6, 0.6, 0.6)
----------------------------------------------------
local BorderBody = AbyssUI_YouDiedFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUI_YouDiedFrame)
BorderBody:SetVertexColor(0.6, 0.6, 0.6, 0.6)
----------------------------------------------------
local Texture = AbyssUI_YouDiedFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUI_YouDiedFrame)
AbyssUI_YouDiedFrame.texture = Texture
----------------------------------------------------
-- LevelUp Frame
local AbyssUI_LevelUpFrame = CreateFrame("Frame", "$parentAbyssUI_LevelUpFrame", UIParent)
AbyssUI_LevelUpFrame:SetFrameStrata("DIALOG")
AbyssUI_LevelUpFrame:SetWidth(GetScreenWidth())
AbyssUI_LevelUpFrame:SetHeight(GetScreenHeight()/4)
AbyssUI_LevelUpFrame:SetClampedToScreen(true)
AbyssUI_LevelUpFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
AbyssUI_LevelUpFrame.text = AbyssUI_LevelUpFrame.text or AbyssUI_LevelUpFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUI_LevelUpFrame.text:SetScale(6)
AbyssUI_LevelUpFrame.text:SetPoint("CENTER", 0, 5)
AbyssUI_LevelUpFrame.text:SetText("You've Reached")
AbyssUI_LevelUpFrame.text:SetWidth(GetScreenWidth())
AbyssUI_LevelUpFrame.text:SetHeight(GetScreenHeight()/4)
AbyssUI_LevelUpFrame:Hide()
----------------------------------------------------
local AbyssUIBorder = AbyssUI_LevelUpFrame:CreateTexture(nil, "BACKGROUND")
AbyssUIBorder:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
AbyssUIBorder:SetPoint("TOPLEFT", -3, 3)
AbyssUIBorder:SetPoint("BOTTOMRIGHT", 3, -3)
AbyssUIBorder:SetVertexColor(0.3, 0.3, 0.3, 0.3)
----------------------------------------------------
local BorderBody = AbyssUI_LevelUpFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUI_LevelUpFrame)
BorderBody:SetVertexColor(0.3, 0.3, 0.3, 0.3)
----------------------------------------------------
local Texture = AbyssUI_LevelUpFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUI_LevelUpFrame)
AbyssUI_LevelUpFrame.texture = Texture
----------------------------------------------------
-- Player Name/Level
local LevelUp_PlayerInfo = CreateFrame("Frame", "$parentLevelUp_PlayerLevel", AbyssUI_LevelUpFrame)
LevelUp_PlayerInfo:SetAllPoints(AbyssUI_LevelUpFrame)
LevelUp_PlayerInfo:SetScale(8)
LevelUp_PlayerInfo.text = LevelUp_PlayerInfo.text or LevelUp_PlayerInfo:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
LevelUp_PlayerInfo.text:SetPoint("CENTER", 0, -5)
LevelUp_PlayerInfo.text:SetText("|cfff2dc7fLevel|r ".."|cfff2dc7f"..level.."|r")
LevelUp_PlayerInfo.text:SetWidth(GetScreenWidth())
LevelUp_PlayerInfo.text:SetHeight(GetScreenHeight()/4)
local function AbyssUI_UpdateYouDiedLevelUpData()
	-- Get
	level = UnitLevel("player")
	-- Set
	LevelUp_PlayerInfo.text:SetText("|cfff2dc7fLevel|r ".."|cfff2dc7f"..level.."|r")
end
AbyssUI_LevelUpFrame:RegisterEvent("PLAYER_LEVEL_UP")
AbyssUI_LevelUpFrame:SetScript("OnEvent", function(self, event, ...)
	if ( AbyssUIAddonSettings.HideYouDiedLevelUpFrame ~= true ) then
		if ( event == "PLAYER_LEVEL_UP" ) then
			C_Timer.After(1, function()
				AbyssUI_UpdateYouDiedLevelUpData()
				UIFrameFadeIn(AbyssUI_LevelUpFrame, 2, 0, 1)
			end)
			C_Timer.After(3, function()
				UIFrameFadeIn(AbyssUI_LevelUpFrame, 4, 1, 0)
			end)
			C_Timer.After(10, function()
				AbyssUI_LevelUpFrame:Hide()
			end)
		else
			return nil
		end
	else
		return nil
	end
end)
-------------------------- Save and Extra Stuff --------------------------
-- AbyssUIFirstFrame
AbyssUIFirstFrame = CreateFrame("Frame", "$parentAbyssUIFirstFrame", UIParent)
AbyssUIFirstFrame:Hide()
AbyssUIFirstFrame:SetWidth(GetScreenWidth())
AbyssUIFirstFrame:SetHeight(GetScreenHeight())
AbyssUIFirstFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
AbyssUIFirstFrame:EnableMouse(true)
AbyssUIFirstFrame:SetFrameStrata("HIGH")
AbyssUIFirstFrame.text = AbyssUIFirstFrame.text or AbyssUIFirstFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUIFirstFrame.text:SetScale(5)
AbyssUIFirstFrame.text:SetAllPoints(true)
AbyssUIFirstFrame.text:SetJustifyH("CENTER")
AbyssUIFirstFrame.text:SetJustifyV("CENTER")
AbyssUIFirstFrame.text:SetText("Thank you for choosing Abyss|cff0d75d4UI|r!")
----------------------------------------------------
local Subtittle = CreateFrame("Frame", "$parentSubtittle", AbyssUIFirstFrame)
Subtittle:SetWidth(GetScreenWidth())
Subtittle:SetHeight(GetScreenHeight())
Subtittle:SetPoint("CENTER", AbyssUIFirstFrame, "CENTER", 0, -50)
Subtittle:EnableMouse(false)
Subtittle:SetFrameStrata("HIGH")
Subtittle.text = Subtittle.text or Subtittle:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
Subtittle.text:SetScale(3)
Subtittle.text:SetAllPoints(true)
Subtittle.text:SetJustifyH("CENTER")
Subtittle.text:SetJustifyV("CENTER")
Subtittle.text:SetText("The improved World of Warcraft user interface")
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
local CloseButton = CreateFrame("Button", "$parentFrameButton", AbyssUIFirstFrame, "UIPanelButtonTemplate")
CloseButton:SetHeight(40)
CloseButton:SetWidth(40)
CloseButton:SetPoint("TOPRIGHT", AbyssUIFirstFrame, "TOPRIGHT", 0, 0)
CloseButton:SetText("x")
CloseButton:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
----------------------------------------------------
local BorderCloseButton = CloseButton:CreateTexture(nil, "ARTWORK")
BorderCloseButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderCloseButton:SetAllPoints(CloseButton)
BorderCloseButton:SetVertexColor(0.34, 0.34, 0.34, 1)
CloseButton:SetScript("OnClick", function()
	AbyssUIFirstFrame:Hide()
	AbyssUISecondFrame:Show()
end)
----------------------------------------------------
local FrameButton = CreateFrame("Button", "$parentFrameButton", AbyssUIFirstFrame, "UIPanelButtonTemplate")
FrameButton:SetHeight(GetScreenHeight())
FrameButton:SetWidth(GetScreenWidth())
FrameButton:SetPoint("CENTER", AbyssUIFirstFrame, "CENTER", 0, 0)
FrameButton:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
FrameButton:SetAlpha(0)
FrameButton:SetScript("OnClick", function()
	UIFrameFadeIn(AbyssUIFirstFrame, 1, 1, 0)
	C_Timer.After(1, function()
		AbyssUIFirstFrame:Hide()
		UIFrameFadeIn(AbyssUISecondFrame, 1, 0, 1)
	end)
end)
----------------------------------------------------
-- AbyssUISecondFrame
AbyssUISecondFrame = CreateFrame("Frame", "$parentAbyssUIFirstFrame", UIParent)
AbyssUISecondFrame:Hide()
AbyssUISecondFrame:SetWidth(GetScreenWidth())
AbyssUISecondFrame:SetHeight(GetScreenHeight())
AbyssUISecondFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
AbyssUISecondFrame:EnableMouse(true)
AbyssUISecondFrame:SetFrameStrata("HIGH")
AbyssUISecondFrame.text = AbyssUISecondFrame.text or AbyssUISecondFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUISecondFrame.text:SetScale(2)
AbyssUISecondFrame.text:SetAllPoints(true)
AbyssUISecondFrame.text:SetJustifyH("CENTER")
AbyssUISecondFrame.text:SetJustifyV("CENTER")
AbyssUISecondFrame.text:SetText("First we need to save the variables"
.." of the interface for the first use of AbyssUI.\n\nYou can choose to configure by yourself (Confirm)"
.." or use the recommended settings (Recommended).\n\nIf you choose to configure,"
.." the game will reload and then you can go to the configuration panel by typing '/abyssui config'.\n\n"
.."If you choose the recommended settings, the UI will load the settings that are the mostly"
.." recommended to use.\nYou always can configure the interface the way you would like by"
.." typing /abyssui config in the chat.")
----------------------------------------------------
local AbyssUIBorder = AbyssUISecondFrame:CreateTexture(nil, "BACKGROUND")
AbyssUIBorder:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
AbyssUIBorder:SetPoint("TOPLEFT", -3, 3)
AbyssUIBorder:SetPoint("BOTTOMRIGHT", 3, -3)
AbyssUIBorder:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUISecondFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUISecondFrame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUISecondFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUISecondFrame)
AbyssUISecondFrame.texture = Texture
----------------------------------------------------
local FrameButton2 = CreateFrame("Button", "$parentFrameButton", AbyssUISecondFrame, "UIPanelButtonTemplate")
FrameButton2:SetHeight(40)
FrameButton2:SetWidth(120)
FrameButton2:SetPoint("CENTER", AbyssUISecondFrame, "CENTER", 100, -200)
FrameButton2:SetText("Recommended")
FrameButton2.GlowTexture = FrameButton2:CreateTexture(nil, "OVERLAY", "UIPanelButtonHighlightTexture")
FrameButton2.GlowTexture:SetAllPoints()
FrameButton2.GlowTexture:Hide()
FrameButton2.Glow = FrameButton2:CreateAnimationGroup()
FrameButton2.Glow:SetLooping("REPEAT")
local anim = FrameButton2.Glow:CreateAnimation("Alpha")
	anim:SetChildKey("GlowTexture")
	anim:SetOrder(1)
	anim:SetFromAlpha(0)
	anim:SetToAlpha(1)
	anim:SetDuration(0.5)
anim = FrameButton2.Glow:CreateAnimation("Alpha")
	anim:SetOrder(2)
	anim:SetChildKey("GlowTexture")
	anim:SetFromAlpha(1)
	anim:SetToAlpha(0)
	anim:SetDuration(0.5)
FrameButton2.Glow:SetScript("OnPlay", function(self)
		self:GetParent().GlowTexture:Show()
	end)
FrameButton2.Glow:SetScript("OnStop", function(self)
		self:GetParent().GlowTexture:Hide()
	end)
if not FrameButton2.running then
	FrameButton2.running = true
	FrameButton2.Glow:Play()
else
	FrameButton2.running = false
	FrameButton2.Glow:Stop()
end
----------------------------------------------------
local BorderButton = FrameButton2:CreateTexture(nil, "ARTWORK")
BorderButton:SetAllPoints(FrameButton2)
FrameButton2:SetScript("OnClick", function()
	-- Set
	for i, v in pairs {
		addonTable.CameraSmooth50,
		addonTable.InspectTarget,
		addonTable.AutoSellGray,
		addonTable.DisableHealingSpam,
		addonTable.InstanceLeave,
		addonTable.ConfirmPopUps,
		addonTable.PixelPerfect,
		addonTable.UnitFrameImproved,
	} do
	 	v:SetChecked(true)
	end
	-- Get
	AbyssUIAddonSettings.ExtraFunctionCameraSmooth50 = addonTable.CameraSmooth50:GetChecked()
	AbyssUIAddonSettings.ExtraFunctionInspectTarget = addonTable.InspectTarget:GetChecked()
	AbyssUIAddonSettings.ExtraFunctionSellGray = addonTable.AutoSellGray:GetChecked()
	AbyssUIAddonSettings.ExtraFunctionDisableHealingSpam = addonTable.DisableHealingSpam:GetChecked()
	AbyssUIAddonSettings.ExtraFunctionInstanceLeave = addonTable.InstanceLeave:GetChecked()
	AbyssUIAddonSettings.ExtraFunctionConfirmPopUps = addonTable.ConfirmPopUps:GetChecked()
	AbyssUIAddonSettings.ExtraFunctionPixelPerfect = addonTable.PixelPerfect:GetChecked()
	AbyssUIAddonSettings.UnitFrameImproved = addonTable.UnitFrameImproved:GetChecked()
	AbyssUISecondFrame:Hide()
	FrameButton2.Glow:Finish()
	ReloadUI()
end)
----------------------------------------------------
local FrameButton = CreateFrame("Button", "$parentFrameButton", AbyssUISecondFrame, "UIPanelButtonTemplate")
FrameButton:SetHeight(40)
FrameButton:SetWidth(120)
FrameButton:SetPoint("CENTER", AbyssUISecondFrame, "CENTER", -100, -200)
FrameButton:SetText("Confirm")
----------------------------------------------------
local BorderButton = FrameButton:CreateTexture(nil, "ARTWORK")
BorderButton:SetAllPoints(FrameButton)
FrameButton:SetScript("OnClick", function()
	AbyssUISecondFrame:Hide()
	FrameButton2.Glow:Finish()
	ReloadUI()
end)
----------------------------------------------------
local CloseButton = CreateFrame("Button", "$parentFrameButton", AbyssUISecondFrame, "UIPanelButtonTemplate")
CloseButton:SetHeight(40)
CloseButton:SetWidth(40)
CloseButton:SetPoint("TOPRIGHT", AbyssUISecondFrame, "TOPRIGHT", 0, 0)
CloseButton:SetText("x")
CloseButton:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
----------------------------------------------------
local BorderCloseButton = CloseButton:CreateTexture(nil, "ARTWORK")
BorderCloseButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderCloseButton:SetAllPoints(CloseButton)
BorderCloseButton:SetVertexColor(0.34, 0.34, 0.34, 1)
CloseButton:SetScript("OnClick", function()
	AbyssUISecondFrame:Hide()
	FrameButton2.Glow:Finish()
	ReloadUI()
end)
----------------------------------------------------
-- AbyssUI_ReloadFrame
AbyssUI_ReloadFrame = CreateFrame("Frame", "$parentAbyssUI_ReloadFrame", UIParent)
AbyssUI_ReloadFrame:Hide()
AbyssUI_ReloadFrame:SetWidth(400)
AbyssUI_ReloadFrame:SetHeight(150)
AbyssUI_ReloadFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, -100)
AbyssUI_ReloadFrame:EnableMouse(true)
AbyssUI_ReloadFrame:SetClampedToScreen(true)
AbyssUI_ReloadFrame:SetMovable(true)
AbyssUI_ReloadFrame:RegisterForDrag("LeftButton")
AbyssUI_ReloadFrame:SetScript("OnDragStart", AbyssUI_ReloadFrame.StartMoving)
AbyssUI_ReloadFrame:SetScript("OnDragStop", function(self)
  self:StopMovingOrSizing()
end)
AbyssUI_ReloadFrame:SetFrameStrata("Dialog")
AbyssUI_ReloadFrame.text = AbyssUI_ReloadFrame.text or AbyssUI_ReloadFrame:CreateFontString(nil,"ARTWORK","QuestMapRewardsFont")
AbyssUI_ReloadFrame.text:SetScale(1.5)
AbyssUI_ReloadFrame.text:SetAllPoints(true)
AbyssUI_ReloadFrame.text:SetJustifyH("CENTER")
AbyssUI_ReloadFrame.text:SetJustifyV("CENTER")
AbyssUI_ReloadFrame.text:SetText("A reload is necessary so this configuration can be save!\n"..
"Click the |cffffcc00'Confirm'|r button to Reload.\nYou still can make changes (do before you confirm).")
----------------------------------------------------
local Border = AbyssUI_ReloadFrame:CreateTexture(nil, "BACKGROUND")
Border:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Border:SetPoint("TOPLEFT", -3, 3)
Border:SetPoint("BOTTOMRIGHT", 3, -3)
Border:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUI_ReloadFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUI_ReloadFrame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUI_ReloadFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUI_ReloadFrame)
AbyssUI_ReloadFrame.texture = Texture
----------------------------------------------------
local FrameButtonConfirm = CreateFrame("Button","$parentFrameButtonConfirm", AbyssUI_ReloadFrame, "UIPanelButtonTemplate")
FrameButtonConfirm:SetHeight(24)
FrameButtonConfirm:SetWidth(70)
FrameButtonConfirm:SetPoint("BOTTOM", AbyssUI_ReloadFrame, "BOTTOM", 0, 10)
FrameButtonConfirm:SetText("Confirm")
FrameButtonConfirm:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
----------------------------------------------------
local BorderButton = FrameButtonConfirm:CreateTexture(nil, "ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButtonConfirm)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)
FrameButtonConfirm:SetScript("OnClick", function()
	AbyssUI_ReloadFrame:Hide()
	ReloadUI()
end)
----------------------------------------------------
-- AbyssUI_ReloadFrameFadeUI
AbyssUI_ReloadFrameFadeUI = CreateFrame("Frame", "$parentAbyssUI_ReloadFrameFadeUI", UIParent)
AbyssUI_ReloadFrameFadeUI:Hide()
AbyssUI_ReloadFrameFadeUI:SetWidth(500)
AbyssUI_ReloadFrameFadeUI:SetHeight(180)
AbyssUI_ReloadFrameFadeUI:SetPoint("CENTER", "UIParent", "CENTER", 0, -100)
AbyssUI_ReloadFrameFadeUI:EnableMouse(true)
AbyssUI_ReloadFrameFadeUI:SetClampedToScreen(true)
AbyssUI_ReloadFrameFadeUI:SetMovable(true)
AbyssUI_ReloadFrameFadeUI:RegisterForDrag("LeftButton")
AbyssUI_ReloadFrameFadeUI:SetScript("OnDragStart", AbyssUI_ReloadFrameFadeUI.StartMoving)
AbyssUI_ReloadFrameFadeUI:SetScript("OnDragStop", function(self)
  self:StopMovingOrSizing()
end)
AbyssUI_ReloadFrameFadeUI:SetFrameStrata("Dialog")
AbyssUI_ReloadFrameFadeUI.text = AbyssUI_ReloadFrameFadeUI.text or AbyssUI_ReloadFrameFadeUI:CreateFontString(nil,"ARTWORK","QuestMapRewardsFont")
AbyssUI_ReloadFrameFadeUI.text:SetScale(1.5)
AbyssUI_ReloadFrameFadeUI.text:SetAllPoints(true)
AbyssUI_ReloadFrameFadeUI.text:SetJustifyH("CENTER")
AbyssUI_ReloadFrameFadeUI.text:SetJustifyV("CENTER")
AbyssUI_ReloadFrameFadeUI.text:SetText("It will only hide Blizzard frames, addons have their"..
" own frames,\n a good addon probably has an option to hide while out of combat.\n"..
" I could have added the entire interface to be hidden,\n but that would prevent"..
" interaction with some frames (eg auction, loot, quest, frames).")
----------------------------------------------------
local Border = AbyssUI_ReloadFrameFadeUI:CreateTexture(nil, "BACKGROUND")
Border:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Border:SetPoint("TOPLEFT", -3, 3)
Border:SetPoint("BOTTOMRIGHT", 3, -3)
Border:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUI_ReloadFrameFadeUI:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUI_ReloadFrameFadeUI)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUI_ReloadFrameFadeUI:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUI_ReloadFrameFadeUI)
AbyssUI_ReloadFrameFadeUI.texture = Texture
----------------------------------------------------
local FrameButtonConfirm = CreateFrame("Button","$parentFrameButtonConfirm", AbyssUI_ReloadFrameFadeUI, "UIPanelButtonTemplate")
FrameButtonConfirm:SetHeight(24)
FrameButtonConfirm:SetWidth(70)
FrameButtonConfirm:SetPoint("BOTTOM", AbyssUI_ReloadFrameFadeUI, "BOTTOM", 0, 10)
FrameButtonConfirm:SetText("Confirm")
FrameButtonConfirm:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
----------------------------------------------------
local BorderButton = FrameButtonConfirm:CreateTexture(nil, "ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButtonConfirm)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)
FrameButtonConfirm:SetScript("OnClick", function()
	AbyssUI_ReloadFrameFadeUI:Hide()
	ReloadUI()
end)
----------------------------------------------------
-- AbyssUI_ActionBarCleaner
AbyssUI_ActionBarCleaner = CreateFrame("Frame", "$parentAbyssUI_ActionBarCleaner", UIParent)
AbyssUI_ActionBarCleaner:Hide()
AbyssUI_ActionBarCleaner:SetWidth(400)
AbyssUI_ActionBarCleaner:SetHeight(150)
AbyssUI_ActionBarCleaner:SetPoint("CENTER", "UIParent", "CENTER", 0, -100)
AbyssUI_ActionBarCleaner:EnableMouse(true)
AbyssUI_ActionBarCleaner:SetClampedToScreen(true)
AbyssUI_ActionBarCleaner:SetMovable(true)
AbyssUI_ActionBarCleaner:RegisterForDrag("LeftButton")
AbyssUI_ActionBarCleaner:SetScript("OnDragStart", AbyssUI_ActionBarCleaner.StartMoving)
AbyssUI_ActionBarCleaner:SetScript("OnDragStop", function(self)
  self:StopMovingOrSizing()
end)
AbyssUI_ActionBarCleaner:SetFrameStrata("Dialog")
AbyssUI_ActionBarCleaner.text = AbyssUI_ActionBarCleaner.text or AbyssUI_ActionBarCleaner:CreateFontString(nil,"ARTWORK","QuestMapRewardsFont")
AbyssUI_ActionBarCleaner.text:SetScale(1.5)
AbyssUI_ActionBarCleaner.text:SetAllPoints(true)
AbyssUI_ActionBarCleaner.text:SetJustifyH("CENTER")
AbyssUI_ActionBarCleaner.text:SetJustifyV("CENTER")
AbyssUI_ActionBarCleaner.text:SetText("Wait!\nThis will clean all your skills/spells from Actions Bars.")
----------------------------------------------------
local Border = AbyssUI_ActionBarCleaner:CreateTexture(nil, "BACKGROUND")
Border:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Border:SetPoint("TOPLEFT", -3, 3)
Border:SetPoint("BOTTOMRIGHT", 3, -3)
Border:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUI_ActionBarCleaner:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUI_ActionBarCleaner)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUI_ActionBarCleaner:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUI_ActionBarCleaner)
AbyssUI_ActionBarCleaner.texture = Texture
----------------------------------------------------
local FrameButtonConfirm = CreateFrame("Button","$parentFrameButtonConfirm", AbyssUI_ActionBarCleaner, "UIPanelButtonTemplate")
FrameButtonConfirm:SetHeight(24)
FrameButtonConfirm:SetWidth(70)
FrameButtonConfirm:SetPoint("BOTTOM", AbyssUI_ActionBarCleaner, "BOTTOM", -50, 10)
FrameButtonConfirm:SetText("Confirm")
FrameButtonConfirm:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
----------------------------------------------------
local FrameButtonCancel = CreateFrame("Button","$parentFrameButtonCancel", AbyssUI_ActionBarCleaner, "UIPanelButtonTemplate")
FrameButtonCancel:SetHeight(24)
FrameButtonCancel:SetWidth(70)
FrameButtonCancel:SetPoint("BOTTOM", AbyssUI_ActionBarCleaner, "BOTTOM", 50, 10)
FrameButtonCancel:SetText("Cancel")
FrameButtonCancel:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
----------------------------------------------------
local BorderButton = FrameButtonConfirm:CreateTexture(nil, "ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButtonConfirm)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)
FrameButtonConfirm:SetScript("OnClick", function()
	for i = 1, 120 do
		PickupAction(i) ClearCursor()
	end
	AbyssUI_ActionBarCleaner:Hide()
end)
----------------------------------------------------
local BorderButton = FrameButtonCancel:CreateTexture(nil, "ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButtonCancel)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)
FrameButtonCancel:SetScript("OnClick", function()
	AbyssUI_ActionBarCleaner:Hide()
end)
----------------------------------------------------
-- AbyssUI_ActionBarInfo
AbyssUI_ActionBarInfo = CreateFrame("Frame", "$parentAbyssUI_ActionBarInfo", UIParent)
AbyssUI_ActionBarInfo:Hide()
AbyssUI_ActionBarInfo:SetWidth(500)
AbyssUI_ActionBarInfo:SetHeight(160)
AbyssUI_ActionBarInfo:SetPoint("CENTER", "UIParent", "CENTER", 0, -100)
AbyssUI_ActionBarInfo:EnableMouse(true)
AbyssUI_ActionBarInfo:SetClampedToScreen(true)
AbyssUI_ActionBarInfo:SetMovable(true)
AbyssUI_ActionBarInfo:RegisterForDrag("LeftButton")
AbyssUI_ActionBarInfo:SetScript("OnDragStart", AbyssUI_ActionBarInfo.StartMoving)
AbyssUI_ActionBarInfo:SetScript("OnDragStop", function(self)
  self:StopMovingOrSizing()
end)
AbyssUI_ActionBarInfo:SetFrameStrata("Dialog")
AbyssUI_ActionBarInfo.text = AbyssUI_ActionBarInfo.text or AbyssUI_ActionBarInfo:CreateFontString(nil,"ARTWORK","QuestMapRewardsFont")
AbyssUI_ActionBarInfo.text:SetScale(1.5)
AbyssUI_ActionBarInfo.text:SetAllPoints(true)
AbyssUI_ActionBarInfo.text:SetJustifyH("CENTER")
AbyssUI_ActionBarInfo.text:SetJustifyV("CENTER")
AbyssUI_ActionBarInfo.text:SetText("You need to choose the small version of blizzard actionbar"..
" (Interface->ActionBars).\nThis new bar don't have keybind setup on it, also it can"..
" glitchy (rare to happen).")
----------------------------------------------------
local Border = AbyssUI_ActionBarInfo:CreateTexture(nil, "BACKGROUND")
Border:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Border:SetPoint("TOPLEFT", -3, 3)
Border:SetPoint("BOTTOMRIGHT", 3, -3)
Border:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUI_ActionBarInfo:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUI_ActionBarInfo)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUI_ActionBarInfo:CreateTexture(nil,"BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUI_ActionBarInfo)
AbyssUI_ActionBarInfo.texture = Texture
----------------------------------------------------
local FrameButtonReset = CreateFrame("Button","$parentFrameButtonReset", AbyssUI_ActionBarInfo, "UIPanelButtonTemplate")
FrameButtonReset:SetHeight(24)
FrameButtonReset:SetWidth(85)
FrameButtonReset:SetPoint("BOTTOM", AbyssUI_ActionBarInfo, "BOTTOM", 0, 10)
FrameButtonReset:SetText("Reload UI")
FrameButtonReset:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
----------------------------------------------------
local BorderButton = FrameButtonReset:CreateTexture(nil, "ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButtonReset)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)
FrameButtonReset:SetScript("OnClick", function()
	AbyssUI_ActionBarInfo:Hide()
	ReloadUI()
end)
----------------------------------------------------
-- AbyssUI_ColorPickerFrame
AbyssUI_ColorPickerFrame = CreateFrame("Frame", "$parentAbyssUI_ColorPickerFrame", UIParent)
AbyssUI_ColorPickerFrame:Hide()
AbyssUI_ColorPickerFrame:SetWidth(400)
AbyssUI_ColorPickerFrame:SetHeight(150)
AbyssUI_ColorPickerFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, -100)
AbyssUI_ColorPickerFrame:EnableMouse(true)
AbyssUI_ColorPickerFrame:SetClampedToScreen(true)
AbyssUI_ColorPickerFrame:SetMovable(true)
AbyssUI_ColorPickerFrame:RegisterForDrag("LeftButton")
AbyssUI_ColorPickerFrame:SetScript("OnDragStart", AbyssUI_ColorPickerFrame.StartMoving)
AbyssUI_ColorPickerFrame:SetScript("OnDragStop", function(self)
  self:StopMovingOrSizing()
end)
AbyssUI_ColorPickerFrame:SetFrameStrata("Dialog")
AbyssUI_ColorPickerFrame.text = AbyssUI_ColorPickerFrame.text or AbyssUI_ColorPickerFrame:CreateFontString(nil,"ARTWORK","QuestMapRewardsFont")
AbyssUI_ColorPickerFrame.text:SetScale(1.5)
AbyssUI_ColorPickerFrame.text:SetAllPoints(true)
AbyssUI_ColorPickerFrame.text:SetJustifyH("CENTER")
AbyssUI_ColorPickerFrame.text:SetJustifyV("CENTER")
AbyssUI_ColorPickerFrame.text:SetText("Choose a color by clicking on 'Choose a color', 'Okay' and then reload the UI.")
----------------------------------------------------
local Border = AbyssUI_ColorPickerFrame:CreateTexture(nil, "BACKGROUND")
Border:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Border:SetPoint("TOPLEFT", -3, 3)
Border:SetPoint("BOTTOMRIGHT", 3, -3)
Border:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUI_ColorPickerFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUI_ColorPickerFrame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUI_ColorPickerFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUI_ColorPickerFrame)
AbyssUI_ColorPickerFrame.texture = Texture
----------------------------------------------------
local FrameButtonColorPicker = CreateFrame("Button","$parentFrameButtonColorPicker", AbyssUI_ColorPickerFrame, "UIPanelButtonTemplate")
FrameButtonColorPicker:SetHeight(24)
FrameButtonColorPicker:SetWidth(120)
FrameButtonColorPicker:SetPoint("BOTTOM", AbyssUI_ColorPickerFrame, "BOTTOM", -50, 10)
FrameButtonColorPicker:SetText("Choose a Color")
FrameButtonColorPicker:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
----------------------------------------------------
local BorderButton = FrameButtonColorPicker:CreateTexture(nil, "ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButtonColorPicker)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)
FrameButtonColorPicker:SetScript("OnClick", function()
	AbyssUI_ShowColorPicker()
end)
----------------------------------------------------
local FrameButtonReset = CreateFrame("Button","$parentFrameButtonReset", AbyssUI_ColorPickerFrame, "UIPanelButtonTemplate")
FrameButtonReset:SetHeight(24)
FrameButtonReset:SetWidth(85)
FrameButtonReset:SetPoint("BOTTOM", AbyssUI_ColorPickerFrame, "BOTTOM", 50, 10)
FrameButtonReset:SetText("Reload UI")
FrameButtonReset:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
----------------------------------------------------
local BorderButton = FrameButtonReset:CreateTexture(nil, "ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButtonReset)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)
FrameButtonReset:SetScript("OnClick", function()
	AbyssUI_ColorPickerFrame:Hide()
	ReloadUI()
end)
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
				print("Thank you for choosing |cff0d75d4AbyssUI|r")
				print("The improved World of Warcraft user interface.")
			end)
			C_Timer.After(5, function()
				AbyssUIDailyInfo()
				C_Timer.After(1, function() 
					print("|cfff2dc7fTime since last login: |r" .. name .. " you were gone for |cffffcc00" .. SecondsToTime(elapsed) .. "|r")
					print("Type |cffffcc00/abyssui|r for a list of commands")
				end)
			end)
			AbyssUIFirstFrame:Hide()
		end
	elseif ( event == "PLAYER_LOGOUT" ) then
		AbyssUIProfile = time()
	end
end)
-- End
