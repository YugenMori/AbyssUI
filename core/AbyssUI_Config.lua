-- Author: Yugen
--
-- Supports any version of wow
--
-- Configuration page for AbyssUI
--------------------------------------------------------------
-- Init - Tables - Saves
local addonName, addonTable = ...
local GetWoWVersion = ((select(4, GetBuildInfo())))
local L = LibStub("AceLocale-3.0"):GetLocale("AbyssUI")
--local texturepackCheck    = "1.0.1.7"
--local texturepackDate     = "26/11/20"
local f = CreateFrame("Frame", "AbyssUI_Config", UIParent)
f:SetSize(50, 50)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, ...)
  character = UnitName("player").."-"..GetRealmName()
  -- Config/Panel
  if not AbyssUI_Config then
    local AbyssUI_Config = {}
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
    globalFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    subFont     = mediaFolder.."zhCN-TW\\senty.ttf"
    damageFont  = mediaFolder.."zhCN-TW\\senty.ttf"
  elseif (locale == "zhTW") then
    globalFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    subFont     = mediaFolder.."zhCN-TW\\senty.ttf"
    damageFont  = mediaFolder.."zhCN-TW\\senty.ttf"
  elseif (locale == "ruRU") then
    globalFont  = mediaFolder.."ruRU\\dejavu.ttf"
    subFont     = mediaFolder.."ruRU\\dejavu.ttf"
    damageFont  = mediaFolder.."ruRU\\dejavu.ttf"
  elseif (locale == "koKR") then
    globalFont  = mediaFolder.."koKR\\dxlbab.ttf"
    subFont     = mediaFolder.."koKR\\dxlbab.ttf"
    damageFont  = mediaFolder.."koKR\\dxlbab.ttf"
  elseif (locale == "frFR" or locale == "deDE" or locale == "enGB" or locale == "enUS" or locale == "itIT" or
    locale == "esES" or locale == "esMX" or locale == "ptBR") then
    globalFont  = mediaFolder.."global.ttf"
    subFont     = mediaFolder.."npcfont.ttf"
    damageFont  = mediaFolder.."damagefont.ttf"
  else
    globalFont  = fontName
    subFont     = fontName
    damageFont  = fontName
  end
  return globalFont, subFont, damageFont
end
-- declarations
local globalFont, subFont, damageFont = AbyssUI_Fontification(globalFont, subFont, damageFont)
-- RegionList
local function AbyssUI_RegionListSize(self, width, height)
  if (GetWoWVersion <= 90500) then
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
end
-- FrameSize
local function AbyssUI_FrameSize(self, width, height)
  if (GetWoWVersion <= 90500) then
    self:SetWidth(width)
    self:SetHeight(height)
  end
end
-- ApplyFonts
local function AbyssUI_ApplyFonts(self)
  self:SetTextColor(31/255, 31/255, 31/255)
  self:SetFont(globalFont, 13)
  self:SetShadowColor(45/255, 45/255, 45/255)
  self:SetShadowOffset(0, 0)
end
-- StatusBarFill
local function AbyssUI_StatusBarFill()
  if (AbyssUIAddonSettings ~= nil and AbyssUIAddonSettings.ReverseHealthFill == true) then
    if (GetWoWVersion <= 90500) then
      TargetFrameHealthBar:SetReverseFill(true)
      if (GetWoWVersion >= 20502) then
        FocusFrameHealthBar:SetReverseFill(true)
      end
    else
      TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetReverseFill(true)
      FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetReverseFill(true)
    end
  end
