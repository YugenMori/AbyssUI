-- Author: Yugen
--
-- Shadowlands
--
-- Frames for AbyssUI
--------------------------------------------------------------
local addonName, addonTable = ...
local _G = _G
local move = _G["BINDING_NAME_MOVEFORWARD"]
----------------------------------------------------
local AbyssUI_AFKCameraFrame = CreateFrame("Frame", "$parentAbyssUI_AFKCameraFrame", WorldFrame)
AbyssUI_AFKCameraFrame:SetFrameStrata("HIGH")
AbyssUI_AFKCameraFrame:SetScale(UIParent:GetScale())
AbyssUI_AFKCameraFrame:SetAllPoints(UIParent)
AbyssUI_AFKCameraFrame:SetClampedToScreen(true)
AbyssUI_AFKCameraFrame:Hide()
----------------------------------------------------
local AbyssUIBorder = AbyssUI_AFKCameraFrame:CreateTexture(nil, "BACKGROUND")
AbyssUIBorder:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
AbyssUIBorder:SetPoint("TOPLEFT", -3, 3)
AbyssUIBorder:SetPoint("BOTTOMRIGHT", 3, -3)
AbyssUIBorder:SetVertexColor(0.9, 0.9, 0.9, 0.9)
----------------------------------------------------
-- Text
AbyssUI_AFKCameraFrame.text = AbyssUI_AFKCameraFrame.text or AbyssUI_AFKCameraFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUI_AFKCameraFrame.text:SetScale(3)
AbyssUI_AFKCameraFrame.text:SetAllPoints(true)
AbyssUI_AFKCameraFrame.text:SetJustifyH("BOTTOM")
AbyssUI_AFKCameraFrame.text:SetJustifyV("BOTTOM")
AbyssUI_AFKCameraFrame.text:SetWidth(GetScreenWidth()/4)
AbyssUI_AFKCameraFrame.text:SetHeight(GetScreenHeight()/2)
AbyssUI_AFKCameraFrame.text:SetText(move)
-- Texture
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
AbyssUI_ModelFrameAFKMode:SetPoint("BOTTOMRIGHT", 5, 5)
AbyssUI_ModelFrameAFKMode:SetWidth(CharacterModelFrame:GetWidth()*2)
AbyssUI_ModelFrameAFKMode:SetHeight(CharacterModelFrame:GetHeight()*2)
AbyssUI_ModelFrameAFKMode:SetAlpha(1)
local ModelFrame_Model1 = CreateFrame("PlayerModel", "$parentModelFrame_Model1", AbyssUI_ModelFrameAFKMode)
ModelFrame_Model1:SetUnit("player")
ModelFrame_Model1:SetAlpha(1)
ModelFrame_Model1:SetAllPoints(AbyssUI_ModelFrameAFKMode)
ModelFrame_Model1:SetCustomCamera(1)
--local x, y, z = ModelFrame_Model1:GetCameraPosition()
--[[
local AnimationsSequence = { 5, 60, 67, 96, }
local Animations = #AnimationsSequence
ModelFrame_Model1:SetAnimation(AnimationsSequence[random(1, Animations)])
--]]
----------------------------------------------------
-- PlayerInfoAFKMode
-- Name
local PlayerInfo_Name1 = CreateFrame("Frame", "$parentPlayerInfo_Name1", AbyssUI_AFKCameraFrame)
local playerName = UnitName("player")
PlayerInfo_Name1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Name1:SetScale(4)
PlayerInfo_Name1.text = PlayerInfo_Name1.text or PlayerInfo_Name1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Name1.text:SetPoint("TOP", 0, -1)
PlayerInfo_Name1.text:SetText(playerName)
--
-- Title
local PlayerInfo_Title1 = CreateFrame("Frame", "$parentPlayerInfo_Title1", AbyssUI_AFKCameraFrame)
local titleId = GetCurrentTitle() 
local titleName = GetTitleName(titleId)
PlayerInfo_Title1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Title1:SetScale(2)
PlayerInfo_Title1.text = PlayerInfo_Title1.text or PlayerInfo_Title1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Title1.text:SetPoint("TOP", 0, -21)
PlayerInfo_Title1.text:SetText(titleName)

