-- Author: Yugen
--
-- Shadowlands
--
-- Frames for AbyssUI
--------------------------------------------------------------
-- Init - Tables - Saves
local addonName, addonTable = ...
local L = LibStub("AceLocale-3.0"):GetLocale("AbyssUI")
--
local f = CreateFrame("Frame", "AbyssUI_Config", UIParent)
f:SetSize(50, 50)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, ...)
  character = UnitName("player").."-"..GetRealmName()
  -- Config/Panel
	if not AbyssUI_Config then
		local AbyssUI_Config = {}
	end
	-- AddonSettings
	if not AbyssUIAddonSettings then
		AbyssUIAddonSettings = {}
	end
  if not AbyssUIAddonSettings[character] then
    AbyssUIAddonSettings[character] = {}
  end
	-- Color Init
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
-- Fontfication
local function AbyssUI_Fontification(globalFont, subFont, damageFont)
local locale = GetLocale()
local fontName, fontHeight, fontFlags = MinimapZoneText:GetFont()
local mediaFolder = "Interface\\AddOns\\AbyssUI\\textures\\font\\"
	if (locale == "zhCN") then
		globalFont	= mediaFolder.."zhCN-TW\\senty.ttf"
		subFont 	= mediaFolder.."zhCN-TW\\senty.ttf"
		damageFont 	= mediaFolder.."zhCN-TW\\senty.ttf"
	elseif (locale == "zhTW") then
		globalFont	= mediaFolder.."zhCN-TW\\senty.ttf"
		subFont 	= mediaFolder.."zhCN-TW\\senty.ttf"
		damageFont 	= mediaFolder.."zhCN-TW\\senty.ttf"
	elseif (locale == "ruRU") then
		globalFont	= mediaFolder.."ruRU\\dejavu.ttf"
		subFont 	= mediaFolder.."ruRU\\dejavu.ttf"
		damageFont 	= mediaFolder.."ruRU\\dejavu.ttf"
	elseif (locale == "koKR") then
		globalFont	= mediaFolder.."koKR\\dxlbab.ttf"
		subFont 	= mediaFolder.."koKR\\dxlbab.ttf"
		damageFont 	= mediaFolder.."koKR\\dxlbab.ttf"
	elseif (locale == "frFR" or locale == "deDE" or locale == "enGB" or locale == "enUS" or locale == "itIT" or
		locale == "esES" or locale == "esMX" or locale == "ptBR") then
		globalFont	= mediaFolder.."global.ttf"
		subFont 	= mediaFolder.."npcfont.ttf"
		damageFont 	= mediaFolder.."damagefont.ttf"
	else
		globalFont	= fontName
		subFont 	= fontName
		damageFont 	= fontName
	end
	return globalFont, subFont, damageFont
end
local globalFont, subFont, damageFont = AbyssUI_Fontification(globalFont, subFont, damageFont)
-- RegionList
local function AbyssUI_RegionListSize(self, width, height)
	local regionList = { 
		self:GetRegions() } 
	for i, self in ipairs(regionList) do 
	    local regionType = self:GetObjectType() 
	    if regionType == "Texture" and not self:GetTexture() then  -- the region with no texture, just black colour
	        self:SetWidth(width)
					self:SetHeight(height)
	        break 
	    end  
	end
end
-- FrameSize
local function AbyssUI_FrameSize(self, width, height)
	self:SetWidth(width)
	self:SetHeight(height)
end
-- ApplyFonts
local function AbyssUI_ApplyFonts(self)
  self:SetTextColor(45/255, 45/255, 45/255)
  self:SetFont(globalFont, 13, "NORMAL")
  self:SetShadowColor(45/255, 45/255, 45/255)
  self:SetShadowOffset(0.5, 0)