end
--------------------------------------------------------------
--------------------------------------------------------------
local _G = _G
local confirmString     = _G["OKAY"]
local colorString       = _G["COLOR_PICKER"]
local colorColorString  = _G["COLOR"]
local applyString       = _G["APPLY"]
--------------------------------------------------------------
local function InitSettings()
  AbyssUI_Config.panel = CreateFrame("Frame", "$parentAbyssUI_Config", InterfaceOptionsFramePanelContainer)
  -- Register in the Interface Addon Options GUI
  -- Set the name for the Category for the Options Panel1
  AbyssUI_Config.panel.name = "Abyss|cff0d75d4UI|r"
  -- Add the panel to the Interface Options
  InterfaceOptions_AddCategory(AbyssUI_Config.panel, addonName)
  --Child Panels
  --[[
  if (GetWoWVersion <= 90500) then
    AbyssUI_Config.childpanel1 = CreateFrame("Frame", "$parentConfigChild_InfoPanel", AbyssUI_Config.panel)
    AbyssUI_Config.childpanel1.name = L["Info Panel"]
    AbyssUI_Config.childpanel1.parent = AbyssUI_Config.panel.name
    InterfaceOptions_AddCategory(AbyssUI_Config.childpanel1)
  end
  --]]
  --
  AbyssUI_Config.childpanel2 = CreateFrame("Frame", "$parentConfigChild_HideElements", AbyssUI_Config.panel)
  AbyssUI_Config.childpanel2.name = L["Hide Elements"]
  AbyssUI_Config.childpanel2.parent = AbyssUI_Config.panel.name
  InterfaceOptions_AddCategory(AbyssUI_Config.childpanel2)
  --
  AbyssUI_Config.childpanel3 = CreateFrame("Frame", "$parentConfigChild_Miscellaneous", AbyssUI_Config.panel)
  AbyssUI_Config.childpanel3.name = L["Miscellaneous"]
  AbyssUI_Config.childpanel3.parent = AbyssUI_Config.panel.name
  InterfaceOptions_AddCategory(AbyssUI_Config.childpanel3)
  --
  AbyssUI_Config.childpanel4 = CreateFrame("Frame", "$parentConfigChild_Themes", AbyssUI_Config.panel)
  AbyssUI_Config.childpanel4.name = L["Art & Themes"]
  AbyssUI_Config.childpanel4.parent = AbyssUI_Config.panel.name
  InterfaceOptions_AddCategory(AbyssUI_Config.childpanel4)
  --
  AbyssUI_Config.childpanel5 = CreateFrame("Frame", "$parentConfigChild_Colorization", AbyssUI_Config.panel)
  AbyssUI_Config.childpanel5.name = L["Colorization"]
  AbyssUI_Config.childpanel5.parent = AbyssUI_Config.panel.name
  InterfaceOptions_AddCategory(AbyssUI_Config.childpanel5)
  --
  AbyssUI_Config.childpanel6 = CreateFrame("Frame", "$parentConfigChild_Extras", AbyssUI_Config.panel)
  AbyssUI_Config.childpanel6.name = L["Tweaks & Extra"]
  AbyssUI_Config.childpanel6.parent = AbyssUI_Config.panel.name
  InterfaceOptions_AddCategory(AbyssUI_Config.childpanel6)
  --
  AbyssUI_Config.childpanel7 = CreateFrame("Frame", "$parentConfigChild_Classic", AbyssUI_Config.panel)
  AbyssUI_Config.childpanel7.name = "Classic & BCC"
  AbyssUI_Config.childpanel7.parent = AbyssUI_Config.panel.name
  InterfaceOptions_AddCategory(AbyssUI_Config.childpanel7)
  --
  --[[
  if (GetWoWVersion <= 90500) then
    AbyssUI_Config.childpanel8 = CreateFrame("Frame", "$parentConfigChild_Scale", AbyssUI_Config.panel)
    AbyssUI_Config.childpanel8.name = L["Scale & Frame Size"]
    AbyssUI_Config.childpanel8.parent = AbyssUI_Config.panel.name
    InterfaceOptions_AddCategory(AbyssUI_Config.childpanel8)
  end
  --]]
  --
  AbyssUI_Config.childpanel9 = CreateFrame("Frame", "$parentConfigChild_Patreon", AbyssUI_Config.panel)
  AbyssUI_Config.childpanel9.name = "|cfff2dc7f"..L["Donators"].."|r"
  AbyssUI_Config.childpanel9.parent = AbyssUI_Config.panel.name
  InterfaceOptions_AddCategory(AbyssUI_Config.childpanel9)
  --
  AbyssUI_Config.childpanel10 = CreateFrame("Frame", "$parentConfigChild_Thanks&Translations", AbyssUI_Config.panel)
  AbyssUI_Config.childpanel10.name = L["Thanks & Translations"]
  AbyssUI_Config.childpanel10.parent = AbyssUI_Config.panel.name
  InterfaceOptions_AddCategory(AbyssUI_Config.childpanel10)
    --
  AbyssUI_Config.childpanel11 = CreateFrame("Frame", "$parentConfigChild_FAQ", AbyssUI_Config.panel)
  AbyssUI_Config.childpanel11.name = "FAQ"
  AbyssUI_Config.childpanel11.parent = AbyssUI_Config.panel.name
  InterfaceOptions_AddCategory(AbyssUI_Config.childpanel11)
  --------------------------------------------------------------
  -- Title
  local Frame = CreateFrame("Frame","$parentFrameButtonTitle", AbyssUI_Config.panel)
  Frame:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 0, -20)
  Frame:SetHeight(24)
  Frame:SetWidth(70)
  Frame:SetScale(1.5)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetPoint("CENTER")
  Frame:SetAllPoints()
  Frame:SetText("Abyss|cff0d75d4UI|r")
  -- SubTittle
  local Frame = CreateFrame("Frame","$parentFrameButtonSubTitle", AbyssUI_Config.panel)
  Frame:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 0, -100)
  Frame:SetHeight(100)
  Frame:SetWidth(600)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetPoint("LEFT")
  Frame:SetAllPoints()
  Frame:SetText(L["Thank you for using Abyss|cff0d75d4UI|r. If you enjoy this addon,"..
  " consider sharing with your friends or even making a donation."..
  "It helps a lot! This is a minimalist UI that makes changes directly to the WoW frames,"..
  "using nearly the same amount of CPU/RAM as the Blizzard default UI.\n\n"..
  "Options that have a different text color are based on your choice in the setup."..
  " Those options are set by default if you choose recommended settings.\n"..
  "Check the options by clicking in the (+) button on the left."])
  -- Panel 01 (Info Panel)
  --[[
  if (GetWoWVersion <= 90500) then
    local Frame = CreateFrame("Frame","$parentFrameButtonPanel01", AbyssUI_Config.childpanel1)
    Frame:SetPoint("CENTER", AbyssUI_Config.childpanel1, "TOP", 0, -20)
    Frame:SetWidth(600)
    Frame:SetHeight(40)
    Frame:SetScale(1.5)
    Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    Frame:SetPoint("CENTER")
    Frame:SetAllPoints()
    Frame:SetText(L["Info Panel"])
  end
  --]]
  -- Panel 02 (HideElements)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel02", AbyssUI_Config.childpanel2)
  Frame:SetPoint("CENTER", AbyssUI_Config.childpanel2, "TOP", 0, -20)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame:SetScale(1.5)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetPoint("CENTER")
  Frame:SetAllPoints()
  Frame:SetText(L["Hide Elements"])
  -- Panel 03 (Miscellaneous)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel03", AbyssUI_Config.childpanel3)
  Frame:SetPoint("CENTER", AbyssUI_Config.childpanel3, "TOP", 0, -20)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame:SetScale(1.5)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["Miscellaneous"])
  -- Panel 03.01 (Miscellaneous)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel041", AbyssUI_Config.childpanel3)
  Frame:SetPoint("TOPLEFT", AbyssUI_Config.childpanel3, "TOPLEFT", -65, -50)
  Frame:SetWidth(200)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["- General"])
  -- Panel 03.01 (Miscellaneous)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel041", AbyssUI_Config.childpanel3)
  Frame:SetPoint("TOPRIGHT", AbyssUI_Config.childpanel3, "TOPRIGHT", -130, -50)
  Frame:SetWidth(200)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["- Frames"])
  -- Panel 04 (Themes)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel04", AbyssUI_Config.childpanel4)
  Frame:SetPoint("CENTER", AbyssUI_Config.childpanel4, "TOP", 0, -20)
  Frame:SetWidth(200)
  Frame:SetHeight(40)
  Frame:SetScale(1.5)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["Player Portrait"])
  -- Panel 04.01 (Themes)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel041", AbyssUI_Config.childpanel4)
  Frame:SetPoint("TOPLEFT", AbyssUI_Config.childpanel4, "TOPLEFT", -40, -50)
  Frame:SetWidth(200)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["- Portrait Art"])
  -- Panel 4.02 (Themes)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel052", AbyssUI_Config.childpanel4)
  Frame:SetPoint("TOPRIGHT", AbyssUI_Config.childpanel4, "TOPRIGHT", -65, -50)
  Frame:SetWidth(200)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["- UnitFrame Art"])
    -- Panel 04.03 (Themes)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel041", AbyssUI_Config.childpanel4)
  Frame:SetPoint("TOPLEFT", AbyssUI_Config.childpanel4, "TOPLEFT", -40, -320)
  Frame:SetWidth(200)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText("- Icon Border")
  -- Panel 05 (Colorization)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel05", AbyssUI_Config.childpanel5)
  Frame:SetPoint("CENTER", AbyssUI_Config.childpanel5, "TOP", 0, -20)
  Frame:SetWidth(200)
  Frame:SetHeight(40)
  Frame:SetScale(1.5)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["Frame Colorization"])
  -- Panel 05.01 (Colorization)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel051", AbyssUI_Config.childpanel5)
  Frame:SetPoint("TOPLEFT", AbyssUI_Config.childpanel5, "TOPLEFT", -15, -50)
  Frame:SetWidth(200)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["- Preset Colors"])
  -- Panel 05.02 (Colorization)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel052", AbyssUI_Config.childpanel5)
  Frame:SetPoint("TOPRIGHT", AbyssUI_Config.childpanel5, "TOPRIGHT", -55, -50)
  Frame:SetWidth(200)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["- Choose a Color"])
  -- Panel 06 (Extra)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel06", AbyssUI_Config.childpanel6)
  Frame:SetPoint("CENTER", AbyssUI_Config.childpanel6, "TOP", 0, -20)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame:SetScale(1.5)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["Tweaks & Extra"])
  -- Panel 06.01 (Extra)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel061", AbyssUI_Config.childpanel6)
  Frame:SetPoint("TOPLEFT", AbyssUI_Config.childpanel6, "TOPLEFT", -60, -50)
  Frame:SetWidth(200)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["- General"])
  -- Panel 06.02 (Extra)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel062", AbyssUI_Config.childpanel6)
  Frame:SetPoint("TOPRIGHT", AbyssUI_Config.childpanel6, "TOPRIGHT", -90, -50)
  Frame:SetWidth(200)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["- Frames"])
  -- Panel 07 (Classic)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel07", AbyssUI_Config.childpanel7)
  Frame:SetPoint("CENTER", AbyssUI_Config.childpanel7, "TOP", 0, -20)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame:SetScale(1.5)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText("Classic & BCC")
  -- Panel 08 (Scale)
  --[[
  if (GetWoWVersion <= 90500) then
    local Frame = CreateFrame("Frame","$parentFrameButtonPanel08", AbyssUI_Config.childpanel8)
    Frame:SetPoint("CENTER", AbyssUI_Config.childpanel8, "TOP", 0, -20)
    Frame:SetWidth(600)
    Frame:SetHeight(40)
    Frame:SetScale(1.5)
    Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    Frame:SetAllPoints()
    Frame:SetText(L["Scale & Frame Size"])
  end
  --]]
  -- Panel 09 (Patreon)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel09", AbyssUI_Config.childpanel9)
  Frame:SetPoint("CENTER", AbyssUI_Config.childpanel9, "TOP", 0, -20)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame:SetScale(1.5)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["Donators"])
  -- Panel 10 (Thanks)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel10", AbyssUI_Config.childpanel10)
  Frame:SetPoint("CENTER", AbyssUI_Config.childpanel10, "TOP", 0, -20)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame:SetScale(1.5)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["Thanks & Translations"])
  -- Panel 11 (Faq)
  local Frame = CreateFrame("Frame","$parentFrameButtonPanel11", AbyssUI_Config.childpanel11)
  Frame:SetPoint("CENTER", AbyssUI_Config.childpanel11, "TOP", 0, -20)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame:SetScale(1.5)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText("FAQ")
  --------------------------------- Buttons ---------------------------------
  local _G = _G
  --local honorString         = _G["HONOR"]
  --local levelString         = _G["LEVEL"]
  --local timeStringLabel     = _G["TIME_LABEL"]
  local fichaString         = _G["TOKEN_FILTER_LABEL"]
  local versionString       = _G["GAME_VERSION_LABEL"]
  local versionIncopatible  = _G["ADDON_INCOMPATIBLE"]
  local latestString        = _G["KBASE_RECENTLY_UPDATED"] 
  ----------------------------------------------------
  -- Buttons
  -- AbyssUI Setup --
  local f = CreateFrame("Frame", nil)
  f:RegisterEvent("PLAYER_ENTERING_WORLD")
  f:SetScript("OnEvent", function() 
    local FrameButton = CreateFrame("Button","$parentExtraSetupButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
    FrameButton:SetHeight(30)
    FrameButton:SetWidth(140)
    FrameButton:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", -200, -200)
    FrameButton.text = FrameButton.text or FrameButton:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
    --FrameButton.text:SetFont(globalFont, 14)
    FrameButton.text:SetPoint("CENTER", FrameButton, "CENTER", 0, -1)
    FrameButton.text:SetText(L["Setup"])
      if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
        AbyssUI_ApplyFonts(FrameButton.text)
      else
        FrameButton.text:SetFont(globalFont, 12)
        FrameButton.text:SetTextColor(248/255, 248/255, 248/255)
        FrameButton.text:SetShadowColor(0, 0, 0)
        FrameButton.text:SetShadowOffset(1, -1)
      end
    FrameButton:SetScript("OnClick", function()
      AbyssUISecondFrame:Show()
    end)
  end)
  -- Clear Action Bar --
  local f = CreateFrame("Frame", nil)
  f:RegisterEvent("PLAYER_ENTERING_WORLD")
  f:SetScript("OnEvent", function() 
    local FrameButton = CreateFrame("Button","$parentExtraClearActionButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
    FrameButton:SetHeight(30)
    FrameButton:SetWidth(140)
    FrameButton:SetPoint("CENTER",  AbyssUI_Config.panel, "TOP", 0, -200)
    FrameButton.text = FrameButton.text or FrameButton:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
    --FrameButton.text:SetFont(globalFont, 14)
    FrameButton.text:SetPoint("CENTER", FrameButton, "CENTER", 0, -1)
    FrameButton.text:SetText(L["Clear Bars"])
      if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
        AbyssUI_ApplyFonts(FrameButton.text)
      else
        FrameButton.text:SetFont(globalFont, 12)
        FrameButton.text:SetTextColor(248/255, 248/255, 248/255)
        FrameButton.text:SetShadowColor(0, 0, 0)
        FrameButton.text:SetShadowOffset(1, -1)
      end
    FrameButton:SetScript("OnClick", function()
      AbyssUI_ActionBarCleaner:Show()
    end)
  end)
  -- AbyssUI DailyInfo --
  local f = CreateFrame("Frame", nil)
  f:RegisterEvent("PLAYER_ENTERING_WORLD")
  f:SetScript("OnEvent", function() 
    local FrameButton = CreateFrame("Button","$parentExtraDailyInfoButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
    FrameButton:SetHeight(30)
    FrameButton:SetWidth(140)
    FrameButton:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 200, -200)
    FrameButton.text = FrameButton.text or FrameButton:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
    --FrameButton.text:SetFont(globalFont, 14)
    FrameButton.text:SetPoint("CENTER", FrameButton, "CENTER", 0, -1)
    FrameButton.text:SetText(L["DailyInfo"])
      if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
        AbyssUI_ApplyFonts(FrameButton.text)
      else
        FrameButton.text:SetFont(globalFont, 12)
        FrameButton.text:SetTextColor(248/255, 248/255, 248/255)
        FrameButton.text:SetShadowColor(0, 0, 0)
        FrameButton.text:SetShadowOffset(1, -1)
      end
    FrameButton:SetScript("OnClick", function()
    C_WowTokenPublic.UpdateMarketPrice()
      C_Timer.After(0.5, function()
        local AddonVersion = GetAddOnMetadata("AbyssUI", "Version")
        print(L["|cfff2dc7fAbyssUI Daily Info|r"])
        if C_WowTokenPublic.GetCurrentMarketPrice() ~= nil then
          print("|cfff2dc7f"..fichaString..": |r" .. GetMoneyString(C_WowTokenPublic.GetCurrentMarketPrice()))
        else
          print("|cfff2dc7f"..fichaString..": |r"..L["Not available right now!"])
        end
        if (AbyssUIAddonSettings.ExtraFunctionAmericanClock == true) then
          print("|cfff2dc7f"..L["Current Time"].."|r " .. date("%H:%M |cffffcc00%m/%d/%y|r "))
        else
          print("|cfff2dc7f"..L["Current Time"].."|r " .. date("%H:%M |cffffcc00%d/%m/%y|r "))
        end
        if (GetWoWVersion > 31400) then
          local HonorLevel = UnitHonorLevel("player")
          print("|cfff2dc7f"..L["Honor Level"]..": |r|cffffcc00"..HonorLevel.."|r")
        end
        print(L["|cfff2dc7fWoW Version"]..": |r|cffffcc00" .. select(1, GetBuildInfo()) .."|r".." ".."("..(GetWoWVersion)..")")
        print(L["|cfff2dc7fAbyssUI Version"]..": |r|cffffcc00" .. AddonVersion .. "|r")
        print(L["|cfff2dc7fEnjoying AbyssUI? |rRecommend to a friend!"])
        print(L["|cfff2dc7fBuy me a coffee!|r"].." -> ko-fi.com/yugensan")
      end)
    end)
  end)
  -- Reload --
  local f = CreateFrame("Frame", nil)
  f:RegisterEvent("PLAYER_ENTERING_WORLD")
  f:SetScript("OnEvent", function() 
    local FrameButton = CreateFrame("Button","$parentExtraReloadInterfaceButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
    FrameButton:SetHeight(30)
    FrameButton:SetWidth(140)
    FrameButton:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", -200, -250)
    FrameButton.text = FrameButton.text or FrameButton:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
    --FrameButton.text:SetFont(globalFont, 14)
    FrameButton.text:SetPoint("CENTER", FrameButton, "CENTER", 0, -1)
    FrameButton.text:SetText(L["Reload UI"])
      if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
        AbyssUI_ApplyFonts(FrameButton.text)
      else
        FrameButton.text:SetFont(globalFont, 12)
        FrameButton.text:SetTextColor(248/255, 248/255, 248/255)
        FrameButton.text:SetShadowColor(0, 0, 0)
        FrameButton.text:SetShadowOffset(1, -1)
      end
    FrameButton:SetScript("OnClick", function()
      ReloadUI()
    end)
  end)
  -- Discord --
  local f = CreateFrame("Frame", nil)
  f:RegisterEvent("PLAYER_ENTERING_WORLD")
  f:SetScript("OnEvent", function() 
    local FrameButton = CreateFrame("Button","$parentExtraDiscordButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
    FrameButton:SetHeight(30)
    FrameButton:SetWidth(140)
    FrameButton:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 0, -250)
    FrameButton.text = FrameButton.text or FrameButton:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
    --FrameButton.text:SetFont(globalFont, 14)
    FrameButton.text:SetPoint("CENTER", FrameButton, "CENTER", 0, -1)
    FrameButton.text:SetText("Discord")
      if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
        AbyssUI_ApplyFonts(FrameButton.text)
      else
        FrameButton.text:SetFont(globalFont, 12)
        FrameButton.text:SetTextColor(248/255, 248/255, 248/255)
        FrameButton.text:SetShadowColor(0, 0, 0)
        FrameButton.text:SetShadowOffset(1, -1)
      end
    FrameButton:SetScript("OnClick", function()
        AbyssUI_EditBox:SetText("offline")
        AbyssUI_EditBox_Frame:Show()
    end)
  end)
  -- Chat Commands
  local f = CreateFrame("Frame", nil)
  f:RegisterEvent("PLAYER_ENTERING_WORLD")
  f:SetScript("OnEvent", function() 
    local FrameButton = CreateFrame("Button","$parentExtraTwitchButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
    FrameButton:SetHeight(30)
    FrameButton:SetWidth(140)
    FrameButton:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 200, -250)
    FrameButton.text = FrameButton.text or FrameButton:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
    --FrameButton.text:SetFont(globalFont, 14)
    FrameButton.text:SetPoint("CENTER", FrameButton, "CENTER", 0, -1)
    FrameButton.text:SetText(L["Chat Commands"])
      if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
        AbyssUI_ApplyFonts(FrameButton.text)
      else
        FrameButton.text:SetFont(globalFont, 12)
        FrameButton.text:SetTextColor(248/255, 248/255, 248/255)
        FrameButton.text:SetShadowColor(0, 0, 0)
        FrameButton.text:SetShadowOffset(1, -1)
      end
    FrameButton:SetScript("OnClick", function()
      print(L["|cfff2dc7fAbyssUI Command List|r"])
      print(L["|cfff2dc7fType /abyssui |r|cffffcc00'command name'|r"])
      print(L["/abyssui |cffffcc00config|r ~configuration panel"])
      print(L["/abyssui |cffffcc00setup|r ~show the setup frame"])
      print(L["/abyssui |cffffcc00reset|r ~reset UI frames to default positions"])
      print(L["/abyssui |cffffcc00daily|r ~daily info"])
      print(L["/abyssui |cffffcc00reload|r ~reload the interface"])
      print(L["/abyssui |cffffcc00more|r ~for more commands"])
    end)
  end)
  -- Donate
  local f = CreateFrame("Frame", nil)
  f:RegisterEvent("PLAYER_ENTERING_WORLD")
  f:SetScript("OnEvent", function() 
    local FrameButton = CreateFrame("Button","$parentExtraPaypalButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
    FrameButton:SetHeight(30)
    FrameButton:SetWidth(140)
    FrameButton:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", -200, -300)
    FrameButton.text = FrameButton.text or FrameButton:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
    --FrameButton.text:SetFont(globalFont, 14)
    FrameButton.text:SetPoint("CENTER", FrameButton, "CENTER", 0, -1)
    FrameButton.text:SetText("Ko-fi")
    if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
      AbyssUI_ApplyFonts(FrameButton.text)
    else
      FrameButton.text:SetFont(globalFont, 12)
      FrameButton.text:SetTextColor(248/255, 248/255, 248/255)
      FrameButton.text:SetShadowColor(0, 0, 0)
      FrameButton.text:SetShadowOffset(1, -1)
    end
    FrameButton:SetScript("OnClick", function()
        AbyssUI_EditBox:SetText("ko-fi.com/yugensan")
        AbyssUI_EditBox_Frame:Show()
    end)
  end)
  -- Donators
  local f = CreateFrame("Frame", nil)
  f:RegisterEvent("PLAYER_ENTERING_WORLD")
  f:SetScript("OnEvent", function() 
    local FrameButton = CreateFrame("Button","$parentBuyCoffeeButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
    FrameButton:SetHeight(30)
    FrameButton:SetWidth(140)
    FrameButton:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 0, -300)
    FrameButton.text = FrameButton.text or FrameButton:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
    FrameButton.text:SetPoint("CENTER", FrameButton, "CENTER", 0, -1)
    FrameButton.text:SetFont(globalFont, 13)
    FrameButton.text:SetTextColor(232/255, 201/255, 121/255)
    FrameButton.text:SetText(L["Donate"])
    -- animation
    FrameButton.GlowTexture = FrameButton:CreateTexture(nil, "OVERLAY", "UIPanelButtonHighlightTexture")
    FrameButton.GlowTexture:SetAllPoints()
    FrameButton.GlowTexture:Hide()
    FrameButton.Glow = FrameButton:CreateAnimationGroup()
    FrameButton.Glow:SetLooping("REPEAT")
    local anim = FrameButton.Glow:CreateAnimation("Alpha")
    anim:SetChildKey("GlowTexture")
    anim:SetOrder(1)
    anim:SetFromAlpha(0)
    anim:SetToAlpha(1)
    anim:SetDuration(0.5)
    anim = FrameButton.Glow:CreateAnimation("Alpha")
    anim:SetOrder(2)
    anim:SetChildKey("GlowTexture")
    anim:SetFromAlpha(1)
    anim:SetToAlpha(0)
    anim:SetDuration(0.5)
    FrameButton.Glow:SetScript("OnPlay", function(self)
      self:GetParent().GlowTexture:Show()
    end)
    FrameButton.Glow:SetScript("OnStop", function(self)
      self:GetParent().GlowTexture:Hide()
    end)
    if not FrameButton.running then
      FrameButton.running = true
      FrameButton.Glow:Play()
    else
      FrameButton.running = false
      FrameButton.Glow:Stop()
    end
    if(not FrameButton:IsShown()) then
      FrameButton.Glow:Stop()
    end
    FrameButton:SetScript("OnClick", function()
      AbyssUI_EditBoxPatreon:SetText(L["|cfff2dc7fDonations will appear in the 'Donators' tab as a rank. Thank you very much, confirm to get the link|r"])
      AbyssUI_EditBoxPatreon_Frame:Show()
    end)
    --for i, v in pairs({
      --TopAbyssUI_ConfigBuyCoffeeButton.Right,
      --TopAbyssUI_ConfigBuyCoffeeButton.Middle,
      --TopAbyssUI_ConfigBuyCoffeeButton.Left,
    --}) do
      --v:SetVertexColor(232/255, 201/255, 121/255)
    --end
  end)
  -- Github
  local f = CreateFrame("Frame", nil)
  f:RegisterEvent("PLAYER_ENTERING_WORLD")
  f:SetScript("OnEvent", function() 
    local FrameButton = CreateFrame("Button","$parentExtraGitButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
    FrameButton:SetHeight(30)
    FrameButton:SetWidth(140)
    FrameButton:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 200, -300)
    FrameButton.text = FrameButton.text or FrameButton:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
    --FrameButton.text:SetFont(globalFont, 14)
    FrameButton.text:SetPoint("CENTER", FrameButton, "CENTER", 0, -1)
    FrameButton.text:SetText("Github")
      if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
        AbyssUI_ApplyFonts(FrameButton.text)
      else
        FrameButton.text:SetFont(globalFont, 12)
        FrameButton.text:SetTextColor(248/255, 248/255, 248/255)
        FrameButton.text:SetShadowColor(0, 0, 0)
        FrameButton.text:SetShadowOffset(1, -1)
      end
    FrameButton:SetScript("OnClick", function()
        AbyssUI_EditBox:SetText("https://github.com/YugenMori/AbyssUI")
        AbyssUI_EditBox_Frame:Show()
    end)
  end)
  ----------------------------- AbyssUI Info Panel -------------------------------
  --- Images ---
  -- SubText
  --[[
  if (GetWoWVersion <= 90500) then
    local InfoPanelSubText = CreateFrame("Frame","$parentInfoPanelSubText", AbyssUI_Config.childpanel1)
    InfoPanelSubText:SetPoint("TOPLEFT", 20, -40)
    InfoPanelSubText:SetHeight(60)
    InfoPanelSubText:SetWidth(600)
    InfoPanelSubText:SetScale(1)
    InfoPanelSubText = InfoPanelSubText:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    InfoPanelSubText:SetPoint("LEFT")
    InfoPanelSubText:SetAllPoints()
    InfoPanelSubText:SetText(L["In this page you can find links to some other AddOns/Packs that make AbyssUI even better." ..
    "These addons are verify to especially work with AbyssUI without any conflict or problem."..
    "Click on the image so you can get the respective link. Don't forget to check then out!"])

    --- Frames and Boxes ---
    -- AbyssUI_TexturePack
    local AbyssUI_TexturePack = CreateFrame("Frame", "$parentAbyssUI_TexturePack", AbyssUI_Config.childpanel1)
    AbyssUI_TexturePack:SetFrameStrata("HIGH")
    AbyssUI_TexturePack:SetHeight(256)
    AbyssUI_TexturePack:SetWidth(256)
    AbyssUI_TexturePack:SetPoint("TOP", 0, -120)
    local t = AbyssUI_TexturePack:CreateFrame(nil, "HIGH", nil)
    t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\AbyssUITexturePackLogo2x2")
    t:SetAllPoints(AbyssUI_TexturePack)
    -- Check Icon
    local CheckIcon_TexturePack = CreateFrame("Frame", "$parentCheckIcon_TexturePack", AbyssUI_TexturePack)
    CheckIcon_TexturePack:SetFrameStrata("HIGH")
    CheckIcon_TexturePack:SetHeight(32)
    CheckIcon_TexturePack:SetWidth(32)
    CheckIcon_TexturePack:SetPoint("TOPRIGHT", 5, 10)
    local t = CheckIcon_TexturePack:CreateFrame(nil, "HIGH", nil)
    t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\checkIcon")
    t:SetAllPoints(CheckIcon_TexturePack)
    CheckIcon_TexturePack:Hide()
    -- Download Icon
    local DownloadIcon_TexturePack = CreateFrame("Frame", "$parentDownloadIcon_TexturePack", AbyssUI_TexturePack)
    DownloadIcon_TexturePack:SetFrameStrata("HIGH")
    DownloadIcon_TexturePack:SetHeight(32)
    DownloadIcon_TexturePack:SetWidth(128)
    DownloadIcon_TexturePack:SetPoint("TOPRIGHT", 20, 35)
    local t = DownloadIcon_TexturePack:CreateFrame(nil, "HIGH", nil)
    t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\downloadIcon")
    t:SetAllPoints(DownloadIcon_TexturePack)
    DownloadIcon_TexturePack:Hide()
    -- OnClick
    AbyssUI_TexturePack:SetScript("OnMouseDown", function (self, button)
        if (button == 'LeftButton') then 
         AbyssUI_EditBoxPatreon:SetText(L["|cfff2dc7fDonations will appear in the 'Donators' tab as a rank. Thank you very much, confirm to get the link|r"])
         AbyssUI_EditBoxPatreon_Frame:Show()
        end
    end)
    -- Glass
    local Glass = CreateFrame("Frame", "$parentGlass", AbyssUI_Config.childpanel1)
    Glass:SetFrameStrata("HIGH")
    Glass:SetHeight(128)
    Glass:SetWidth(128)
    Glass:SetPoint("BOTTOMLEFT", 20, 20)
    local t = Glass:CreateTexture(nil, "HIGH", nil)
    t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\Glass")
    t:SetAllPoints(Glass)
    -- Check Icon
    local CheckIcon_Glass = CreateFrame("Frame", "$parentCheckIcon_Glass", Glass)
    CheckIcon_Glass:SetFrameStrata("HIGH")
    CheckIcon_Glass:SetHeight(32)
    CheckIcon_Glass:SetWidth(32)
    CheckIcon_Glass:SetPoint("TOPRIGHT", 5, 10)
    local t = CheckIcon_Glass:CreateTexture(nil, "HIGH", nil, nil)
    t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\checkIcon")
    t:SetAllPoints(CheckIcon_Glass)
    CheckIcon_Glass:Hide()
    -- OnClick
    Glass:SetScript("OnMouseDown", function (self, button)
        if (button == 'LeftButton') then
          AbyssUI_EditBox:SetText("curseforge.com/wow/addons/glass")
          AbyssUI_EditBox_Frame:Show()
        end
    end)
    -- Kui Nameplates
    local KuiNameplates = CreateFrame("Frame", "$parentKuiNameplates", AbyssUI_Config.childpanel1)
    KuiNameplates:SetFrameStrata("HIGH")
    KuiNameplates:SetHeight(128)
    KuiNameplates:SetWidth(128)
    KuiNameplates:SetPoint("BOTTOM", -80, 20)
    local t = KuiNameplates:CreateTexture(nil, "HIGH", nil)
    t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\KuiNameplates")
    t:SetAllPoints(KuiNameplates)
    -- Check Icon
    local CheckIcon_Kui = CreateFrame("Frame", "$parentCheckIcon_Kui", KuiNameplates)
    CheckIcon_Kui:SetFrameStrata("HIGH")
    CheckIcon_Kui:SetHeight(32)
    CheckIcon_Kui:SetWidth(32)
    CheckIcon_Kui:SetPoint("TOPRIGHT", 5, 10)
    local t = CheckIcon_Kui:CreateTexture(nil, "HIGH", nil)
    t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\checkIcon")
    t:SetAllPoints(CheckIcon_Kui)
    CheckIcon_Kui:Hide()
    -- OnClick
    KuiNameplates:SetScript("OnMouseDown", function (self, button)
        if (button == 'LeftButton') then
          AbyssUI_EditBox:SetText("curseforge.com/wow/addons/Kuinameplates")
          AbyssUI_EditBox_Frame:Show()
        end
    end)
    -- Bagnon
    local Bagnon = CreateFrame("Frame", "$parentBagnon", AbyssUI_Config.childpanel1)
    Bagnon:SetFrameStrata("HIGH")
    Bagnon:SetHeight(128)
    Bagnon:SetWidth(128)
    Bagnon:SetPoint("BOTTOM", 80, 20)
    local t = Bagnon:CreateTexture(nil, "HIGH", nil)
    t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\Bagnon")
    t:SetAllPoints(Bagnon)
    -- Check Icon
    local CheckIcon_Bagnon = CreateFrame("Frame", "$parentCheckIcon_Bagnon", Bagnon)
    CheckIcon_Bagnon:SetFrameStrata("HIGH")
    CheckIcon_Bagnon:SetHeight(32)
    CheckIcon_Bagnon:SetWidth(32)
    CheckIcon_Bagnon:SetPoint("TOPRIGHT", 5, 10)
    local t = CheckIcon_Bagnon:CreateTexture(nil, "HIGH", nil)
    t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\checkIcon")
    t:SetAllPoints(CheckIcon_Bagnon)
    CheckIcon_Bagnon:Hide()
    -- OnClick
    Bagnon:SetScript("OnMouseDown", function (self, button)
        if (button == 'LeftButton') then
          AbyssUI_EditBox:SetText("curseforge.com/wow/addons/Bagnon")
          AbyssUI_EditBox_Frame:Show()
        end
    end)
    -- DBM
    local DBM = CreateFrame("Frame", "$parentDBM", AbyssUI_Config.childpanel1)
    DBM:SetFrameStrata("HIGH")
    DBM:SetHeight(128)
    DBM:SetWidth(128)
    DBM:SetPoint("BOTTOMRIGHT", -20, 20)
    local t = DBM:CreateTexture(nil, "HIGH", nil)
    t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\DBM")
    t:SetAllPoints(DBM)
    -- Check Icon
    local CheckIcon_DBM = CreateFrame("Frame", "$parentCheckIcon_DBM", DBM)
    CheckIcon_DBM:SetFrameStrata("HIGH")
    CheckIcon_DBM:SetHeight(32)
    CheckIcon_DBM:SetWidth(32)
    CheckIcon_DBM:SetPoint("TOPRIGHT", 5, 10)
    local t = CheckIcon_DBM:CreateTexture(nil, "HIGH", nil)
    t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\checkIcon")
    t:SetAllPoints(CheckIcon_DBM)
    CheckIcon_DBM:Hide()
    -- OnClick
    DBM:SetScript("OnMouseDown", function (self, button)
        if (button == 'LeftButton') then
          AbyssUI_EditBox:SetText("curseforge.com/wow/addons/deadly-boss-mods")
          AbyssUI_EditBox_Frame:Show()
        end
    end)
    -- CheckFunction
    local Check = CreateFrame("Frame")
    Check:RegisterEvent("PLAYER_ENTERING_WORLD")
    Check:SetScript("OnEvent", function(self, event, arg1)
    local glass   = IsAddOnLoaded("Glass")
    local kui     = IsAddOnLoaded("Kui_Nameplates")
    local bagnon  = IsAddOnLoaded("Bagnon")
    local dbm     = IsAddOnLoaded("DBM-Core")
        if (glass == true) then
          CheckIcon_Glass:Show()
        end
        if (kui == true) then
          CheckIcon_Kui:Show()
        end
        if (bagnon == true) then
          CheckIcon_Bagnon:Show()
        end
        if (dbm == true) then
          CheckIcon_DBM:Show()
        end
    end)
  end
  --]]
end
-- End
------------------------------- Hide Elements ---------------------------------
local function HideElementsInit()
  local PSINFOHide_CheckButton = CreateFrame("Frame","$parentPSINFOHide_CheckButton", AbyssUI_Config.childpanel2)
  PSINFOHide_CheckButton:SetPoint("BOTTOMLEFT", AbyssUI_Config.childpanel2, "BOTTOMLEFT", 10, 20)
  PSINFOHide_CheckButton:SetHeight(40)
  PSINFOHide_CheckButton:SetWidth(600)
  PSINFOHide_CheckButton = PSINFOHide_CheckButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  PSINFOHide_CheckButton:SetPoint("LEFT")
  PSINFOHide_CheckButton:SetAllPoints()
  PSINFOHide_CheckButton:SetText(L["The symbol (*) in some options means that there is important information/instructions to be read. "..
    "Options with a different color are recommended settings (based on your choice in the setup)."])
  -- MicroMenu/Bags --
  local MicroMenu_CheckButton = CreateFrame("CheckButton", "$parentMicroMenu_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  MicroMenu_CheckButton:SetPoint("TOPLEFT", 10, -80)
  MicroMenu_CheckButton.Text:SetText(L["Hide MicroMenu"])
  MicroMenu_CheckButton.tooltip = L["Hide the ActionBar MicroMenu (Bags Bar)"]
  MicroMenu_CheckButton:SetChecked(AbyssUIAddonSettings.HideMicroMenu)
  --  Hide
  local function AbyssUI_HideMicroMenu_Function()
    for i, v in pairs({ MicroButtonAndBagsBar.MicroBagBar,
      MicroButtonAndBagsBar,
      MainMenuBarPerformanceBar,
      MainMenuMicroButton,
      EJMicroButton,
      CollectionsMicroButton,
      LFDMicroButton,
      GuildMicroButton,
      QuestLogMicroButton,
      TalentMicroButton,
      SpellbookMicroButton,
      CharacterMicroButton, }) do
      v:Hide()
      AchievementMicroButton:SetAlpha(0)
      StoreMicroButton:SetAlpha(0)
    end
  end
  -- Show
  local function AbyssUI_ShowMicroMenu_Function()
    if (GetWoWVersion > 12400) then
      for i, v in pairs({ MicroButtonAndBagsBar.MicroBagBar,
        MicroButtonAndBagsBar,
        MainMenuBarPerformanceBar,
        MainMenuMicroButton,
        EJMicroButton,
        CollectionsMicroButton,
        LFDMicroButton,
        GuildMicroButton,
        QuestLogMicroButton,
        TalentMicroButton,
        SpellbookMicroButton,
        CharacterMicroButton, }) do
        v:Show()
        AchievementMicroButton:SetAlpha(1)
        StoreMicroButton:SetAlpha(1)
      end
    end
  end
  -- OnClick Function
  MicroMenu_CheckButton:SetScript("OnClick", function(self)
  if (GetWoWVersion > 30600) then
    AbyssUIAddonSettings.HideMicroMenu = self:GetChecked()
    if AbyssUIAddonSettings.HideMicroMenu == true then
      AbyssUI_HideMicroMenu_Function()
    else
      AbyssUI_ShowMicroMenu_Function()
    end
   else 
      UIErrorsFrame:AddMessage(L["Not available in this version of WoW!"], 1.0, 0.1, 0.1, 1.0)
      MicroMenu_CheckButton:SetChecked(nil)
   end
  end)
  -- After Login/Reload
  MicroMenu_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  MicroMenu_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (GetWoWVersion > 30600) then
      if (event == "PLAYER_ENTERING_WORLD") then
        if AbyssUIAddonSettings.HideMicroMenu == true then
          AbyssUI_HideMicroMenu_Function()
        else
          AbyssUI_ShowMicroMenu_Function()
        end
      end
    end
  end)
  -- Gryphons Option --
  local Gryphons_CheckButton = CreateFrame("CheckButton", "$parentGryphons_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  Gryphons_CheckButton:SetPoint("TOPLEFT", 10, -110)
  Gryphons_CheckButton.Text:SetText(L["Hide Gryphons"])
  Gryphons_CheckButton.tooltip = L["Hide the ActionBar Gryphons"]
  Gryphons_CheckButton:SetChecked(AbyssUIAddonSettings.HideGryphons)
  -- OnClick Function
  Gryphons_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.HideGryphons = self:GetChecked()
if (GetWoWVersion >= 30600 and GetWoWVersion <= 90500) then
        if AbyssUIAddonSettings.HideGryphons == true then
          MainMenuBarArtFrame.RightEndCap:Hide()
          MainMenuBarArtFrame.LeftEndCap:Hide()
        else
          MainMenuBarArtFrame.RightEndCap:Show()
          MainMenuBarArtFrame.LeftEndCap:Show()
        end
      else
        if (GetWoWVersion <= 90500) then
          if AbyssUIAddonSettings.HideGryphons == true then
            MainMenuBarLeftEndCap:Hide()
            MainMenuBarRightEndCap:Hide()
          else
            MainMenuBarLeftEndCap:Show()
            MainMenuBarRightEndCap:Show()
          end
        end
      end
      if (GetWoWVersion >= 90500) then
        if AbyssUIAddonSettings.HideGryphons == true then
          MainMenuBar.EndCaps.RightEndCap:Hide()
          MainMenuBar.EndCaps.LeftEndCap:Hide()
        else
          MainMenuBar.EndCaps.RightEndCap:Show()
          MainMenuBar.EndCaps.LeftEndCap:Show()
        end
      else
        if (GetWoWVersion >= 90500) then
          if AbyssUIAddonSettings.HideGryphons == true then
            MainMenuBar.EndCaps.LeftEndCap:Hide()
            MainMenuBar.EndCaps.RightEndCap:Hide()
          else
            MainMenuBar.EndCaps.LeftEndCap:Show()
            MainMenuBar.EndCaps.RightEndCap:Show()
          end
        end
      end
  end)
  -- After Login/Reload
  Gryphons_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  Gryphons_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if (GetWoWVersion >= 30600 and GetWoWVersion <= 90500) then
        if AbyssUIAddonSettings.HideGryphons == true then
          MainMenuBarArtFrame.RightEndCap:Hide()
          MainMenuBarArtFrame.LeftEndCap:Hide()
        else
          MainMenuBarArtFrame.RightEndCap:Show()
          MainMenuBarArtFrame.LeftEndCap:Show()
        end
      else
        if (GetWoWVersion <= 90500) then
          if AbyssUIAddonSettings.HideGryphons == true then
            MainMenuBarLeftEndCap:Hide()
            MainMenuBarRightEndCap:Hide()
          else
            MainMenuBarLeftEndCap:Show()
            MainMenuBarRightEndCap:Show()
          end
        end
      end
      if (GetWoWVersion >= 90500) then
        if AbyssUIAddonSettings.HideGryphons == true then
          MainMenuBar.EndCaps.RightEndCap:Hide()
          MainMenuBar.EndCaps.LeftEndCap:Hide()
        else
          MainMenuBar.EndCaps.RightEndCap:Show()
          MainMenuBar.EndCaps.LeftEndCap:Show()
        end
      else
        if (GetWoWVersion >= 90500) then
          if AbyssUIAddonSettings.HideGryphons == true then
            MainMenuBar.EndCaps.LeftEndCap:Hide()
            MainMenuBar.EndCaps.RightEndCap:Hide()
          else
            MainMenuBar.EndCaps.LeftEndCap:Show()
            MainMenuBar.EndCaps.RightEndCap:Show()
          end
        end
      end
    end
  end)
  -- Minimap
  local Minimap_CheckButton = CreateFrame("CheckButton", "$parentMinimap_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  Minimap_CheckButton:SetPoint("TOPLEFT", 10, -140)
  Minimap_CheckButton.Text:SetText(L["Hide Minimap"])
  Minimap_CheckButton.tooltip = L["Hide the Game Minimap"]
  Minimap_CheckButton:SetChecked(AbyssUIAddonSettings.HideMinimap)
  -- OnClick Function
  Minimap_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.HideMinimap = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- After Login/Reload
  Minimap_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  Minimap_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if AbyssUIAddonSettings.HideMinimap == true then
        MinimapCluster:Hide()
      else
        MinimapCluster:Show()
      end
    end
  end)
  -- Objective Tracker --
  local ObjTracker_CheckButton = CreateFrame("CheckButton", "$parentObjTracker_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  ObjTracker_CheckButton:SetPoint("TOPLEFT", 10, -170)
  ObjTracker_CheckButton.Text:SetText(L["Hide Objective Tracker"])
  ObjTracker_CheckButton.tooltip = L["Hide the Objective Tracker (Quest Frame)"]
  ObjTracker_CheckButton:SetChecked(AbyssUIAddonSettings.HideObjectiveTracker)
  -- OnClick Function
  ObjTracker_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.HideObjectiveTracker = self:GetChecked()
    if (GetWoWVersion > 30600) then
        if AbyssUIAddonSettings.HideObjectiveTracker == true then
          ObjectiveTrackerFrame:Hide()
        else
          ObjectiveTrackerFrame:Show()
        end
      elseif (GetWoWVersion < 20600) then
        if AbyssUIAddonSettings.HideObjectiveTracker == true then
          QuestWatchFrame:Hide()
        else
          QuestWatchFrame:Show()
        end
      else
        if AbyssUIAddonSettings.HideObjectiveTracker == true then
          WatchFrame:Hide()
        else
          WatchFrame:Show()
        end 
      end
  end)
  -- After Login/Reload
  ObjTracker_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  ObjTracker_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if (GetWoWVersion > 30600) then
        if AbyssUIAddonSettings.HideObjectiveTracker == true then
          ObjectiveTrackerFrame:Hide()
        else
          ObjectiveTrackerFrame:Show()
        end
      elseif (GetWoWVersion < 20600) then
        if AbyssUIAddonSettings.HideObjectiveTracker == true then
          QuestWatchFrame:Hide()
        else
          QuestWatchFrame:Show()
        end
      else
        if AbyssUIAddonSettings.HideObjectiveTracker == true then
          WatchFrame:Hide()
        else
          WatchFrame:Show()
        end 
      end
    end
  end)
  -- Hide FPS/MS Frame --
  local FPSMSFrame_CheckButton = CreateFrame("CheckButton", "$parentFPSMSFrame_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  FPSMSFrame_CheckButton:SetPoint("TOPLEFT", 10, -200)
  FPSMSFrame_CheckButton.Text:SetText(L["Hide FPS/MS Frame"])
  FPSMSFrame_CheckButton.tooltip = L["Hide the fps/ms frame (bottomleft)"]
  FPSMSFrame_CheckButton:SetChecked(AbyssUIAddonSettings.HideFPSMSFrame)
  addonTable.FPSMSFrame = FPSMSFrame_CheckButton
  -- OnClick Function
  FPSMSFrame_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.HideFPSMSFrame = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- YouDied LevelUp Frame --
  local YouDiedLevelUpFrame_CheckButton = CreateFrame("CheckButton", "$parentYouDiedLevelUpFrame_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  YouDiedLevelUpFrame_CheckButton:SetPoint("TOPLEFT", 10, -230)
  YouDiedLevelUpFrame_CheckButton.Text:SetText(L["Hide YouDied/LevelUp Frame"])
  YouDiedLevelUpFrame_CheckButton.tooltip = L["Hide the 'You Died' and 'Level Up' frame when you"..
  " die/level in the game"]
  YouDiedLevelUpFrame_CheckButton:SetChecked(AbyssUIAddonSettings.HideYouDiedLevelUpFrame)
  addonTable.YouDiedLevelUpFrame = YouDiedLevelUpFrame_CheckButton
  -- OnClick Function
  YouDiedLevelUpFrame_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.HideYouDiedLevelUpFrame = self:GetChecked()
  end)
  -- Hide Macro Labels --
  local HideMacroLabels_CheckButton = CreateFrame("CheckButton", "$parentHideMacroLabels_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  HideMacroLabels_CheckButton:SetPoint("TOPLEFT", 10, -260)
  HideMacroLabels_CheckButton.Text:SetText(L["Hide Macro Labels"])
  HideMacroLabels_CheckButton.tooltip = L["Hide Macro Labels from Action Bar"]
  HideMacroLabels_CheckButton:SetChecked(AbyssUIAddonSettings.HideMacroLabels)
  -- OnClick Function
  HideMacroLabels_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.HideMacroLabels = self:GetChecked()
    if (AbyssUIAddonSettings.HideMacroLabels == true) then
      for i = 1, 12 do
        _G["ActionButton"..i.."Name"]:SetAlpha(0)
        _G["MultiBarBottomRightButton"..i.."Name"]:SetAlpha(0)
        _G["MultiBarBottomLeftButton"..i.."Name"]:SetAlpha(0)
        _G["MultiBarRightButton"..i.."Name"]:SetAlpha(0)
        --_G["MultibarLeftButton"..i.."Name"]:SetAlpha(0)
      end
    else
      for i = 1, 12 do
        _G["ActionButton"..i.."Name"]:SetAlpha(1)
        _G["MultiBarBottomRightButton"..i.."Name"]:SetAlpha(1)
        _G["MultiBarBottomLeftButton"..i.."Name"]:SetAlpha(1)
        _G["MultiBarRightButton"..i.."Name"]:SetAlpha(1)
      --_G["MultibarLeftButton"..i.."Name"]:SetAlpha(1)
      end
    end
  end)
  -- After Login/Reload
  HideMacroLabels_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  HideMacroLabels_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if AbyssUIAddonSettings.HideMacroLabels == true then
        for i = 1, 12 do
          _G["ActionButton"..i.."Name"]:SetAlpha(0)
          _G["MultiBarBottomRightButton"..i.."Name"]:SetAlpha(0)
          _G["MultiBarBottomLeftButton"..i.."Name"]:SetAlpha(0)
          _G["MultiBarRightButton"..i.."Name"]:SetAlpha(0)
          --_G["MultibarLeftButton"..i.."Name"]:SetAlpha(0)
        end
      end
    end
  end)
  -- Hide Hotkeys --
  local HideHotkeysLabels_CheckButton = CreateFrame("CheckButton", "$parentHideHotkeysLabels_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  HideHotkeysLabels_CheckButton:SetPoint("TOPLEFT", 10, -290)
  HideHotkeysLabels_CheckButton.Text:SetText(L["Hide Hotkeys Labels"])
  HideHotkeysLabels_CheckButton.tooltip = L["Hide Hotkeys Labels from Action Bar"]
  HideHotkeysLabels_CheckButton:SetChecked(AbyssUIAddonSettings.HideHotkeysLabels)
  -- OnClick Function
  HideHotkeysLabels_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.HideHotkeysLabels = self:GetChecked()
     if (AbyssUIAddonSettings.HideHotkeysLabels == true) then
       for i = 1, 12 do
         _G["ActionButton"..i.."HotKey"]:SetAlpha(0)
         _G["MultiBarBottomRightButton"..i.."HotKey"]:SetAlpha(0)
         _G["MultiBarBottomLeftButton"..i.."HotKey"]:SetAlpha(0)
         _G["MultiBarRightButton"..i.."HotKey"]:SetAlpha(0)
         --_G["MultibarLeftButton"..i.."HotKey"]:SetAlpha(0)
       end
     else
       for i = 1, 12 do
         _G["ActionButton"..i.."HotKey"]:SetAlpha(1)
         _G["MultiBarBottomRightButton"..i.."HotKey"]:SetAlpha(1)
         _G["MultiBarBottomLeftButton"..i.."HotKey"]:SetAlpha(1)
         _G["MultiBarRightButton"..i.."HotKey"]:SetAlpha(1)
       --_G["MultibarLeftButton"..i.."HotKey"]:SetAlpha(1)
       end
     end
  end)
  -- After Login/Reload
  HideHotkeysLabels_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  HideHotkeysLabels_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if AbyssUIAddonSettings.HideHotkeysLabels == true then
        for i = 1, 12 do
          _G["ActionButton"..i.."HotKey"]:SetAlpha(0)
          _G["MultiBarBottomRightButton"..i.."HotKey"]:SetAlpha(0)
          _G["MultiBarBottomLeftButton"..i.."HotKey"]:SetAlpha(0)
          _G["MultiBarRightButton"..i.."HotKey"]:SetAlpha(0)
          --_G["MultibarLeftButton"..i.."HotKey"]:SetAlpha(0)
        end
      end
    end
  end)
  -- Hide StanceBar
  local HideStanceBar_CheckButton = CreateFrame("CheckButton", "$parentHideStanceBar_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  HideStanceBar_CheckButton:SetPoint("TOPLEFT", 10, -320)
  HideStanceBar_CheckButton.Text:SetText(L["Hide Stance Bar"])
  HideStanceBar_CheckButton.tooltip = L["Hide the Stance Bar (Druid forms, Rogue stealth, etc)"]
  HideStanceBar_CheckButton:SetChecked(AbyssUIAddonSettings.HideStanceBar)
  -- OnClick Function
  HideStanceBar_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.HideStanceBar = self:GetChecked()
     if (AbyssUIAddonSettings.HideStanceBar == true) then
       StanceBar:SetAlpha(0)
     else
       return nil
     end
  end)
  -- After Login/Reload
  HideStanceBar_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  HideStanceBar_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if AbyssUIAddonSettings.HideStanceBar == true then
        C_Timer.After(0.5, function()
          StanceBar:SetAlpha(0)
        end)
      end
    end
  end)
  -- Chat Hide Frame (needs to be here so the hide chat buttons works on this too)
  -- Thanks to Syncrow for part of this 
  local AbyssUI_ChatHideFrame = CreateFrame("Button", "$parentChatHideFrame", UIParent)
  AbyssUI_ChatHideFrame:SetSize(30, 30)
  AbyssUI_ChatHideFrame.t = AbyssUI_ChatHideFrame:CreateTexture(nil, "BORDER")
  AbyssUI_ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
  AbyssUI_ChatHideFrame.t:SetAllPoints(AbyssUI_ChatHideFrame)
  AbyssUI_ChatHideFrame:SetPoint("BOTTOM","ChatFrame1ButtonFrame","BOTTOM", 0, -35)
  local glass = IsAddOnLoaded("Glass")
  if (AbyssUIAddonSettings.FadeUI ~= true and glass ~= true) then
    AbyssUI_ChatHideFrame:Show()
  else
    AbyssUI_ChatHideFrame:Hide()
  end

  local ChatHide = false
  AbyssUI_ChatHideFrame:SetScript("OnMouseDown", function(self, Button)
    if ChatHide == false then
      if Button == "LeftButton" then
        AbyssUI_ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Down.blp")
      end
    elseif ChatHide == true then
      if Button == "LeftButton" then
        AbyssUI_ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Maximize-Down.blp")
      end
    end
  end)

  AbyssUI_ChatHideFrame:SetScript("OnMouseUp", function(self, Button)
    if ChatHide == false then
      if Button == "LeftButton" then
        AbyssUI_ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
      end
    elseif ChatHide == true then
      if Button == "LeftButton" then
        AbyssUI_ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Maximize-Up.blp")
      end
    end
  end)

  AbyssUI_ChatHideFrame:SetScript("OnClick", function(self, Button)
    if ChatHide == false then
      AbyssUI_ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Maximize-Up.blp")
      GeneralDockManager:Hide()
      ChatFrameMenuButton:Hide()
      ChatFrameChannelButton:Hide()
      ChatFrame1EditBox:Hide()
      if (GetWoWVersion > 30600) then
        QuickJoinToastButton:Hide()
        ChatFrameToggleVoiceDeafenButton.Icon:Hide()
        ChatFrameToggleVoiceMuteButton.Icon:Hide()
      end
      for i = 1, NUM_CHAT_WINDOWS do
        _G["ChatFrame"..i..""]:SetAlpha(0)
        _G["ChatFrame"..i.."ButtonFrame"]:Hide()
        _G["ChatFrame"..i.."EditBox"]:SetAlpha(0)
      end
      ChatHide = true
    elseif ChatHide == true then
      AbyssUI_ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
      GeneralDockManager:Show()
      ChatFrameMenuButton:Show()
      ChatFrameChannelButton:Show()
      ChatFrame1EditBox:Show()
      if (GetWoWVersion > 30600) then
        QuickJoinToastButton:Show()
        ChatFrameToggleVoiceDeafenButton.Icon:Show()
        ChatFrameToggleVoiceMuteButton.Icon:Show()
      end

      for i = 1 , NUM_CHAT_WINDOWS do
        _G["ChatFrame"..i..""]:SetAlpha(1)
        _G["ChatFrame"..i.."ButtonFrame"]:Show()
        _G["ChatFrame"..i.."EditBox"]:SetAlpha(1)
      end
      ChatHide = false
    end
  end)
  -- Hide Chat Buttons
  local HideChatButtons_CheckButton = CreateFrame("CheckButton", "$parentHideStanceBar_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  HideChatButtons_CheckButton:SetPoint("TOPLEFT", 10, -350)
  HideChatButtons_CheckButton.Text:SetText(L["Hide Chat Buttons"])
  HideChatButtons_CheckButton.tooltip = L["Hide the Chat buttons (voice, social, etc)"]
  HideChatButtons_CheckButton:SetChecked(AbyssUIAddonSettings.HideChatButtons)
  -- OnClick Function
  HideChatButtons_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.HideChatButtons = self:GetChecked()
    if (AbyssUIAddonSettings.HideChatButtons == true) then
      if (GetWoWVersion > 30600) then
        QuickJoinToastButton:Hide()
        ChatFrameToggleVoiceDeafenButton:SetAlpha(0)
        ChatFrameToggleVoiceMuteButton:SetAlpha(0)
      end
      GeneralDockManager:SetAlpha(0)
      ChatFrameMenuButton:Hide()
      ChatFrameChannelButton:Hide()
      ChatFrame1ButtonFrame:SetAlpha(0)
      AbyssUI_ChatHideFrame:Hide()
    else 
      if (GetWoWVersion > 30600) then
        QuickJoinToastButton:Show()
        ChatFrameToggleVoiceDeafenButton:SetAlpha(1)
        ChatFrameToggleVoiceMuteButton:SetAlpha(1)
      end
      GeneralDockManager:SetAlpha(1)
      ChatFrameMenuButton:Show()
      ChatFrameChannelButton:Show()
      ChatFrame1ButtonFrame:SetAlpha(1)
      AbyssUI_ChatHideFrame:Show()
    end
  end)
  -- After Login/Reload
  HideChatButtons_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  HideChatButtons_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if AbyssUIAddonSettings.HideChatButtons == true then
        C_Timer.After(1, function()
          GeneralDockManager:SetAlpha(0)
          ChatFrameMenuButton:Hide()
          ChatFrameChannelButton:Hide()
          ChatFrame1ButtonFrame:SetAlpha(0)
          AbyssUI_ChatHideFrame:Hide()
          if (GetWoWVersion > 30600) then
            QuickJoinToastButton:Hide()
            ChatFrameToggleVoiceDeafenButton:SetAlpha(0)
            ChatFrameToggleVoiceMuteButton:SetAlpha(0)
          end
        end)
      end
    end
  end)
  -- AFKCammeraFrame --
  local AFKCammeraFrame_CheckButton = CreateFrame("CheckButton", "$parentAFKCammeraFrame_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AFKCammeraFrame_CheckButton:SetPoint("TOPLEFT", 10, -380)
  AFKCammeraFrame_CheckButton.Text:SetText(L["Hide AFK Frame"])
  AFKCammeraFrame_CheckButton.tooltip = L["Hide the AFKMode when you are AFK"]
  AFKCammeraFrame_CheckButton:SetChecked(AbyssUIAddonSettings.AFKCammeraFrame)
  -- OnClick Function
  AFKCammeraFrame_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.AFKCammeraFrame = self:GetChecked()
  end)
  -- Faction/PvP/Prestige icon --
  local FactionPvpIcon_CheckButton = CreateFrame("CheckButton", "$parentFactionPvpIcon_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  FactionPvpIcon_CheckButton:SetPoint("TOPLEFT", 10, -410)
  FactionPvpIcon_CheckButton.Text:SetText(L["Hide Faction/PvP/Prestige icon"])
  FactionPvpIcon_CheckButton.tooltip = L["Hide the player frame Faction/PvP/Prestige icon"]
  FactionPvpIcon_CheckButton:SetChecked(AbyssUIAddonSettings.FactionPvpIcon)
  -- OnClick Function
  FactionPvpIcon_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.FactionPvpIcon = self:GetChecked()
      if (AbyssUIAddonSettings.FactionPvpIcon == true) then
        for i, v in pairs ({
          PlayerPrestigeBadge,
          PlayerPrestigePortrait,
          TargetFrameTextureFramePrestigeBadge,
          TargetFrameTextureFramePrestigePortrait,
          FocusFrameTextureFramePrestigeBadge,
          FocusFrameTextureFramePrestigePortrait, }) do
          --v:Hide()
          v:SetAlpha(0)
        end
      else
        for i, v in pairs ({
          PlayerPrestigeBadge,
          PlayerPrestigePortrait,
          TargetFrameTextureFramePrestigeBadge,
          TargetFrameTextureFramePrestigePortrait,
          FocusFrameTextureFramePrestigeBadge,
          FocusFrameTextureFramePrestigePortrait, }) do
          --v:Show()
          v:SetAlpha(1)
        end
      end
  end)
  -- After Login/Reload
  FactionPvpIcon_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  FactionPvpIcon_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if AbyssUIAddonSettings.FactionPvpIcon == true then
        for i, v in pairs ({
          PlayerPrestigeBadge,
          PlayerPrestigePortrait,
          TargetFrameTextureFramePrestigeBadge,
          TargetFrameTextureFramePrestigePortrait,
          FocusFrameTextureFramePrestigeBadge,
          FocusFrameTextureFramePrestigePortrait, }) do
          --v:Hide()
          v:SetAlpha(0)
        end
      else
        for i, v in pairs ({
          PlayerPrestigeBadge,
          PlayerPrestigePortrait,
          TargetFrameTextureFramePrestigeBadge,
          TargetFrameTextureFramePrestigePortrait,
          FocusFrameTextureFramePrestigeBadge,
          FocusFrameTextureFramePrestigePortrait, }) do
          --v:Show()
          v:SetAlpha(1)
        end
      end
    end
  end)
  -- Hide UnitImproved Faction Icons
  local HideUnitImprovedFaction_CheckButton = CreateFrame("CheckButton", "$parentHideUnitImprovedFaction_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  HideUnitImprovedFaction_CheckButton:SetPoint("TOPLEFT", 10, -440)
  HideUnitImprovedFaction_CheckButton.Text:SetText(L["|cfff2dc7fHide UnitImproved Faction Icon|r"])
  HideUnitImprovedFaction_CheckButton.tooltip = L["Hide the Faction Icon (Ally/Horde) on players frames"]
  HideUnitImprovedFaction_CheckButton:SetChecked(AbyssUIAddonSettings.HideUnitImprovedFaction)
  addonTable.HideUnitImprovedFaction = HideUnitImprovedFaction_CheckButton
  -- OnClick Function
  HideUnitImprovedFaction_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.HideUnitImprovedFaction = self:GetChecked()
  end)
  -- 2nd Collum
  -- Hide Cast Timer
  local HideCastTimer_CheckButton = CreateFrame("CheckButton", "$parentHideCastTimer_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  HideCastTimer_CheckButton:SetPoint("TOPRIGHT", -200, -80)
  HideCastTimer_CheckButton.Text:SetText(L["Hide CastBar Timer"])
  local Frame = CreateFrame("Frame", nil, HideCastTimer_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  HideCastTimer_CheckButton.Text:SetAllPoints(Frame)
  HideCastTimer_CheckButton.tooltip = L["Hide the timer below CastBar"]
  HideCastTimer_CheckButton:SetChecked(AbyssUIAddonSettings.HideCastTimer)
  addonTable.HideCastTimer = HideCastTimer_CheckButton
  -- OnClick Function
  HideCastTimer_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.HideCastTimer = self:GetChecked()
  end)
  -- Hide Group Frame
  local HideGroupFrame_CheckButton = CreateFrame("CheckButton", "$parentHideGroupFrame_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  HideGroupFrame_CheckButton:SetPoint("TOPRIGHT", -200, -110)
  HideGroupFrame_CheckButton.Text:SetText(L["|cfff2dc7fHide GroupFrame|r"])
  local Frame = CreateFrame("Frame", nil, HideGroupFrame_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  HideGroupFrame_CheckButton.Text:SetAllPoints(Frame)
  HideGroupFrame_CheckButton.tooltip = L["Hide the GroupFrame on the player portrait"]
  HideGroupFrame_CheckButton:SetChecked(AbyssUIAddonSettings.HideGroupFrame)
  addonTable.HideGroupFrame = HideGroupFrame_CheckButton
  -- OnClick Function
  HideGroupFrame_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.HideGroupFrame = self:GetChecked()
      if (AbyssUIAddonSettings.HideGroupFrame == true) then
        PlayerFrameGroupIndicator:SetAlpha(0)
      else
        PlayerFrameGroupIndicator:SetAlpha(1)
      end
  end)
  -- After Login/Reload
  HideGroupFrame_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  HideGroupFrame_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD" and GetWoWVersion <= 90500) then
      if (AbyssUIAddonSettings.HideGroupFrame == true) then
        PlayerFrameGroupIndicator:SetAlpha(0)
      else
        PlayerFrameGroupIndicator:SetAlpha(1)
      end
    end
  end)
  -- Hide Covenant Frame
  local HideConvenantFrame_CheckButton = CreateFrame("CheckButton", "$parentHideConvenantFrame_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  HideConvenantFrame_CheckButton:SetPoint("TOPRIGHT", -200, -140)
  HideConvenantFrame_CheckButton.Text:SetText(L["Hide Covenant Frame"])
  local Frame = CreateFrame("Frame", nil, HideConvenantFrame_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  HideConvenantFrame_CheckButton.Text:SetAllPoints(Frame)
  HideConvenantFrame_CheckButton.tooltip = L["Hide the Covenant/Garrison minimap icon"]
  HideConvenantFrame_CheckButton:SetChecked(AbyssUIAddonSettings.HideConvenantFrame)
  -- OnClick Function
  HideConvenantFrame_CheckButton:SetScript("OnClick", function(self)
    if (GetWoWVersion > 30600) then
      AbyssUIAddonSettings.HideConvenantFrame = self:GetChecked()
      if (AbyssUIAddonSettings.HideConvenantFrame == true) then
        GarrisonLandingPageMinimapButton:Hide()
      else
        GarrisonLandingPageMinimapButton:Show()
      end
    else
      UIErrorsFrame:AddMessage(L["Not available in this version of WoW!"], 1.0, 0.1, 0.1, 1.0)
      HideConvenantFrame_CheckButton:SetChecked(nil)
    end
  end)
  -- After Login/Reload
  HideConvenantFrame_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  HideConvenantFrame_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if (GetWoWVersion > 30600) then
        if (AbyssUIAddonSettings.HideConvenantFrame == true) then
          C_Timer.After(1, function()
            GarrisonLandingPageMinimapButton:Hide(0)
          end)
        end
      end
    end
  end)
  -- Hide Minimap Zone Text
  local HideMinimapZoneText_CheckButton = CreateFrame("CheckButton", "$parentHideMinimapZoneText_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  HideMinimapZoneText_CheckButton:SetPoint("TOPRIGHT", -200, -170)
  HideMinimapZoneText_CheckButton.Text:SetText(L["Hide Minimap Zone Text"])
  local Frame = CreateFrame("Frame", nil, HideMinimapZoneText_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  HideMinimapZoneText_CheckButton.Text:SetAllPoints(Frame)
  HideMinimapZoneText_CheckButton.tooltip = L["Hide zone text above minimap"]
  HideMinimapZoneText_CheckButton:SetChecked(AbyssUIAddonSettings.HideMinimapZoneText)
  -- OnClick Function
  HideMinimapZoneText_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.HideMinimapZoneText = self:GetChecked()
      if (AbyssUIAddonSettings.HideMinimapZoneText == true) then
        MinimapZoneText:Hide()
      else
        MinimapZoneText:Show()
      end
  end)
  -- After Login/Reload
  HideMinimapZoneText_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  HideMinimapZoneText_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if (AbyssUIAddonSettings.HideMinimapZoneText == true) then
        C_Timer.After(1, function()
          MinimapZoneText:Hide()
        end)
      end
    end
  end)
  -- Hide MainActionBar
  local HideMainActionBar_CheckButton = CreateFrame("CheckButton", "$parentHideHideMainActionBar_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  HideMainActionBar_CheckButton:SetPoint("TOPRIGHT", -200, -200)
  HideMainActionBar_CheckButton.Text:SetText(L["Hide MainActionBar"])
  local Frame = CreateFrame("Frame", nil, HideMainActionBar_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  HideMainActionBar_CheckButton.Text:SetAllPoints(Frame)
  HideMainActionBar_CheckButton.tooltip = L["Hides the MainActionBar"]
  HideMainActionBar_CheckButton:SetChecked(AbyssUIAddonSettings.HideMainActionBar)
  -- OnClick Function
  HideMainActionBar_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.HideMainActionBar = self:GetChecked()
      if (AbyssUIAddonSettings.HideMainActionBar == true ) then
        MainMenuBar:Hide()
        if (StanceBar) then
          StanceBar:Hide()
        end
      else
        MainMenuBar:Show()
        if (StanceBar) then
          StanceBar:ClearAllPoints()
          StanceBar:Show()
        end
      end
  end)
  -- After Login/Reload
  HideMainActionBar_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  HideMainActionBar_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if (AbyssUIAddonSettings.HideMainActionBar == true) then
        C_Timer.After(1, function()
          MainMenuBar:Hide()
          if (StanceBar) then
            StanceBar:Hide()
          end
        end)
      end
    end
  end)
end
-- End
------------------------------- Miscellaneous -------------------------------
local function Miscellaneous()
  local PSINFOMisce_CheckButton = CreateFrame("Frame","$parentPSINFOMisce_CheckButton", AbyssUI_Config.childpanel3)
  PSINFOMisce_CheckButton:SetPoint("BOTTOMLEFT", AbyssUI_Config.childpanel3, "BOTTOMLEFT", 10, 20)
  PSINFOMisce_CheckButton:SetHeight(40)
  PSINFOMisce_CheckButton:SetWidth(600)
  PSINFOMisce_CheckButton = PSINFOMisce_CheckButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  PSINFOMisce_CheckButton:SetPoint("LEFT")
  PSINFOMisce_CheckButton:SetAllPoints()
  PSINFOMisce_CheckButton:SetText(L["The symbol (*) in some options means that there is important information/instructions to be read. "..
  "Options with a different color are recommended settings (based on your choice in the setup)."])
  --- General ---
  -- Camera Pitch Function Option 50%
  local CameraSmooth50_CheckButton = CreateFrame("CheckButton", "$parentCameraSmooth50_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  CameraSmooth50_CheckButton:SetPoint("TOPLEFT", 10, -80)
  CameraSmooth50_CheckButton.Text:SetText(L["Smooth Camera (50% Slower)"])
  CameraSmooth50_CheckButton.tooltip = L["Makes the Camera turns in a more smooth way"]
  CameraSmooth50_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionCameraSmooth50)
  -- OnClick Function
  CameraSmooth50_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.ExtraFunctionCameraSmooth70 ~= true and AbyssUIAddonSettings.ExtraFunctionCameraSmooth90 ~= true then
      AbyssUIAddonSettings.ExtraFunctionCameraSmooth50 = self:GetChecked()
      if AbyssUIAddonSettings.ExtraFunctionCameraSmooth50 == true then
        ConsoleExec("cameraYawMoveSpeed 50")
        ConsoleExec("cameraPitchMoveSpeed 50")
      else
        ConsoleExec("cameraYawMoveSpeed 100")
        ConsoleExec("cameraPitchMoveSpeed 100")
        if AbyssUIAddonSettings.ExtraFunctionCameraSmooth50 ~= true and AbyssUIAddonSettings.ExtraFunctionCameraSmooth90 ~= true then
          AbyssUI_ReloadFrame:Show()
        end
      end
    else
      CameraSmooth50_CheckButton:SetChecked(nil)
    end
  end)
  -- After Login/Reload
  CameraSmooth50_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  CameraSmooth50_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if AbyssUIAddonSettings.ExtraFunctionCameraSmooth50 == true then
        ConsoleExec("cameraYawMoveSpeed 50")
        ConsoleExec("cameraPitchMoveSpeed 50")
      end
    end
  end)
  -- Camera Pitch Function Option 70%
  local CameraSmooth70_CheckButton = CreateFrame("CheckButton", "$parentCameraSmooth70_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  CameraSmooth70_CheckButton:SetPoint("TOPLEFT", 10, -110)
  CameraSmooth70_CheckButton.Text:SetText(L["Smooth Camera (70% Slower)"])
  CameraSmooth70_CheckButton.tooltip = L["Makes the Camera turns in a more smooth way"]
  CameraSmooth70_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionCameraSmooth70)
  -- OnClick Function
  CameraSmooth70_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.ExtraFunctionCameraSmooth50 ~= true and AbyssUIAddonSettings.ExtraFunctionCameraSmooth90 ~= true then
      AbyssUIAddonSettings.ExtraFunctionCameraSmooth70 = self:GetChecked()
      if AbyssUIAddonSettings.ExtraFunctionCameraSmooth70 == true then
        ConsoleExec("cameraYawMoveSpeed 30")
        ConsoleExec("cameraPitchMoveSpeed 30")
      else
        ConsoleExec("cameraYawMoveSpeed 100")
        ConsoleExec("cameraPitchMoveSpeed 100")
        if AbyssUIAddonSettings.ExtraFunctionCameraSmooth50 ~= true and AbyssUIAddonSettings.ExtraFunctionCameraSmooth90 ~= true then
          AbyssUI_ReloadFrame:Show()
        end
      end
    else
      CameraSmooth70_CheckButton:SetChecked(nil)
    end
  end)
  -- After Login/Reload
  CameraSmooth70_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  CameraSmooth70_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if AbyssUIAddonSettings.ExtraFunctionCameraSmooth70 == true then
        ConsoleExec("cameraYawMoveSpeed 30")
        ConsoleExec("cameraPitchMoveSpeed 30")
      end
    end
  end)
  -- Camera Pitch Function Option 90%
  local CameraSmooth90_CheckButton = CreateFrame("CheckButton", "$parentCameraSmooth90_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  CameraSmooth90_CheckButton:SetPoint("TOPLEFT", 10, -140)
  CameraSmooth90_CheckButton.Text:SetText(L["Smooth Camera (90% Slower)"])
  CameraSmooth90_CheckButton.tooltip = L["Makes the Camera turns in a more smooth way"]
  CameraSmooth90_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionCameraSmooth90)
  -- OnClick Function
  CameraSmooth90_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.ExtraFunctionCameraSmooth50 ~= true and AbyssUIAddonSettings.ExtraFunctionCameraSmooth70 ~= true then
      AbyssUIAddonSettings.ExtraFunctionCameraSmooth90 = self:GetChecked()
      if AbyssUIAddonSettings.ExtraFunctionCameraSmooth90 == true then
        ConsoleExec("cameraYawMoveSpeed 10")
        ConsoleExec("cameraPitchMoveSpeed 10")
      else
        ConsoleExec("cameraYawMoveSpeed 100")
        ConsoleExec("cameraPitchMoveSpeed 100")
        if AbyssUIAddonSettings.ExtraFunctionCameraSmooth50 ~= true and AbyssUIAddonSettings.ExtraFunctionCameraSmooth70 ~= true then
          AbyssUI_ReloadFrame:Show()
        end
      end
    else
      CameraSmooth90_CheckButton:SetChecked(nil)
    end
  end)
  -- After Login/Reload
  CameraSmooth90_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  CameraSmooth90_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if AbyssUIAddonSettings.ExtraFunctionCameraSmooth90 == true then
        ConsoleExec("cameraYawMoveSpeed 10")
        ConsoleExec("cameraPitchMoveSpeed 10")
      end
    end
  end)
  -- Auto Repair/Sell Gray --
  local AbyssUIAutoSellGray_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIAutoSellGray_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  AbyssUIAutoSellGray_CheckButton:SetPoint("TOPLEFT", 10, -170)
  AbyssUIAutoSellGray_CheckButton.Text:SetText(L["|cfff2dc7fAuto Repair/Sell Gray Items|r"])
  AbyssUIAutoSellGray_CheckButton.tooltip = L["When you open a Merchant shop, auto sell gray"..
  " and repair items"]
  AbyssUIAutoSellGray_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionSellGray)
  addonTable.AutoSellGray = AbyssUIAutoSellGray_CheckButton
  -- OnClick Function
  AbyssUIAutoSellGray_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionSellGray = self:GetChecked()
  end)
  -- Auto Gamma Day/Night
  local AbyssUIAutoGamma_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIAutoGamma_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  AbyssUIAutoGamma_CheckButton:SetPoint("TOPLEFT", 10, -200)
  AbyssUIAutoGamma_CheckButton.Text:SetText(L["Auto Gamma"])
  AbyssUIAutoGamma_CheckButton.tooltip = L["Automatically change the gamma when is day to"..
  " 1.2 (brighter) and to 1.0 (default) at night based on the local time"]
  AbyssUIAutoGamma_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionAutoGamma)
  -- OnClick Function
  AbyssUIAutoGamma_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionAutoGamma = self:GetChecked()
    if AbyssUIAddonSettings.ExtraFunctionAutoGamma == true then
      local dataTime = tonumber(date("%H"))
      if (dataTime >= 6 and dataTime < 18) then
        ConsoleExec("Gamma 1.2")
      elseif (dataTime >= 18) then
        ConsoleExec("Gamma 1.0")
      end
    end
  end)
  -- After Login/Reload
  AbyssUIAutoGamma_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  AbyssUIAutoGamma_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if AbyssUIAddonSettings.ExtraFunctionAutoGamma == true then
        C_Timer.After(0.5, function ()
          local dataTime = tonumber(date("%H"))
          if (dataTime >= 6 and dataTime < 18) then
            ConsoleExec("Gamma 1.2")
          elseif (dataTime >= 18) then
            ConsoleExec("Gamma 1.0")
          end
        end)  
      end
    end
  end)
  -- American Clock Style --
  local AbyssUI_AmericanClock_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_AmericanClock_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  AbyssUI_AmericanClock_CheckButton:SetPoint("TOPLEFT", 10, -230)
  AbyssUI_AmericanClock_CheckButton.Text:SetText(L["Non-Military Date/Time"])
  AbyssUI_AmericanClock_CheckButton.tooltip = L["Change the date format of the whole UI to"..
  " Non-Military format"]
  AbyssUI_AmericanClock_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionAmericanClock)
  -- OnClick Function
  AbyssUI_AmericanClock_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionAmericanClock = self:GetChecked()
  end)
  -- Better Fonts --
  local AbyssUI_BetterFonts_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_BetterFonts_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  AbyssUI_BetterFonts_CheckButton:SetPoint("TOPLEFT", 10, -260)
  AbyssUI_BetterFonts_CheckButton.Text:SetText(L["RPG chat fonts"])
  AbyssUI_BetterFonts_CheckButton.tooltip = L["Change the chat fonts to a RPG look-alike style"]
  AbyssUI_BetterFonts_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionBetterFonts)
  -- OnClick Function
  AbyssUI_BetterFonts_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionBetterFonts = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- After Login/Reload
  AbyssUI_BetterFonts_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  AbyssUI_BetterFonts_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if (AbyssUIAddonSettings.ExtraFunctionBetterFonts == true) then
         ChatFrame1:SetFont("Fonts\\MORPHEUS.TTF", 13)
         ChatFrame1.editBox.header:SetFont("Fonts\\MORPHEUS.TTF",13)
      else 
        return nil
      end
    end
  end)
  -- Screenshot when you level up --
  local AbyssUI_ScreenshotLevelUp_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_ScreenshotLevelUp_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  AbyssUI_ScreenshotLevelUp_CheckButton:SetPoint("TOPLEFT", 10, -290)
  AbyssUI_ScreenshotLevelUp_CheckButton.Text:SetText(L["Auto Screenshot"])
  AbyssUI_ScreenshotLevelUp_CheckButton.tooltip = L["Automatically takes a screenshot when you level up"]
  AbyssUI_ScreenshotLevelUp_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionScreenshotLevelUp)
  -- OnClick Function
  AbyssUI_ScreenshotLevelUp_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionScreenshotLevelUp = self:GetChecked()
  end)
  -- Always show clock --
  local AbyssUI_ShowClock_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_ShowClock_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  AbyssUI_ShowClock_CheckButton:SetPoint("TOPLEFT", 10, -320)
  AbyssUI_ShowClock_CheckButton.Text:SetText(L["Show Minimap Clock"])
  AbyssUI_ShowClock_CheckButton.tooltip = L["This will always show the minimap clock, instead of showing on hover"]
  AbyssUI_ShowClock_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionMinimapClock)
  -- OnClick Function
  AbyssUI_ShowClock_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionMinimapClock = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  --- Frames ---
  -- Transparent Background Name --
  local AbyssUI_TransparentName_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_TransparentName_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  AbyssUI_TransparentName_CheckButton:SetPoint("TOPLEFT", 400, -80)
  AbyssUI_TransparentName_CheckButton.Text:SetText(L["Transparent Name BKGD"])
  local Frame = CreateFrame("Frame", nil, AbyssUI_TransparentName_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  AbyssUI_TransparentName_CheckButton.Text:SetAllPoints(Frame)
  AbyssUI_TransparentName_CheckButton.tooltip = L["Remove any color in the target name background"]
  AbyssUI_TransparentName_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionTransparentName)
  -- OnClick Function
  AbyssUI_TransparentName_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionTransparentName = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- Remove Background class color --
  local AbyssUI_HideBackgroundClassColor_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_HideBackgroundClassColor_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  AbyssUI_HideBackgroundClassColor_CheckButton:SetPoint("TOPLEFT", 400, -110)
  AbyssUI_HideBackgroundClassColor_CheckButton.Text:SetText(L["Default Class Background"])
  local Frame = CreateFrame("Frame", nil, AbyssUI_HideBackgroundClassColor_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  AbyssUI_HideBackgroundClassColor_CheckButton.Text:SetAllPoints(Frame)
  AbyssUI_HideBackgroundClassColor_CheckButton.tooltip = L["Remove the class color background behind"..
  " the player names to default values (Transparent Name needs to be unchecked)"]
  AbyssUI_HideBackgroundClassColor_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionHideBackgroundClassColor)
  -- OnClick Function
  AbyssUI_HideBackgroundClassColor_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionHideBackgroundClassColor = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- Disable Nameplate Changes --
  local AbyssUI_NameplateChanges_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_NameplateChanges_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  AbyssUI_NameplateChanges_CheckButton:SetPoint("TOPLEFT", 400, -140)
  AbyssUI_NameplateChanges_CheckButton.Text:SetText(L["Disable Nameplate Changes"])
  local Frame = CreateFrame("Frame", nil, AbyssUI_NameplateChanges_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  AbyssUI_NameplateChanges_CheckButton.Text:SetAllPoints(Frame)
  AbyssUI_NameplateChanges_CheckButton.tooltip = L["This option will remove any change that was made to the nameplates (the bar above mobs and players)"]
  AbyssUI_NameplateChanges_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionNameplateChanges)
  -- OnClick Function
  AbyssUI_NameplateChanges_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionNameplateChanges = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- Disable ChatBubble --
  local AbyssUI_ChatBubbleChanges_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_ChatBubbleChanges_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  AbyssUI_ChatBubbleChanges_CheckButton:SetPoint("TOPLEFT", 400, -170)
  AbyssUI_ChatBubbleChanges_CheckButton.Text:SetText(L["Disable ChatBubble Changes"])
  local Frame = CreateFrame("Frame", nil, AbyssUI_ChatBubbleChanges_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  AbyssUI_ChatBubbleChanges_CheckButton.Text:SetAllPoints(Frame)
  AbyssUI_ChatBubbleChanges_CheckButton.tooltip = L["This option will remove any change that was made to the chatbubbles (the frame text above players)"]
  AbyssUI_ChatBubbleChanges_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionChatBubbleChanges)
  addonTable.ChatBubbleChanges = AbyssUI_ChatBubbleChanges_CheckButton
  -- OnClick Function
  AbyssUI_ChatBubbleChanges_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionChatBubbleChanges = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- Disable Damage Font --
  --[[
  local AbyssUI_DamageFont_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_DamageFont_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  AbyssUI_DamageFont_CheckButton:SetPoint("TOPLEFT", 400, -200)
  AbyssUI_DamageFont_CheckButton.Text:SetText(L["Disable Damage Font (*)"])
  local Frame = CreateFrame("Frame", nil, AbyssUI_DamageFont_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  AbyssUI_DamageFont_CheckButton.Text:SetAllPoints(Frame)
  AbyssUI_DamageFont_CheckButton.tooltip = L["This option will remove any change to the damage font text."..
  "\n*You need to restart the game so the font can be reloaded. You can change it to any font, "..
  "go to Textures->font and replace the file keeping the same name"]
  AbyssUI_DamageFont_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionDamageFont)
  -- OnClick Function
  AbyssUI_DamageFont_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionDamageFont = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  --]]
  -- Disable healing spam over player --
  local AbyssUI_DisableHealingSpam_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_DisableHealingSpam_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  AbyssUI_DisableHealingSpam_CheckButton:SetPoint("TOPLEFT", 400, -200)
  AbyssUI_DisableHealingSpam_CheckButton.Text:SetText(L["|cfff2dc7fDisable Portrait Text Spam|r"])
  local Frame = CreateFrame("Frame", nil, AbyssUI_DisableHealingSpam_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  AbyssUI_DisableHealingSpam_CheckButton.Text:SetAllPoints(Frame)
  AbyssUI_DisableHealingSpam_CheckButton.tooltip = L["Disable healing/damage spam over player"..
  " and pet portraits"]
  AbyssUI_DisableHealingSpam_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionDisableHealingSpam)
  addonTable.DisableHealingSpam = AbyssUI_DisableHealingSpam_CheckButton
  -- OnClick Function
  AbyssUI_DisableHealingSpam_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionDisableHealingSpam = self:GetChecked()
    PlayerHitIndicator:SetText(nil)
    PlayerHitIndicator.SetText = function() end

    PetHitIndicator:SetText(nil)
    PetHitIndicator.SetText = function() end
  end)
  -- After Login/Reload
  AbyssUI_DisableHealingSpam_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  AbyssUI_DisableHealingSpam_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if (AbyssUIAddonSettings.ExtraFunctionDisableHealingSpam == true) then
        PlayerHitIndicator:SetText(nil)
        PlayerHitIndicator.SetText = function() end

        PetHitIndicator:SetText(nil)
        PetHitIndicator.SetText = function() end
      end
    end
  end)
  -- Disable New Minimap --
  local DisableNewMinimap_CheckButton = CreateFrame("CheckButton", "$parentUnitFrameImproved_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  DisableNewMinimap_CheckButton:SetPoint("TOPLEFT", 400, -230)
  DisableNewMinimap_CheckButton.Text:SetText(L["Disable New Minimap"])
  local Frame = CreateFrame("Frame", nil, DisableNewMinimap_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  DisableNewMinimap_CheckButton.Text:SetAllPoints(Frame)
  DisableNewMinimap_CheckButton.tooltip = L["This option will get you back to the"..
  " Blizzard default minimap style (round)."]
  DisableNewMinimap_CheckButton:SetChecked(AbyssUIAddonSettings.DisableNewMinimap)
  addonTable.DisableNewMinimap = DisableNewMinimap_CheckButton
  -- OnClick Function
  DisableNewMinimap_CheckButton:SetScript("OnClick", function(self)
    if (GetWoWVersion > 30600) then
      AbyssUIAddonSettings.DisableNewMinimap = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else 
      UIErrorsFrame:AddMessage(L["Not available in this version of WoW!"], 1.0, 0.1, 0.1, 1.0)
      DisableNewMinimap_CheckButton:SetChecked(nil)
    end
  end)
  -- Disable UnitFrame Smoke --
  local DisableUnitFrameSmoke_CheckButton = CreateFrame("CheckButton", "$parentDisableUnitFrameSmoke_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  DisableUnitFrameSmoke_CheckButton:SetPoint("TOPLEFT", 400, -260)
  DisableUnitFrameSmoke_CheckButton.Text:SetText(L["Disable Smoke Texture"])
  local Frame = CreateFrame("Frame", nil, DisableUnitFrameSmoke_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  DisableUnitFrameSmoke_CheckButton.Text:SetAllPoints(Frame)
  DisableUnitFrameSmoke_CheckButton.tooltip = L["It will disable the 'smoke' texture around the portrait in "..
  "the UnitFrameImproved version of it"]
  DisableUnitFrameSmoke_CheckButton:SetChecked(AbyssUIAddonSettings.UnitFrameImprovedDefaultTexture)
  addonTable.DisableUnitFrameSmoke = DisableUnitFrameSmoke_CheckButton
  -- OnClick Function
  DisableUnitFrameSmoke_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.UnitFrameImprovedDefaultTexture = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- Disable font white text --
  local AbyssUI_FontWhiteText_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_FontWhiteText_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  AbyssUI_FontWhiteText_CheckButton:SetPoint("TOPLEFT", 400, -290)
  AbyssUI_FontWhiteText_CheckButton.Text:SetText(L["Disable Button Color Text"])
  local Frame = CreateFrame("Frame", nil, AbyssUI_FontWhiteText_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  AbyssUI_FontWhiteText_CheckButton.Text:SetAllPoints(Frame)
  AbyssUI_FontWhiteText_CheckButton.tooltip = L["Change the button colors back to default yellow"]
  AbyssUI_FontWhiteText_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText)
  addonTable.ExtraFunctionDisableFontWhiteText = AbyssUI_FontWhiteText_CheckButton
  -- OnClick Function
  AbyssUI_FontWhiteText_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- Disable New CastBar --
  local AbyssUI_NewCastBar_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_NewCastBar_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  AbyssUI_NewCastBar_CheckButton:SetPoint("TOPLEFT", 400, -320)
  AbyssUI_NewCastBar_CheckButton.Text:SetText(L["Disable New CastBar"])
  local Frame = CreateFrame("Frame", nil, AbyssUI_NewCastBar_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  AbyssUI_NewCastBar_CheckButton.Text:SetAllPoints(Frame)
  AbyssUI_NewCastBar_CheckButton.tooltip = L["Will disable the new castbar and return to Blizzard default texture"]
  AbyssUI_NewCastBar_CheckButton:SetChecked(AbyssUIAddonSettings.NewCastBar)
  addonTable.NewCastBar = AbyssUI_NewCastBar_CheckButton
  -- OnClick Function
  AbyssUI_NewCastBar_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.NewCastBar = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- Green Health --
  local GreenHealth_CheckButton = CreateFrame("CheckButton", "$parentGreenHealth_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  GreenHealth_CheckButton:SetPoint("TOPLEFT", 400, -350)
  GreenHealth_CheckButton.Text:SetText(L["Green Health Bars"])
  local Frame = CreateFrame("Frame", nil, GreenHealth_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  GreenHealth_CheckButton.Text:SetAllPoints(Frame)
  GreenHealth_CheckButton.tooltip = L["All unitframe health bars will be green (default)"]
  GreenHealth_CheckButton:SetChecked(AbyssUIAddonSettings.GreenHealth)
  -- OnClick Function
  GreenHealth_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.GreenHealth = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- ReverseHealthFill --
  local ReverseHealthFill_CheckButton = CreateFrame("CheckButton", "$parentGreenHealth_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  ReverseHealthFill_CheckButton:SetPoint("TOPLEFT", 400, -380)
  ReverseHealthFill_CheckButton.Text:SetText(L["Reverse HealthBar Fill"])
  local Frame = CreateFrame("Frame", nil, ReverseHealthFill_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  ReverseHealthFill_CheckButton.Text:SetAllPoints(Frame)
  ReverseHealthFill_CheckButton.tooltip = L["All unitframe health bars will fill in reverse"]
  ReverseHealthFill_CheckButton:SetChecked(AbyssUIAddonSettings.ReverseHealthFill)
  -- OnClick Function
  ReverseHealthFill_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ReverseHealthFill = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- Disable Tooltip Healthbar --
  local DisableTooltipHealth_CheckButton = CreateFrame("CheckButton", "$parentDisableTooltipHealth_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
  DisableTooltipHealth_CheckButton:SetPoint("TOPLEFT", 400, -410)
  DisableTooltipHealth_CheckButton.Text:SetText(L["Disable Tooltip Health"])
  local Frame = CreateFrame("Frame", nil, DisableTooltipHealth_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  DisableTooltipHealth_CheckButton.Text:SetAllPoints(Frame)
  DisableTooltipHealth_CheckButton.tooltip = L["Disable the tooltip healthBar from mouse hover functions"]
  DisableTooltipHealth_CheckButton:SetChecked(AbyssUIAddonSettings.DisableTooltipHealth)
  -- OnClick Function
  DisableTooltipHealth_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.DisableTooltipHealth = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
end
--End
----------------------------------- Tweaks & Extra  -----------------------------------
local function TweaksExtra()
  -- Read tooltip--
  local PSINFOTweaks_CheckButton = CreateFrame("Frame","$parentPSINFOTweaks_CheckButton", AbyssUI_Config.childpanel6)
  PSINFOTweaks_CheckButton:SetPoint("BOTTOMLEFT", AbyssUI_Config.childpanel6, "BOTTOMLEFT", 10, 20)
  PSINFOTweaks_CheckButton:SetHeight(40)
  PSINFOTweaks_CheckButton:SetWidth(600)
  PSINFOTweaks_CheckButton = PSINFOTweaks_CheckButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  PSINFOTweaks_CheckButton:SetPoint("LEFT")
  PSINFOTweaks_CheckButton:SetAllPoints()
  PSINFOTweaks_CheckButton:SetText(L["The symbol (*) in some options means that there is important information/instructions to be read. "..
    "Options with a different color are recommended settings (based on your choice in the setup)."])
  --- Global ---
  -- Disable Kill Announcer --
  local KillAnnouncer_CheckButton = CreateFrame("CheckButton", "$parentKillAnnouncer_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  KillAnnouncer_CheckButton:SetPoint("TOPLEFT", 10, -80)
  KillAnnouncer_CheckButton.Text:SetText(L["Disable Kill Announcer"])
  KillAnnouncer_CheckButton.tooltip = L["Disable the Kill Announcer frame that show up when you kill someone"]
  KillAnnouncer_CheckButton:SetChecked(AbyssUIAddonSettings.DisableKillAnnouncer)
  -- OnClick Function
  KillAnnouncer_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.DisableKillAnnouncer = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- Silence Kill Announcer --
  local SilenceKillAnnouncer_CheckButton = CreateFrame("CheckButton", "$parentSilenceKillAnnouncer_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  SilenceKillAnnouncer_CheckButton:SetPoint("TOPLEFT", 10, -110)
  SilenceKillAnnouncer_CheckButton.Text:SetText(L["Silence Kill Announcer"])
  SilenceKillAnnouncer_CheckButton.tooltip = L["Remove boss/kill sounds from the Kill Announcer frame"]
  SilenceKillAnnouncer_CheckButton:SetChecked(AbyssUIAddonSettings.SilenceKillAnnouncer)
  -- OnClick Function
  SilenceKillAnnouncer_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.SilenceKillAnnouncer = self:GetChecked()
  end)
  -- TooltipOnCursor --
  local TooltipOnCursor_CheckButton = CreateFrame("CheckButton", "$parentTooltipOnCursor_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  TooltipOnCursor_CheckButton:SetPoint("TOPLEFT", 10, -140)
  TooltipOnCursor_CheckButton.Text:SetText(L["|cfff2dc7fTooltip on Cursor|r"])
  TooltipOnCursor_CheckButton.tooltip = L["Tooltips will appear close to the mouse cursor position"]
  TooltipOnCursor_CheckButton:SetChecked(AbyssUIAddonSettings.TooltipOnCursor)
  addonTable.TooltipOnCursor = TooltipOnCursor_CheckButton
  -- OnClick Function
  TooltipOnCursor_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.TooltipOnCursor = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- Inspect Target
  local InspectTarget_CheckButton = CreateFrame("CheckButton", "$parentInspectTarget_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  InspectTarget_CheckButton:SetPoint("TOPLEFT", 10, -170)
  InspectTarget_CheckButton.Text:SetText(L["|cfff2dc7fInspect Target (Shift + ')|r"])
  InspectTarget_CheckButton.tooltip = L["When you have a target or your mouse is over someone character,"..
  " to inspect this player press the keys Shift + '"]
  InspectTarget_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionInspectTarget)
  addonTable.InspectTarget = InspectTarget_CheckButton
  -- OnClick Function
  InspectTarget_CheckButton:SetScript("OnClick", function(self)
      AbyssUIAddonSettings.ExtraFunctionInspectTarget = self:GetChecked()
  end)
  -- Ctrl + ' to confirm  --
  local AbyssUI_ConfirmPopUps_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_ConfirmPopUps_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  AbyssUI_ConfirmPopUps_CheckButton:SetPoint("TOPLEFT", 10, -200)
  AbyssUI_ConfirmPopUps_CheckButton.Text:SetText(L["|cfff2dc7fConfirm Pop-Ups (Ctrl + ')|r"])
  AbyssUI_ConfirmPopUps_CheckButton.tooltip = L["When this is active you can confirm almost"..
  " any pop-ups (release, quests, stacks, etc) pressing the keys Ctrl + '"]
  AbyssUI_ConfirmPopUps_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionConfirmPopUps)
  addonTable.ConfirmPopUps = AbyssUI_ConfirmPopUps_CheckButton
  -- OnClick Function
  AbyssUI_ConfirmPopUps_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionConfirmPopUps = self:GetChecked()
  end)
  -- First Person --
  local FirstPerson_CheckButton = CreateFrame("CheckButton", "$parentFirstPerson_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  FirstPerson_CheckButton:SetPoint("TOPLEFT", 10, -230)
  FirstPerson_CheckButton.Text:SetText(L["First Person View"])
  FirstPerson_CheckButton.tooltip = L["Change the camera view to a 'First Person' experience"]
  FirstPerson_CheckButton:SetChecked(AbyssUIAddonSettings.FirstPerson)
  -- OnClick Function
  FirstPerson_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.FirstPerson = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- Spell on KeyUp
  local ActionButtonKeyUP_CheckButton = CreateFrame("CheckButton", "$parentActionButtonKeyUP_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  ActionButtonKeyUP_CheckButton:SetPoint("TOPLEFT", 10, -260)
  ActionButtonKeyUP_CheckButton.Text:SetText(L["ActionButton on KeyUp"])
  ActionButtonKeyUP_CheckButton.tooltip = L["With this option spells can be cast just when the"..
  " keybind are released"]
  ActionButtonKeyUP_CheckButton:SetChecked(AbyssUIAddonSettings.ActionButtonKeyDown)
  -- OnClick Function
  ActionButtonKeyUP_CheckButton:SetScript("OnClick", function(self)
      AbyssUIAddonSettings.ActionButtonKeyDown = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
  end)
  -- After Login/Reload
  ActionButtonKeyUP_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  ActionButtonKeyUP_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if AbyssUIAddonSettings.ActionButtonKeyDown == true then
        SetCVar('ActionButtonUseKeyDown', 0)
      else
        if (GetWoWVersion <= 90500) then
          SetCVar('ActionButtonUseKeyDown', 1)
        end
      end
    else
      return nil
    end
  end)
  -- Action Cam --
  local AbyssUIActionCam_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIActionCam_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  AbyssUIActionCam_CheckButton:SetPoint("TOPLEFT", 10, -290)
  AbyssUIActionCam_CheckButton.Text:SetText(L["Combat Cursor Mode"])
  AbyssUIActionCam_CheckButton.tooltip = L["Makes the camera turns with your mouse when in"..
  " combat (right-click to show cursor)"]
  AbyssUIActionCam_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionActionCam)
  -- OnClick Function
  AbyssUIActionCam_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionActionCam = self:GetChecked()
  end)
  -- Update
  AbyssUIActionCam_CheckButton:RegisterEvent("PLAYER_REGEN_ENABLED")
  AbyssUIActionCam_CheckButton:RegisterEvent("PLAYER_REGEN_DISABLED")
  AbyssUIActionCam_CheckButton:SetScript("OnEvent", function(self, event, ...)
    local IsMouseLooking = IsMouselooking()
    if (event == "PLAYER_REGEN_DISABLED" and IsMouseLooking == false) then
      if AbyssUIAddonSettings.ExtraFunctionActionCam == true then
        MouselookStart()
      else
        MouselookStop()
      end
    end
  end)
  -- Show Titles --
  local AbyssUIShowTitles_CheckButton = CreateFrame("CheckButton", "$parentActionButtonKeyUP_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  AbyssUIShowTitles_CheckButton:SetPoint("TOPLEFT", 10, -320)
  AbyssUIShowTitles_CheckButton.Text:SetText(L["Always Show Titles"])
  AbyssUIShowTitles_CheckButton.tooltip = L["Always show people titles on their names"]
  AbyssUIShowTitles_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionShowTitle)
  -- OnClick Function
  AbyssUIShowTitles_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionShowTitle = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- After Login/Reload
  AbyssUIShowTitles_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  AbyssUIShowTitles_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if AbyssUIAddonSettings.ExtraFunctionShowTitle == true then
        SetCVar('UnitNamePlayerPVPTitle', 1)
      else
        SetCVar('UnitNamePlayerPVPTitle', 0)
      end
    else
      return nil
    end
  end)
  --- Frames ---
  -- Square Minimap --
  local SquareMinimap_CheckButton = CreateFrame("CheckButton", "$parentSquareMinimap_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  SquareMinimap_CheckButton:SetPoint("TOPLEFT", 400, -80)
  SquareMinimap_CheckButton.Text:SetText(L["Square Minimap"])
  local Frame = CreateFrame("Frame", nil, SquareMinimap_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  SquareMinimap_CheckButton.Text:SetAllPoints(Frame)
  SquareMinimap_CheckButton.tooltip = L["A modern minimap (neon class borders)"]
  SquareMinimap_CheckButton:SetChecked(AbyssUIAddonSettings.SquareMinimap)
  addonTable.SquareMinimap = SquareMinimap_CheckButton
  -- OnClick Function
  SquareMinimap_CheckButton:SetScript("OnClick", function(self)
    if (GetWoWVersion > 30600) then
      if (AbyssUIAddonSettings.DisableNewMinimap == true) then
        UIErrorsFrame:AddMessage("You need to uncheck 'Disable New Minimap' first", 1.0, 0.1, 0.1, 1.0)
        SquareMinimap_CheckButton:SetChecked(nil)
      else
        AbyssUIAddonSettings.SquareMinimap = self:GetChecked()
        AbyssUI_ReloadFrame:Show()
      end
    else
      UIErrorsFrame:AddMessage(L["Not available in this version of WoW!"], 1.0, 0.1, 0.1, 1.0)
      SquareMinimap_CheckButton:SetChecked(nil)
    end
  end)
  -- Keep UnitFrame Dark --
  local KeepUnitDark_CheckButton = CreateFrame("CheckButton", "$parentKeepUnitDark_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  KeepUnitDark_CheckButton:SetPoint("TOPLEFT", 400, -110)
  KeepUnitDark_CheckButton.Text:SetText(L["Keep UnitFrame Dark"])
  local Frame = CreateFrame("Frame", nil, KeepUnitDark_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  KeepUnitDark_CheckButton.Text:SetAllPoints(Frame)
  KeepUnitDark_CheckButton.tooltip = L["Even if you change theme, this will keep UnitFrame Dark"..
  " (player frame, boss, etc)."]
  KeepUnitDark_CheckButton:SetChecked(AbyssUIAddonSettings.KeepUnitDark)
  -- OnClick Function
  KeepUnitDark_CheckButton:SetScript("OnClick", function(self)
   if AbyssUIAddonSettings.KeepUnitBlizzard == true then
     UIErrorsFrame:AddMessage(L["You can only select one style of UnitFrame color"], 1.0, 0.1, 0.1, 1.0)
     KeepUnitDark_CheckButton:SetChecked(nil)
   else
     AbyssUIAddonSettings.KeepUnitDark = self:GetChecked()
     AbyssUI_ReloadFrame:Show()
   end
  end)
   -- After Login/Reload
  KeepUnitDark_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  KeepUnitDark_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if AbyssUIAddonSettings.KeepUnitDark == true then
        AbyssUIAddonSettings.KeepUnitDark = self:GetChecked()
      else
        KeepUnitDark_CheckButton:SetChecked(nil)
      end
    end
  end)
  -- Keep UnitFrame Blizzard Like --
  local KeepUnitBlizzard_CheckButton = CreateFrame("CheckButton", "$parentKeepUnitBlizzard_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  KeepUnitBlizzard_CheckButton:SetPoint("TOPLEFT", 400, -140)
  KeepUnitBlizzard_CheckButton.Text:SetText(L["Keep UnitFrame Blizzard Like"])
  local Frame = CreateFrame("Frame", nil, KeepUnitBlizzard_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  KeepUnitBlizzard_CheckButton.Text:SetAllPoints(Frame)
  KeepUnitBlizzard_CheckButton.tooltip = L["Even if you change theme, this will keep UnitFrame"..
  " Blizzard like (player frame, boss, etc)."]
  KeepUnitBlizzard_CheckButton:SetChecked(AbyssUIAddonSettings.KeepUnitBlizzard)
  -- OnClick Function
  KeepUnitBlizzard_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.KeepUnitDark == true then
      UIErrorsFrame:AddMessage(L["You can only select one style of UnitFrame color"], 1.0, 0.1, 0.1, 1.0)
      KeepUnitBlizzard_CheckButton:SetChecked(nil)
    else
      AbyssUIAddonSettings.KeepUnitBlizzard = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    end
  end)
  -- After Login/Reload
  KeepUnitBlizzard_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  KeepUnitBlizzard_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
      if AbyssUIAddonSettings.KeepUnitBlizzard == true then
        AbyssUIAddonSettings.KeepUnitBlizzard = self:GetChecked()
      else
        KeepUnitBlizzard_CheckButton:SetChecked(nil)
      end
    end
  end)
  -- Instance Leave --
  local AbyssUI_InstanceLeave_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_InstanceLeave_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  AbyssUI_InstanceLeave_CheckButton:SetPoint("TOPLEFT", 400, -170)
  AbyssUI_InstanceLeave_CheckButton.Text:SetText(L["|cfff2dc7fInstance Leave Frame|r"])
  local Frame = CreateFrame("Frame", nil, AbyssUI_InstanceLeave_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  AbyssUI_InstanceLeave_CheckButton.Text:SetAllPoints(Frame)
  AbyssUI_InstanceLeave_CheckButton.tooltip = L["A dynamic frame that pop-up when you"..
  " complete a LFG (dungeon, raid, etc)"]
  AbyssUI_InstanceLeave_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionInstanceLeave)
  addonTable.InstanceLeave = AbyssUI_InstanceLeave_CheckButton
  -- OnClick Function
  AbyssUI_InstanceLeave_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionInstanceLeave = self:GetChecked()
  end)
  -- Fade UI --
  local FadeUI_CheckButton = CreateFrame("CheckButton", "$parentFadeUI_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  FadeUI_CheckButton:SetPoint("TOPLEFT", 400, -200)
  FadeUI_CheckButton.Text:SetText(L["Minimalist UI"])
  local Frame = CreateFrame("Frame", nil, FadeUI_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  FadeUI_CheckButton.Text:SetAllPoints(Frame)
  FadeUI_CheckButton.tooltip = L["Hide some parts of the UI when you are out of combat ('ATL-CTRL-P' to show frames)"]
  FadeUI_CheckButton:SetChecked(AbyssUIAddonSettings.FadeUI)
  -- OnClick Function
  FadeUI_CheckButton:SetScript("OnClick", function(self)
    if (AbyssUIAddonSettings.ExtraFunctionHideInCombat ~= true) then
      AbyssUIAddonSettings.FadeUI = self:GetChecked()
      AbyssUI_ReloadFrameFadeUI:Show()
    else
      UIErrorsFrame:AddMessage(L["Disable 'Dynamic Quest Tracker' at Miscellaneous tab first"], 1.0, 0.1, 0.1, 1.0)
      FadeUI_CheckButton:SetChecked(nil)
    end
  end)
  -- Minimal ActionBar --
  local MinimalActionBar_CheckButton = CreateFrame("CheckButton", "$parentMinimalActionBar_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  MinimalActionBar_CheckButton:SetPoint("TOPLEFT", 400, -230)
  MinimalActionBar_CheckButton.Text:SetText(L["Minimal ActionBar"])
  local Frame = CreateFrame("Frame", nil, MinimalActionBar_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  MinimalActionBar_CheckButton.Text:SetAllPoints(Frame)
  MinimalActionBar_CheckButton.tooltip = L["Minimalist actionbar, hide all the textures"]
  MinimalActionBar_CheckButton:SetChecked(AbyssUIAddonSettings.MinimalActionBar)
  -- OnClick Function
  MinimalActionBar_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.MinimalActionBar = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- Hide in Combat --
  local AbyssUI_HideInCombat_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_HideInCombat_CheckButton", AbyssUI_Config.childpanel6, "ChatConfigCheckButtonTemplate")
  AbyssUI_HideInCombat_CheckButton:SetPoint("TOPLEFT", 400, -260)
  AbyssUI_HideInCombat_CheckButton.Text:SetText(L["Dynamic Quest Tracker"])
  local Frame = CreateFrame("Frame", nil, AbyssUI_HideInCombat_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  AbyssUI_HideInCombat_CheckButton.Text:SetAllPoints(Frame)
  AbyssUI_HideInCombat_CheckButton.tooltip = L["Hide the quest track when you"..
  " are in combat or in a PVP instance"]
  AbyssUI_HideInCombat_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionHideInCombat)
  -- OnClick Function
  AbyssUI_HideInCombat_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionHideInCombat = self:GetChecked()
  end)
end
-- End
----------------------------------- Classic & BCC -----------------------------------
local function ClassicBCC()
  local InfoPanelSubText = CreateFrame("Frame", "$parentInfoPanelSubText", AbyssUI_Config.childpanel7)
  InfoPanelSubText:SetPoint("TOPLEFT", 20, -40)
  InfoPanelSubText:SetHeight(60)
  InfoPanelSubText:SetWidth(600)
  InfoPanelSubText:SetScale(1)
  InfoPanelSubText = InfoPanelSubText:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  InfoPanelSubText:SetPoint("LEFT")
  InfoPanelSubText:SetAllPoints()
  InfoPanelSubText:SetText(L["In this tab of the addon settings, you will find options directed to the version of WoW Classic."..
  " Many of them are exclusive and can only be used in Burning Crusade and similar client versions."])
  -- Hide Helm --
  local HideHelm_CheckButton = CreateFrame("CheckButton", "$parentHideHelm_CheckButton", AbyssUI_Config.childpanel7, "ChatConfigCheckButtonTemplate")
  HideHelm_CheckButton:SetPoint("TOPLEFT", 10, -110)
  HideHelm_CheckButton.Text:SetText(L["Hide Helm"])
  HideHelm_CheckButton.tooltip = L["Hide the player helm"]
  HideHelm_CheckButton:SetChecked(AbyssUIAddonSettings.HideHelm)
  -- OnClick Function
  HideHelm_CheckButton:SetScript("OnClick", function(self)
    if (GetWoWVersion == 20502 or GetWoWVersion <= 12400) then
      AbyssUIAddonSettings.HideHelm = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["Not available in this version of WoW!"], 1.0, 0.1, 0.1, 1.0)
      HideHelm_CheckButton:SetChecked(nil)
    end
  end)
  -- After Login/Reload
  HideHelm_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  HideHelm_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if ( event == "PLAYER_ENTERING_WORLD" ) then
      if (GetWoWVersion == 20502 or GetWoWVersion <= 12400) then
        if AbyssUIAddonSettings.HideHelm == true then
          ShowHelm(false)
        end
      end
    end
  end)
  -- Hide Cloak --
  local HideCloak_CheckButton = CreateFrame("CheckButton", "$parentHideCloak_CheckButton", AbyssUI_Config.childpanel7, "ChatConfigCheckButtonTemplate")
  HideCloak_CheckButton:SetPoint("TOPLEFT", 10, -140)
  HideCloak_CheckButton.Text:SetText(L["Hide Cloak"])
  HideCloak_CheckButton.tooltip = L["Hide the player cloak"]
  HideCloak_CheckButton:SetChecked(AbyssUIAddonSettings.HideCloak)
  -- OnClick Function
  HideCloak_CheckButton:SetScript("OnClick", function(self)
    if (GetWoWVersion == 20502 or GetWoWVersion <= 12400) then
      AbyssUIAddonSettings.HideCloak = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["Not available in this version of WoW!"], 1.0, 0.1, 0.1, 1.0)
      HideCloak_CheckButton:SetChecked(nil)
    end
  end)
  -- After Login/Reload
  HideCloak_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  HideCloak_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if ( event == "PLAYER_ENTERING_WORLD" ) then
      if (GetWoWVersion == 20502 or GetWoWVersion <= 12400) then
        if AbyssUIAddonSettings.HideCloak == true then
          ShowCloak(false)
        end
      end
    end
  end)
    -- Show Helm --
  local ShowHelm_CheckButton = CreateFrame("CheckButton", "$parentShowHelm_CheckButton", AbyssUI_Config.childpanel7, "ChatConfigCheckButtonTemplate")
  ShowHelm_CheckButton:SetPoint("TOPLEFT", 10, -170)
  ShowHelm_CheckButton.Text:SetText(L["Show Helm"])
  ShowHelm_CheckButton.tooltip = L["Always show helm"]
  ShowHelm_CheckButton:SetChecked(AbyssUIAddonSettings.ShowHelm)
  -- OnClick Function
  ShowHelm_CheckButton:SetScript("OnClick", function(self)
    if (GetWoWVersion == 20502 or GetWoWVersion <= 12400) then
      AbyssUIAddonSettings.ShowHelm = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["Not available in this version of WoW!"], 1.0, 0.1, 0.1, 1.0)
      ShowHelm_CheckButton:SetChecked(nil)
    end
  end)
  -- After Login/Reload
  ShowHelm_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  ShowHelm_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if ( event == "PLAYER_ENTERING_WORLD" ) then
      if (GetWoWVersion == 20502 or GetWoWVersion <= 12400) then
        if AbyssUIAddonSettings.ShowHelm == true then
          ShowHelm(true)
        end
      end
    end
  end)
  -- Show Cloak --
  local ShowCloak_CheckButton = CreateFrame("CheckButton", "$parentShowCloak_CheckButton", AbyssUI_Config.childpanel7, "ChatConfigCheckButtonTemplate")
  ShowCloak_CheckButton:SetPoint("TOPLEFT", 10, -200)
  ShowCloak_CheckButton.Text:SetText(L["Show Cloak"])
  ShowCloak_CheckButton.tooltip = L["Always show cloak"]
  ShowCloak_CheckButton:SetChecked(AbyssUIAddonSettings.ShowCloak)
  -- OnClick Function
  ShowCloak_CheckButton:SetScript("OnClick", function(self)
    if (GetWoWVersion == 20502 or GetWoWVersion <= 12400) then
      AbyssUIAddonSettings.ShowCloak = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["Not available in this version of WoW!"], 1.0, 0.1, 0.1, 1.0)
      ShowCloak_CheckButton:SetChecked(nil)
    end
  end)
  -- After Login/Reload
  ShowCloak_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  ShowCloak_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if ( event == "PLAYER_ENTERING_WORLD" ) then
      if (GetWoWVersion == 20502 or GetWoWVersion <= 12400) then
        if AbyssUIAddonSettings.ShowCloak == true then
          ShowCloak(true)
        end
      end
    end
  end)
  -- Better WorldMap --
  local leatrix = IsAddOnLoaded("Leatrix_Maps")
  local AbyssUI_BetterWorldMap_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_BetterWorldMap_CheckButton", AbyssUI_Config.childpanel7, "ChatConfigCheckButtonTemplate")
  AbyssUI_BetterWorldMap_CheckButton:SetPoint("TOPLEFT", 10, -230)
  AbyssUI_BetterWorldMap_CheckButton.Text:SetText(L["Better World Map"])
  AbyssUI_BetterWorldMap_CheckButton.tooltip = L["Makes the worldmap minimalist/clean"]
  AbyssUI_BetterWorldMap_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionBetterWorldMap)
  -- OnClick Function
  AbyssUI_BetterWorldMap_CheckButton:SetScript("OnClick", function(self)
    if (not leatrix) then
      if (GetWoWVersion == 20502 or GetWoWVersion <= 12400) then
        AbyssUIAddonSettings.ExtraFunctionBetterWorldMap = self:GetChecked()
        AbyssUI_ReloadFrame:Show()
      else
        UIErrorsFrame:AddMessage(L["Not available in this version of WoW!"], 1.0, 0.1, 0.1, 1.0)
        AbyssUI_BetterWorldMap_CheckButton:SetChecked(nil)
      end
    end
  end)
  -- After Login/Reload
  AbyssUI_BetterWorldMap_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  AbyssUI_BetterWorldMap_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if ( event == "PLAYER_ENTERING_WORLD" ) then
      if (not leatrix) then
        if (GetWoWVersion == 20502 or GetWoWVersion <= 12400) then
          if ( AbyssUIAddonSettings.ExtraFunctionBetterWorldMap == true ) then
            WorldMapFrame.BlackoutFrame:Hide()
            WorldMapFrame.BlackoutFrame:EnableMouse(false)
          else 
            WorldMapFrame.BlackoutFrame:Show()
            WorldMapFrame.BlackoutFrame:EnableMouse(true)
          end
        end
      end
    end
  end)
  -- WorldMap Fader --
  -- Thanks to Ketho for the fader
  local AbyssUI_WorldMapFade_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_WorldMapFade_CheckButton", AbyssUI_Config.childpanel7, "ChatConfigCheckButtonTemplate")
  AbyssUI_WorldMapFade_CheckButton:SetPoint("TOPLEFT", 10, -260)
  AbyssUI_WorldMapFade_CheckButton.Text:SetText(L["World Map Fader"])
  AbyssUI_WorldMapFade_CheckButton.tooltip = L["Makes the worldmap fade while you move"]
  AbyssUI_WorldMapFade_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionWorldMapFade)
  -- OnClick Function
  AbyssUI_WorldMapFade_CheckButton:SetScript("OnClick", function(self)
    if (not leatrix) then
      if (GetWoWVersion == 20502 or GetWoWVersion <= 12400) then
        AbyssUIAddonSettings.ExtraFunctionWorldMapFade = self:GetChecked()
        AbyssUI_ReloadFrame:Show()
      else
        UIErrorsFrame:AddMessage(L["Not available in this version of WoW!"], 1.0, 0.1, 0.1, 1.0)
        AbyssUI_WorldMapFade_CheckButton:SetChecked(nil)
      end
    end
  end)
  -- After Login/Reload
  AbyssUI_WorldMapFade_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
  AbyssUI_WorldMapFade_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if ( event == "PLAYER_ENTERING_WORLD" ) then
      if (not leatrix) then
        if (GetWoWVersion == 20502 or GetWoWVersion <= 12400) then
          if ( AbyssUIAddonSettings.ExtraFunctionWorldMapFade == true ) then
            PlayerMovementFrameFader.AddDeferredFrame(WorldMapFrame, .60, 1.0, .60)
          end
        end
      end
    end
  end)
  -- Default Nameplate Range --
  local AbyssUI_DefaultNameplate_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_DefaultNameplate_CheckButton", AbyssUI_Config.childpanel7, "ChatConfigCheckButtonTemplate")
  AbyssUI_DefaultNameplate_CheckButton:SetPoint("TOPLEFT", 10, -290)
  AbyssUI_DefaultNameplate_CheckButton.Text:SetText(L["Default Nameplate Range"])
  AbyssUI_DefaultNameplate_CheckButton.tooltip = L["Disable the double range of"..
  " nameplates to Blizzard default value"]
  AbyssUI_DefaultNameplate_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionDefaultNameplate)
  -- OnClick Function
  AbyssUI_DefaultNameplate_CheckButton:SetScript("OnClick", function(self)
    if (GetWoWVersion == 20502 or GetWoWVersion <= 12400) then
      AbyssUIAddonSettings.ExtraFunctionDefaultNameplate = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["Not available in this version of WoW!"], 1.0, 0.1, 0.1, 1.0)
      AbyssUI_DefaultNameplate_CheckButton:SetChecked(nil)
    end
  end)
  -- Disable QuestFrame Border
  local DisableQuestFrame_CheckButton = CreateFrame("CheckButton", "$parentDisableQuestFrame_CheckButton", AbyssUI_Config.childpanel7, "ChatConfigCheckButtonTemplate")
  DisableQuestFrame_CheckButton:SetPoint("TOPLEFT", 10, -320)
  DisableQuestFrame_CheckButton.Text:SetText(L["Default QuestFrame"])
  local Frame = CreateFrame("Frame", nil, DisableQuestFrame_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  DisableQuestFrame_CheckButton.Text:SetAllPoints(Frame)
  DisableQuestFrame_CheckButton.tooltip = L["Disable QuestFrame border and text colorization to default from Blizzard"]
  DisableQuestFrame_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionDisableQuestFrame)
  -- OnClick Function
  DisableQuestFrame_CheckButton:SetScript("OnClick", function(self)
    if (GetWoWVersion == 20502 or GetWoWVersion <= 12400) then
      AbyssUIAddonSettings.ExtraFunctionDisableQuestFrame = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["Not available in this version of WoW!"], 1.0, 0.1, 0.1, 1.0)
      DisableQuestFrame_CheckButton:SetChecked(nil)
    end
  end)
  -- 2nd Collum
  -- Read tooltip --
  local PSINFOScale_CheckButton = CreateFrame("Frame", "$parentPSINFOScale_CheckButton", AbyssUI_Config.childpanel7)
  PSINFOScale_CheckButton:SetPoint("BOTTOMLEFT", AbyssUI_Config.childpanel7, "BOTTOMLEFT", 10, 20)
  PSINFOScale_CheckButton:SetWidth(600)
  PSINFOScale_CheckButton:SetHeight(40)
  PSINFOScale_CheckButton:SetScale(1)
  PSINFOScale_CheckButton = PSINFOScale_CheckButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  PSINFOScale_CheckButton:SetPoint("LEFT")
  PSINFOScale_CheckButton:SetAllPoints()
  PSINFOScale_CheckButton:SetText(L["|cffb62a25In development, more features will be added soon, so be patient.|r"])
  end