-- Race
local PlayerInfo_Race1 = CreateFrame("Frame", "$parentPlayerInfo_Race1", AbyssUI_AFKCameraFrame)
local race, raceEn = UnitRace("player")
PlayerInfo_Race1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Race1:SetScale(3)
PlayerInfo_Race1.text = PlayerInfo_Race1.text or PlayerInfo_Race1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Race1.text:SetPoint("BOTTOMLEFT", 5, 100)
PlayerInfo_Race1.text:SetText(raceEn)
-- Class
local PlayerInfo_Class1 = CreateFrame("Frame", "$parentPlayerInfo_Class1", AbyssUI_AFKCameraFrame)
local playerClass, englishClass = UnitClass("player")
PlayerInfo_Class1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Class1:SetScale(3)
PlayerInfo_Class1.text = PlayerInfo_Class1.text or PlayerInfo_Class1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Class1.text:SetPoint("BOTTOMLEFT", 5, 90)
PlayerInfo_Class1.text:SetText(playerClass)
-- Current Specialization
local PlayerInfo_CurrentSpec1 = CreateFrame("Frame", "$parentPlayerInfo_CurrentSpec1", AbyssUI_AFKCameraFrame)
local currentSpec = GetSpecialization()
local currentSpecName = currentSpec and select(2, GetSpecializationInfo(currentSpec)) or "None"
PlayerInfo_CurrentSpec1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_CurrentSpec1:SetScale(3)
PlayerInfo_CurrentSpec1.text = PlayerInfo_CurrentSpec1.text or PlayerInfo_CurrentSpec1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_CurrentSpec1.text:SetPoint("BOTTOMLEFT", 5, 80)
PlayerInfo_CurrentSpec1.text:SetText(currentSpecName)
-- Level
local PlayerInfo_Level1 = CreateFrame("Frame", "$parentPlayerInfo_Level1", AbyssUI_AFKCameraFrame)
local level = UnitLevel("player")
PlayerInfo_Level1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Level1:SetScale(3)
PlayerInfo_Level1.text = PlayerInfo_Level1.text or PlayerInfo_Level1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Level1.text:SetPoint("BOTTOMLEFT", 5, 70)
PlayerInfo_Level1.text:SetText("Level: "..level)
-- Honor Level
local PlayerInfo_Honor1 = CreateFrame("Frame", "$parentPlayerInfo_Honor1", AbyssUI_AFKCameraFrame)
local HonorLevel = UnitHonorLevel("player")
PlayerInfo_Honor1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Honor1:SetScale(3)
PlayerInfo_Honor1.text = PlayerInfo_Honor1.text or PlayerInfo_Honor1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Honor1.text:SetPoint("BOTTOMLEFT", 5, 60)
PlayerInfo_Honor1.text:SetText("Honor: "..HonorLevel)
-- Item Level
local PlayerInfo_ILevel1 = CreateFrame("Frame", "$parentPlayerInfo_ILevel1", AbyssUI_AFKCameraFrame)
local overall, equipped = GetAverageItemLevel()
PlayerInfo_ILevel1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_ILevel1:SetScale(3)
PlayerInfo_ILevel1.text = PlayerInfo_ILevel1.text or PlayerInfo_ILevel1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_ILevel1.text:SetPoint("BOTTOMLEFT", 5, 50)
PlayerInfo_ILevel1.text:SetText("ILevel: "..floor(overall + 0.5))
-- Zone
local PlayerInfo_CurrentZone1 = CreateFrame("Frame", "$parentPlayerInfo_CurrentZone1", AbyssUI_AFKCameraFrame)
local zoneName = GetZoneText()
PlayerInfo_CurrentZone1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_CurrentZone1:SetScale(3)
PlayerInfo_CurrentZone1.text = PlayerInfo_CurrentZone1.text or PlayerInfo_CurrentZone1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_CurrentZone1.text:SetPoint("BOTTOMLEFT", 5, 40)
PlayerInfo_CurrentZone1.text:SetText(zoneName)
-- Guild Info
local PlayerInfo_Guild1 = CreateFrame("Frame", "$parentPlayerInfo_Guild1", AbyssUI_AFKCameraFrame)
local guildName, guildRankName, guildRankIndex = GetGuildInfo("player")
PlayerInfo_Guild1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Guild1:SetScale(3)
PlayerInfo_Guild1.text = PlayerInfo_Guild1.text or PlayerInfo_Guild1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Guild1.text:SetPoint("BOTTOMLEFT", 5, 30)
PlayerInfo_Guild1.text:SetText(guildName)
-- CLock
local ExtraInfo_Clock1 = CreateFrame("Frame", "$parentExtraInfo_Clock1", AbyssUI_AFKCameraFrame)
ExtraInfo_Clock1:SetAllPoints(AbyssUI_AFKCameraFrame)
ExtraInfo_Clock1:SetScale(3)
ExtraInfo_Clock1.text = ExtraInfo_Clock1.text or ExtraInfo_Clock1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
ExtraInfo_Clock1.text:SetPoint("TOPRIGHT", -5, -1)
-- Faction
local englishFaction, localizedFaction = UnitFactionGroup("player")
local ExtraInfo_Faction1 = CreateFrame("Frame", "$parentExtraInfo_Faction1", AbyssUI_AFKCameraFrame)
ExtraInfo_Faction1:SetWidth(64)
ExtraInfo_Faction1:SetHeight(64)
ExtraInfo_Faction1:SetPoint("TOPLEFT", 5, -5)
ExtraInfo_Faction1:SetScale(3)
local t = ExtraInfo_Faction1:CreateTexture(nil, "HIGH")
	if ( englishFaction == "Horde" ) then
		t:SetTexture("Interface\\AddOns\\AbyssUI\\Textures\\extra\\Horde-Logo")
	else
		t:SetTexture("Interface\\AddOns\\AbyssUI\\Textures\\extra\\Alliance-Logo")
	end