end
--------------------------------------------------------------
--------------------------------------------------------------
local _G = _G
--local moveString     						= _G["BINDING_NAME_MOVEFORWARD"]
--local confirmString   					= _G["OKAY"]
--local recommendedString 				= _G["RECOMMENDED"]
local cancelString    					= _G["CANCEL"]
local dialogFrameTexture 				= "Interface\\Addons\\AbyssUI\\textures\\extra\\dialogFrameTexture"
local dialogFrameTextureBorder 	= "Interface\\DialogFrame\\UI-DialogBox-Background"
----------------------------------------------------
----------------------------------------------------
-- AbyssUI_EditBox_Frame
AbyssUI_EditBox_Frame = CreateFrame("Frame", "$parentAbyssUI_EditBox_Frame", AbyssUI_Config.childpanel1)
AbyssUI_EditBox_Frame:Hide()
AbyssUI_EditBox_Frame:SetWidth(500)
AbyssUI_EditBox_Frame:SetHeight(64)
AbyssUI_EditBox_Frame:SetPoint("CENTER", AbyssUI_Config.childpanel1, "CENTER", 0, 0)
AbyssUI_EditBox_Frame:EnableMouse(true)
AbyssUI_EditBox_Frame:SetClampedToScreen(true)
AbyssUI_EditBox_Frame:SetMovable(true)
AbyssUI_EditBox_Frame:RegisterForDrag("LeftButton")
AbyssUI_EditBox_Frame:SetScript("OnDragStart", AbyssUI_EditBox_Frame.StartMoving)
AbyssUI_EditBox_Frame:SetScript("OnDragStop", function(self)
  self:StopMovingOrSizing()
end)
AbyssUI_EditBox_Frame:SetFrameStrata("Dialog")
----------------------------------------------------
local Border = AbyssUI_EditBox_Frame:CreateTexture(nil, "BACKGROUND")
Border:SetTexture(dialogFrameTextureBorder)
Border:SetPoint("TOPLEFT", -3, 3)
Border:SetPoint("BOTTOMRIGHT", 3, -3)
--Border:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUI_EditBox_Frame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture(dialogFrameTextureBorder)
BorderBody:SetAllPoints(AbyssUI_EditBox_Frame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUI_EditBox_Frame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture(dialogFrameTextureBorder)
Texture:SetAllPoints(AbyssUI_EditBox_Frame)
AbyssUI_EditBox_Frame.texture = Texture
----------------------------------------------------
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function() 
	local FrameButtonConfirm = CreateFrame("Button","$parentFrameButtonConfirm", AbyssUI_EditBox_Frame, "UIPanelButtonTemplate")
	FrameButtonConfirm:SetHeight(24)
	FrameButtonConfirm:SetWidth(100)
	FrameButtonConfirm:SetPoint("BOTTOM", AbyssUI_EditBox_Frame, "BOTTOM", 0, 0)
	FrameButtonConfirm.text = FrameButtonConfirm.text or FrameButtonConfirm:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
	--FrameButtonConfirm.text:SetFont(globalFont, 14)
	FrameButtonConfirm.text:SetPoint("CENTER", FrameButtonConfirm, "CENTER", 0, 0)
	FrameButtonConfirm.text:SetText(L["Confirm"])
		if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
			AbyssUI_ApplyFonts(FrameButtonConfirm.text)
		else
			FrameButtonConfirm.text:SetFont(globalFont, 14)
			FrameButtonConfirm.text:SetTextColor(248/255, 248/255, 248/255)
			FrameButtonConfirm.text:SetShadowColor(0, 0, 0)
			FrameButtonConfirm.text:SetShadowOffset(1, -1)
		end
	FrameButtonConfirm:SetScript("OnClick", function()
	  AbyssUI_EditBox_Frame:Hide()
	end)
end)
----------------------------------------------------
-- EditBox
AbyssUI_EditBox= CreateFrame("EditBox", "$parentEditBox_TexturePack", AbyssUI_EditBox_Frame)
AbyssUI_EditBox:SetFont(globalFont, 14, "THINOUTLINE")
AbyssUI_EditBox:SetPoint("CENTER", 0, 0)
AbyssUI_EditBox:SetMultiLine(true)
AbyssUI_EditBox:SetHeight(24)
AbyssUI_EditBox:SetWidth(450)
----------------------------------------------------
----------------------------------------------------
-- AbyssUI_AFKCameraFrame
local AbyssUI_AFKCameraFrame = CreateFrame("Frame", "$parentAbyssUI_AFKCameraFrame", WorldFrame)
AbyssUI_AFKCameraFrame:SetFrameStrata("HIGH")
AbyssUI_AFKCameraFrame:SetScale(UIParent:GetScale())
AbyssUI_AFKCameraFrame:SetAllPoints(UIParent)
AbyssUI_AFKCameraFrame:SetClampedToScreen(true)
AbyssUI_AFKCameraFrame:Hide()
----------------------------------------------------
local AbyssUIBorder = AbyssUI_AFKCameraFrame:CreateTexture(nil, "BACKGROUND")
AbyssUIBorder:SetTexture(dialogFrameTextureBorder)
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
AbyssUI_AFKCameraFrame.text:SetText(L["Move"])
-- Texture
local Texture = AbyssUI_AFKCameraFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture(dialogFrameTextureBorder)
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
PlayerInfo_Level1.text:SetText(L["Level: "]..level)
-- Honor Level
local PlayerInfo_Honor1 = CreateFrame("Frame", "$parentPlayerInfo_Honor1", AbyssUI_AFKCameraFrame)
local HonorLevel = UnitHonorLevel("player")
PlayerInfo_Honor1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_Honor1:SetScale(3)
PlayerInfo_Honor1.text = PlayerInfo_Honor1.text or PlayerInfo_Honor1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_Honor1.text:SetPoint("BOTTOMLEFT", 5, 60)
PlayerInfo_Honor1.text:SetText(L["Honor: "]..HonorLevel)
-- Item Level
local PlayerInfo_ILevel1 = CreateFrame("Frame", "$parentPlayerInfo_ILevel1", AbyssUI_AFKCameraFrame)
local overall, equipped = GetAverageItemLevel()
PlayerInfo_ILevel1:SetAllPoints(AbyssUI_AFKCameraFrame)
PlayerInfo_ILevel1:SetScale(3)
PlayerInfo_ILevel1.text = PlayerInfo_ILevel1.text or PlayerInfo_ILevel1:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
PlayerInfo_ILevel1.text:SetPoint("BOTTOMLEFT", 5, 50)
PlayerInfo_ILevel1.text:SetText(L["Item Level: "]..floor(overall + 0.5))
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
	if (englishFaction == "Horde") then
		t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\Horde-Logo")
	else
		t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\Alliance-Logo")
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
if (englishClass == "DEATHKNIGHT") then
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
elseif (englishClass == "DEMONHUNTER") then
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
elseif (englishClass == "DRUID") then
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
elseif (englishClass == "HUNTER") then
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
elseif (englishClass == "MAGE") then
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
elseif (englishClass == "MONK") then
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
elseif (englishClass == "PALADIN") then
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
elseif (englishClass == "PRIEST") then
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
elseif (englishClass == "ROGUE") then
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
elseif (englishClass == "SHAMAN") then
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
elseif (englishClass == "WARLOCK") then
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
elseif (englishClass == "WARRIOR") then
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
	if (AbyssUIAddonSettings.ExtraFunctionAmericanClock == true) then
		dataTime = date("%H:%M |cfff2dc7f%m/%d/%y|r ")
	else
		dataTime = date("%H:%M |cfff2dc7f%d/%m/%y|r ")
	end
	englishFaction, localizedFaction = UnitFactionGroup("player")
	money = GetCoinTextureString(GetMoney())
	-- Set
	PlayerInfo_Name1.text:SetText(playerName)
	PlayerInfo_Title1.text:SetText(titleName)
	PlayerInfo_Level1.text:SetText(L["Level: "]..level)
	PlayerInfo_Race1.text:SetText(race)
	PlayerInfo_Class1.text:SetText(playerClass)
	ExtraInfo_Clock1.text:SetText(dataTime)
	PlayerInfo_Honor1.text:SetText(L["Honor: "]..HonorLevel)
	PlayerInfo_ILevel1.text:SetText(L["Item Level: "]..floor(overall + 0.5))
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
	if (AbyssUIAddonSettings.AFKCammeraFrame ~= true) then
		if (event == "PLAYER_FLAGS_CHANGED" or event == "PLAYER_ENTERING_WORLD") then
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
					if (not MinimapCluster:IsShown()) then
						MinimapCluster:Show()
					end
				end
			else
				AbyssUI_AFKCameraFrame:Hide()
			end
		end
		-- OnClick
		if (AbyssUI_AFKCameraFrame:IsShown()) then
			AbyssUI_AFKCameraFrame:SetScript("OnMouseDown", function (self, button)
			    if (button == 'LeftButton') then 
			    	AbyssUI_AFKCameraFrame:Hide()
					UIParent:SetAlpha(1)
					if AbyssUIAddonSettings.HideMinimap ~= true then
						MinimapCluster:Show()
					end
			    end
			end)
		end
	else
		return nil
	end