----------------------------------- Scale & Frame Size  -----------------------------------
--[[
local function ScaleFrameSize()
  -- Read tooltip --
  if (GetWoWVersion <= 90500) then
    local PSINFOScale_CheckButton = CreateFrame("Frame","$parentPSINFOScale_CheckButton", AbyssUI_Config.childpanel8)
    PSINFOScale_CheckButton:SetPoint("BOTTOMLEFT", AbyssUI_Config.childpanel8, "BOTTOMLEFT", 10, 20)
    PSINFOScale_CheckButton:SetWidth(600)
    PSINFOScale_CheckButton:SetHeight(40)
    PSINFOScale_CheckButton:SetScale(1)
    PSINFOScale_CheckButton = PSINFOScale_CheckButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    PSINFOScale_CheckButton:SetPoint("LEFT")
    PSINFOScale_CheckButton:SetAllPoints()
    PSINFOScale_CheckButton:SetText(L["|cffb62a25This is a work in progress,".. 
    " I'm still learning how it works, please report any bugs in our discord|r"])
    -- Slider Func
    local CreateBasicSlider = function(parent, name, title, minVal, maxVal, valStep)
      local slider = CreateFrame("Slider", name, parent, "OptionsSliderTemplate")
      local editbox = CreateFrame("EditBox", "$parentEditBox", slider, "InputBoxTemplate")
      slider:SetMinMaxValues(minVal, maxVal)
      --slider:SetValue(1)
      slider:SetValueStep(valStep)
      slider.text     = _G[name.."Text"]
      slider.text:SetText(title)
      slider.textLow  = _G[name.."Low"]
      slider.textHigh = _G[name.."High"]
      slider.textLow:SetText(math.floor(minVal))
      slider.textHigh:SetText(math.floor(maxVal))
      slider.textLow:SetTextColor(0.4,0.4,0.4)
      slider.textHigh:SetTextColor(0.4,0.4,0.4)
      editbox:SetSize(50,30)
      editbox:ClearAllPoints()
      editbox:SetPoint("LEFT", slider, "RIGHT", 15, 0)
      editbox:SetText(slider:GetValue())
      editbox:SetAutoFocus(false)
      slider:SetScript("OnValueChanged", function(self,value)
        self.editbox:SetText(math.floor(value/valStep)/100)
      end)
      editbox:SetScript("OnTextChanged", function(self)
        if tonumber(val) then
           self:GetParent():SetValue(val)
        end
      end)
      editbox:SetScript("OnEnterPressed", function(self)
        local val = self:GetText()
        if tonumber(val) then
           self:GetParent():SetValue(val)
           self:ClearFocus()
        end
      end)
      slider.editbox = editbox
      return slider
    end
    -- Minimap
    local AbyssUI_MinimapSlider = CreateBasicSlider(AbyssUI_Config.childpanel8, "AbyssUI_MinimapSlider", "Minimap", 0, 2, 0.01)
    AbyssUI_MinimapSlider:SetPoint("TOPLEFT", 20, -80)
    AbyssUI_MinimapSlider:HookScript("OnValueChanged", function(self, value)
      if (value ~= nil and value > 0) then
        local newValue = string.format("%.2f", value)
        if (not InCombatLockdown()) then
          MinimapCluster:SetScale(newValue)
          AbyssUIAddonSettings[character].Slider.MinimapSlider = newValue
        end
      end
    end)
    -- Player Frame / Target / Focus
    local AbyssUI_UnitFrameSlider = CreateBasicSlider(AbyssUI_Config.childpanel8, "AbyssUI_UnitFrameSlider", "UnitFrame", 0, 2, 0.01)
    AbyssUI_UnitFrameSlider:SetPoint("TOPLEFT", 20, -110)
    AbyssUI_UnitFrameSlider:HookScript("OnValueChanged", function(self, value)
      if (value ~= nil and value > 0 and GetWoWVersion <= 90500) then
        local newValue = string.format("%.2f", value)
        if (not InCombatLockdown()) then
          for i, v in pairs({
            PlayerFrame,
            TargetFrame,
            FocusFrame,
          }) do
            v:SetScale(newValue)
          end
          AbyssUIAddonSettings[character].Slider.UnitFrameSlider = newValue
        end
      end
    end)
    -- BuffFrame
    local AbyssUI_BuffFrameSlider = CreateBasicSlider(AbyssUI_Config.childpanel8, "AbyssUI_BuffFrameSlider", "BuffFrame", 0, 2, 0.01)
    AbyssUI_BuffFrameSlider:SetPoint("TOPLEFT", 20, -140)
    AbyssUI_BuffFrameSlider:HookScript("OnValueChanged", function(self, value)
      if (value ~= nil and value > 0) then
        local newValue = string.format("%.2f", value)
        if (not InCombatLockdown()) then
          BuffFrame:SetScale(newValue)
          AbyssUIAddonSettings[character].Slider.BuffFrameSlider = newValue
        end
      end
    end)
    -- Party Frame
    local AbyssUI_PartyFrameSlider = CreateBasicSlider(AbyssUI_Config.childpanel8, "AbyssUI_PartyFrameSlider", "PartyFrame", 0, 2, 0.01)
    AbyssUI_PartyFrameSlider:SetPoint("TOPLEFT", 20, -170)
    AbyssUI_PartyFrameSlider:HookScript("OnValueChanged", function(self, value)
      if (value ~= nil and value > 0) then
        local newValue = string.format("%.2f", value)
        if (not InCombatLockdown()) then
          for i, v in pairs({
            PartyMemberFrame1,
            PartyMemberFrame2,
            PartyMemberFrame3,
            PartyMemberFrame4,
          }) do
            v:SetScale(newValue)
          end
          AbyssUIAddonSettings[character].Slider.PartyFrameSlider = newValue
        end
      end
    end)
    -- Raid Frame
    local AbyssUI_RaidFrameSlider = CreateBasicSlider(AbyssUI_Config.childpanel8, "AbyssUI_RaidFrameSlider", "RaidFrame", 0, 2, 0.01)
    AbyssUI_RaidFrameSlider:SetPoint("TOPLEFT", 20, -200)
    AbyssUI_RaidFrameSlider:HookScript("OnValueChanged", function(self, value)
      if (value ~= nil and value > 0) then
        local newValue = string.format("%.2f", value)
        if (not InCombatLockdown()) then
          CompactRaidFrameContainer:SetScale(newValue)
          AbyssUIAddonSettings[character].Slider.RaidFrameSlider = newValue
        end
      end
    end)
    -- Objective Frame
    local AbyssUI_ObjectiveFrameSlider = CreateBasicSlider(AbyssUI_Config.childpanel8, "AbyssUI_ObjectiveFrameSlider", "QuestFrame", 0, 2, 0.01)
    AbyssUI_ObjectiveFrameSlider:SetPoint("TOPLEFT", 20, -230)
    AbyssUI_ObjectiveFrameSlider:HookScript("OnValueChanged", function(self, value)
      if (value ~= nil and value > 0) then
        local newValue = string.format("%.2f", value)
        if (GetWoWVersion > 30600) then
          if (not InCombatLockdown() and ObjectiveTrackerFrame:IsShown()) then
            ObjectiveTrackerFrame:SetScale(newValue)
            AbyssUIAddonSettings[character].Slider.ObjectiveFrameSlider = newValue
          end
        else
          if (not InCombatLockdown() and QuestWatchFrame:IsShown()) then
            QuestWatchFrame:SetScale(newValue)
            AbyssUIAddonSettings[character].Slider.QuestWatchFrame = newValue
          end
        end
      end
    end)
  end
end
--]]
--End
----------------------------------- Patreon  -----------------------------------
local function Patreon()
  local PSINFOPatreon_CheckButton = CreateFrame("Frame","$parentPSINFOPatreon_CheckButton", AbyssUI_Config.childpanel9)
  PSINFOPatreon_CheckButton:SetPoint("BOTTOMLEFT", AbyssUI_Config.childpanel9, "BOTTOMLEFT", 20, -5)
  PSINFOPatreon_CheckButton:SetHeight(80)
  PSINFOPatreon_CheckButton:SetWidth(600)
  PSINFOPatreon_CheckButton = PSINFOPatreon_CheckButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  PSINFOPatreon_CheckButton:SetPoint("LEFT")
  PSINFOPatreon_CheckButton:SetAllPoints()
  PSINFOPatreon_CheckButton:SetText("")
  PSINFOPatreon_CheckButton:SetFont(globalFont, 18)
  --
  -- Bronze
  local AbyssUI_PatreonBronze = CreateFrame("Frame", "$parentAbyssUI_PatreonBronze", AbyssUI_Config.childpanel9)
  AbyssUI_PatreonBronze:SetFrameStrata("HIGH")
  AbyssUI_PatreonBronze:SetHeight(48)
  AbyssUI_PatreonBronze:SetWidth(48)
  AbyssUI_PatreonBronze:SetPoint("TOP", -220, -60)
  local t = AbyssUI_PatreonBronze:CreateTexture(nil, "BACKGROUND")
  t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\BronzeIcon")
  t:SetAllPoints(AbyssUI_PatreonBronze)
  -- text
  local PatreonBronzeText = CreateFrame("Frame","$parentPatreonBronzeText", AbyssUI_Config.childpanel9)
  PatreonBronzeText:SetPoint("TOPLEFT", AbyssUI_Config.childpanel9, "TOPLEFT", -189, -80)
  PatreonBronzeText:SetHeight(80)
  PatreonBronzeText:SetWidth(600)
  PatreonBronzeText = PatreonBronzeText:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  PatreonBronzeText:SetPoint("LEFT")
  PatreonBronzeText:SetAllPoints()
  PatreonBronzeText:SetText("BRONZE")
  PatreonBronzeText:SetFont(globalFont, 14)
  -- Patreons Bronze
  local PatreonBronzeTextPatrons = CreateFrame("Frame","$parentPatreonBronzeTextPatrons", AbyssUI_Config.childpanel9)
  PatreonBronzeTextPatrons:SetPoint("TOPLEFT", AbyssUI_Config.childpanel9, "TOPLEFT", -189, -100)
  PatreonBronzeTextPatrons:SetHeight(80)
  PatreonBronzeTextPatrons:SetWidth(600)
  PatreonBronzeTextPatrons = PatreonBronzeTextPatrons:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  PatreonBronzeTextPatrons:SetPoint("LEFT")
  PatreonBronzeTextPatrons:SetAllPoints()
  PatreonBronzeTextPatrons:SetText("|cffcd7f32".."Maurizio".."|r")
  PatreonBronzeTextPatrons:SetFont(globalFont, 14)
  -- Silver
  local AbyssUI_PatreonSilver = CreateFrame("Frame", "$parentAbyssUI_PatreonSilver", AbyssUI_Config.childpanel9)
  AbyssUI_PatreonSilver:SetFrameStrata("HIGH")
  AbyssUI_PatreonSilver:SetHeight(64)
  AbyssUI_PatreonSilver:SetWidth(64)
  AbyssUI_PatreonSilver:SetPoint("TOP", -20, -60)
  local t = AbyssUI_PatreonSilver:CreateTexture(nil, "BACKGROUND")
  t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\SilverIcon")
  t:SetAllPoints(AbyssUI_PatreonSilver)
  -- text
  local PatreonSilverText = CreateFrame("Frame","$parentPatreonSilverText", AbyssUI_Config.childpanel9)
  PatreonSilverText:SetPoint("TOPLEFT", AbyssUI_Config.childpanel9, "TOPLEFT", 13, -80)
  PatreonSilverText:SetHeight(80)
  PatreonSilverText:SetWidth(600)
  PatreonSilverText = PatreonSilverText:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  PatreonSilverText:SetPoint("LEFT")
  PatreonSilverText:SetAllPoints()
  PatreonSilverText:SetText("SILVER")
  PatreonSilverText:SetFont(globalFont, 14)
  -- Patreons Silver
  local PatreonSilverTextPatrons = CreateFrame("Frame","$parentPatreonSilverTextPatrons", AbyssUI_Config.childpanel9)
  PatreonSilverTextPatrons:SetPoint("TOPLEFT", AbyssUI_Config.childpanel9, "TOPLEFT", 13, -100)
  PatreonSilverTextPatrons:SetHeight(80)
  PatreonSilverTextPatrons:SetWidth(600)
  PatreonSilverTextPatrons = PatreonSilverTextPatrons:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  PatreonSilverTextPatrons:SetPoint("LEFT")
  PatreonSilverTextPatrons:SetAllPoints()
  PatreonSilverTextPatrons:SetText("|cffC0C0C0".."".."|r")
  PatreonSilverTextPatrons:SetFont(globalFont, 14)
  -- Gold
  local AbyssUI_PatreonGold = CreateFrame("Frame", "$parentAbyssUI_PatreonGold", AbyssUI_Config.childpanel9)
  AbyssUI_PatreonGold:SetFrameStrata("HIGH")
  AbyssUI_PatreonGold:SetHeight(64)
  AbyssUI_PatreonGold:SetWidth(64)
  AbyssUI_PatreonGold:SetPoint("TOP", 180, -60)
  local t = AbyssUI_PatreonGold:CreateTexture(nil, "BACKGROUND")
  t:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\extra\\GoldIcon")
  t:SetAllPoints(AbyssUI_PatreonGold)
  -- text
  local PatreonGoldText = CreateFrame("Frame","$parentPatreonGoldText", AbyssUI_Config.childpanel9)
  PatreonGoldText:SetPoint("TOPLEFT", AbyssUI_Config.childpanel9, "TOPLEFT", 214, -80)
  PatreonGoldText:SetHeight(80)
  PatreonGoldText:SetWidth(600)
  PatreonGoldText = PatreonGoldText:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  PatreonGoldText:SetPoint("LEFT")
  PatreonGoldText:SetAllPoints()
  PatreonGoldText:SetText("GOLD")
  PatreonGoldText:SetFont(globalFont, 14)
  -- Patreons Gold
  local PatreonGoldTextPatrons = CreateFrame("Frame","$parentPatreonGoldTextPatrons", AbyssUI_Config.childpanel9)
  PatreonGoldTextPatrons:SetPoint("TOPLEFT", AbyssUI_Config.childpanel9, "TOPLEFT", 214, -100)
  PatreonGoldTextPatrons:SetHeight(80)
  PatreonGoldTextPatrons:SetWidth(600)
  PatreonGoldTextPatrons = PatreonGoldTextPatrons:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  PatreonGoldTextPatrons:SetPoint("LEFT")
  PatreonGoldTextPatrons:SetAllPoints()
  PatreonGoldTextPatrons:SetText("|cffffd700".."MrAddict".."|r")
  PatreonGoldTextPatrons:SetFont(globalFont, 14)