t:SetAllPoints(ExtraInfo_Faction1)
-- Gold Amount
local _G = _G
local currency = _G["MONEY"]
local PlayerInfo_GoldAmount1 = CreateFrame("Frame", "$parentPlayerInfo_GoldAmount1", AbyssUI_AFKCameraFrame)
PlayerInfo_GoldAmount1:RegisterEvent("PLAYER_FLAGS_CHANGED")
PlayerInfo_GoldAmount1:RegisterEvent("PLAYER_ENTERING_WORLD")
local money = GetCoinTextureString(GetMoney())
PlayerInfo_GoldAmount1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_GoldAmount1:SetScale(3)
PlayerInfo_GoldAmount1.text = PlayerInfo_GoldAmount1.text or PlayerInfo_GoldAmount1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_GoldAmount1.text:SetPoint("BOTTOMLEFT", 5 , 1)
PlayerInfo_GoldAmount1.text:SetText(currency.."|cfff2dc7f"..money.."|r")
-- Class colorization (all player info)
if ( englishClass == "DEATHKNIGHT" ) then
	for i, v in pairs({
		AbyssUI_AFKCameraFrame, 
		PlayerInfo_Name1,
		PlayerInfo_Title1, 
		PlayerInfo_Level1, 
		PlayerInfo_Race1, 
		PlayerInfo_Class1,
		PlayerInfo_Honor1,
		PlayerInfo_ILevel1,
		PlayerInfo_CurrentSpec1,
		PlayerInfo_CurrentZone1,
		PlayerInfo_Guild1,
		ExtraInfo_Clock1,
	PlayerInfo_GoldAmount1 }) do
		v.text:SetVertexColor(196/255, 30/255, 59/255)
	end 
elseif ( englishClass == "DEMONHUNTER" ) then
	for i, v in pairs({ 
		AbyssUI_AFKCameraFrame, 
		PlayerInfo_Name1,
		PlayerInfo_Title1,
		PlayerInfo_Level1, 
		PlayerInfo_Race1, 
		PlayerInfo_Class1,
		PlayerInfo_Honor1,
		PlayerInfo_ILevel1,
		PlayerInfo_CurrentSpec1,
		PlayerInfo_CurrentZone1,
		PlayerInfo_Guild1,
		ExtraInfo_Clock1,
	PlayerInfo_GoldAmount1 }) do
		v.text:SetVertexColor(163/255, 48/255, 201/255)
	end 
