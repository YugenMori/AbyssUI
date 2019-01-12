-- Author: Yugen
--
-- Battle for Azeroth
--
-- Hope you like my addOn ^^
--
-- Dark Minimalist UI for World of Warcraft
--------------------------------------------------------------------------------

-- AbyssUI_AFKCameraFrame
AbyssUI_AFKCameraFrame = CreateFrame("Frame", nil, UIParent)
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
AbyssUI_AFKCameraFrame.text:SetText("|cff0d75d4AbyssUI|r\nThe |cff5f545eDark|r Blizzard UI revamp.\nMove to leave AFK Mode ('W', 'D', 'A' or 'S').")
AbyssUI_AFKCameraFrame:Hide()
----------------------------------------------------
local AbyssUIBorder = AbyssUI_AFKCameraFrame:CreateTexture(nil, "BACKGROUND")
AbyssUIBorder:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
AbyssUIBorder:SetPoint("TOPLEFT", -3, 3)
AbyssUIBorder:SetPoint("BOTTOMRIGHT", 3, -3)
AbyssUIBorder:SetVertexColor(0.5, 0.5, 0.5, 0.5)
----------------------------------------------------
local BorderBody = AbyssUI_AFKCameraFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUI_AFKCameraFrame)
BorderBody:SetVertexColor(0.5, 0.5, 0.5, 0.5)
----------------------------------------------------
local Texture = AbyssUI_AFKCameraFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUI_AFKCameraFrame)
AbyssUI_AFKCameraFrame.texture = Texture
----------------------------------------------------

-- ModelFrameAFKMode
-- Model1
local AbyssUI_ModelFrameAFKMode = CreateFrame("Frame", nil, AbyssUI_AFKCameraFrame)
AbyssUI_ModelFrameAFKMode:SetPoint("TOPLEFT", 0, 0)
AbyssUI_ModelFrameAFKMode:SetWidth(512)
AbyssUI_ModelFrameAFKMode:SetHeight(512)
AbyssUI_ModelFrameAFKMode:SetAlpha(1)

local ModelFrame_Model1 = CreateFrame("PlayerModel", nil, AbyssUI_ModelFrameAFKMode)
ModelFrame_Model1:SetUnit("player")
ModelFrame_Model1:SetAlpha(1)
ModelFrame_Model1:SetAllPoints(AbyssUI_ModelFrameAFKMode)
ModelFrame_Model1:SetCustomCamera(1)
local x, y, z = ModelFrame_Model1:GetCameraPosition()
----------------------------------------------------
-- PlayerInfoAFKMode
-- Name
local PlayerInfo_Name1 = CreateFrame("Frame", nil, AbyssUI_AFKCameraFrame)
local playerName = UnitName("player")
PlayerInfo_Name1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Name1:SetScale(3)
PlayerInfo_Name1.text = PlayerInfo_Name1.text or PlayerInfo_Name1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Name1.text:SetPoint("TOPRIGHT", 0, -10)
PlayerInfo_Name1.text:SetText(playerName)
-- Level
local PlayerInfo_Level1 = CreateFrame("Frame", nil, AbyssUI_AFKCameraFrame)
local level = UnitLevel("player")
PlayerInfo_Level1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Level1:SetScale(3)
PlayerInfo_Level1.text = PlayerInfo_Level1.text or PlayerInfo_Level1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Level1.text:SetPoint("TOPRIGHT", 0, -20)
PlayerInfo_Level1.text:SetText(level)
-- Race
local PlayerInfo_Race1 = CreateFrame("Frame", nil, AbyssUI_AFKCameraFrame)
local race, raceEn = UnitRace("player")
PlayerInfo_Race1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Race1:SetScale(3)
PlayerInfo_Race1.text = PlayerInfo_Race1.text or PlayerInfo_Race1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Race1.text:SetPoint("TOPRIGHT", 0, -30)
PlayerInfo_Race1.text:SetText(raceEn)
-- Class
local PlayerInfo_Class1 = CreateFrame("Frame", nil, AbyssUI_AFKCameraFrame)
local playerClass, englishClass = UnitClass("player")
PlayerInfo_Class1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Class1:SetScale(3)
PlayerInfo_Class1.text = PlayerInfo_Class1.text or PlayerInfo_Class1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Class1.text:SetPoint("TOPRIGHT", 0, -40)
PlayerInfo_Class1.text:SetText(playerClass)
-- ExtraInfoAFKMode
-- CLock
local ExtraInfo_Clock1 = CreateFrame("Frame", nil, AbyssUI_AFKCameraFrame)
ExtraInfo_Clock1:SetAllPoints(AbyssUI_AFKCameraFrame)
ExtraInfo_Clock1:SetScale(3)
ExtraInfo_Clock1.text = ExtraInfo_Clock1.text or ExtraInfo_Clock1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
ExtraInfo_Clock1.text:SetPoint("BOTTOMRIGHT", 0, 0)
function ExtraInfo_Clock1:onUpdate(sinceLastUpdate)
	self.sinceLastUpdate = (self.sinceLastUpdate or 0) + sinceLastUpdate
	if ( self.sinceLastUpdate >= 5 ) then
		local dataTime = date("%H:%M |cffffcc00%m/%d/%y|r ")
		ExtraInfo_Clock1.text:SetText(dataTime)
		self.sinceLastUpdate = 0
	end