end
----------------------------------- Thanks & Translations  -----------------------------------
local function ThanksTraslations()
  local PSINFOThanks_CheckButton = CreateFrame("Frame","$parentPSINFOThanks_CheckButton", AbyssUI_Config.childpanel10)
  PSINFOThanks_CheckButton:SetPoint("BOTTOMLEFT", AbyssUI_Config.childpanel10, "BOTTOMLEFT", 10, 20)
  PSINFOThanks_CheckButton:SetHeight(80)
  PSINFOThanks_CheckButton:SetWidth(600)
  PSINFOThanks_CheckButton = PSINFOThanks_CheckButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  PSINFOThanks_CheckButton:SetPoint("LEFT")
  PSINFOThanks_CheckButton:SetAllPoints()
  PSINFOThanks_CheckButton:SetText(L["Feel free to help translate AbyssUI to your own language, if you want to help, go to AbyssUI Github page, "..
  "there's a folder named 'localization', find the language you know better and help to improve it. Thank you soo much for this."])
  -- Special Thanks
  local Frame = CreateFrame("Frame","$parentFrameThanks", AbyssUI_Config.childpanel10)
  Frame:SetPoint("TOPLEFT", AbyssUI_Config.childpanel10, "TOPLEFT", 0, -60)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["|cff0d75d4Special Thanks|r"])
  local Frame1 = CreateFrame("Frame","$parentFrame1Thanks", AbyssUI_Config.childpanel10)
  Frame1:SetPoint("TOPLEFT", AbyssUI_Config.childpanel10, "TOPLEFT", 10, -80)
  Frame1:SetWidth(600)
  Frame1:SetHeight(40)
  Frame1 = Frame1:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame1:SetAllPoints()
  Frame1:SetJustifyV("LEFT")
  Frame1:SetJustifyH("LEFT")
  Frame1:SetText(L["|cfff2dc7fFizzlemizz|r for helping me with programming questions."])
  local Frame2 = CreateFrame("Frame","$parentFrame2Thanks", AbyssUI_Config.childpanel10)
  Frame2:SetPoint("TOPLEFT", AbyssUI_Config.childpanel10, "TOPLEFT", 10, -100)
  Frame2:SetWidth(600)
  Frame2:SetHeight(40)
  Frame2 = Frame2:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame2:SetAllPoints()
  Frame2:SetJustifyV("LEFT")
  Frame2:SetJustifyH("LEFT")
  Frame2:SetText(L["|cfff2dc7fKawF|r for UnitFrame Improved, so I could create a really nice"..
  " UnitFrame for AbyssUI."])
    local Frame3 = CreateFrame("Frame","$parentFrame3Thanks", AbyssUI_Config.childpanel10)
  Frame3:SetPoint("TOPLEFT", AbyssUI_Config.childpanel10, "TOPLEFT", 10, -120)
  Frame3:SetWidth(600)
  Frame3:SetHeight(40)
  Frame3 = Frame3:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame3:SetAllPoints()
  Frame3:SetJustifyV("LEFT")
  Frame3:SetJustifyH("LEFT")
  Frame3:SetText(L["|cfff2dc7fLortUI|r for better icon borders and shadows."])
  -- Translations
  local Frame = CreateFrame("Frame","$parentFrameThanks", AbyssUI_Config.childpanel10)
  Frame:SetPoint("LEFT", AbyssUI_Config.childpanel10, "TOPLEFT", 0, -200)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["|cff0d75d4Translators|r"])
  --
  local Frame = CreateFrame("Frame","$parentFrameTranslations", AbyssUI_Config.childpanel10)
  Frame:SetPoint("LEFT", AbyssUI_Config.childpanel10, "TOPLEFT", 10, -230)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetJustifyV("LEFT")
  Frame:SetJustifyH("LEFT")
  Frame:SetText(L["|cfff2dc7fEnglish (United States): |r"]..L["Default"])
  --
  local Frame = CreateFrame("Frame","$parentFrameTranslations", AbyssUI_Config.childpanel10)
  Frame:SetPoint("LEFT", AbyssUI_Config.childpanel10, "TOPLEFT", 10, -260)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetJustifyV("LEFT")
  Frame:SetJustifyH("LEFT")
  Frame:SetText(L["|cfff2dc7fSpanish (Mexico): |r"]..L["Need Translator"])
  --
  local Frame = CreateFrame("Frame","$parentFrameTranslations", AbyssUI_Config.childpanel10)
  Frame:SetPoint("LEFT", AbyssUI_Config.childpanel10, "TOPLEFT", 10, -290)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetJustifyV("LEFT")
  Frame:SetJustifyH("LEFT")
  Frame:SetText(L["|cfff2dc7fPortuguese: |r"].."Yūgen")
  --
  local Frame = CreateFrame("Frame","$parentFrameTranslations", AbyssUI_Config.childpanel10)
  Frame:SetPoint("LEFT", AbyssUI_Config.childpanel10, "TOPLEFT", 10, -320)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetJustifyV("LEFT")
  Frame:SetJustifyH("LEFT")
  Frame:SetText(L["|cfff2dc7fGerman: |r"]..L["Need Translator"])
  --
  local Frame = CreateFrame("Frame","$parentFrameTranslations", AbyssUI_Config.childpanel10)
  Frame:SetPoint("LEFT", AbyssUI_Config.childpanel10, "TOPLEFT", 10, -350)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetJustifyV("LEFT")
  Frame:SetJustifyH("LEFT")
  Frame:SetText(L["|cfff2dc7fEnglish (Great Britain): |r"]..L["Default"])
  --
  local Frame = CreateFrame("Frame","$parentFrameTranslations", AbyssUI_Config.childpanel10)
  Frame:SetPoint("LEFT", AbyssUI_Config.childpanel10, "TOPLEFT", 10, -380)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetJustifyV("LEFT")
  Frame:SetJustifyH("LEFT")
  Frame:SetText(L["|cfff2dc7fSpanish (Spain): |r"]..L["Need Translator"])
  --
  local Frame = CreateFrame("Frame","$parentFrameTranslations", AbyssUI_Config.childpanel10)
  Frame:SetPoint("LEFT", AbyssUI_Config.childpanel10, "TOPLEFT", -10, -230)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetJustifyV("RIGHT")
  Frame:SetJustifyH("RIGHT")
  Frame:SetText(L["|cfff2dc7fFrench: |r"]..L["Need Translator"])
  --
  local Frame = CreateFrame("Frame","$parentFrameTranslations", AbyssUI_Config.childpanel10)
  Frame:SetPoint("LEFT", AbyssUI_Config.childpanel10, "TOPLEFT", -10, -260)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetJustifyV("RIGHT")
  Frame:SetJustifyH("RIGHT")
  Frame:SetText(L["|cfff2dc7fItalian: |r"]..L["Need Translator"])
  --
  local Frame = CreateFrame("Frame","$parentFrameTranslations", AbyssUI_Config.childpanel10)
  Frame:SetPoint("LEFT", AbyssUI_Config.childpanel10, "TOPLEFT", -10, -290)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetJustifyV("RIGHT")
  Frame:SetJustifyH("RIGHT")
  Frame:SetText(L["|cfff2dc7fRussian: |r"]..L["Need Translator"])
  --
  local Frame = CreateFrame("Frame","$parentFrameTranslations", AbyssUI_Config.childpanel10)
  Frame:SetPoint("LEFT", AbyssUI_Config.childpanel10, "TOPLEFT", -10, -320)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetJustifyV("RIGHT")
  Frame:SetJustifyH("RIGHT")
  Frame:SetText(L["|cfff2dc7fKorean: |r"]..L["Need Translator"])
  --
  local Frame = CreateFrame("Frame","$parentFrameTranslations", AbyssUI_Config.childpanel10)
  Frame:SetPoint("LEFT", AbyssUI_Config.childpanel10, "TOPLEFT", -10, -350)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetJustifyV("RIGHT")
  Frame:SetJustifyH("RIGHT")
  Frame:SetText(L["|cfff2dc7fChinese (Traditional): |r"]..L["Need Translator"])
  --
  local Frame = CreateFrame("Frame","$parentFrameTranslations", AbyssUI_Config.childpanel10)
  Frame:SetPoint("LEFT", AbyssUI_Config.childpanel10, "TOPLEFT", -10, -380)
  Frame:SetWidth(600)
  Frame:SetHeight(40)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetJustifyV("RIGHT")
  Frame:SetJustifyH("RIGHT")
  Frame:SetText(L["|cfff2dc7fChinese (Simplified): |r"].."Wallrained")