elseif ( englishClass == "DRUID" ) then
	for i, v in pairs({ 
		AbyssUI_AFKCameraFrame, 
		PlayerInfo_Name1,
		PlayerInfo_Title1,
		PlayerInfo_Level1, 
		PlayerInfo_Race1, 
		PlayerInfo_Class1,
		PlayerInfo_Honor1,
		PlayerInfo_ILevel1,
		PlayerInfo_CurrentSpec1,
		PlayerInfo_CurrentZone1,
		PlayerInfo_Guild1,
		ExtraInfo_Clock1,
	PlayerInfo_GoldAmount1 }) do
		v.text:SetVertexColor(255/255, 125/255, 10/255)
	end 
elseif ( englishClass == "HUNTER" ) then
	for i, v in pairs({ 
		AbyssUI_AFKCameraFrame,
		PlayerInfo_Name1,
		PlayerInfo_Title1,
		PlayerInfo_Level1, 
		PlayerInfo_Race1, 
		PlayerInfo_Class1,
		PlayerInfo_Honor1,
		PlayerInfo_ILevel1,
		PlayerInfo_CurrentSpec1,
		PlayerInfo_CurrentZone1,
		PlayerInfo_Guild1,
		ExtraInfo_Clock1,
	PlayerInfo_GoldAmount1 }) do
		v.text:SetVertexColor(171/255, 212/255, 115/255)
	end 
elseif ( englishClass == "MAGE" ) then
	for i, v in pairs({ 
		AbyssUI_AFKCameraFrame,
		PlayerInfo_Name1,
		PlayerInfo_Title1,
		PlayerInfo_Level1, 
		PlayerInfo_Race1, 
		PlayerInfo_Class1,
		PlayerInfo_Honor1,
		PlayerInfo_ILevel1,
		PlayerInfo_CurrentSpec1,
		PlayerInfo_CurrentZone1,
		PlayerInfo_Guild1,
		ExtraInfo_Clock1,
	PlayerInfo_GoldAmount1 }) do
		v.text:SetVertexColor(105/255, 204/255, 240/255)
	end 
elseif ( englishClass == "MONK" ) then
	for i, v in pairs({ 
		AbyssUI_AFKCameraFrame,
		PlayerInfo_Name1,
		PlayerInfo_Title1, 
		PlayerInfo_Level1, 
		PlayerInfo_Race1, 
		PlayerInfo_Class1,
		PlayerInfo_Honor1,
		PlayerInfo_ILevel1,
		PlayerInfo_CurrentSpec1,
		PlayerInfo_CurrentZone1,
		PlayerInfo_Guild1,
		ExtraInfo_Clock1,
	PlayerInfo_GoldAmount1 }) do
		v.text:SetVertexColor(0/255, 255/255, 150/255)
	end 
elseif ( englishClass == "PALADIN" ) then
	for i, v in pairs({ 
		AbyssUI_AFKCameraFrame,
		PlayerInfo_Name1,
		PlayerInfo_Title1, 
		PlayerInfo_Level1, 
		PlayerInfo_Race1, 
		PlayerInfo_Class1,
		PlayerInfo_Honor1,
		PlayerInfo_ILevel1,
		PlayerInfo_CurrentSpec1,
		PlayerInfo_CurrentZone1,
		PlayerInfo_Guild1,
		ExtraInfo_Clock1,
	PlayerInfo_GoldAmount1 }) do
		v.text:SetVertexColor(245/255, 140/255, 186/255)
	end 
elseif ( englishClass == "PRIEST" ) then
	for i, v in pairs({ 
		AbyssUI_AFKCameraFrame,
		PlayerInfo_Name1,
		PlayerInfo_Title1, 
		PlayerInfo_Level1, 
		PlayerInfo_Race1, 
		PlayerInfo_Class1,
		PlayerInfo_Honor1,
		PlayerInfo_ILevel1,
		PlayerInfo_CurrentSpec1,
		PlayerInfo_CurrentZone1,
		PlayerInfo_Guild1,
		ExtraInfo_Clock1,
	PlayerInfo_GoldAmount1 }) do
		v.text:SetVertexColor(255/255, 255/255, 255/255)
	end 