end
ExtraInfo_Clock1:SetScript("OnUpdate", ExtraInfo_Clock1.onUpdate)

function AbyssUI_UpdateAFKCameraData()
	-- Get
	playerName = UnitName("player")
	level = UnitLevel("player")
	race, raceEn = UnitRace("player")
	playerClass, englishClass = UnitClass("player")
	dataTime = date("%H:%M |cffffcc00%m/%d/%y|r ")
	-- Set
	PlayerInfo_Name1.text:SetText(playerName)
	PlayerInfo_Level1.text:SetText(level)
	PlayerInfo_Race1.text:SetText(raceEn)
	PlayerInfo_Class1.text:SetText(playerClass)
	ExtraInfo_Clock1.text:SetText(dataTime)
end

-- YouDied Frame
local AbyssUI_YouDiedFrame = CreateFrame("Frame", nil, UIParent)
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
AbyssUI_YouDiedFrame:Hide()
AbyssUI_YouDiedFrame:SetScript("OnEvent", function(self, event, ...)
	if ( AbyssUIAddonSettings.HideYouDiedLevelUpFrame ~= true ) then
		if ( event == "PLAYER_DEAD" ) then
			UIFrameFadeIn(AbyssUI_YouDiedFrame, 2, 0, 1)
			C_Timer.After(2, function()
				UIFrameFadeIn(AbyssUI_YouDiedFrame, 4, 1, 0)
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
local AbyssUI_LevelUpFrame = CreateFrame("Frame", nil, UIParent)
AbyssUI_LevelUpFrame:RegisterEvent("PLAYER_LEVEL_UP")
AbyssUI_LevelUpFrame:SetFrameStrata("HIGH")
AbyssUI_LevelUpFrame:SetWidth(GetScreenWidth())
AbyssUI_LevelUpFrame:SetHeight(GetScreenHeight()/4)
AbyssUI_LevelUpFrame:SetClampedToScreen(true)
AbyssUI_LevelUpFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
AbyssUI_LevelUpFrame.text = AbyssUI_LevelUpFrame.text or AbyssUI_LevelUpFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUI_LevelUpFrame.text:SetScale(8)
AbyssUI_LevelUpFrame.text:SetAllPoints(true)
AbyssUI_LevelUpFrame.text:SetJustifyH("CENTER")
AbyssUI_LevelUpFrame.text:SetJustifyV("CENTER")
AbyssUI_LevelUpFrame.text:SetText("|cfff2dc7fLevel Up|r")
AbyssUI_LevelUpFrame:Hide()
AbyssUI_LevelUpFrame:SetScript("OnEvent", function(self, event, ...)
	if ( AbyssUIAddonSettings.HideYouDiedLevelUpFrame ~= true ) then
		if ( event == "PLAYER_LEVEL_UP" ) then
			C_Timer.After(1, function()
				AbyssUI_UpdateYouDiedLevelUpData()
				UIFrameFadeIn(AbyssUI_LevelUpFrame, 2, 0, 1)
			end)
			C_Timer.After(2, function()
				UIFrameFadeIn(AbyssUI_LevelUpFrame, 4, 1, 0)
			end)
		else
			return nil
		end
	else
		return nil
	end
end)
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
-- Player Level
local LevelUp_PlayerLevel = CreateFrame("Frame", nil, AbyssUI_LevelUpFrame)
LevelUp_PlayerLevel:SetAllPoints(AbyssUI_LevelUpFrame)
LevelUp_PlayerLevel:SetScale(8)
LevelUp_PlayerLevel.text = LevelUp_PlayerLevel.text or LevelUp_PlayerLevel:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
LevelUp_PlayerLevel.text:SetPoint("CENTER", 0, -10)
LevelUp_PlayerLevel.text:SetText(level)
-- Player Nome
local LevelUp_PlayerName = CreateFrame("Frame", nil, AbyssUI_LevelUpFrame)
LevelUp_PlayerName:SetAllPoints(AbyssUI_LevelUpFrame)
LevelUp_PlayerName:SetScale(8)
LevelUp_PlayerName.text = LevelUp_PlayerName.text or LevelUp_PlayerName:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
LevelUp_PlayerName.text:SetPoint("CENTER", 0, 10)
LevelUp_PlayerName.text:SetText(playerName)

function AbyssUI_UpdateYouDiedLevelUpData()
	-- Get
	level = UnitLevel("player")
	playerName = UnitName("player")
	-- Set
	LevelUp_PlayerLevel.text:SetText(level)
	LevelUp_PlayerName.text:SetText(playerName)
end
-------------------------- Save and Extra Stuff --------------------------

-- AbyssUIFirstFrame
AbyssUIFirstFrame = CreateFrame("Frame", nil, UIParent)
AbyssUIFirstFrame:Hide()
AbyssUIFirstFrame:SetWidth(400)
AbyssUIFirstFrame:SetHeight(140)
AbyssUIFirstFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 200)
AbyssUIFirstFrame:EnableMouse(true)
AbyssUIFirstFrame:SetFrameStrata("HIGH")
AbyssUIFirstFrame.text = AbyssUIFirstFrame.text or AbyssUIFirstFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUIFirstFrame.text:SetScale(1.5)
AbyssUIFirstFrame.text:SetAllPoints(true)
AbyssUIFirstFrame.text:SetJustifyH("CENTER")
AbyssUIFirstFrame.text:SetJustifyV("CENTER")
AbyssUIFirstFrame.text:SetText("Thanks for using |cff0d75d4AbyssUI!|r\nThe |cff5f545eDark|r Blizzard UI revamp.\nCheck my other addons:\nEasyLeave, EasyConfirm and HideonCombat.\n|cffffcc00'Confirm'|r to ReloadUI")
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
FrameButton:SetText("Confirm")
FrameButton:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
----------------------------------------------------
local BorderButton = FrameButton:CreateTexture(nil, "ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButton)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)
FrameButton:SetScript("OnClick", function()
	AbyssUIFirstFrame:Hide()
	ReloadUI()
end)
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
				print("|cffa5f6f3Time since last login: |r" .. name .. " you leave for |cffffcc00" .. SecondsToTime(elapsed) .. "|r")
			end)
			AbyssUIFirstFrame:Hide()
		end
	elseif ( event == "PLAYER_LOGOUT" ) then
		AbyssUIProfile = time()
	end
end)

-- End