end
----------------------------------- FAQ  -----------------------------------
local function FAQ()
  --
  local PSINFOFAQ_CheckButton = CreateFrame("Frame","$parentPSINFOFAQ_CheckButton", AbyssUI_Config.childpanel11)
  PSINFOFAQ_CheckButton:SetPoint("BOTTOMLEFT", AbyssUI_Config.childpanel11, "BOTTOMLEFT", 10, 20)
  PSINFOFAQ_CheckButton:SetHeight(80)
  PSINFOFAQ_CheckButton:SetWidth(600)
  PSINFOFAQ_CheckButton = PSINFOFAQ_CheckButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  PSINFOFAQ_CheckButton:SetPoint("LEFT")
  PSINFOFAQ_CheckButton:SetAllPoints()
  PSINFOFAQ_CheckButton:SetText(L["Always check the FAQ before posting. Bug reports have more visibility on our discord channel."])
  --]]
  -- FAQ
  local Frame = CreateFrame("Frame","$parentFrameFAQ", AbyssUI_Config.childpanel11)
  Frame:SetPoint("TOPLEFT", AbyssUI_Config.childpanel11, "TOPLEFT", 0, -30)
  Frame:SetWidth(600)
  Frame:SetHeight(80)
  Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame:SetAllPoints()
  Frame:SetText(L["|cff0d75d4Frequently Answered Questions|r"])
  local Frame1 = CreateFrame("Frame","$parentFrame1FAQ", AbyssUI_Config.childpanel11)
  Frame1:SetPoint("TOPLEFT", AbyssUI_Config.childpanel11, "TOPLEFT", 10, -80)
  Frame1:SetWidth(600)
  Frame1:SetHeight(80)
  Frame1 = Frame1:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame1:SetAllPoints()
  Frame1:SetJustifyV("LEFT")
  Frame1:SetJustifyH("LEFT")
  Frame1:SetText(L["- How to change fonts or go back to Bliizard default?\n"..
  "A: Go to AbyssUI folder -> textures -> font and change the fonts keeping their names (you need to restart the game)."])
  local Frame2 = CreateFrame("Frame","$parentFrame2FAQ", AbyssUI_Config.childpanel11)
  Frame2:SetPoint("TOPLEFT", AbyssUI_Config.childpanel11, "TOPLEFT", 10, -160)
  Frame2:SetWidth(600)
  Frame2:SetHeight(80)
  Frame2 = Frame2:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame2:SetAllPoints()
  Frame2:SetJustifyV("LEFT")
  Frame2:SetJustifyH("LEFT")
  Frame2:SetText(L["- Do you plan to add save profiles to the UI?\n"..
  "A: No, at least it's not on my plans right now. At this point, the interface have so many options and I have short time to work on it, so it's not planned."])
  local Frame3 = CreateFrame("Frame","$parentFrame3FAQ", AbyssUI_Config.childpanel11)
  Frame3:SetPoint("TOPLEFT", AbyssUI_Config.childpanel11, "TOPLEFT", 10, -240)
  Frame3:SetWidth(600)
  Frame3:SetHeight(80)
  Frame3 = Frame3:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame3:SetAllPoints()
  Frame3:SetJustifyV("LEFT")
  Frame3:SetJustifyH("LEFT")
  Frame3:SetText(L["- Some texture are looking/acting weird or Texture/Image is not right or cropped?\n"..
  "A: You are probably using a old version of AbyssUI, try a fresh installation, delete the old version and re-download it."])
  local Frame4 = CreateFrame("Frame","$parentFrame4FAQ", AbyssUI_Config.childpanel11)
  Frame4:SetPoint("TOPLEFT", AbyssUI_Config.childpanel11, "TOPLEFT", 10, -320)
  Frame4:SetWidth(600)
  Frame4:SetHeight(80)
  Frame4 = Frame4:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  Frame4:SetAllPoints()
  Frame4:SetJustifyV("LEFT")
  Frame4:SetJustifyH("LEFT")
  Frame4:SetText(L["- How to make interface looks like in the video?\n"..
  "A: The white buttons was another project that was discontinued due to the lack of time and the amount of work that was needed to make it work under different conditions. It may still work, but no support or upcoming updates are planned."])