elseif ( englishClass == "ROGUE" ) then
	for i, v in pairs({
		AbyssUI_AFKCameraFrame,
		PlayerInfo_Name1,
		PlayerInfo_Title1, 
		PlayerInfo_Level1, 
		PlayerInfo_Race1, 
		PlayerInfo_Class1,
		PlayerInfo_Honor1,
		PlayerInfo_ILevel1,
		PlayerInfo_CurrentSpec1,
		PlayerInfo_CurrentZone1,
		PlayerInfo_Guild1,
		ExtraInfo_Clock1,
	PlayerInfo_GoldAmount1 }) do
		v.text:SetVertexColor(255/255, 245/255, 105/255)
	end 
elseif ( englishClass == "SHAMAN" ) then
	for i, v in pairs({ 
		AbyssUI_AFKCameraFrame,
		PlayerInfo_Name1,
		PlayerInfo_Title1, 
		PlayerInfo_Level1, 
		PlayerInfo_Race1, 
		PlayerInfo_Class1,
		PlayerInfo_Honor1,
		PlayerInfo_ILevel1,
		PlayerInfo_CurrentSpec1,
		PlayerInfo_CurrentZone1,
		PlayerInfo_Guild1,
		ExtraInfo_Clock1,
	PlayerInfo_GoldAmount1 }) do
		v.text:SetVertexColor(0/255, 112/255, 222/255)
	end 
elseif ( englishClass == "WARLOCK" ) then
	for i, v in pairs({ 
		AbyssUI_AFKCameraFrame,
		PlayerInfo_Name1,
		PlayerInfo_Title1,
		PlayerInfo_Level1, 
		PlayerInfo_Race1, 
		PlayerInfo_Class1,
		PlayerInfo_Honor1,
		PlayerInfo_ILevel1,
		PlayerInfo_CurrentSpec1,
		PlayerInfo_CurrentZone1,
		PlayerInfo_Guild1,
		ExtraInfo_Clock1,
	PlayerInfo_GoldAmount1 }) do
		v.text:SetVertexColor(148/255, 130/255, 201/255)
	end 
elseif ( englishClass == "WARRIOR" ) then
	for i, v in pairs({ 
		AbyssUI_AFKCameraFrame,
		PlayerInfo_Name1,
		PlayerInfo_Title1,
		PlayerInfo_Level1, 
		PlayerInfo_Race1, 
		PlayerInfo_Class1,
		PlayerInfo_Honor1,
		PlayerInfo_ILevel1,
		PlayerInfo_CurrentSpec1,
		PlayerInfo_CurrentZone1,
		PlayerInfo_Guild1,
		ExtraInfo_Clock1,
	PlayerInfo_GoldAmount1 }) do
		v.text:SetVertexColor(199/255, 156/255, 110/255)
	end 
else
	return nil
end
local function AbyssUI_UpdateAFKCameraData()
	-- Get
	playerName = UnitName("player")
	titleId = GetCurrentTitle() 
	titleName = GetTitleName(titleId)
	level = UnitLevel("player")
	race, raceEn = UnitRace("player")
	playerClass, englishClass = UnitClass("player")
	HonorLevel = UnitHonorLevel("player")
	overall, equipped = GetAverageItemLevel()
	currentSpec = GetSpecialization()
	currentSpecName = currentSpec and select(2, GetSpecializationInfo(currentSpec)) or "None"
	zoneName = GetZoneText()
	guildName, guildRankName, guildRankIndex = GetGuildInfo("player")
	if ( AbyssUIAddonSettings.ExtraFunctionAmericanClock == true ) then
		dataTime = date("%H:%M |cfff2dc7f%m/%d/%y|r ")
	else
		dataTime = date("%H:%M |cfff2dc7f%d/%m/%y|r ")
	end
	englishFaction, localizedFaction = UnitFactionGroup("player")
	money = GetCoinTextureString(GetMoney())
	-- Set
	PlayerInfo_Name1.text:SetText(playerName)
	PlayerInfo_Title1.text:SetText(titleName)
	PlayerInfo_Level1.text:SetText("Level: "..level)
	PlayerInfo_Race1.text:SetText(race)
	PlayerInfo_Class1.text:SetText(playerClass)
	ExtraInfo_Clock1.text:SetText(dataTime)
	PlayerInfo_Honor1.text:SetText("Honor: "..HonorLevel)
	PlayerInfo_ILevel1.text:SetText("ILvl: "..floor(overall + 0.5))
	PlayerInfo_GoldAmount1.text:SetText(currency..": |cfff2dc7f"..money.."|r")
	PlayerInfo_CurrentSpec1.text:SetText(currentSpecName)
	PlayerInfo_CurrentZone1.text:SetText(zoneName)
	PlayerInfo_Guild1.text:SetText(guildName)
