-- Author: Yugen
--
-- Battle for Azeroth
--
-- Hope you like my addOn ^^
--
-- Frames for AbyssUI
--------------------------------------------------------------------------------

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
AbyssUI_AFKCameraFrame.text:SetText("|cff0d75d4AbyssUI|r the |cff5f545eDark|r Blizzard UI revamp\nMove to leave AFK Mode")
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
-- AFK Camera Function
local AbyssUI_AFKCamera = CreateFrame("Frame", "$parentAbyssUI_AFKCamera", nil)
AbyssUI_AFKCamera:RegisterEvent("PLAYER_FLAGS_CHANGED")
AbyssUI_AFKCamera:RegisterEvent("PLAYER_ENTERING_WORLD")
----------------------------------------------------
-- ModelFrameAFKMode
-- Model1
local AbyssUI_ModelFrameAFKMode = CreateFrame("Frame", "$parentAbyssUI_ModelFrameAFKMode", AbyssUI_AFKCameraFrame)
AbyssUI_ModelFrameAFKMode:SetPoint("TOPLEFT", 0, 0)
AbyssUI_ModelFrameAFKMode:SetWidth(512)
AbyssUI_ModelFrameAFKMode:SetHeight(512)
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
		local dataTime = date("%H:%M |cffffcc00%d/%m/%y|r ")
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
	dataTime = date("%H:%M |cffffcc00%d/%m/%y|r ")
	-- Set
	PlayerInfo_Name1.text:SetText(playerName)
	PlayerInfo_Level1.text:SetText(level)
	PlayerInfo_Race1.text:SetText(race)
	PlayerInfo_Class1.text:SetText(playerClass)
	ExtraInfo_Clock1.text:SetText(dataTime)
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
AbyssUI_LevelUpFrame:RegisterEvent("PLAYER_LEVEL_UP")
AbyssUI_LevelUpFrame:SetFrameStrata("DIALOG")
AbyssUI_LevelUpFrame:SetWidth(GetScreenWidth())
AbyssUI_LevelUpFrame:SetHeight(GetScreenHeight()/4)
AbyssUI_LevelUpFrame:SetClampedToScreen(true)
AbyssUI_LevelUpFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
AbyssUI_LevelUpFrame.text = AbyssUI_LevelUpFrame.text or AbyssUI_LevelUpFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUI_LevelUpFrame.text:SetScale(6)
AbyssUI_LevelUpFrame.text:SetAllPoints(true)
AbyssUI_LevelUpFrame.text:SetJustifyH("CENTER")
AbyssUI_LevelUpFrame.text:SetJustifyV("CENTER")
AbyssUI_LevelUpFrame.text:SetText("|cfff2dc7fLevel UP|r")
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
-- Player Level
local LevelUp_PlayerLevel = CreateFrame("Frame", "$parentLevelUp_PlayerLevel", AbyssUI_LevelUpFrame)
LevelUp_PlayerLevel:SetAllPoints(AbyssUI_LevelUpFrame)
LevelUp_PlayerLevel:SetScale(6)
LevelUp_PlayerLevel.text = LevelUp_PlayerLevel.text or LevelUp_PlayerLevel:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
LevelUp_PlayerLevel.text:SetPoint("CENTER", 0, -10)
LevelUp_PlayerLevel.text:SetText(level)
LevelUp_PlayerLevel.text:SetWidth(GetScreenWidth())
LevelUp_PlayerLevel.text:SetHeight(GetScreenHeight()/4)
-- Player Nome
local LevelUp_PlayerName = CreateFrame("Frame", "$parentLevelUp_PlayerName", AbyssUI_LevelUpFrame)
LevelUp_PlayerName:SetAllPoints(AbyssUI_LevelUpFrame)
LevelUp_PlayerName:SetScale(6)
LevelUp_PlayerName.text = LevelUp_PlayerName.text or LevelUp_PlayerName:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
LevelUp_PlayerName.text:SetPoint("CENTER", 0, 10)
LevelUp_PlayerName.text:SetText(playerName)
LevelUp_PlayerName.text:SetWidth(GetScreenWidth())
LevelUp_PlayerName.text:SetHeight(GetScreenHeight()/4)
local function AbyssUI_UpdateYouDiedLevelUpData()
	-- Get
	level = UnitLevel("player")
	playerName = UnitName("player")
	-- Set
	LevelUp_PlayerLevel.text:SetText(level)
	LevelUp_PlayerName.text:SetText(playerName)
end
-- AbyssUI_LevelUpFrame Set Script
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
AbyssUIFirstFrame:SetWidth(350)
AbyssUIFirstFrame:SetHeight(120)
AbyssUIFirstFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 200)
AbyssUIFirstFrame:EnableMouse(true)
AbyssUIFirstFrame:SetFrameStrata("HIGH")
AbyssUIFirstFrame.text = AbyssUIFirstFrame.text or AbyssUIFirstFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUIFirstFrame.text:SetScale(1.5)
AbyssUIFirstFrame.text:SetAllPoints(true)
AbyssUIFirstFrame.text:SetJustifyH("CENTER")
AbyssUIFirstFrame.text:SetJustifyV("CENTER")
AbyssUIFirstFrame.text:SetText("Thanks for using |cff0d75d4AbyssUI!|r\nThe |cff5f545eDark|r Blizzard UI revamp.\n|cffffcc00'Confirm'|r to ReloadUI")
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
local FrameButton = CreateFrame("Button", "$parentFrameButton", AbyssUIFirstFrame, "UIPanelButtonTemplate")
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
AbyssUI_ReloadFrame.text:SetText("A reload is necessary so this configuration can be save!\nClick the |cffffcc00'Confirm'|r button to Reload.\nYou still can make changes (do before you confirm).")
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
AbyssUI_ActionBarInfo.text:SetText("This option is for the small version of Blizzard MainBar\nGo to: Esc> Interface> ActionBar\nCheck: Bottom Left Bar, Right Bar 1 and 2.\nAbyss|cff0d75d4UI|r Actionbar glitchs sometimes, reload the UI and it will be fixed (mostly of the times).\nCheck the comments section for more info.")
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