end
----------------------------- AbyssUI Stylization ------------------------------
local function Stylization()
  -- Player Portrait Style --
  local PSINFO_CheckButton = CreateFrame("Frame","$parentPSINFO_CheckButton", AbyssUI_Config.childpanel4)
  PSINFO_CheckButton:SetPoint("BOTTOMLEFT", AbyssUI_Config.childpanel4, "BOTTOMLEFT", 10, 20)
  PSINFO_CheckButton:SetWidth(600)
  PSINFO_CheckButton:SetHeight(40)
  PSINFO_CheckButton = PSINFO_CheckButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  PSINFO_CheckButton:SetPoint("LEFT")
  PSINFO_CheckButton:SetAllPoints()
  --PSINFO_CheckButton:SetText(L["Some of this options needs the AbyssUI_TexturePack."..
  --" You can find a download link in the addon page. You also can find the link in te 'Info Panel' section."])
  -- UnitFrame Themes
  -- UnitFrame Improved --
  local UnitFrameImproved_CheckButton = CreateFrame("CheckButton", "$parentUnitFrameImproved_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  UnitFrameImproved_CheckButton:SetPoint("TOPLEFT", 400, -80)
  UnitFrameImproved_CheckButton.Text:SetText(L["|cfff2dc7fUnitFrame Improved|r"])
  local Frame = CreateFrame("Frame", nil, UnitFrameImproved_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  UnitFrameImproved_CheckButton.Text:SetAllPoints(Frame)
  UnitFrameImproved_CheckButton.tooltip = L["This is a improved version of unitframes,"..
  " it changes those frames to a more beautiful and complete version"]
  UnitFrameImproved_CheckButton:SetChecked(AbyssUIAddonSettings.UnitFrameImproved)
  addonTable.UnitFrameImproved = UnitFrameImproved_CheckButton
  -- OnClick Function
  UnitFrameImproved_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.UnitFrameImproved = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- UnitFrame DragonFlight --
  local UnitFrameImproved_Dragonflight = CreateFrame("CheckButton", "$parentUnitFrameImproved_Dragonflight", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  UnitFrameImproved_Dragonflight:SetPoint("TOPLEFT", 400, -110)
  UnitFrameImproved_Dragonflight.Text:SetText("|cfff2dc7fDragonflight UnitFrame|r")
  local Frame = CreateFrame("Frame", nil, UnitFrameImproved_Dragonflight)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  UnitFrameImproved_Dragonflight.Text:SetAllPoints(Frame)
  UnitFrameImproved_Dragonflight.tooltip = L["Dragonflight UnitFrame"]
  UnitFrameImproved_Dragonflight:SetChecked(AbyssUIAddonSettings.Dragonflight)
  addonTable.Dragonflight = UnitFrameImproved_Dragonflight
  -- OnClick Function
  UnitFrameImproved_Dragonflight:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.DKAllyPortrait     ~= true and 
      AbyssUIAddonSettings.DKHordePortrait     ~= true and
      AbyssUIAddonSettings.DemonHunterPortrait ~= true then
      AbyssUIAddonSettings.Dragonflight = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one UnitFrame portrait art"], 1.0, 0.1, 0.1, 1.0)
      UnitFrameImproved_Dragonflight:SetChecked(nil)
    end
  end)
  -- Elite Portrait --
  local ElitePortrait_CheckButton = CreateFrame("CheckButton", "$parentElitePortrait_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  ElitePortrait_CheckButton:SetPoint("TOPLEFT", 400, -140)
  ElitePortrait_CheckButton.Text:SetText(L["|cfff2dc7fElite Portrait|r"])
  local Frame = CreateFrame("Frame", nil, ElitePortrait_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  ElitePortrait_CheckButton.Text:SetAllPoints(Frame)
  ElitePortrait_CheckButton.tooltip = L["Add a elite texture to the player portrait"]
  ElitePortrait_CheckButton:SetChecked(AbyssUIAddonSettings.ElitePortrait)
  addonTable.ElitePortrait = ElitePortrait_CheckButton
  -- OnClick Function
  ElitePortrait_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.DKAllyPortrait     ~= true and 
      AbyssUIAddonSettings.DKHordePortrait     ~= true and
      AbyssUIAddonSettings.DemonHunterPortrait ~= true then
      AbyssUIAddonSettings.ElitePortrait = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one UnitFrame portrait art"], 1.0, 0.1, 0.1, 1.0)
      ElitePortrait_CheckButton:SetChecked(nil)
    end
  end)
  -- Flat HealthBar --
  local FlatHealthBar_CheckButton = CreateFrame("CheckButton", "$parentFlatHealthBar_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  FlatHealthBar_CheckButton:SetPoint("TOPLEFT", 400, -170)
  FlatHealthBar_CheckButton.Text:SetText("|cfff2dc7f"..L["Flat HealthBars"].."|r")
  local Frame = CreateFrame("Frame", nil, FlatHealthBar_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  FlatHealthBar_CheckButton.Text:SetAllPoints(Frame)
  FlatHealthBar_CheckButton.tooltip = L["Make the health bar textures looks Flat"]
  FlatHealthBar_CheckButton:SetChecked(AbyssUIAddonSettings.FlatHealth)
  addonTable.FlatHealth = FlatHealthBar_CheckButton
  -- OnClick Function
  FlatHealthBar_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.FlatHealth = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end)
  -- Dk Ally --
  local DKAllyPortrait_CheckButton = CreateFrame("CheckButton", "$parentDKAllyPortrait_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  DKAllyPortrait_CheckButton:SetPoint("TOPLEFT", 400, -200)
  DKAllyPortrait_CheckButton.Text:SetText(L["DeathKnight Alliance Portrait"])
  local Frame = CreateFrame("Frame", nil, DKAllyPortrait_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  DKAllyPortrait_CheckButton.Text:SetAllPoints(Frame)
  DKAllyPortrait_CheckButton.tooltip = L["Add a sword texture to the player portrait"]
  DKAllyPortrait_CheckButton:SetChecked(AbyssUIAddonSettings.DKAllyPortrait)
  -- OnClick Function
  DKAllyPortrait_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.ElitePortrait       ~= true and 
      AbyssUIAddonSettings.DKHordePortrait      ~= true and 
      AbyssUIAddonSettings.DemonHunterPortrait  ~= true then
      AbyssUIAddonSettings.DKAllyPortrait = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one UnitFrame portrait art"], 1.0, 0.1, 0.1, 1.0)
      DKAllyPortrait_CheckButton:SetChecked(nil)
    end
  end)
  -- Dk Horde Portrait --
  local DKHordePortrait_CheckButton = CreateFrame("CheckButton", "$parentDKHordePortrait_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  DKHordePortrait_CheckButton:SetPoint("TOPLEFT", 400, -230)
  DKHordePortrait_CheckButton.Text:SetText(L["DeathKnight Horde Portrait"])
  local Frame = CreateFrame("Frame", nil, DKHordePortrait_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  DKHordePortrait_CheckButton.Text:SetAllPoints(Frame)
  DKHordePortrait_CheckButton.tooltip = L["Add a sword texture to the player portrait"]
  DKHordePortrait_CheckButton:SetChecked(AbyssUIAddonSettings.DKHordePortrait)
  -- OnClick Function
  DKHordePortrait_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.ElitePortrait      ~= true and 
      AbyssUIAddonSettings.DKAllyPortrait      ~= true and 
      AbyssUIAddonSettings.DemonHunterPortrait ~= true then
      AbyssUIAddonSettings.DKHordePortrait = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one UnitFrame portrait art"], 1.0, 0.1, 0.1, 1.0)
      DKHordePortrait_CheckButton:SetChecked(nil)
    end
  end)
  -- Demon Hunter Portrait --
  local DemonHunterPortrait_CheckButton = CreateFrame("CheckButton", "$parentDemonHunterPortrait_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  DemonHunterPortrait_CheckButton:SetPoint("TOPLEFT", 400, -260)
  DemonHunterPortrait_CheckButton.Text:SetText(L["Demon Hunter Portrait"])
  local Frame = CreateFrame("Frame", nil, DemonHunterPortrait_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  DemonHunterPortrait_CheckButton.Text:SetAllPoints(Frame)
  DemonHunterPortrait_CheckButton.tooltip = L["Add a DH inspired texture to the player portrait"]
  DemonHunterPortrait_CheckButton:SetChecked(AbyssUIAddonSettings.DemonHunterPortrait)
  -- OnClick Function
  DemonHunterPortrait_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.ElitePortrait  ~= true and 
      AbyssUIAddonSettings.DKAllyPortrait  ~= true and 
      AbyssUIAddonSettings.DKHordePortrait ~= true then
      AbyssUIAddonSettings.DemonHunterPortrait = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one UnitFrame portrait art"], 1.0, 0.1, 0.1, 1.0)
      DemonHunterPortrait_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles01_CheckButton
  local AbyssUIClassCircles01_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles01_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles01_CheckButton:SetPoint("TOPLEFT", 10, -80)
  AbyssUIClassCircles01_CheckButton.Text:SetText(L["Artistic"])
  AbyssUIClassCircles01_CheckButton.tooltip = L["A artistic version of UnitPlayerFrame"]
  AbyssUIClassCircles01_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles01)
  -- OnClick Function
  AbyssUIClassCircles01_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles02 ~= true and 
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
      AbyssUIAddonSettings.UIClassCircles01 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles01_CheckButton:SetChecked(nil)
    end
  end)
  -- Icon Border --
  -- Gloss
  local GlossIconBorder_CheckButton = CreateFrame("CheckButton", "$parentGlossIconBorder_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  GlossIconBorder_CheckButton:SetPoint("TOPLEFT", 10, -350)
  GlossIconBorder_CheckButton.Text:SetText(L["Class Color"])
  local Frame = CreateFrame("Frame", nil, GlossIconBorder_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  GlossIconBorder_CheckButton.Text:SetAllPoints(Frame)
  GlossIconBorder_CheckButton.tooltip = L["Change icon border to a class colored theme"]
  GlossIconBorder_CheckButton:SetChecked(AbyssUIAddonSettings.GlossIconBorder)
  -- OnClick Function
  GlossIconBorder_CheckButton:SetScript("OnClick", function(self)
   if AbyssUIAddonSettings.CrispIconBorder    ~= true and 
      AbyssUIAddonSettings.OriginalIconBorder ~= true and 
      AbyssUIAddonSettings.SquareIconBorder   ~= true and 
      AbyssUIAddonSettings.GlassIconBorder    ~= true and
      AbyssUIAddonSettings.OldIconBorder      ~= true and
      AbyssUIAddonSettings.ThinIconBorder     ~= true then 
      AbyssUIAddonSettings.GlossIconBorder = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to select just one of those options so they don't overlap"], 1.0, 0.1, 0.1, 1.0)
      GlossIconBorder_CheckButton:SetChecked(nil)
    end
  end)
  -- Crisp
  local CrispIconBorder_CheckButton = CreateFrame("CheckButton", "$parentCrispIconBorder_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  CrispIconBorder_CheckButton:SetPoint("TOPLEFT", 10, -380)
  CrispIconBorder_CheckButton.Text:SetText(L["Crisp"])
  local Frame = CreateFrame("Frame", nil, CrispIconBorder_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  CrispIconBorder_CheckButton.Text:SetAllPoints(Frame)
  CrispIconBorder_CheckButton.tooltip = L["Change icon border to a crisp theme"]
  CrispIconBorder_CheckButton:SetChecked(AbyssUIAddonSettings.CrispIconBorder)
  -- OnClick Function
  CrispIconBorder_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.GlossIconBorder   ~= true and 
      AbyssUIAddonSettings.OriginalIconBorder ~= true and 
      AbyssUIAddonSettings.SquareIconBorder   ~= true and
      AbyssUIAddonSettings.GlassIconBorder    ~= true and
      AbyssUIAddonSettings.OldIconBorder      ~= true and  
      AbyssUIAddonSettings.ThinIconBorder     ~= true then 
      AbyssUIAddonSettings.CrispIconBorder = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to select just one of those options so they don't overlap"], 1.0, 0.1, 0.1, 1.0)
      CrispIconBorder_CheckButton:SetChecked(nil)
    end
  end)
  -- Original
  local OriginalIconBorder_CheckButton = CreateFrame("CheckButton", "$parentOriginalIconBorder_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  OriginalIconBorder_CheckButton:SetPoint("TOPLEFT", 10, -410)
  OriginalIconBorder_CheckButton.Text:SetText(L["Original"])
  local Frame = CreateFrame("Frame", nil, OriginalIconBorder_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  OriginalIconBorder_CheckButton.Text:SetAllPoints(Frame)
  OriginalIconBorder_CheckButton.tooltip = L["Change icon border to a original theme"]
  OriginalIconBorder_CheckButton:SetChecked(AbyssUIAddonSettings.OriginalIconBorder)
  -- OnClick Function
  OriginalIconBorder_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.CrispIconBorder   ~= true and 
      AbyssUIAddonSettings.GlossIconBorder    ~= true and 
      AbyssUIAddonSettings.SquareIconBorder   ~= true and 
      AbyssUIAddonSettings.GlassIconBorder    ~= true and
      AbyssUIAddonSettings.OldIconBorder      ~= true and 
      AbyssUIAddonSettings.ThinIconBorder     ~= true then 
      AbyssUIAddonSettings.OriginalIconBorder = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to select just one of those options so they don't overlap"], 1.0, 0.1, 0.1, 1.0)
      OriginalIconBorder_CheckButton:SetChecked(nil)
    end
  end)
  -- Square
  local SquareIconBorder_CheckButton = CreateFrame("CheckButton", "$parentSquareIconBorder_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  SquareIconBorder_CheckButton:SetPoint("TOPLEFT", 10, -440)
  SquareIconBorder_CheckButton.Text:SetText(L["Square"])
  local Frame = CreateFrame("Frame", nil, SquareIconBorder_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  SquareIconBorder_CheckButton.Text:SetAllPoints(Frame)
  SquareIconBorder_CheckButton.tooltip = L["Change icon border to a square theme"]
  SquareIconBorder_CheckButton:SetChecked(AbyssUIAddonSettings.SquareIconBorder)
  -- OnClick Function
  SquareIconBorder_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.CrispIconBorder   ~= true and 
      AbyssUIAddonSettings.OriginalIconBorder ~= true and 
      AbyssUIAddonSettings.GlossIconBorder    ~= true and 
      AbyssUIAddonSettings.GlassIconBorder    ~= true and
      AbyssUIAddonSettings.OldIconBorder      ~= true and 
      AbyssUIAddonSettings.ThinIconBorder     ~= true then 
      AbyssUIAddonSettings.SquareIconBorder = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to select just one of those options so they don't overlap"], 1.0, 0.1, 0.1, 1.0)
      SquareIconBorder_CheckButton:SetChecked(nil)
    end
  end)
  -- Thin
  local ThinIconBorder_CheckButton = CreateFrame("CheckButton", "$parentThinIconBorder_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  ThinIconBorder_CheckButton:SetPoint("TOPLEFT", 10, -470)
  ThinIconBorder_CheckButton.Text:SetText(L["Thin"])
  local Frame = CreateFrame("Frame", nil, ThinIconBorder_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  ThinIconBorder_CheckButton.Text:SetAllPoints(Frame)
  ThinIconBorder_CheckButton.tooltip = L["Change icon border to a thin theme"]
  ThinIconBorder_CheckButton:SetChecked(AbyssUIAddonSettings.ThinIconBorder)
  -- OnClick Function
  ThinIconBorder_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.CrispIconBorder   ~= true and 
      AbyssUIAddonSettings.OriginalIconBorder ~= true and 
      AbyssUIAddonSettings.SquareIconBorder   ~= true and 
      AbyssUIAddonSettings.GlassIconBorder    ~= true and
      AbyssUIAddonSettings.OldIconBorder      ~= true and 
      AbyssUIAddonSettings.GlossIconBorder    ~= true then 
      AbyssUIAddonSettings.ThinIconBorder = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to select just one of those options so they don't overlap"], 1.0, 0.1, 0.1, 1.0)
      ThinIconBorder_CheckButton:SetChecked(nil)
    end
  end)
  -- Glass
  local GlassIconBorder_CheckButton = CreateFrame("CheckButton", "$parentGlassIconBorder_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  GlassIconBorder_CheckButton:SetPoint("TOPLEFT", 180, -350)
  GlassIconBorder_CheckButton.Text:SetText(L["Glass"])
  local Frame = CreateFrame("Frame", nil, GlassIconBorder_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  GlassIconBorder_CheckButton.Text:SetAllPoints(Frame)
  GlassIconBorder_CheckButton.tooltip = L["Change the icon to a glass theme"]
  GlassIconBorder_CheckButton:SetChecked(AbyssUIAddonSettings.GlassIconBorder)
  -- OnClick Function
  GlassIconBorder_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.CrispIconBorder   ~= true and 
      AbyssUIAddonSettings.OriginalIconBorder ~= true and 
      AbyssUIAddonSettings.SquareIconBorder   ~= true and 
      AbyssUIAddonSettings.GlossIconBorder    ~= true and
      AbyssUIAddonSettings.OldIconBorder      ~= true and 
      AbyssUIAddonSettings.ThinIconBorder     ~= true then 
      AbyssUIAddonSettings.GlassIconBorder = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to select just one of those options so they don't overlap"], 1.0, 0.1, 0.1, 1.0)
      GlassIconBorder_CheckButton:SetChecked(nil)
    end
  end)
  -- Old Theme
  local OldIconBorder_CheckButton = CreateFrame("CheckButton", "$parentOldIconBorder_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  OldIconBorder_CheckButton:SetPoint("TOPLEFT", 180, -380)
  OldIconBorder_CheckButton.Text:SetText("Classic")
  local Frame = CreateFrame("Frame", nil, OldIconBorder_CheckButton)
  Frame:SetWidth(180)
  Frame:SetHeight(40)
  Frame:SetPoint("LEFT", 25, 0)
  OldIconBorder_CheckButton.Text:SetAllPoints(Frame)
  OldIconBorder_CheckButton.tooltip = "Classic"
  OldIconBorder_CheckButton:SetChecked(AbyssUIAddonSettings.OldIconBorder)
  -- OnClick Function
  OldIconBorder_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.CrispIconBorder   ~= true and 
      AbyssUIAddonSettings.OriginalIconBorder ~= true and 
      AbyssUIAddonSettings.SquareIconBorder   ~= true and 
      AbyssUIAddonSettings.GlossIconBorder    ~= true and
      AbyssUIAddonSettings.GlassIconBorder    ~= true and 
      AbyssUIAddonSettings.ThinIconBorder     ~= true then 
      AbyssUIAddonSettings.OldIconBorder = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to select just one of those options so they don't overlap"], 1.0, 0.1, 0.1, 1.0)
      OldIconBorder_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles02_CheckButton
  local AbyssUIClassCircles02_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles02_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles02_CheckButton:SetPoint("TOPLEFT", 10, -110)
  AbyssUIClassCircles02_CheckButton.Text:SetText(L["Bright"])
  AbyssUIClassCircles02_CheckButton.tooltip = L["A bright version of UnitPlayerFrame"]
  AbyssUIClassCircles02_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles02)
  -- OnClick Function
  AbyssUIClassCircles02_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and 
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
      AbyssUIAddonSettings.UIClassCircles02 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles02_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles03_CheckButton
  local AbyssUIClassCircles03_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles03_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles03_CheckButton:SetPoint("TOPLEFT", 10, -140)
  AbyssUIClassCircles03_CheckButton.Text:SetText(L["Classic"])
  AbyssUIClassCircles03_CheckButton.tooltip = L["A classic version of UnitPlayerFrame"]
  AbyssUIClassCircles03_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles03)
  -- OnClick Function
  AbyssUIClassCircles03_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and
       AbyssUIAddonSettings.UIClassCircles02 ~= true and 
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
      AbyssUIAddonSettings.UIClassCircles03 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles03_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles04_CheckButton
  local AbyssUIClassCircles04_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles04_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles04_CheckButton:SetPoint("TOPLEFT", 10, -170)
  AbyssUIClassCircles04_CheckButton.Text:SetText(L["Artistic(V2)"])
  AbyssUIClassCircles04_CheckButton.tooltip = L["Version two of artistic UnitPlayerFrame"]
  AbyssUIClassCircles04_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles04)
  -- OnClick Function
  AbyssUIClassCircles04_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and
       AbyssUIAddonSettings.UIClassCircles02 ~= true and 
       AbyssUIAddonSettings.UIClassCircles03 ~= true and 
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
      AbyssUIAddonSettings.UIClassCircles04 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles04_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles05_CheckButton
  local AbyssUIClassCircles05_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles05_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles05_CheckButton:SetPoint("TOPLEFT", 180 , -80)
  AbyssUIClassCircles05_CheckButton.Text:SetText(L["Dark"])
  AbyssUIClassCircles05_CheckButton.tooltip = L["Dark version of UnitPlayerFrame"]
  AbyssUIClassCircles05_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles05)
  -- OnClick Function
  AbyssUIClassCircles05_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and 
       AbyssUIAddonSettings.UIClassCircles02 ~= true and 
       AbyssUIAddonSettings.UIClassCircles03 ~= true and 
       AbyssUIAddonSettings.UIClassCircles04 ~= true and 
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
      AbyssUIAddonSettings.UIClassCircles05 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles05_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles06_CheckButton
  local AbyssUIClassCircles06_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles06_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles06_CheckButton:SetPoint("TOPLEFT", 180, -110)
  AbyssUIClassCircles06_CheckButton.Text:SetText(L["DarkGray"])
  AbyssUIClassCircles06_CheckButton.tooltip = L["A dark gray version of UnitPlayerFrame"]
  AbyssUIClassCircles06_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles06)
  -- OnClick Function
  AbyssUIClassCircles06_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and 
       AbyssUIAddonSettings.UIClassCircles02 ~= true and 
       AbyssUIAddonSettings.UIClassCircles03 ~= true and 
       AbyssUIAddonSettings.UIClassCircles04 ~= true and 
       AbyssUIAddonSettings.UIClassCircles05 ~= true and 
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
      AbyssUIAddonSettings.UIClassCircles06 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles06_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles07_CheckButton
  local AbyssUIClassCircles07_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles07_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles07_CheckButton:SetPoint("TOPLEFT", 180, -140)
  AbyssUIClassCircles07_CheckButton.Text:SetText(L["Dark(V2)"])
  AbyssUIClassCircles07_CheckButton.tooltip = L["Version 2 of the dark UnitPlayerFrame"]
  AbyssUIClassCircles07_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles07)
  -- OnClick Function
  AbyssUIClassCircles07_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and 
       AbyssUIAddonSettings.UIClassCircles02 ~= true and 
       AbyssUIAddonSettings.UIClassCircles03 ~= true and 
       AbyssUIAddonSettings.UIClassCircles04 ~= true and 
       AbyssUIAddonSettings.UIClassCircles05 ~= true and 
       AbyssUIAddonSettings.UIClassCircles06 ~= true and 
       AbyssUIAddonSettings.UIClassCircles08 ~= true and 
       AbyssUIAddonSettings.UIClassCircles09 ~= true and 
       AbyssUIAddonSettings.UIClassCircles10 ~= true and 
       AbyssUIAddonSettings.UIClassCircles11 ~= true and 
       AbyssUIAddonSettings.UIClassCircles12 ~= true and
       AbyssUIAddonSettings.UIClassCircles13 ~= true and
       AbyssUIAddonSettings.UIClassCircles14 ~= true and
       AbyssUIAddonSettings.UIClassCircles15 ~= true and
       AbyssUIAddonSettings.UIClassCircles16 ~= true then
      AbyssUIAddonSettings.UIClassCircles07 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles07_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles08_CheckButton
  local AbyssUIClassCircles08_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles08_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles08_CheckButton:SetPoint("TOPLEFT", 180, -170)
  AbyssUIClassCircles08_CheckButton.Text:SetText(L["GrayScale"])
  AbyssUIClassCircles08_CheckButton.tooltip = L["A grayscale version of UnitPlayerFrame"]
  AbyssUIClassCircles08_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles08)
  -- OnClick Function
  AbyssUIClassCircles08_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and
       AbyssUIAddonSettings.UIClassCircles02 ~= true and
       AbyssUIAddonSettings.UIClassCircles03 ~= true and 
       AbyssUIAddonSettings.UIClassCircles04 ~= true and 
       AbyssUIAddonSettings.UIClassCircles05 ~= true and 
       AbyssUIAddonSettings.UIClassCircles06 ~= true and 
       AbyssUIAddonSettings.UIClassCircles07 ~= true and 
       AbyssUIAddonSettings.UIClassCircles09 ~= true and 
       AbyssUIAddonSettings.UIClassCircles10 ~= true and 
       AbyssUIAddonSettings.UIClassCircles11 ~= true and 
       AbyssUIAddonSettings.UIClassCircles12 ~= true and
       AbyssUIAddonSettings.UIClassCircles13 ~= true and
       AbyssUIAddonSettings.UIClassCircles14 ~= true and
       AbyssUIAddonSettings.UIClassCircles15 ~= true and
       AbyssUIAddonSettings.UIClassCircles16 ~= true then
      AbyssUIAddonSettings.UIClassCircles08 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles08_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles09_CheckButton
  local AbyssUIClassCircles09_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles09_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles09_CheckButton:SetPoint("TOPLEFT", 10, -200)
  AbyssUIClassCircles09_CheckButton.Text:SetText(L["LightGray"])
  AbyssUIClassCircles09_CheckButton.tooltip = L["A light gray version of UnitPlayerFrame"]
  AbyssUIClassCircles09_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles09)
  -- OnClick Function
  AbyssUIClassCircles09_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and
       AbyssUIAddonSettings.UIClassCircles02 ~= true and 
       AbyssUIAddonSettings.UIClassCircles03 ~= true and 
       AbyssUIAddonSettings.UIClassCircles04 ~= true and 
       AbyssUIAddonSettings.UIClassCircles05 ~= true and 
       AbyssUIAddonSettings.UIClassCircles06 ~= true and
       AbyssUIAddonSettings.UIClassCircles07 ~= true and 
       AbyssUIAddonSettings.UIClassCircles08 ~= true and 
       AbyssUIAddonSettings.UIClassCircles10 ~= true and 
       AbyssUIAddonSettings.UIClassCircles11 ~= true and 
       AbyssUIAddonSettings.UIClassCircles12 ~= true and
       AbyssUIAddonSettings.UIClassCircles13 ~= true and
       AbyssUIAddonSettings.UIClassCircles14 ~= true and
       AbyssUIAddonSettings.UIClassCircles15 ~= true and
       AbyssUIAddonSettings.UIClassCircles16 ~= true then
      AbyssUIAddonSettings.UIClassCircles09 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles09_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles10_CheckButton
  local AbyssUIClassCircles10_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles10_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles10_CheckButton:SetPoint("TOPLEFT", 180, -200)
  AbyssUIClassCircles10_CheckButton.Text:SetText(L["MediumGray"])
  AbyssUIClassCircles10_CheckButton.tooltip = L["A medium gray version of UnitPlayerFrame"]
  AbyssUIClassCircles10_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles10)
  -- OnClick Function
  AbyssUIClassCircles10_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and 
       AbyssUIAddonSettings.UIClassCircles02 ~= true and 
       AbyssUIAddonSettings.UIClassCircles03 ~= true and 
       AbyssUIAddonSettings.UIClassCircles04 ~= true and 
       AbyssUIAddonSettings.UIClassCircles05 ~= true and 
       AbyssUIAddonSettings.UIClassCircles06 ~= true and 
       AbyssUIAddonSettings.UIClassCircles07 ~= true and 
       AbyssUIAddonSettings.UIClassCircles08 ~= true and 
       AbyssUIAddonSettings.UIClassCircles09 ~= true and 
       AbyssUIAddonSettings.UIClassCircles11 ~= true and 
       AbyssUIAddonSettings.UIClassCircles12 ~= true and
       AbyssUIAddonSettings.UIClassCircles13 ~= true and
       AbyssUIAddonSettings.UIClassCircles14 ~= true and
       AbyssUIAddonSettings.UIClassCircles15 ~= true and
       AbyssUIAddonSettings.UIClassCircles16 ~= true then
      AbyssUIAddonSettings.UIClassCircles10 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles10_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles11_CheckButton
  local AbyssUIClassCircles11_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles11_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles11_CheckButton:SetPoint("TOPLEFT", 10, -230)
  AbyssUIClassCircles11_CheckButton.Text:SetText(L["MinimalBlue"])
  AbyssUIClassCircles11_CheckButton.tooltip = L["A blue version of UnitPlayerFrame"]
  AbyssUIClassCircles11_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles11)
  -- OnClick Function
  AbyssUIClassCircles11_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and 
       AbyssUIAddonSettings.UIClassCircles02 ~= true and 
       AbyssUIAddonSettings.UIClassCircles03 ~= true and 
       AbyssUIAddonSettings.UIClassCircles04 ~= true and 
       AbyssUIAddonSettings.UIClassCircles05 ~= true and 
       AbyssUIAddonSettings.UIClassCircles06 ~= true and 
       AbyssUIAddonSettings.UIClassCircles07 ~= true and 
       AbyssUIAddonSettings.UIClassCircles08 ~= true and 
       AbyssUIAddonSettings.UIClassCircles09 ~= true and 
       AbyssUIAddonSettings.UIClassCircles10 ~= true and 
       AbyssUIAddonSettings.UIClassCircles12 ~= true and
       AbyssUIAddonSettings.UIClassCircles13 ~= true and
       AbyssUIAddonSettings.UIClassCircles14 ~= true and
       AbyssUIAddonSettings.UIClassCircles15 ~= true and
       AbyssUIAddonSettings.UIClassCircles16 ~= true then
      AbyssUIAddonSettings.UIClassCircles11 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles11_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles12_CheckButton
  local AbyssUIClassCircles12_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles12_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles12_CheckButton:SetPoint("TOPLEFT", 180, -230)
  AbyssUIClassCircles12_CheckButton.Text:SetText(L["MinimalRed"])
  AbyssUIClassCircles12_CheckButton.tooltip = L["A red version of UnitPlayerFrame"]
  AbyssUIClassCircles12_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles12)
  -- OnClick Function
  AbyssUIClassCircles12_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and 
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
       AbyssUIAddonSettings.UIClassCircles13 ~= true and
       AbyssUIAddonSettings.UIClassCircles14 ~= true and
       AbyssUIAddonSettings.UIClassCircles15 ~= true and
       AbyssUIAddonSettings.UIClassCircles16 ~= true then
      AbyssUIAddonSettings.UIClassCircles12 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles12_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles13_CheckButton
  local AbyssUIClassCircles13_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles13_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles13_CheckButton:SetPoint("TOPLEFT", 10, -260)
  AbyssUIClassCircles13_CheckButton.Text:SetText(L["Muted"])
  AbyssUIClassCircles13_CheckButton.tooltip = L["A muted version of UnitPlayerFrame"]
  AbyssUIClassCircles13_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles13)
  -- OnClick Function
  AbyssUIClassCircles13_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and 
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
       AbyssUIAddonSettings.UIClassCircles14 ~= true and
       AbyssUIAddonSettings.UIClassCircles15 ~= true and
       AbyssUIAddonSettings.UIClassCircles16 ~= true then
      AbyssUIAddonSettings.UIClassCircles13 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles13_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles14_CheckButton
  local AbyssUIClassCircles14_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles14_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles14_CheckButton:SetPoint("TOPLEFT", 180, -260)
  AbyssUIClassCircles14_CheckButton.Text:SetText(L["Psychedelic"])
  AbyssUIClassCircles14_CheckButton.tooltip = L["A psychedelic version of UnitPlayerFrame"]
  AbyssUIClassCircles14_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles14)
  -- OnClick Function
  AbyssUIClassCircles14_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and 
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
       AbyssUIAddonSettings.UIClassCircles15 ~= true and
       AbyssUIAddonSettings.UIClassCircles16 ~= true then
      AbyssUIAddonSettings.UIClassCircles14 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles14_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles15_CheckButton
  local AbyssUIClassCircles15_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles14_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles15_CheckButton:SetPoint("TOPLEFT", 10, -290)
  AbyssUIClassCircles15_CheckButton.Text:SetText(L["Retro"])
  AbyssUIClassCircles15_CheckButton.tooltip = L["A retrowave version of UnitPlayerFrame"]
  AbyssUIClassCircles15_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles15)
  -- OnClick Function
  AbyssUIClassCircles15_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and 
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
       AbyssUIAddonSettings.UIClassCircles16 ~= true then
      AbyssUIAddonSettings.UIClassCircles15 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles15_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles16_CheckButton
  local AbyssUIClassCircles16_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles14_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles16_CheckButton:SetPoint("TOPLEFT", 180, -290)
  AbyssUIClassCircles16_CheckButton.Text:SetText(L["Vibrant"])
  AbyssUIClassCircles16_CheckButton.tooltip = L["A vibrant version of UnitPlayerFrame"]
  AbyssUIClassCircles16_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles16)
  -- OnClick Function
  AbyssUIClassCircles16_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and 
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
       AbyssUIAddonSettings.UIClassCircles15 ~= true then
      AbyssUIAddonSettings.UIClassCircles16 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any other portrait art to apply a new one"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIClassCircles16_CheckButton:SetChecked(nil)
    end
  end)
  -- Frame Colorization --
  -- AbyssUIVertexColorFrames01_CheckButton
  local AbyssUIVertexColorFrames01_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames01_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames01_CheckButton:SetPoint("TOPLEFT", 10, -80)
  AbyssUIVertexColorFrames01_CheckButton.Text:SetText(L["|cffc0c0c0Blizzard (Default)|r"])
  AbyssUIVertexColorFrames01_CheckButton.tooltip = L["Blizzard Silver Colorization for Frames"]
  AbyssUIVertexColorFrames01_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames01)
  -- OnClick Function
  AbyssUIVertexColorFrames01_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames01 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames01_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames02_CheckButton
  local AbyssUIVertexColorFrames02_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames02_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames02_CheckButton:SetPoint("TOPLEFT", 10, -110)
  AbyssUIVertexColorFrames02_CheckButton.Text:SetText(L["|cff636363Blackout|r"])
  AbyssUIVertexColorFrames02_CheckButton.tooltip = L["A completely dark colorization"]
  AbyssUIVertexColorFrames02_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames02)
  -- OnClick Function
  AbyssUIVertexColorFrames02_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames02 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames02_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames03_CheckButton
  local AbyssUIVertexColorFrames03_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames03_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames03_CheckButton:SetPoint("TOPLEFT", 10, -140)
  AbyssUIVertexColorFrames03_CheckButton.Text:SetText(L["|cffb62a25Blood|r"])
  AbyssUIVertexColorFrames03_CheckButton.tooltip = L["A dark red colorization"]
  AbyssUIVertexColorFrames03_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames03)
  -- OnClick Function
  AbyssUIVertexColorFrames03_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames03 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames03_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames04_CheckButton
  local AbyssUIVertexColorFrames04_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames04_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames04_CheckButton:SetPoint("TOPLEFT", 10, -170)
  AbyssUIVertexColorFrames04_CheckButton.Text:SetText(L["|cffecc13cGold|r"])
  AbyssUIVertexColorFrames04_CheckButton.tooltip = L["A golden colorization"]
  AbyssUIVertexColorFrames04_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames04)
  -- OnClick Function
  AbyssUIVertexColorFrames04_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames04 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames04_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames05_CheckButton
  local AbyssUIVertexColorFrames05_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames05_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames05_CheckButton:SetPoint("TOPLEFT", 10, -200)
  AbyssUIVertexColorFrames05_CheckButton.Text:SetText(L["|cffc41F3BDeath Knight|r"])
  AbyssUIVertexColorFrames05_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames05)
  -- OnClick Function
  AbyssUIVertexColorFrames05_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames05 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames05_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames06_CheckButton
  local AbyssUIVertexColorFrames06_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames06_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames06_CheckButton:SetPoint("TOPLEFT", 10, -230)
  AbyssUIVertexColorFrames06_CheckButton.Text:SetText(L["|cffA330C9Demon Hunter|r"])
  AbyssUIVertexColorFrames06_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames06)
  -- OnClick Function
  AbyssUIVertexColorFrames06_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames06 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames06_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames07_CheckButton
  local AbyssUIVertexColorFrames07_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames07_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames07_CheckButton:SetPoint("TOPLEFT", 10, -260)
  AbyssUIVertexColorFrames07_CheckButton.Text:SetText(L["|cffFF7D0ADruid|r"])
  AbyssUIVertexColorFrames07_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames07)
  -- OnClick Function
  AbyssUIVertexColorFrames07_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames07 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames07_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames08_CheckButton
  local AbyssUIVertexColorFrames08_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames08_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames08_CheckButton:SetPoint("TOPLEFT", 10, -290)
  AbyssUIVertexColorFrames08_CheckButton.Text:SetText(L["|cffABD473Hunter|r"])
  AbyssUIVertexColorFrames08_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames08)
  -- OnClick Function
  AbyssUIVertexColorFrames08_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames08 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames08_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames09_CheckButton
  local AbyssUIVertexColorFrames09_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames09_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames09_CheckButton:SetPoint("TOPLEFT", 10, -320)
  AbyssUIVertexColorFrames09_CheckButton.Text:SetText(L["|cff69CCF0Mage|r"])
  AbyssUIVertexColorFrames09_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames09)
  -- OnClick Function
  AbyssUIVertexColorFrames09_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames09 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames09_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames10_CheckButton
  local AbyssUIVertexColorFrames10_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames10_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames10_CheckButton:SetPoint("TOPLEFT", 10, -350)
  AbyssUIVertexColorFrames10_CheckButton.Text:SetText(L["|cff00FF96Monk|r"])
  AbyssUIVertexColorFrames10_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames10)
  -- OnClick Function
  AbyssUIVertexColorFrames10_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames10 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames10_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames11_CheckButton
  local AbyssUIVertexColorFrames11_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames11_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames11_CheckButton:SetPoint("TOPLEFT", 10, -380)
  AbyssUIVertexColorFrames11_CheckButton.Text:SetText(L["|cffF58CBAPaladin|r"])
  AbyssUIVertexColorFrames11_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames11)
  -- OnClick Function
  AbyssUIVertexColorFrames11_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames11 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames11_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames12_CheckButton
  local AbyssUIVertexColorFrames12_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames12_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames12_CheckButton:SetPoint("TOPLEFT", 10, -410)
  AbyssUIVertexColorFrames12_CheckButton.Text:SetText(L["Priest (Shadow)"])
  AbyssUIVertexColorFrames12_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames12)
  -- OnClick Function
  AbyssUIVertexColorFrames12_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames12 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames12_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames13_CheckButton
  local AbyssUIVertexColorFrames13_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames13_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames13_CheckButton:SetPoint("TOPLEFT", 10, -440)
  AbyssUIVertexColorFrames13_CheckButton.Text:SetText(L["|cffFFF569Rogue|r"])
  AbyssUIVertexColorFrames13_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames13)
  -- OnClick Function
  AbyssUIVertexColorFrames13_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames13 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames13_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames14_CheckButton
  local AbyssUIVertexColorFrames14_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames14_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames14_CheckButton:SetPoint("TOPLEFT", 10, -470)
  AbyssUIVertexColorFrames14_CheckButton.Text:SetText(L["|cff0070DEShaman|r"])
  AbyssUIVertexColorFrames14_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames14)
  -- OnClick Function
  AbyssUIVertexColorFrames14_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames14 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames14_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames15_CheckButton
  local AbyssUIVertexColorFrames15_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames15_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames15_CheckButton:SetPoint("TOPLEFT", 10, -500)
  AbyssUIVertexColorFrames15_CheckButton.Text:SetText(L["|cff9482C9Warlock|r"])
  AbyssUIVertexColorFrames15_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames15)
  -- OnClick Function
  AbyssUIVertexColorFrames15_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames15 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames15_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames16_CheckButton
  local AbyssUIVertexColorFrames16_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames16_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames16_CheckButton:SetPoint("TOPLEFT", 10, -530)
  AbyssUIVertexColorFrames16_CheckButton.Text:SetText(L["|cffC79C6EWarrior|r"])
  AbyssUIVertexColorFrames16_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames16)
  -- OnClick Function
  AbyssUIVertexColorFrames16_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames16 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames16_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames17_CheckButton
  local AbyssUIVertexColorFrames17_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames17_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames17_CheckButton:SetPoint("TOPLEFT", 10, -560)
  AbyssUIVertexColorFrames17_CheckButton.Text:SetText("|cff33937FEvoker|r")
  AbyssUIVertexColorFrames17_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFrames17)
  -- OnClick Function
  AbyssUIVertexColorFrames17_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames17 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      UIErrorsFrame:AddMessage(L["You can only select one preset color, uncheck others"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFrames17_CheckButton:SetChecked(nil)
    end
  end)
  -- Choose a Color (Color Picker)
  local f = CreateFrame("Frame", nil)
  f:RegisterEvent("PLAYER_ENTERING_WORLD")
  f:SetScript("OnEvent", function() 
    local AbyssUIVertexColorFramesColorPicker_Button = CreateFrame("Button", "$parentAbyssUIVertexColorFramesColorPicker_Button", AbyssUI_Config.childpanel5, "UIPanelButtonTemplate")
    AbyssUIVertexColorFramesColorPicker_Button:SetPoint("TOPLEFT", 400, -80)
    AbyssUIVertexColorFramesColorPicker_Button:SetHeight(30)
    AbyssUIVertexColorFramesColorPicker_Button:SetWidth(120)
    AbyssUIVertexColorFramesColorPicker_Button.text = AbyssUIVertexColorFramesColorPicker_Button.text or AbyssUIVertexColorFramesColorPicker_Button:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
    --AbyssUIVertexColorFramesColorPicker_Button.text:SetFont(globalFont, 14)
    AbyssUIVertexColorFramesColorPicker_Button.text:SetPoint("CENTER", AbyssUIVertexColorFramesColorPicker_Button, "CENTER", 0, 0)
    AbyssUIVertexColorFramesColorPicker_Button.text:SetText(colorString)
    if (AbyssUIAddonSettings.FontsValue == true and AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true) then
          AbyssUI_ApplyFonts(AbyssUIVertexColorFramesColorPicker_Button.text)
        else
          AbyssUIVertexColorFramesColorPicker_Button.text:SetFont(globalFont, 14)
          AbyssUIVertexColorFramesColorPicker_Button.text:SetTextColor(248/255, 248/255, 248/255)
          AbyssUIVertexColorFramesColorPicker_Button.text:SetShadowColor(0, 0, 0)
          AbyssUIVertexColorFramesColorPicker_Button.text:SetShadowOffset(1, -1)
        end
    -- OnClick Function
    AbyssUIVertexColorFramesColorPicker_Button:SetScript("OnClick", function(self)
      AbyssUI_ShowColorPicker()
    end)
  end)
  -- Apply Color
  local AbyssUIVertexColorFramesColorPicker_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFramesColorPicker_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFramesColorPicker_CheckButton:SetPoint("TOPLEFT", 400, -110)
  AbyssUIVertexColorFramesColorPicker_CheckButton.Text:SetText(applyString.." "..colorColorString)
  local character = UnitName("player").."-"..GetRealmName()
  AbyssUIVertexColorFramesColorPicker_CheckButton.Text:SetTextColor(COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b)
  AbyssUIVertexColorFramesColorPicker_CheckButton.tooltip = L["Apply the color you choose from the ColorPicker"]
  AbyssUIVertexColorFramesColorPicker_CheckButton:SetChecked(AbyssUIAddonSettings.UIVertexColorFramesColorPicker)
  -- OnClick Function
  AbyssUIVertexColorFramesColorPicker_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIVertexColorFrames01 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames02 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames03 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames04 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames05 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames06 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames07 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames08 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames09 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames10 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames11 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames12 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames13 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames14 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true and
    AbyssUIAddonSettings.UIVertexColorFrames17 ~= true then
      AbyssUIAddonSettings.UIVertexColorFramesColorPicker = self:GetChecked()
      if (AbyssUIAddonSettings.UIVertexColorFramesColorPicker == true) then
        AbyssUIVertexColorFramesColorPicker_CheckButton.Text:SetTextColor(COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b)
        ReloadUI()
      end
    else
      UIErrorsFrame:AddMessage(L["You need to uncheck any preset color, to apply a color"], 1.0, 0.1, 0.1, 1.0)
      AbyssUIVertexColorFramesColorPicker_CheckButton:SetChecked(nil)
    end
  end)
end
-- End
--------------------------------------------------------------
local f = CreateFrame("Frame")
f:SetSize(50, 50)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, ...)
  character = UnitName("player").."-"..GetRealmName()
  if not AbyssUIAddonSettings then
    AbyssUIAddonSettings = {}
  end
  if not AbyssUIAddonSettings[character] then
    AbyssUIAddonSettings[character] = {}
  end
  InitSettings()
  HideElementsInit()
  Miscellaneous()
  TweaksExtra()
  ClassicBCC()
  Patreon()
  ThanksTraslations()
  FAQ()
  Stylization()
  AbyssUI_StatusBarFill()
end)
--------------------------------------------------------------
-- End