end
-- Clock Update
local timer = ExtraInfo_Clock1:CreateAnimationGroup()
local timerAnim = timer:CreateAnimation()
timerAnim:SetDuration(5) -- how often you want it to finish
timer:SetScript("OnFinished", function(self, requested)
	-- requested = true if you used timer:Stop(), false if it finished naturally
	AbyssUI_UpdateAFKCameraData()
	self:Play() -- start it over again
end)
timer:Play()
----------------------------------------------------
-- AbyssUI_AFKCamera SetScript
AbyssUI_AFKCamera:SetScript("OnEvent", function(self, event, ...)
	local inInstance, instanceType = IsInInstance()
	if ( AbyssUIAddonSettings.AFKCammeraFrame ~= true ) then
		if ( event == "PLAYER_FLAGS_CHANGED" or event == "PLAYER_ENTERING_WORLD" ) then
			local isAFK = UnitIsAFK("player")
			if isAFK == true and inInstance ~= true then
				UIParent:SetAlpha(0)
				if AbyssUIAddonSettings.HideMinimap ~= true then
					MinimapCluster:Hide()
				end
				AbyssUI_UpdateAFKCameraData()
				UIFrameFadeIn(AbyssUI_AFKCameraFrame, 3, 0, 1)
			elseif isAFK == false and inInstance ~= true then
				AbyssUI_AFKCameraFrame:Hide()
				UIParent:SetAlpha(1)
				if AbyssUIAddonSettings.HideMinimap ~= true then
					MinimapCluster:Show()
				end
			elseif isAFK == true and inInstance == true then
				AbyssUI_AFKCameraFrame:Hide()
				UIParent:SetAlpha(1)
				if AbyssUIAddonSettings.HideMinimap ~= true then
					MinimapCluster:Show()
				end
			elseif isAFK == false and inInstance == true then
				AbyssUI_AFKCameraFrame:Hide()
				UIParent:SetAlpha(1)
				if AbyssUIAddonSettings.HideMinimap ~= true then
					MinimapCluster:Show()
				end
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
local _G = _G
local deathrecap = _G["DEAD"]
local AbyssUI_YouDiedFrame = CreateFrame("Frame", "$parentAbyssUI_YouDiedFrame", UIParent)
AbyssUI_YouDiedFrame:RegisterEvent("PLAYER_DEAD")
AbyssUI_YouDiedFrame:SetFrameStrata("DIALOG")
AbyssUI_YouDiedFrame:SetWidth(GetScreenWidth())
AbyssUI_YouDiedFrame:SetHeight(GetScreenHeight()/4)
AbyssUI_YouDiedFrame:SetClampedToScreen(true)
AbyssUI_YouDiedFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
AbyssUI_YouDiedFrame.text = AbyssUI_YouDiedFrame.text or AbyssUI_YouDiedFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUI_YouDiedFrame.text:SetScale(8*2)
AbyssUI_YouDiedFrame.text:SetAllPoints(true)
AbyssUI_YouDiedFrame.text:SetJustifyH("CENTER")
AbyssUI_YouDiedFrame.text:SetJustifyV("CENTER")
AbyssUI_YouDiedFrame.text:SetText(strupper("|cff8b0000"..deathrecap.."|r"))
AbyssUI_YouDiedFrame.text:SetWidth(GetScreenWidth())
AbyssUI_YouDiedFrame.text:SetHeight(GetScreenHeight()/4)
AbyssUI_YouDiedFrame:Hide()
AbyssUI_YouDiedFrame:SetScript("OnEvent", function(self, event, ...)
	if ( AbyssUIAddonSettings.HideYouDiedLevelUpFrame ~= true ) then
		if ( event == "PLAYER_DEAD" ) then
			AbyssUI_YouDiedFrame.text:SetText(strupper("|cff8b0000"..deathrecap.."|r"))
			UIFrameFadeIn(AbyssUI_YouDiedFrame, 2, 0, 1)
			C_Timer.After(4, function()
				UIFrameFadeIn(AbyssUI_YouDiedFrame, 4, 1, 0)
			end)
			C_Timer.After(10, function()
				AbyssUI_YouDiedFrame:Hide()
			end)
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
local _G = _G
local levelup_reached = _G["LEVEL_UP_YOU_REACHED"]
local leveltext 	  = _G["LEVEL"]
local AbyssUI_LevelUpFrame = CreateFrame("Frame", "$parentAbyssUI_LevelUpFrame", UIParent)
AbyssUI_LevelUpFrame:SetFrameStrata("DIALOG")
AbyssUI_LevelUpFrame:SetWidth(GetScreenWidth())
AbyssUI_LevelUpFrame:SetHeight(GetScreenHeight()/4)
AbyssUI_LevelUpFrame:SetClampedToScreen(true)
AbyssUI_LevelUpFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
AbyssUI_LevelUpFrame.text = AbyssUI_LevelUpFrame.text or AbyssUI_LevelUpFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUI_LevelUpFrame.text:SetScale(6)
AbyssUI_LevelUpFrame.text:SetPoint("CENTER", 0, 5)
AbyssUI_LevelUpFrame.text:SetText(strupper(levelup_reached))
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
LevelUp_PlayerInfo.text:SetText(strupper("|cfff2dc7f"..leveltext.."|r ".."|cfff2dc7f"..level.."|r"))
LevelUp_PlayerInfo.text:SetWidth(GetScreenWidth())
LevelUp_PlayerInfo.text:SetHeight(GetScreenHeight()/4)
local function AbyssUI_UpdateYouDiedLevelUpData()
	-- Get
	level = UnitLevel("player")
	-- Set
	LevelUp_PlayerInfo.text:SetText(strupper("|cfff2dc7f"..leveltext.."|r ".."|cfff2dc7f"..level.."|r"))
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
		addonTable.HideUnitImprovedFaction,
		addonTable.InstanceLeave,
		addonTable.InspectTarget,
		addonTable.ConfirmPopUps,
		addonTable.AutoSellGray,
		addonTable.DisableHealingSpam,
		addonTable.UnitFrameImproved,
		addonTable.ElitePortrait,
	} do
		v:SetChecked(true)
	end
	-- Get
	AbyssUIAddonSettings.HideUnitImprovedFaction = addonTable.HideUnitImprovedFaction:GetChecked()
	AbyssUIAddonSettings.ExtraFunctionInstanceLeave = addonTable.InstanceLeave:GetChecked()
	AbyssUIAddonSettings.ExtraFunctionInspectTarget = addonTable.InspectTarget:GetChecked()
	AbyssUIAddonSettings.ExtraFunctionConfirmPopUps = addonTable.ConfirmPopUps:GetChecked()
	AbyssUIAddonSettings.ExtraFunctionSellGray = addonTable.AutoSellGray:GetChecked()
	AbyssUIAddonSettings.ExtraFunctionDisableHealingSpam = addonTable.DisableHealingSpam:GetChecked()
	AbyssUIAddonSettings.UnitFrameImproved = addonTable.UnitFrameImproved:GetChecked()
	AbyssUIAddonSettings.ElitePortrait = addonTable.ElitePortrait:GetChecked()
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
			AbyssUIFirstFrame:Hide()
		end
	elseif ( event == "PLAYER_LOGOUT" ) then
		AbyssUIProfile = time()
	else
		return nil
	end
end)
--------------------------------------------------------------
-- End