end)
--------------------------------------------
-- YouDied Frame
local _G = _G
--local deathrecap = _G["DEAD"]
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
AbyssUI_YouDiedFrame.text:SetText(strupper(L["|cff8b0000YOU DIED|r"]))
AbyssUI_YouDiedFrame.text:SetWidth(GetScreenWidth())
AbyssUI_YouDiedFrame.text:SetHeight(GetScreenHeight()/4)
AbyssUI_YouDiedFrame:Hide()
AbyssUI_YouDiedFrame:SetScript("OnEvent", function(self, event, ...)
	if (AbyssUIAddonSettings.HideYouDiedLevelUpFrame ~= true) then
		if (event == "PLAYER_DEAD") then
			AbyssUI_YouDiedFrame.text:SetText(strupper(L["|cff8b0000YOU DIED|r"]))
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
AbyssUIBorder:SetTexture(dialogFrameTextureBorder)
AbyssUIBorder:SetPoint("TOPLEFT", -3, 3)
AbyssUIBorder:SetPoint("BOTTOMRIGHT", 3, -3)
AbyssUIBorder:SetVertexColor(0.6, 0.6, 0.6, 0.6)
----------------------------------------------------
local BorderBody = AbyssUI_YouDiedFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture(dialogFrameTextureBorder)
BorderBody:SetAllPoints(AbyssUI_YouDiedFrame)
BorderBody:SetVertexColor(0.6, 0.6, 0.6, 0.6)
----------------------------------------------------
local Texture = AbyssUI_YouDiedFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture(dialogFrameTextureBorder)
Texture:SetAllPoints(AbyssUI_YouDiedFrame)
AbyssUI_YouDiedFrame.texture = Texture
----------------------------------------------------
-- LevelUp Fixes
local _G = _G
local levelupreachedString 	= _G["LEVEL_UP_YOU_REACHED"]
local levelString 	 				= _G["LEVEL"]
-- LevelUp Frame
local AbyssUI_LevelUpFrame = CreateFrame("Frame", "$parentAbyssUI_LevelUpFrame", UIParent)
AbyssUI_LevelUpFrame:SetFrameStrata("DIALOG")
AbyssUI_LevelUpFrame:SetWidth(GetScreenWidth())
AbyssUI_LevelUpFrame:SetHeight(GetScreenHeight()/4)
AbyssUI_LevelUpFrame:SetClampedToScreen(true)
AbyssUI_LevelUpFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
AbyssUI_LevelUpFrame.text = AbyssUI_LevelUpFrame.text or AbyssUI_LevelUpFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUI_LevelUpFrame.text:SetScale(8)
AbyssUI_LevelUpFrame.text:SetPoint("CENTER", 0, 5)
AbyssUI_LevelUpFrame.text:SetText(strupper(levelupreachedString))
AbyssUI_LevelUpFrame.text:SetWidth(GetScreenWidth())
AbyssUI_LevelUpFrame.text:SetHeight(GetScreenHeight()/4)
AbyssUI_LevelUpFrame:Hide()
----------------------------------------------------
local AbyssUIBorder = AbyssUI_LevelUpFrame:CreateTexture(nil, "BACKGROUND")
AbyssUIBorder:SetTexture(dialogFrameTextureBorder)
AbyssUIBorder:SetPoint("TOPLEFT", -3, 3)
AbyssUIBorder:SetPoint("BOTTOMRIGHT", 3, -3)
AbyssUIBorder:SetVertexColor(0.3, 0.3, 0.3, 0.3)
----------------------------------------------------
local BorderBody = AbyssUI_LevelUpFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture(dialogFrameTextureBorder)
BorderBody:SetAllPoints(AbyssUI_LevelUpFrame)
BorderBody:SetVertexColor(0.3, 0.3, 0.3, 0.3)
----------------------------------------------------
local Texture = AbyssUI_LevelUpFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture(dialogFrameTextureBorder)
Texture:SetAllPoints(AbyssUI_LevelUpFrame)
AbyssUI_LevelUpFrame.texture = Texture
----------------------------------------------------
-- Player Name/Level
local LevelUp_PlayerInfo = CreateFrame("Frame", "$parentLevelUp_PlayerLevel", AbyssUI_LevelUpFrame)
LevelUp_PlayerInfo:SetAllPoints(AbyssUI_LevelUpFrame)
LevelUp_PlayerInfo:SetScale(8)
LevelUp_PlayerInfo.text = LevelUp_PlayerInfo.text or LevelUp_PlayerInfo:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
LevelUp_PlayerInfo.text:SetPoint("CENTER", 0, -5)
LevelUp_PlayerInfo.text:SetText(strupper("|cfff2dc7f"..levelString.."|r ".."|cfff2dc7f"..level.."|r"))
LevelUp_PlayerInfo.text:SetWidth(GetScreenWidth())
LevelUp_PlayerInfo.text:SetHeight(GetScreenHeight()/4)
local function AbyssUI_UpdateYouDiedLevelUpData()
	-- Get
	level = UnitLevel("player")
	-- Set
	LevelUp_PlayerInfo.text:SetText(strupper("|cfff2dc7f"..levelString.."|r ".."|cfff2dc7f"..level.."|r"))
end
AbyssUI_LevelUpFrame:RegisterEvent("PLAYER_LEVEL_UP")
AbyssUI_LevelUpFrame:SetScript("OnEvent", function(self, event, ...)
	if (AbyssUIAddonSettings.HideYouDiedLevelUpFrame ~= true) then
		if (event == "PLAYER_LEVEL_UP") then
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
----------------------------------------------------
-- AbyssUIFirstFrame
local AbyssUIFirstFrame = CreateFrame("Frame", "$parentAbyssUIFirstFrame", UIParent)
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
AbyssUIFirstFrame.text:SetText(L["Thank you for choosing Abyss|cff0d75d4UI|r!"])
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
Subtittle.text:SetText(L["The improved World of Warcraft user interface."])
----------------------------------------------------
local AbyssUIBorder = AbyssUIFirstFrame:CreateTexture(nil, "BACKGROUND")
AbyssUIBorder:SetTexture(dialogFrameTextureBorder)
AbyssUIBorder:SetPoint("TOPLEFT", -3, 3)
AbyssUIBorder:SetPoint("BOTTOMRIGHT", 3, -3)
--AbyssUIBorder:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUIFirstFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture(dialogFrameTextureBorder)
BorderBody:SetAllPoints(AbyssUIFirstFrame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUIFirstFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture(dialogFrameTextureBorder)
Texture:SetAllPoints(AbyssUIFirstFrame)
AbyssUIFirstFrame.texture = Texture
----------------------------------------------------
local CloseButton = CreateFrame("Button", "$parentFrameButton", AbyssUIFirstFrame, "UIPanelButtonTemplate")
CloseButton:SetHeight(40)
CloseButton:SetWidth(40)
CloseButton:SetPoint("TOPRIGHT", AbyssUIFirstFrame, "TOPRIGHT", 0, 0)
CloseButton:SetText("x")
----------------------------------------------------
local BorderCloseButton = CloseButton:CreateTexture(nil, "ARTWORK")
BorderCloseButton:SetTexture(dialogFrameTextureBorder)
BorderCloseButton:SetAllPoints(CloseButton)
CloseButton:SetScript("OnClick", function()
	AbyssUIFirstFrame:Hide()
	AbyssUISecondFrame:Show()
end)
----------------------------------------------------
local FrameButton = CreateFrame("Button", "$parentFrameButton", AbyssUIFirstFrame, "UIPanelButtonTemplate")
FrameButton:SetHeight(GetScreenHeight())
FrameButton:SetWidth(GetScreenWidth())
FrameButton:SetPoint("CENTER", AbyssUIFirstFrame, "CENTER", 0, 0)
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
AbyssUISecondFrame.text:SetAllPoints()
AbyssUISecondFrame.text:SetText(L["Let's save the variables and prepare the interface for the first use.\n"
.."To do this, choose the option that best suits your taste.\n\n"
.."|cfff2dc7fClassic|r: interface model close to the original, with few modifications.\n\n"
.."|cfff2dc7fRecommended|r: a mix between the other options, with the best of the two.\n\n"
.."|cfff2dc7fModern|r: a modern interface model, with striking changes to the interface.\n\n"
.."You always can change options on the configuration panel.\nType '|cfff2dc7f/abyssui|r' on chat for more info."])
----------------------------------------------------
local AbyssUIBorder = AbyssUISecondFrame:CreateTexture(nil, "BACKGROUND")
AbyssUIBorder:SetTexture(dialogFrameTextureBorder)
AbyssUIBorder:SetPoint("TOPLEFT", -3, 3)
AbyssUIBorder:SetPoint("BOTTOMRIGHT", 3, -3)
--AbyssUIBorder:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUISecondFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture(dialogFrameTextureBorder)
BorderBody:SetAllPoints(AbyssUISecondFrame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUISecondFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture(dialogFrameTextureBorder)
Texture:SetAllPoints(AbyssUISecondFrame)
AbyssUISecondFrame.texture = Texture
----------------------------------------------------
-- Recommended
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function() 
	local FrameButtonRecommended = CreateFrame("Button", "$parentFrameButtonRecommended", AbyssUISecondFrame, "UIPanelButtonTemplate")
	FrameButtonRecommended:SetHeight(40)
	FrameButtonRecommended:SetWidth(160)
	FrameButtonRecommended:SetPoint("CENTER", AbyssUISecondFrame, "CENTER", 0, -200)
	FrameButtonRecommended.text = FrameButtonRecommended.text or FrameButtonRecommended:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
	FrameButtonRecommended.text:SetFont(globalFont, 14)
	FrameButtonRecommended.text:SetPoint("CENTER", FrameButtonRecommended, "CENTER", 0, -2)
	FrameButtonRecommended.text:SetText(L["Recommended"])
	if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
		FrameButtonRecommended.text:SetTextColor(49/255, 49/255, 49/255)
		FrameButtonRecommended.text:SetShadowColor(0, 0, 0)
		FrameButtonRecommended.text:SetShadowOffset(0.5, 0)
	else
		FrameButtonRecommended.text:SetTextColor(248/255, 248/255, 248/255)
		FrameButtonRecommended.text:SetShadowColor(0, 0, 0)
		FrameButtonRecommended.text:SetShadowOffset(1, -1)
	end
	FrameButtonRecommended.GlowTexture = FrameButtonRecommended:CreateTexture(nil, "OVERLAY", "UIPanelButtonHighlightTexture")
	FrameButtonRecommended.GlowTexture:SetAllPoints()
	FrameButtonRecommended.GlowTexture:Hide()
	FrameButtonRecommended.Glow = FrameButtonRecommended:CreateAnimationGroup()
	FrameButtonRecommended.Glow:SetLooping("REPEAT")
	local anim = FrameButtonRecommended.Glow:CreateAnimation("Alpha")
	anim:SetChildKey("GlowTexture")
	anim:SetOrder(1)
	anim:SetFromAlpha(0)
	anim:SetToAlpha(1)
	anim:SetDuration(0.5)
	anim = FrameButtonRecommended.Glow:CreateAnimation("Alpha")
	anim:SetOrder(2)
	anim:SetChildKey("GlowTexture")
	anim:SetFromAlpha(1)
	anim:SetToAlpha(0)
	anim:SetDuration(0.5)
	FrameButtonRecommended.Glow:SetScript("OnPlay", function(self)
		self:GetParent().GlowTexture:Show()
	end)
	FrameButtonRecommended.Glow:SetScript("OnStop", function(self)
		self:GetParent().GlowTexture:Hide()
	end)
	if not FrameButtonRecommended.running then
		FrameButtonRecommended.running = true
		FrameButtonRecommended.Glow:Play()
	else
		FrameButtonRecommended.running = false
		FrameButtonRecommended.Glow:Stop()
	end
	if(not FrameButtonRecommended:IsShown()) then
		FrameButtonRecommended.Glow:Stop()
	end
	----------------------------------------------------
	local BorderButtonRecommended = FrameButtonRecommended:CreateTexture(nil, "ARTWORK")
	BorderButtonRecommended:SetAllPoints(FrameButtonRecommended)
	FrameButtonRecommended:SetScript("OnClick", function()
		-- Set
		for i, v in pairs {
			addonTable.HideUnitImprovedFaction,
			addonTable.HideGroupFrame,
			addonTable.InstanceLeave,
			addonTable.InspectTarget,
			addonTable.ConfirmPopUps,
			addonTable.AutoSellGray,
			addonTable.DisableHealingSpam,
			addonTable.TooltipOnCursor,
			addonTable.UnitFrameImproved,
			addonTable.ElitePortrait,
		} do
			v:SetChecked(true)
		end
		-- Get
		AbyssUIAddonSettings.HideUnitImprovedFaction 			     = addonTable.HideUnitImprovedFaction:GetChecked()
		AbyssUIAddonSettings.HideGroupFrame					           = addonTable.HideGroupFrame:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionInstanceLeave 		   = addonTable.InstanceLeave:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionInspectTarget 		   = addonTable.InspectTarget:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionConfirmPopUps 		   = addonTable.ConfirmPopUps:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionSellGray 				     = addonTable.AutoSellGray:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionDisableHealingSpam	 = addonTable.DisableHealingSpam:GetChecked()
		AbyssUIAddonSettings.TooltipOnCursor 					         = addonTable.TooltipOnCursor:GetChecked()
		AbyssUIAddonSettings.UnitFrameImproved 				      	 = addonTable.UnitFrameImproved:GetChecked()
		AbyssUIAddonSettings.ElitePortrait 						         = addonTable.ElitePortrait:GetChecked()
		AbyssUISecondFrame:Hide()
		FrameButtonRecommended.Glow:Finish()
		ReloadUI()
	end)
end)
-- Modern
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function() 
	local FrameButtonModern = CreateFrame("Button", "$parentFrameButton", AbyssUISecondFrame, "UIPanelButtonTemplate")
	FrameButtonModern:SetHeight(40)
	FrameButtonModern:SetWidth(120)
	FrameButtonModern:SetPoint("CENTER", AbyssUISecondFrame, "CENTER", 200, -200)
	FrameButtonModern.text = FrameButtonModern.text or FrameButtonModern:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
	FrameButtonModern.text:SetFont(globalFont, 14)
	FrameButtonModern.text:SetPoint("CENTER", FrameButtonModern, "CENTER", 0, -2)
	FrameButtonModern.text:SetText(L["Modern"])
	if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
		FrameButtonModern.text:SetTextColor(49/255, 49/255, 49/255)
		FrameButtonModern.text:SetShadowColor(0, 0, 0)
		FrameButtonModern.text:SetShadowOffset(0.5, 0)
	else
		FrameButtonModern.text:SetTextColor(248/255, 248/255, 248/255)
		FrameButtonModern.text:SetShadowColor(0, 0, 0)
		FrameButtonModern.text:SetShadowOffset(1, -1)
	end
	----------------------------------------------------
	local BorderButtonModern = FrameButtonModern:CreateTexture(nil, "ARTWORK")
	BorderButtonModern:SetAllPoints(FrameButtonModern)
	FrameButtonModern:SetScript("OnClick", function()
		-- Set
		for i, v in pairs {
			addonTable.HideUnitImprovedFaction,
			addonTable.HideGroupFrame,
			addonTable.InstanceLeave,
			addonTable.InspectTarget,
			addonTable.ConfirmPopUps,
			addonTable.AutoSellGray,
			addonTable.DisableHealingSpam,
			addonTable.TooltipOnCursor,
			addonTable.SquareMinimap,
			addonTable.UnitFrameImproved,
			addonTable.ElitePortrait,
		} do
			v:SetChecked(true)
		end
		-- Get
		AbyssUIAddonSettings.HideUnitImprovedFaction 			     = addonTable.HideUnitImprovedFaction:GetChecked()
		AbyssUIAddonSettings.HideGroupFrame					           = addonTable.HideGroupFrame:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionInstanceLeave 		   = addonTable.InstanceLeave:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionInspectTarget 		   = addonTable.InspectTarget:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionConfirmPopUps 		   = addonTable.ConfirmPopUps:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionSellGray 				     = addonTable.AutoSellGray:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionDisableHealingSpam	 = addonTable.DisableHealingSpam:GetChecked()
		AbyssUIAddonSettings.TooltipOnCursor 					         = addonTable.TooltipOnCursor:GetChecked()
		AbyssUIAddonSettings.SquareMinimap 				      	 		 = addonTable.SquareMinimap:GetChecked()
		AbyssUIAddonSettings.UnitFrameImproved 				      	 = addonTable.UnitFrameImproved:GetChecked()
		AbyssUIAddonSettings.ElitePortrait 						         = addonTable.ElitePortrait:GetChecked()
		AbyssUISecondFrame:Hide()
		ReloadUI()
	end)
end)
----------------------------------------------------
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function() 
	local FrameButtonClassic = CreateFrame("Button", "$parentFrameButton", AbyssUISecondFrame, "UIPanelButtonTemplate")
	FrameButtonClassic:SetHeight(40)
	FrameButtonClassic:SetWidth(120)
	FrameButtonClassic:SetPoint("CENTER", AbyssUISecondFrame, "CENTER", -200, -200)
	FrameButtonClassic.text = FrameButtonClassic.text or FrameButtonClassic:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
	FrameButtonClassic.text:SetFont(globalFont, 14)
	FrameButtonClassic.text:SetPoint("CENTER", FrameButtonClassic, "CENTER", 0, -2)
	FrameButtonClassic.text:SetText(L["Classic"])
	if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
	  	FrameButtonClassic.text:SetTextColor(49/255, 49/255, 49/255)
		FrameButtonClassic.text:SetShadowColor(0, 0, 0)
		FrameButtonClassic.text:SetShadowOffset(0.5, 0)
	else
		FrameButtonClassic.text:SetTextColor(248/255, 248/255, 248/255)
		FrameButtonClassic.text:SetShadowColor(0, 0, 0)
		FrameButtonClassic.text:SetShadowOffset(1, -1)
	end

	----------------------------------------------------
	local BorderButtonClassic = FrameButtonClassic:CreateTexture(nil, "ARTWORK")
	BorderButtonClassic:SetAllPoints(FrameButtonClassic)
	FrameButtonClassic:SetScript("OnClick", function()
		-- Set
		for i, v in pairs {
			addonTable.FPSMSFrame,
			addonTable.YouDiedLevelUpFrame,
			addonTable.HideUnitImprovedFaction,
			addonTable.HideCastTimer,
			addonTable.InstanceLeave,
			addonTable.InspectTarget,
			addonTable.ConfirmPopUps,
			addonTable.AutoSellGray,
			addonTable.ChatBubbleChanges,
			addonTable.DisableHealingSpam,
			addonTable.DisableNewMinimap,
			addonTable.DisableUnitFrameSmoke,
			addonTable.NewCastBar,
		} do
			v:SetChecked(true)
		end
		-- Get
		AbyssUIAddonSettings.HideFPSMSFrame 					        = addonTable.FPSMSFrame:GetChecked()
		AbyssUIAddonSettings.HideYouDiedLevelUpFrame 		    	= addonTable.YouDiedLevelUpFrame:GetChecked()
		AbyssUIAddonSettings.HideUnitImprovedFaction 		    	= addonTable.HideUnitImprovedFaction:GetChecked()
		AbyssUIAddonSettings.HideCastTimer					        	= addonTable.HideCastTimer:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionInstanceLeave    		= addonTable.InstanceLeave:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionInspectTarget 	  	= addonTable.InspectTarget:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionConfirmPopUps 	  	= addonTable.ConfirmPopUps:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionSellGray 				    = addonTable.AutoSellGray:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionChatBubbleChanges 	= addonTable.ChatBubbleChanges:GetChecked()
		AbyssUIAddonSettings.ExtraFunctionDisableHealingSpam	= addonTable.DisableHealingSpam:GetChecked()
		AbyssUIAddonSettings.DisableNewMinimap				      	= addonTable.DisableNewMinimap:GetChecked()
		AbyssUIAddonSettings.UnitFrameImprovedDefaultTexture 	= addonTable.DisableUnitFrameSmoke:GetChecked()
	 	AbyssUIAddonSettings.NewCastBar												= addonTable.NewCastBar:GetChecked()

		AbyssUISecondFrame:Hide()
		ReloadUI()
	end)
	----------------------------------------------------
	local CloseButton = CreateFrame("Button", "$parentFrameButton", AbyssUISecondFrame, "UIPanelButtonTemplate")
	CloseButton:SetHeight(40)
	CloseButton:SetWidth(40)
	CloseButton:SetPoint("TOPRIGHT", AbyssUISecondFrame, "TOPRIGHT", 0, 0)
	CloseButton.text = CloseButton.text or CloseButton:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
	CloseButton.text:SetFont(globalFont, 14)
	CloseButton.text:SetPoint("CENTER", CloseButton, "CENTER", 0, 0)
	CloseButton.text:SetText("x")
	----------------------------------------------------
	local BorderCloseButton = CloseButton:CreateTexture(nil, "ARTWORK")
	BorderCloseButton:SetTexture(dialogFrameTextureBorder)
	BorderCloseButton:SetAllPoints(CloseButton)
	CloseButton:SetScript("OnClick", function()
		AbyssUISecondFrame:Hide()
		ReloadUI()
	end)
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
AbyssUI_ReloadFrame.text:SetText(L["A reload is necessary so this configuration can be save!\n"..
"Click the |cffffcc00'confirm'|r button to Reload.\nYou still can make changes (do before you confirm)."])
----------------------------------------------------
local Border = AbyssUI_ReloadFrame:CreateTexture(nil, "BACKGROUND")
Border:SetTexture(dialogFrameTextureBorder)
Border:SetPoint("TOPLEFT", -3, 3)
Border:SetPoint("BOTTOMRIGHT", 3, -3)
--Border:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUI_ReloadFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture(dialogFrameTextureBorder)
BorderBody:SetAllPoints(AbyssUI_ReloadFrame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUI_ReloadFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture(dialogFrameTextureBorder)
Texture:SetAllPoints(AbyssUI_ReloadFrame)
AbyssUI_ReloadFrame.texture = Texture
----------------------------------------------------
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function() 
	local FrameButtonConfirm = CreateFrame("Button","$parentFrameButtonConfirm", AbyssUI_ReloadFrame, "UIPanelButtonTemplate")
	FrameButtonConfirm:SetHeight(24)
	FrameButtonConfirm:SetWidth(100)
	FrameButtonConfirm:SetPoint("BOTTOM", AbyssUI_ReloadFrame, "BOTTOM", 0, 10)
	FrameButtonConfirm.text = FrameButtonConfirm.text or FrameButtonConfirm:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
	--FrameButtonConfirm.text:SetFont(globalFont, 14)
	FrameButtonConfirm.text:SetPoint("CENTER", FrameButtonConfirm, "CENTER", 0, 0)
	FrameButtonConfirm.text:SetText(L["Confirm"])
		if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
			AbyssUI_ApplyFonts(FrameButtonConfirm.text)
		else
			FrameButtonConfirm.text:SetFont(globalFont, 14)
			FrameButtonConfirm.text:SetTextColor(248/255, 248/255, 248/255)
			FrameButtonConfirm.text:SetShadowColor(0, 0, 0)
			FrameButtonConfirm.text:SetShadowOffset(1, -1)
		end
	FrameButtonConfirm:SetScript("OnClick", function()
		AbyssUI_ReloadFrame:Hide()
		ReloadUI()
	end)
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
AbyssUI_ReloadFrameFadeUI.text:SetAllPoints()
AbyssUI_ReloadFrameFadeUI.text:SetText(L["It will only hide Blizzard frames, addons have their"..
" own frames,\n a good addon probably has an option to hide while out of combat.\n"..
" I could have added the entire interface to be hidden,\n but that would prevent"..
" interaction with some frames (auction, loot, quest, etc)."])
----------------------------------------------------
local Border = AbyssUI_ReloadFrameFadeUI:CreateTexture(nil, "BACKGROUND")
Border:SetTexture(dialogFrameTextureBorder)
Border:SetPoint("TOPLEFT", -3, 3)
Border:SetPoint("BOTTOMRIGHT", 3, -3)
--Border:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUI_ReloadFrameFadeUI:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture(dialogFrameTextureBorder)
BorderBody:SetAllPoints(AbyssUI_ReloadFrameFadeUI)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUI_ReloadFrameFadeUI:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture(dialogFrameTextureBorder)
Texture:SetAllPoints(AbyssUI_ReloadFrameFadeUI)
AbyssUI_ReloadFrameFadeUI.texture = Texture
----------------------------------------------------
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function() 
	local FrameButtonConfirm = CreateFrame("Button","$parentFrameButtonConfirm", AbyssUI_ReloadFrameFadeUI, "UIPanelButtonTemplate")
	FrameButtonConfirm:SetHeight(24)
	FrameButtonConfirm:SetWidth(100)
	FrameButtonConfirm:SetPoint("BOTTOM", AbyssUI_ReloadFrameFadeUI, "BOTTOM", 0, 10)
	FrameButtonConfirm.text = FrameButtonConfirm.text or FrameButtonConfirm:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
	--FrameButtonConfirm.text:SetFont(globalFont, 14)
	FrameButtonConfirm.text:SetPoint("CENTER", FrameButtonConfirm, "CENTER", 0, 0)
	FrameButtonConfirm.text:SetText(L["Confirm"])
		if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
			AbyssUI_ApplyFonts(FrameButtonConfirm.text)
		else
			FrameButtonConfirm.text:SetFont(globalFont, 14)
			FrameButtonConfirm.text:SetTextColor(248/255, 248/255, 248/255)
			FrameButtonConfirm.text:SetShadowColor(0, 0, 0)
			FrameButtonConfirm.text:SetShadowOffset(1, -1)
		end
	FrameButtonConfirm:SetScript("OnClick", function()
		AbyssUI_ReloadFrameFadeUI:Hide()
		ReloadUI()
	end)
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
AbyssUI_ActionBarCleaner.text:SetText(L["Wait!\nThis will clean all your skills/spells from Actions Bars."])
----------------------------------------------------
local Border = AbyssUI_ActionBarCleaner:CreateTexture(nil, "BACKGROUND")
Border:SetTexture(dialogFrameTextureBorder)
Border:SetPoint("TOPLEFT", -3, 3)
Border:SetPoint("BOTTOMRIGHT", 3, -3)
--Border:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUI_ActionBarCleaner:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture(dialogFrameTextureBorder)
BorderBody:SetAllPoints(AbyssUI_ActionBarCleaner)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUI_ActionBarCleaner:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture(dialogFrameTextureBorder)
Texture:SetAllPoints(AbyssUI_ActionBarCleaner)
AbyssUI_ActionBarCleaner.texture = Texture
----------------------------------------------------
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function() 
	local FrameButtonConfirm = CreateFrame("Button","$parentFrameButtonConfirm", AbyssUI_ActionBarCleaner, "UIPanelButtonTemplate")
	FrameButtonConfirm:SetHeight(24)
	FrameButtonConfirm:SetWidth(100)
	FrameButtonConfirm:SetPoint("BOTTOM", AbyssUI_ActionBarCleaner, "BOTTOM", -50, 10)
	FrameButtonConfirm.text = FrameButtonConfirm.text or FrameButtonConfirm:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
	--FrameButtonConfirm.text:SetFont(globalFont, 14)
	FrameButtonConfirm.text:SetPoint("CENTER", FrameButtonConfirm, "CENTER", 0, 0)
	FrameButtonConfirm.text:SetText(L["Confirm"])
		if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
			AbyssUI_ApplyFonts(FrameButtonConfirm.text)
		else
			FrameButtonConfirm.text:SetFont(globalFont, 14)
			FrameButtonConfirm.text:SetTextColor(248/255, 248/255, 248/255)
			FrameButtonConfirm.text:SetShadowColor(0, 0, 0)
			FrameButtonConfirm.text:SetShadowOffset(1, -1)
		end
	FrameButtonConfirm:SetScript("OnClick", function()
	  for i = 1, 120 do
	    PickupAction(i) ClearCursor()
	  end
	  AbyssUI_ActionBarCleaner:Hide()
	end)
end)
----------------------------------------------------
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function() 
	local FrameButtonCancel = CreateFrame("Button","$parentFrameButtonCancel", AbyssUI_ActionBarCleaner, "UIPanelButtonTemplate")
	FrameButtonCancel:SetHeight(24)
	FrameButtonCancel:SetWidth(100)
	FrameButtonCancel:SetPoint("BOTTOM", AbyssUI_ActionBarCleaner, "BOTTOM", 50, 10)
	FrameButtonCancel.text = FrameButtonCancel.text or FrameButtonCancel:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
	--FrameButtonCancel.text:SetFont(globalFont, 14)
	FrameButtonCancel.text:SetPoint("CENTER", FrameButtonCancel, "CENTER", 0, 0)
	FrameButtonCancel.text:SetText(cancelString)
	if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
		AbyssUI_ApplyFonts(FrameButtonCancel.text)
	else
		FrameButtonCancel.text:SetFont(globalFont, 14)
		FrameButtonCancel.text:SetTextColor(248/255, 248/255, 248/255)
		FrameButtonCancel.text:SetShadowColor(0, 0, 0)
		FrameButtonCancel.text:SetShadowOffset(1, -1)
	end
	FrameButtonCancel:SetScript("OnClick", function()
		AbyssUI_ActionBarCleaner:Hide()
	end)
end)
-- Start Function
local function AbyssUIStart()
	AbyssUIFirstFrame:Show()
end
--------------------------------- Save ---------------------------------
local AbyssUISave = CreateFrame("Frame")
AbyssUISave:RegisterEvent("ADDON_LOADED")
AbyssUISave:RegisterEvent("PLAYER_LOGOUT")
AbyssUISave:SetScript("OnEvent", function(self, event, arg1)
	if (event == "ADDON_LOADED" and arg1 == "AbyssUI") then
		if (AbyssUICount == nil) then
			AbyssUICount = 0
		end
		if (AbyssUIProfile == nil) then
			AbyssUICount = AbyssUICount + 1
			AbyssUIStart()
		else
			AbyssUIFirstFrame:Hide()
		end
	elseif (event == "PLAYER_LOGOUT") then
		AbyssUIProfile = time()
	else
		return nil
	end
end)
--------------------------------------------------------------
-- End
