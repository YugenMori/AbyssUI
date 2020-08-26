-- Author: Yugen
--
-- Shadowlands
--
-- Configuration page for AbyssUI
--------------------------------------------------------------------------------
local AbyssUI_Config = {}
local addonName, addonTable = ...
local function InitSettings()
AbyssUI_Config.panel = CreateFrame( "Frame", "$parentAbyssUI_Config", InterfaceOptionsFramePanelContainer)
-- Register in the Interface Addon Options GUI
-- Set the name for the Category for the Options Panel
AbyssUI_Config.panel.name = "Abyss|cff0d75d4UI|r"
-- Add the panel to the Interface Options
InterfaceOptions_AddCategory(AbyssUI_Config.panel, addonName)
--Child Panels
AbyssUI_Config.childpanel1 = CreateFrame( "Frame", "$parentConfigChild_InfoPanel", AbyssUI_Config.panel)
AbyssUI_Config.childpanel1.name = "Info Panel"
AbyssUI_Config.childpanel1.parent = AbyssUI_Config.panel.name
InterfaceOptions_AddCategory(AbyssUI_Config.childpanel1)
--
AbyssUI_Config.childpanel2 = CreateFrame( "Frame", "$parentConfigChild_HideElements", AbyssUI_Config.panel)
AbyssUI_Config.childpanel2.name = "Hide Elements"
AbyssUI_Config.childpanel2.parent = AbyssUI_Config.panel.name
InterfaceOptions_AddCategory(AbyssUI_Config.childpanel2)
--
AbyssUI_Config.childpanel3 = CreateFrame( "Frame", "$parentConfigChild_Miscellaneous", AbyssUI_Config.panel)
AbyssUI_Config.childpanel3.name = "Miscellaneous"
AbyssUI_Config.childpanel3.parent = AbyssUI_Config.panel.name
InterfaceOptions_AddCategory(AbyssUI_Config.childpanel3)
--
AbyssUI_Config.childpanel4 = CreateFrame( "Frame", "$parentConfigChild_Themes", AbyssUI_Config.panel)
AbyssUI_Config.childpanel4.name = "Themes"
AbyssUI_Config.childpanel4.parent = AbyssUI_Config.panel.name
InterfaceOptions_AddCategory(AbyssUI_Config.childpanel4)
--
AbyssUI_Config.childpanel5 = CreateFrame( "Frame", "$parentConfigChild_Extras", AbyssUI_Config.panel)
AbyssUI_Config.childpanel5.name = "Tweaks & Extra"
AbyssUI_Config.childpanel5.parent = AbyssUI_Config.panel.name
InterfaceOptions_AddCategory(AbyssUI_Config.childpanel5)
-- Title
local Frame = CreateFrame("Frame","$parentFrameButtonTitle", AbyssUI_Config.panel)
Frame:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 0, -20)
Frame:SetHeight(24)
Frame:SetWidth(70)
Frame:SetScale(1.5)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("CENTER")
Frame:SetText("Abyss|cff0d75d4UI|r")
-- SubTittle
local Frame = CreateFrame("Frame","$parentFrameButtonSubTitle", AbyssUI_Config.panel)
Frame:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 0, -120)
Frame:SetHeight(24)
Frame:SetWidth(200)
Frame:SetScale(1.1)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("CENTER")
Frame:SetText("Thanks for using Abyss|cff0d75d4UI|r.\nIf you enjoy this addon,"..
" consider sharing with your friends\n or even making a donation."..
" It helps a lot!\nThis is a minimalist UI that makes changes directly to the WoW frames,\n"..
"using nearly the same amount of CPU/RAM as the Blizzard default UI.\n\n"..
"Options that have a different text color are recommended.\nThose options are set by default if you choose recommended settings.\n\n"..
"Check the options by clicking in the (+) button on the left.")
--Special Thanks
local Frame = CreateFrame("Frame","$parentFrameButtonSubTitle", AbyssUI_Config.panel)
Frame:SetPoint("BOTTOMLEFT", AbyssUI_Config.panel, "BOTTOMLEFT", 10, 70)
Frame:SetHeight(24)
Frame:SetWidth(200)
Frame:SetScale(1)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("LEFT")
Frame:SetText("|cff0d75d4Special Thanks|r")
local Frame1 = CreateFrame("Frame","$parentFrameButtonSubTitle", AbyssUI_Config.panel)
Frame1:SetPoint("BOTTOMLEFT", AbyssUI_Config.panel, "BOTTOMLEFT", 10, 50)
Frame1:SetHeight(24)
Frame1:SetWidth(200)
Frame1:SetScale(1)
Frame1 = Frame1:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame1:SetPoint("LEFT")
Frame1:SetText("|cfff2dc7fFizzlemizz|r for helping me with programming questions.")
local Frame2 = CreateFrame("Frame","$parentFrameButtonSubTitle", AbyssUI_Config.panel)
Frame2:SetPoint("BOTTOMLEFT", AbyssUI_Config.panel, "BOTTOMLEFT", 10, 30)
Frame2:SetHeight(24)
Frame2:SetWidth(200)
Frame2:SetScale(1)
Frame2 = Frame2:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame2:SetPoint("LEFT")
Frame2:SetText("|cfff2dc7fFry|r for helping me with grammatical errors.")
local Frame3 = CreateFrame("Frame","$parentFrameButtonSubTitle", AbyssUI_Config.panel)
Frame3:SetPoint("BOTTOMLEFT", AbyssUI_Config.panel, "BOTTOMLEFT", 10, 10)
Frame3:SetHeight(24)
Frame3:SetWidth(200)
Frame3:SetScale(1)
Frame3 = Frame3:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame3:SetPoint("LEFT")
Frame3:SetText("|cfff2dc7fKawF|r by UnitFrame Improved, so I could create a really nice"..
" UnitFrame for AbyssUI.")
-- Panel 01 (Info Panel)
local Frame = CreateFrame("Frame","$parentFrameButtonPanel01", AbyssUI_Config.childpanel1)
Frame:SetPoint("CENTER", AbyssUI_Config.childpanel1, "TOP", 0, -20)
Frame:SetWidth(120)
Frame:SetHeight(24)
Frame:SetScale(1.5)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("CENTER")
Frame:SetText("Abyss|cff0d75d4UI|r Info Panel")
-- Panel 02 (HideElements)
local Frame = CreateFrame("Frame","$parentFrameButtonPanel02", AbyssUI_Config.childpanel2)
Frame:SetPoint("CENTER", AbyssUI_Config.childpanel2, "TOP", 0, -20)
Frame:SetWidth(120)
Frame:SetHeight(24)
Frame:SetScale(1.5)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("CENTER")
Frame:SetText("Hide Elements")
-- Panel 03 (Miscellaneous)
local Frame = CreateFrame("Frame","$parentFrameButtonPanel03", AbyssUI_Config.childpanel3)
Frame:SetPoint("CENTER", AbyssUI_Config.childpanel3, "TOP", 0, -20)
Frame:SetWidth(120)
Frame:SetHeight(24)
Frame:SetScale(1.5)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("CENTER")
Frame:SetText("Miscellaneous")
-- Panel 03.01 (Miscellaneous)
local Frame = CreateFrame("Frame","$parentFrameButtonPanel041", AbyssUI_Config.childpanel3)
Frame:SetPoint("CENTER", AbyssUI_Config.childpanel3, "TOP", -265, -70)
Frame:SetWidth(120)
Frame:SetHeight(24)
Frame:SetScale(1)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("CENTER")
Frame:SetText("- General")
-- Panel 03.01 (Miscellaneous)
local Frame = CreateFrame("Frame","$parentFrameButtonPanel041", AbyssUI_Config.childpanel3)
Frame:SetPoint("CENTER", AbyssUI_Config.childpanel3, "TOP", 125, -70)
Frame:SetWidth(120)
Frame:SetHeight(24)
Frame:SetScale(1)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("CENTER")
Frame:SetText("- Frames")
-- Panel 04 (Themes)
local Frame = CreateFrame("Frame","$parentFrameButtonPanel04", AbyssUI_Config.childpanel4)
Frame:SetPoint("CENTER", AbyssUI_Config.childpanel4, "TOP", -150, -20)
Frame:SetWidth(120)
Frame:SetHeight(24)
Frame:SetScale(1.5)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("CENTER")
Frame:SetText("Player Portrait")
-- Panel 04.01 (Themes)
local Frame = CreateFrame("Frame","$parentFrameButtonPanel041", AbyssUI_Config.childpanel4)
Frame:SetPoint("CENTER", AbyssUI_Config.childpanel4, "TOP", -255, -70)
Frame:SetWidth(120)
Frame:SetHeight(24)
Frame:SetScale(1)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("CENTER")
Frame:SetText("- Portrait Art")
-- Panel 05 (Themes)
local Frame = CreateFrame("Frame","$parentFrameButtonPanel05", AbyssUI_Config.childpanel4)
Frame:SetPoint("CENTER", AbyssUI_Config.childpanel4, "TOP", 120, -20)
Frame:SetWidth(120)
Frame:SetHeight(24)
Frame:SetScale(1.5)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("CENTER")
Frame:SetText("Frame Colorization")
-- Panel 05.01 (Themes)
local Frame = CreateFrame("Frame","$parentFrameButtonPanel051", AbyssUI_Config.childpanel4)
Frame:SetPoint("CENTER", AbyssUI_Config.childpanel4, "TOP", 90, -70)
Frame:SetWidth(120)
Frame:SetHeight(24)
Frame:SetScale(1)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("CENTER")
Frame:SetText("- Preset Colors")
-- Panel 05.02 (Themes)
local Frame = CreateFrame("Frame","$parentFrameButtonPanel052", AbyssUI_Config.childpanel4)
Frame:SetPoint("CENTER", AbyssUI_Config.childpanel4, "CENTER", 98, -50)
Frame:SetWidth(120)
Frame:SetHeight(24)
Frame:SetScale(1)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("CENTER")
Frame:SetText("- Choose a Color")
-- Panel 06 (Extra)
local Frame = CreateFrame("Frame","$parentFrameButtonPanel06", AbyssUI_Config.childpanel5)
Frame:SetPoint("CENTER", AbyssUI_Config.childpanel5, "TOP", 0, -20)
Frame:SetWidth(120)
Frame:SetHeight(24)
Frame:SetScale(1.5)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("CENTER")
Frame:SetText("Tweaks & Extra")
-- Panel 06.01 (Extra)
local Frame = CreateFrame("Frame","$parentFrameButtonPanel061", AbyssUI_Config.childpanel5)
Frame:SetPoint("CENTER", AbyssUI_Config.childpanel5, "TOP", -265, -70)
Frame:SetWidth(120)
Frame:SetHeight(24)
Frame:SetScale(1)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("CENTER")
Frame:SetText("- General")
-- Panel 06.02 (Extra)
local Frame = CreateFrame("Frame","$parentFrameButtonPanel062", AbyssUI_Config.childpanel5)
Frame:SetPoint("CENTER", AbyssUI_Config.childpanel5, "TOP", 125, -70)
Frame:SetWidth(120)
Frame:SetHeight(24)
Frame:SetScale(1)
Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Frame:SetPoint("CENTER")
Frame:SetText("- Frames")
--------------------------------- Buttons ---------------------------------
-- AbyssUI DailyInfo --
local FrameButton = CreateFrame("Button","$parentExtraDailyInfoButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
FrameButton:SetHeight(24)
FrameButton:SetWidth(140)
FrameButton:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", -200, -250)
FrameButton:SetText("AbyssUI DailyInfo")
FrameButton:SetScript("OnClick", function()
C_WowTokenPublic.UpdateMarketPrice()
  C_Timer.After(0.5, function()
    local HonorLevel = UnitHonorLevel("player")
    local AddonVersion = GetAddOnMetadata("AbyssUI", "Version")
    print("|cfff2dc7f~ AbyssUI Daily Info ~|r")
    if C_WowTokenPublic.GetCurrentMarketPrice() ~= nil then
      print("|cfff2dc7fToken Price: |r" .. GetMoneyString(C_WowTokenPublic.GetCurrentMarketPrice()))
    else
      print("|cfff2dc7fToken Price:|r Not available right now!")
    end
    if ( AbyssUIAddonSettings.ExtraFunctionAmericanClock == true ) then
      print("|cfff2dc7fDate:|r " .. date("%H:%M |cffffcc00%m/%d/%y|r "))
    else
      print("|cfff2dc7fDate:|r " .. date("%H:%M |cffffcc00%d/%m/%y|r "))
    end
    print("|cfff2dc7fHonor Level: |r|cffffcc00" .. HonorLevel .. "|r")
    --print("|cfff2dc7fLocation: |r" .. GetMinimapZoneText() .. "|cffffcc00, " .. GetZoneText() .. "|r")
    print("|cfff2dc7fWoW Version: |r|cffffcc00" .. select(1, GetBuildInfo()) .. "|r")
    print("|cfff2dc7fAbyssUI Version: |r|cffffcc00" .. AddonVersion .. "|r")
  end)
end)
-- Clear Action Bar --
local FrameButton = CreateFrame("Button","$parentExtraClearActionButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
FrameButton:SetHeight(24)
FrameButton:SetWidth(140)
FrameButton:SetPoint("CENTER",  AbyssUI_Config.panel, "TOP", 0, -250)
FrameButton:SetText("Clear Action Bar")
FrameButton:SetScript("OnClick", function()
  AbyssUI_ActionBarCleaner:Show()
end)
-- Reload --
local FrameButton = CreateFrame("Button","$parentExtraReloadInterfaceButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
FrameButton:SetHeight(24)
FrameButton:SetWidth(140)
FrameButton:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 200, -250)
FrameButton:SetText("Reload UI")
FrameButton:SetScript("OnClick", function()
  ReloadUI()
end)
----------------------------- AbyssUI Info Panel -------------------------------
--- Images ---
-- SubText
local InfoPanelSubText = CreateFrame("Frame","$parentInfoPanelSubText", AbyssUI_Config.childpanel1)
InfoPanelSubText:SetPoint("TOPLEFT", 20, -60)
InfoPanelSubText:SetHeight(24)
InfoPanelSubText:SetWidth(256)
InfoPanelSubText:SetScale(1)
InfoPanelSubText = InfoPanelSubText:CreateFontString(nil, "OVERLAY", "GameFontNormal")
InfoPanelSubText:SetPoint("LEFT")
InfoPanelSubText:SetText("In this page you can find links to some other AddOns/Packs that make AbyssUI even better.\n" ..
"These addons are verify to especially work with AbyssUI without any conflict or problem.\n"..
"Click on the image so you can get the respective link. Don't forget to check then out!")
--- Frames and Boxes ---
-- AbyssUI_EditBox_Frame
local AbyssUI_EditBox_Frame = CreateFrame("Frame", "$parentAbyssUI_EditBox_Frame", AbyssUI_Config.childpanel1)
AbyssUI_EditBox_Frame:Hide()
AbyssUI_EditBox_Frame:SetWidth(500)
AbyssUI_EditBox_Frame:SetHeight(125)
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
Border:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Border:SetPoint("TOPLEFT", -3, 3)
Border:SetPoint("BOTTOMRIGHT", 3, -3)
Border:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUI_EditBox_Frame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUI_EditBox_Frame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUI_EditBox_Frame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUI_EditBox_Frame)
AbyssUI_EditBox_Frame.texture = Texture
----------------------------------------------------
local FrameButtonConfirm = CreateFrame("Button","$parentFrameButtonConfirm", AbyssUI_EditBox_Frame, "UIPanelButtonTemplate")
FrameButtonConfirm:SetHeight(24)
FrameButtonConfirm:SetWidth(70)
FrameButtonConfirm:SetPoint("BOTTOM", AbyssUI_EditBox_Frame, "BOTTOM", 0, 0)
FrameButtonConfirm:SetText("Confirm")
FrameButtonConfirm:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
----------------------------------------------------
local BorderButton = FrameButtonConfirm:CreateTexture(nil, "ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButtonConfirm)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)
FrameButtonConfirm:SetScript("OnClick", function()
  AbyssUI_EditBox_Frame:Hide()
end)
-- EditBox
local AbyssUI_EditBox= CreateFrame("EditBox", "$parentEditBox_TexturePack", AbyssUI_EditBox_Frame)
AbyssUI_EditBox:SetFont("Interface\\AddOns\\AbyssUI\\Textures\\font\\global.ttf", 12, "THINOUTLINE")
AbyssUI_EditBox:SetPoint("CENTER", 0, 0)
AbyssUI_EditBox:SetMultiLine(true)
AbyssUI_EditBox:SetHeight(24)
AbyssUI_EditBox:SetWidth(450)
-- AbyssUI_TexturePack
local AbyssUI_TexturePack = CreateFrame("Frame", "$parentAbyssUI_TexturePack", AbyssUI_Config.childpanel1)
AbyssUI_TexturePack:SetFrameStrata("HIGH")
AbyssUI_TexturePack:SetHeight(256)
AbyssUI_TexturePack:SetWidth(256)
AbyssUI_TexturePack:SetPoint("TOP", 0, -120)
local t = AbyssUI_TexturePack:CreateTexture(nil, "HIGH")
t:SetTexture("Interface\\AddOns\\AbyssUI\\Textures\\extra\\AbyssUITexturePackLogo2x2")
t:SetAllPoints(AbyssUI_TexturePack)
-- OnClick
AbyssUI_TexturePack:SetScript("OnMouseDown", function (self, button)
    if ( button == 'LeftButton' ) then 
      AbyssUI_EditBox:SetText("https://www.wowinterface.com/downloads/info25657-AbyssUI_TexturePack.html")
      AbyssUI_EditBox_Frame:Show()
    end
end)
-- Glass
local Glass = CreateFrame("Frame", "$parentGlass", AbyssUI_Config.childpanel1)
Glass:SetFrameStrata("HIGH")
Glass:SetHeight(128)
Glass:SetWidth(128)
Glass:SetPoint("BOTTOMLEFT", 20, 20)
local t = Glass:CreateTexture(nil, "HIGH")
t:SetTexture("Interface\\AddOns\\AbyssUI\\Textures\\extra\\Glass")
t:SetAllPoints(Glass)
-- OnClick
Glass:SetScript("OnMouseDown", function (self, button)
    if ( button == 'LeftButton' ) then
      AbyssUI_EditBox:SetText("https://www.curseforge.com/wow/addons/glass")
      AbyssUI_EditBox_Frame:Show()
    end
end)
-- Kui Nameplates
local KuiNameplates = CreateFrame("Frame", "$parentKuiNameplates", AbyssUI_Config.childpanel1)
KuiNameplates:SetFrameStrata("HIGH")
KuiNameplates:SetHeight(128)
KuiNameplates:SetWidth(128)
KuiNameplates:SetPoint("BOTTOM", -80, 20)
local t = KuiNameplates:CreateTexture(nil, "HIGH")
t:SetTexture("Interface\\AddOns\\AbyssUI\\Textures\\extra\\KuiNameplates")
t:SetAllPoints(KuiNameplates)
-- OnClick
KuiNameplates:SetScript("OnMouseDown", function (self, button)
    if ( button == 'LeftButton' ) then
      AbyssUI_EditBox:SetText("https://www.curseforge.com/wow/addons/Kuinameplates")
      AbyssUI_EditBox_Frame:Show()
    end
end)
-- Bagnon
local Bagnon = CreateFrame("Frame", "$parentBagnon", AbyssUI_Config.childpanel1)
Bagnon:SetFrameStrata("HIGH")
Bagnon:SetHeight(128)
Bagnon:SetWidth(128)
Bagnon:SetPoint("BOTTOM", 80, 20)
local t = Bagnon:CreateTexture(nil, "HIGH")
t:SetTexture("Interface\\AddOns\\AbyssUI\\Textures\\extra\\Bagnon")
t:SetAllPoints(Bagnon)
-- OnClick
Bagnon:SetScript("OnMouseDown", function (self, button)
    if ( button == 'LeftButton' ) then
      AbyssUI_EditBox:SetText("https://www.curseforge.com/wow/addons/Bagnon")
      AbyssUI_EditBox_Frame:Show()
    end
end)
-- Narcissus
local Narcissus = CreateFrame("Frame", "$parentNarcissus", AbyssUI_Config.childpanel1)
Narcissus:SetFrameStrata("HIGH")
Narcissus:SetHeight(128)
Narcissus:SetWidth(128)
Narcissus:SetPoint("BOTTOMRIGHT", -20, 20)
local t = Narcissus:CreateTexture(nil, "HIGH")
t:SetTexture("Interface\\AddOns\\AbyssUI\\Textures\\extra\\Narcissus")
t:SetAllPoints(Narcissus)
-- OnClick
Narcissus:SetScript("OnMouseDown", function (self, button)
    if ( button == 'LeftButton' ) then
      AbyssUI_EditBox:SetText("https://www.curseforge.com/wow/addons/narcissus")
      AbyssUI_EditBox_Frame:Show()
    end
end)
-- End
------------------------------- Hide Elements ---------------------------------
local PSINFOHide_CheckButton = CreateFrame("Frame","$parentPSINFOHide_CheckButton", AbyssUI_Config.childpanel2)
PSINFOHide_CheckButton:SetPoint("BOTTOMLEFT", AbyssUI_Config.childpanel2, "BOTTOMLEFT", 10, 10)
PSINFOHide_CheckButton:SetHeight(24)
PSINFOHide_CheckButton:SetWidth(200)
PSINFOHide_CheckButton:SetScale(1)
PSINFOHide_CheckButton = PSINFOHide_CheckButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
PSINFOHide_CheckButton:SetPoint("LEFT")
PSINFOHide_CheckButton:SetText("The symbol (*) in some options means that there is important information/instructions to be read.\n"..
  "Options with a different color are recommended settings.")
-- MicroMenu/Bags --
local MicroMenu_CheckButton = CreateFrame("CheckButton", "$parentMicroMenu_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
MicroMenu_CheckButton:SetPoint("TOPLEFT", 10, -80)
MicroMenu_CheckButton.Text:SetText("Hide MicroMenu")
MicroMenu_CheckButton.tooltip = "Hide the ActionBar MicroMenu (Bags Bar)"
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
-- OnClick Function
MicroMenu_CheckButton:SetScript("OnClick", function(self)
AbyssUIAddonSettings.HideMicroMenu = self:GetChecked()
  if AbyssUIAddonSettings.HideMicroMenu == true then
    AbyssUI_HideMicroMenu_Function()
  else
    AbyssUI_ShowMicroMenu_Function()
  end
end)
-- After Login/Reload
MicroMenu_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
MicroMenu_CheckButton:SetScript("OnEvent", function(self, event, ...)
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    if AbyssUIAddonSettings.HideMicroMenu == true then
      AbyssUI_HideMicroMenu_Function()
    else
      AbyssUI_ShowMicroMenu_Function()
    end
  end
end)
-- Gryphons Option --
local Gryphons_CheckButton = CreateFrame("CheckButton", "$parentGryphons_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
Gryphons_CheckButton:SetPoint("TOPLEFT", 10, -110)
Gryphons_CheckButton.Text:SetText("Hide Gryphons")
Gryphons_CheckButton.tooltip = "Hide the ActionBar Gryphons"
Gryphons_CheckButton:SetChecked(AbyssUIAddonSettings.HideGryphons)
-- OnClick Function
Gryphons_CheckButton:SetScript("OnClick", function(self)
AbyssUIAddonSettings.HideGryphons = self:GetChecked()
  if AbyssUIAddonSettings.HideGryphons == true then
    MainMenuBarArtFrame.RightEndCap:Hide()
    MainMenuBarArtFrame.LeftEndCap:Hide()
  else
    MainMenuBarArtFrame.RightEndCap:Show()
    MainMenuBarArtFrame.LeftEndCap:Show()
  end
end)
-- After Login/Reload
Gryphons_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
Gryphons_CheckButton:SetScript("OnEvent", function(self, event, ...)
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    if AbyssUIAddonSettings.HideGryphons == true then
      MainMenuBarArtFrame.RightEndCap:Hide()
      MainMenuBarArtFrame.LeftEndCap:Hide()
    else
      MainMenuBarArtFrame.RightEndCap:Show()
      MainMenuBarArtFrame.LeftEndCap:Show()
    end
  end
end)
-- Minimap
local Minimap_CheckButton = CreateFrame("CheckButton", "$parentMinimap_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
Minimap_CheckButton:SetPoint("TOPLEFT", 10, -140)
Minimap_CheckButton.Text:SetText("Hide Minimap")
Minimap_CheckButton.tooltip = "Hide the Game Minimap"
Minimap_CheckButton:SetChecked(AbyssUIAddonSettings.HideMinimap)
-- OnClick Function
Minimap_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.HideMinimap = self:GetChecked()
  AbyssUI_ReloadFrame:Show()
end)
-- After Login/Reload
Minimap_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
Minimap_CheckButton:SetScript("OnEvent", function(self, event, ...)
  if ( event == "PLAYER_ENTERING_WORLD" ) then
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
ObjTracker_CheckButton.Text:SetText("Hide Objective Tracker")
ObjTracker_CheckButton.tooltip = "Hide the Objective Tracker (Quest Frame)"
ObjTracker_CheckButton:SetChecked(AbyssUIAddonSettings.HideObjectiveTracker)
-- OnClick Function
ObjTracker_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.HideObjectiveTracker = self:GetChecked()
  if AbyssUIAddonSettings.HideObjectiveTracker == true then
    ObjectiveTrackerFrame:Hide()
  else
    ObjectiveTrackerFrame:Show()
  end
end)
-- After Login/Reload
ObjTracker_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
ObjTracker_CheckButton:SetScript("OnEvent", function(self, event, ...)
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    if AbyssUIAddonSettings.HideObjectiveTracker == true then
      ObjectiveTrackerFrame:Hide()
    else
      ObjectiveTrackerFrame:Show()
    end
  end
end)
-- Hide FPS/MS Frame --
local FPSMSFrame_CheckButton = CreateFrame("CheckButton", "$parentFPSMSFrame_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
FPSMSFrame_CheckButton:SetPoint("TOPLEFT", 10, -200)
FPSMSFrame_CheckButton.Text:SetText("Hide FPS/MS Frame (*)")
FPSMSFrame_CheckButton.tooltip = "Hide the fps/ms frame (Top left frame)."
.." *This will only work if you are using the default Blizzard Minimap"
FPSMSFrame_CheckButton:SetChecked(AbyssUIAddonSettings.HideFPSMSFrame)
-- OnClick Function
FPSMSFrame_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.HideFPSMSFrame = self:GetChecked()
  AbyssUI_ReloadFrame:Show()
end)
-- YouDied LevelUp Frame --
local YouDiedLevelUpFrame_CheckButton = CreateFrame("CheckButton", "$parentYouDiedLevelUpFrame_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
YouDiedLevelUpFrame_CheckButton:SetPoint("TOPLEFT", 10, -230)
YouDiedLevelUpFrame_CheckButton.Text:SetText("Hide YouDied/LevelUp Frame")
YouDiedLevelUpFrame_CheckButton.tooltip = "Hide the 'You Died' and 'Level Up' frame when you"..
" die/level in the game"
YouDiedLevelUpFrame_CheckButton:SetChecked(AbyssUIAddonSettings.HideYouDiedLevelUpFrame)
-- OnClick Function
YouDiedLevelUpFrame_CheckButton:SetScript("OnClick", function(self)
AbyssUIAddonSettings.HideYouDiedLevelUpFrame = self:GetChecked()
end)
-- Hide Macro Labels --
local HideMacroLabels_CheckButton = CreateFrame("CheckButton", "$parentHideMacroLabels_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
HideMacroLabels_CheckButton:SetPoint("TOPLEFT", 10, -260)
HideMacroLabels_CheckButton.Text:SetText("Hide Macro Labels")
HideMacroLabels_CheckButton.tooltip = "Hide Macro Labels from Action Bar"
HideMacroLabels_CheckButton:SetChecked(AbyssUIAddonSettings.HideMacroLabels)
-- OnClick Function
HideMacroLabels_CheckButton:SetScript("OnClick", function(self)
AbyssUIAddonSettings.HideMacroLabels = self:GetChecked()
  if ( AbyssUIAddonSettings.HideMacroLabels == true ) then
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
  if ( event == "PLAYER_ENTERING_WORLD" ) then
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
HideHotkeysLabels_CheckButton.Text:SetText("Hide Hotkeys Labels")
HideHotkeysLabels_CheckButton.tooltip = "Hide Hotkeys Labels from Action Bar"
HideHotkeysLabels_CheckButton:SetChecked(AbyssUIAddonSettings.HideHotkeysLabels)
-- OnClick Function
HideHotkeysLabels_CheckButton:SetScript("OnClick", function(self)
AbyssUIAddonSettings.HideHotkeysLabels = self:GetChecked()
   if ( AbyssUIAddonSettings.HideHotkeysLabels == true ) then
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
  if ( event == "PLAYER_ENTERING_WORLD" ) then
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
HideStanceBar_CheckButton.Text:SetText("Hide Stance Bar")
HideStanceBar_CheckButton.tooltip = "Hide the Stance Bar (Druid forms, Rogue stealth, etc)"
HideStanceBar_CheckButton:SetChecked(AbyssUIAddonSettings.HideStanceBar)
-- OnClick Function
HideStanceBar_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.HideStanceBar = self:GetChecked()
   if ( AbyssUIAddonSettings.HideStanceBar == true ) then
     StanceBarFrame:SetAlpha(0)
   else
     return nil
   end
end)
-- After Login/Reload
HideStanceBar_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
HideStanceBar_CheckButton:SetScript("OnEvent", function(self, event, ...)
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    if AbyssUIAddonSettings.HideStanceBar == true then
      C_Timer.After(0.5, function()
        StanceBarFrame:SetAlpha(0)
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
AbyssUI_ChatHideFrame:SetPoint("BOTTOM","ChatFrame1ButtonFrame","BOTTOM",0,-35)
if ( AbyssUIAddonSettings.FadeUI ~= true ) then
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
    AbyssUI_ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
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
-- Hide Chat Buttons
local HideChatButtons_CheckButton = CreateFrame("CheckButton", "$parentHideStanceBar_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
HideChatButtons_CheckButton:SetPoint("TOPLEFT", 10, -350)
HideChatButtons_CheckButton.Text:SetText("Hide Chat Buttons")
HideChatButtons_CheckButton.tooltip = "Hide the Chat buttons (voice, social, etc)"
HideChatButtons_CheckButton:SetChecked(AbyssUIAddonSettings.HideChatButtons)
-- OnClick Function
HideChatButtons_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.HideChatButtons = self:GetChecked()
  if ( AbyssUIAddonSettings.HideChatButtons == true ) then
    QuickJoinToastButton:Hide()
    GeneralDockManager:SetAlpha(0)
    ChatFrameMenuButton:Hide()
    ChatFrameChannelButton:Hide()
    ChatFrame1ButtonFrame:SetAlpha(0)
    AbyssUI_ChatHideFrame:Hide()
    ChatFrameToggleVoiceDeafenButton:SetAlpha(0)
    ChatFrameToggleVoiceMuteButton:SetAlpha(0)
  else 
    QuickJoinToastButton:Show()
    GeneralDockManager:SetAlpha(1)
    ChatFrameMenuButton:Show()
    ChatFrameChannelButton:Show()
    ChatFrame1ButtonFrame:SetAlpha(1)
    AbyssUI_ChatHideFrame:Show()
    ChatFrameToggleVoiceDeafenButton:SetAlpha(1)
    ChatFrameToggleVoiceMuteButton:SetAlpha(1)
  end
end)
-- After Login/Reload
HideChatButtons_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
HideChatButtons_CheckButton:SetScript("OnEvent", function(self, event, ...)
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    if AbyssUIAddonSettings.HideChatButtons == true then
      C_Timer.After(1, function()
        QuickJoinToastButton:Hide()
        GeneralDockManager:SetAlpha(0)
        ChatFrameMenuButton:Hide()
        ChatFrameChannelButton:Hide()
        ChatFrame1ButtonFrame:SetAlpha(0)
        AbyssUI_ChatHideFrame:Hide()
        ChatFrameToggleVoiceDeafenButton:SetAlpha(0)
        ChatFrameToggleVoiceMuteButton:SetAlpha(0)
      end)
    end
  end
end)
-- AFKCammeraFrame --
local AFKCammeraFrame_CheckButton = CreateFrame("CheckButton", "$parentAFKCammeraFrame_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
AFKCammeraFrame_CheckButton:SetPoint("TOPLEFT", 10, -380)
AFKCammeraFrame_CheckButton.Text:SetText("Hide AFKMode Frame")
AFKCammeraFrame_CheckButton.tooltip = "Hide the AFKMode when you are AFK"
AFKCammeraFrame_CheckButton:SetChecked(AbyssUIAddonSettings.AFKCammeraFrame)
-- OnClick Function
AFKCammeraFrame_CheckButton:SetScript("OnClick", function(self)
AbyssUIAddonSettings.AFKCammeraFrame = self:GetChecked()
end)
-- Faction/PvP/Prestige icon --
local FactionPvpIcon_CheckButton = CreateFrame("CheckButton", "$parentFactionPvpIcon_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
FactionPvpIcon_CheckButton:SetPoint("TOPLEFT", 10, -410)
FactionPvpIcon_CheckButton.Text:SetText("Hide Faction/PvP/Prestige icon")
FactionPvpIcon_CheckButton.tooltip = "Hide the player frame Faction/PvP/Prestige icon"
FactionPvpIcon_CheckButton:SetChecked(AbyssUIAddonSettings.FactionPvpIcon)
-- OnClick Function
FactionPvpIcon_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.FactionPvpIcon = self:GetChecked()
    if ( AbyssUIAddonSettings.FactionPvpIcon == true ) then
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
  if ( event == "PLAYER_ENTERING_WORLD" ) then
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
HideUnitImprovedFaction_CheckButton.Text:SetText("|cfff2dc7fHide UnitImproved Faction Icon|r")
HideUnitImprovedFaction_CheckButton.tooltip = "Hide the Faction Icon (Ally/Horde) on players frames"
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
HideCastTimer_CheckButton.Text:SetText("Hide CastBar Timer")
HideCastTimer_CheckButton.tooltip = "Hide the timer below CastBar"
HideCastTimer_CheckButton:SetChecked(AbyssUIAddonSettings.HideCastTimer)
-- OnClick Function
HideCastTimer_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.HideCastTimer = self:GetChecked()
end)
-- Hide Group Frame
local HideGroupFrame_CheckButton = CreateFrame("CheckButton", "$parentHideGroupFrame_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
HideGroupFrame_CheckButton:SetPoint("TOPRIGHT", -200, -110)
HideGroupFrame_CheckButton.Text:SetText("Hide GroupFrame")
HideGroupFrame_CheckButton.tooltip = "Hide the GroupFrame on the player portrait"
HideGroupFrame_CheckButton:SetChecked(AbyssUIAddonSettings.HideGroupFrame)
-- OnClick Function
HideGroupFrame_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.HideGroupFrame = self:GetChecked()
    if ( AbyssUIAddonSettings.HideGroupFrame == true ) then
      PlayerFrameGroupIndicator:SetAlpha(0)
    else
      PlayerFrameGroupIndicator:SetAlpha(1)
    end
end)
-- After Login/Reload
HideGroupFrame_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
HideGroupFrame_CheckButton:SetScript("OnEvent", function(self, event, ...)
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    if ( AbyssUIAddonSettings.HideGroupFrame == true ) then
      PlayerFrameGroupIndicator:SetAlpha(0)
    else
      PlayerFrameGroupIndicator:SetAlpha(1)
    end
  end
end)
-- End
------------------------------- Miscellaneous -------------------------------
local PSINFOHide_CheckButton = CreateFrame("Frame","$parentPSINFOHide_CheckButton", AbyssUI_Config.childpanel3)
PSINFOHide_CheckButton:SetPoint("BOTTOMLEFT", AbyssUI_Config.childpanel3, "BOTTOMLEFT", 10, 10)
PSINFOHide_CheckButton:SetHeight(24)
PSINFOHide_CheckButton:SetWidth(200)
PSINFOHide_CheckButton:SetScale(1)
PSINFOHide_CheckButton = PSINFOHide_CheckButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
PSINFOHide_CheckButton:SetPoint("LEFT")
PSINFOHide_CheckButton:SetText("The symbol (*) in some options means that there is important information/instructions to be read.\n"..
  "Options with a different color are recommended settings.")
--- General ---
-- Camera Pitch Function Option 50%
local CameraSmooth50_CheckButton = CreateFrame("CheckButton", "$parentCameraSmooth50_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
CameraSmooth50_CheckButton:SetPoint("TOPLEFT", 10, -80)
CameraSmooth50_CheckButton.Text:SetText("Smooth Camera\n   (50% Slower)")
CameraSmooth50_CheckButton.tooltip = "Makes the Camera turns in a more smooth way"
CameraSmooth50_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionCameraSmooth50)
-- OnClick Function
CameraSmooth50_CheckButton:SetScript("OnClick", function(self)
  if AbyssUIAddonSettings.ExtraFunctionCameraSmooth70 ~= true and AbyssUIAddonSettings.ExtraFunctionCameraSmooth90 ~= true then
    AbyssUIAddonSettings.ExtraFunctionCameraSmooth50 = self:GetChecked()
    if AbyssUIAddonSettings.ExtraFunctionCameraSmooth50 == true then
      ConsoleExec( "cameraYawMoveSpeed 50" )
      ConsoleExec( "cameraPitchMoveSpeed 50" )
    else
      ConsoleExec( "cameraYawMoveSpeed 100" )
      ConsoleExec( "cameraPitchMoveSpeed 100" )
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
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    if AbyssUIAddonSettings.ExtraFunctionCameraSmooth50 == true then
      ConsoleExec( "cameraYawMoveSpeed 50" )
      ConsoleExec( "cameraPitchMoveSpeed 50" )
    end
  end
end)
-- Camera Pitch Function Option 70%
local CameraSmooth70_CheckButton = CreateFrame("CheckButton", "$parentCameraSmooth70_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
CameraSmooth70_CheckButton:SetPoint("TOPLEFT", 10, -110)
CameraSmooth70_CheckButton.Text:SetText("Smooth Camera\n   (70% Slower)")
CameraSmooth70_CheckButton.tooltip = "Makes the Camera turns in a more smooth way"
CameraSmooth70_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionCameraSmooth70)
-- OnClick Function
CameraSmooth70_CheckButton:SetScript("OnClick", function(self)
  if AbyssUIAddonSettings.ExtraFunctionCameraSmooth50 ~= true and AbyssUIAddonSettings.ExtraFunctionCameraSmooth90 ~= true then
    AbyssUIAddonSettings.ExtraFunctionCameraSmooth70 = self:GetChecked()
    if AbyssUIAddonSettings.ExtraFunctionCameraSmooth70 == true then
      ConsoleExec( "cameraYawMoveSpeed 30" )
      ConsoleExec( "cameraPitchMoveSpeed 30" )
    else
      ConsoleExec( "cameraYawMoveSpeed 100" )
      ConsoleExec( "cameraPitchMoveSpeed 100" )
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
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    if AbyssUIAddonSettings.ExtraFunctionCameraSmooth70 == true then
      ConsoleExec( "cameraYawMoveSpeed 30" )
      ConsoleExec( "cameraPitchMoveSpeed 30" )
    end
  end
end)
-- Camera Pitch Function Option 90%
local CameraSmooth90_CheckButton = CreateFrame("CheckButton", "$parentCameraSmooth90_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
CameraSmooth90_CheckButton:SetPoint("TOPLEFT", 10, -140)
CameraSmooth90_CheckButton.Text:SetText("Smooth Camera\n   (90% Slower)")
CameraSmooth90_CheckButton.tooltip = "Makes the Camera turns in a more smooth way"
CameraSmooth90_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionCameraSmooth90)
-- OnClick Function
CameraSmooth90_CheckButton:SetScript("OnClick", function(self)
  if AbyssUIAddonSettings.ExtraFunctionCameraSmooth50 ~= true and AbyssUIAddonSettings.ExtraFunctionCameraSmooth70 ~= true then
    AbyssUIAddonSettings.ExtraFunctionCameraSmooth90 = self:GetChecked()
    if AbyssUIAddonSettings.ExtraFunctionCameraSmooth90 == true then
      ConsoleExec( "cameraYawMoveSpeed 10" )
      ConsoleExec( "cameraPitchMoveSpeed 10" )
    else
      ConsoleExec( "cameraYawMoveSpeed 100" )
      ConsoleExec( "cameraPitchMoveSpeed 100" )
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
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    if AbyssUIAddonSettings.ExtraFunctionCameraSmooth90 == true then
      ConsoleExec( "cameraYawMoveSpeed 10" )
      ConsoleExec( "cameraPitchMoveSpeed 10" )
    end
  end
end)
-- Instance Leave --
local AbyssUI_InstanceLeave_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_InstanceLeave_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUI_InstanceLeave_CheckButton:SetPoint("TOPLEFT", 10, -170)
AbyssUI_InstanceLeave_CheckButton.Text:SetText("|cfff2dc7fInstance Leave Frame|r")
AbyssUI_InstanceLeave_CheckButton.tooltip = "A dynamic frame that pop-up when you"..
" complete a LFG (dungeon, raid, etc)"
AbyssUI_InstanceLeave_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionInstanceLeave)
addonTable.InstanceLeave = AbyssUI_InstanceLeave_CheckButton
-- OnClick Function
AbyssUI_InstanceLeave_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.ExtraFunctionInstanceLeave = self:GetChecked()
end)
-- Inspect Target
local InspectTarget_CheckButton = CreateFrame("CheckButton", "$parentInspectTarget_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
InspectTarget_CheckButton:SetPoint("TOPLEFT", 10, -200)
InspectTarget_CheckButton.Text:SetText("|cfff2dc7fInspect Target (Shift + ')|r")
InspectTarget_CheckButton.tooltip = "When you have a target or your mouse is over someone character,"..
" to inspect this player press the keys Shift + '"
InspectTarget_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionInspectTarget)
addonTable.InspectTarget = InspectTarget_CheckButton
-- OnClick Function
InspectTarget_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ExtraFunctionInspectTarget = self:GetChecked()
end)
-- Ctrl + ' to confirm  --
local AbyssUI_ConfirmPopUps_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_ConfirmPopUps_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUI_ConfirmPopUps_CheckButton:SetPoint("TOPLEFT", 10, -230)
AbyssUI_ConfirmPopUps_CheckButton.Text:SetText("|cfff2dc7fConfirm Pop-Ups (Ctrl + ')|r")
AbyssUI_ConfirmPopUps_CheckButton.tooltip = "When this is active you can confirm almost"..
" any pop-ups (release, quests, stacks, etc) pressing the keys Ctrl + '"
AbyssUI_ConfirmPopUps_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionConfirmPopUps)
addonTable.ConfirmPopUps = AbyssUI_ConfirmPopUps_CheckButton
-- OnClick Function
AbyssUI_ConfirmPopUps_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.ExtraFunctionConfirmPopUps = self:GetChecked()
end)
-- Spell on KeyUp
local ActionButtonKeyUP_CheckButton = CreateFrame("CheckButton", "$parentActionButtonKeyUP_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
ActionButtonKeyUP_CheckButton:SetPoint("TOPLEFT", 10, -260)
ActionButtonKeyUP_CheckButton.Text:SetText("ActionButton on KeyUp")
ActionButtonKeyUP_CheckButton.tooltip = "With this option spells can be cast just when the"..
" keybind are released"
ActionButtonKeyUP_CheckButton:SetChecked(AbyssUIAddonSettings.ActionButtonKeyDown)
-- OnClick Function
ActionButtonKeyUP_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.ActionButtonKeyDown = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
end)
-- After Login/Reload
ActionButtonKeyUP_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
ActionButtonKeyUP_CheckButton:SetScript("OnEvent", function(self, event, ...)
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    if AbyssUIAddonSettings.ActionButtonKeyDown == true then
      SetCVar('ActionButtonUseKeyDown', 0)
    else
      SetCVar('ActionButtonUseKeyDown', 1)
    end
  else
    return nil
  end
end)
-- Action Cam --
local AbyssUIActionCam_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIActionCam_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUIActionCam_CheckButton:SetPoint("TOPLEFT", 10, -290)
AbyssUIActionCam_CheckButton.Text:SetText("Combat Cursor Mode")
AbyssUIActionCam_CheckButton.tooltip = "Makes the camera turns with your mouse when in"..
" combat (right-click to show cursor)"
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
  if ( event == "PLAYER_REGEN_DISABLED" and IsMouseLooking == false ) then
    if AbyssUIAddonSettings.ExtraFunctionActionCam == true then
      MouselookStart()
    else
      MouselookStop()
    end
  end
--[[
  if ( event == "PLAYER_REGEN_ENABLED" ) then
    MouselookStop()
  end
--]]
end)
-- Auto Repair/Sell Gray --
local AbyssUIAutoSellGray_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIAutoSellGray_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUIAutoSellGray_CheckButton:SetPoint("TOPLEFT", 10, -320)
AbyssUIAutoSellGray_CheckButton.Text:SetText("|cfff2dc7fAuto Repair\nSell Gray Items|r")
AbyssUIAutoSellGray_CheckButton.tooltip = "When you open a Merchant shop, auto sell gray"..
" and repair items"
AbyssUIAutoSellGray_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionSellGray)
addonTable.AutoSellGray = AbyssUIAutoSellGray_CheckButton
-- OnClick Function
AbyssUIAutoSellGray_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.ExtraFunctionSellGray = self:GetChecked()
end)
-- Auto Gamma Day/Night
local AbyssUIAutoGamma_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIAutoGamma_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUIAutoGamma_CheckButton:SetPoint("TOPLEFT", 10, -350)
AbyssUIAutoGamma_CheckButton.Text:SetText("Auto Gamma\n(Day and Night Mode)")
AbyssUIAutoGamma_CheckButton.tooltip = "Automatically change the gamma when is day to"..
" 1.2 (brighter) and to 1.0 (default) at night based on the local time"
AbyssUIAutoGamma_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionAutoGamma)
-- OnClick Function
AbyssUIAutoGamma_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.ExtraFunctionAutoGamma = self:GetChecked()
  --local dataTime = GetGameTime()
  local dataTime = tonumber(date("%H"))
  if ( dataTime >= 6 and dataTime < 18 ) then
    ConsoleExec( "Gamma 1.2" )
  elseif ( dataTime >= 18 ) then
    ConsoleExec( "Gamma 1.0" )
  end
end)
-- After Login/Reload
AbyssUIAutoGamma_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
AbyssUIAutoGamma_CheckButton:SetScript("OnEvent", function(self, event, ...)
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    if AbyssUIAddonSettings.ExtraFunctionAutoGamma == true then
      C_Timer.After(0.5, function ()
        local dataTime = tonumber(date("%H"))
        if ( dataTime >= 6 and dataTime < 18 ) then
          ConsoleExec( "Gamma 1.2" )
        elseif ( dataTime >= 18 ) then
          ConsoleExec( "Gamma 1.0" )
        end
      end)  
    end
  end
end)
-- American Clock Style --
local AbyssUI_AmericanClock_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_AmericanClock_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUI_AmericanClock_CheckButton:SetPoint("TOPLEFT", 10, -380)
AbyssUI_AmericanClock_CheckButton.Text:SetText("American Date Style")
AbyssUI_AmericanClock_CheckButton.tooltip = "Change the date format of the whole UI to"..
" the American style"
AbyssUI_AmericanClock_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionAmericanClock)
-- OnClick Function
AbyssUI_AmericanClock_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.ExtraFunctionAmericanClock = self:GetChecked()
end)
-- Hide in Combat --
local AbyssUI_HideInCombat_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_HideInCombat_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUI_HideInCombat_CheckButton:SetPoint("TOPLEFT", 10, -410)
AbyssUI_HideInCombat_CheckButton.Text:SetText("Dynamic ObjectiveTrack Hide")
AbyssUI_HideInCombat_CheckButton.tooltip = "Hide some parts of the interface when you"..
" are in combat or in a PVP instance"
AbyssUI_HideInCombat_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionHideInCombat)
-- OnClick Function
AbyssUI_HideInCombat_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.ExtraFunctionHideInCombat = self:GetChecked()
end)
-- Better Fonts --
local AbyssUI_BetterFonts_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_BetterFonts_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUI_BetterFonts_CheckButton:SetPoint("TOPLEFT", 10, -440)
AbyssUI_BetterFonts_CheckButton.Text:SetText("RPG chat fonts")
AbyssUI_BetterFonts_CheckButton.tooltip = "Change the chat fonts to a RPG look-alike style"
AbyssUI_BetterFonts_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionBetterFonts)
-- OnClick Function
AbyssUI_BetterFonts_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.ExtraFunctionBetterFonts = self:GetChecked()
  AbyssUI_ReloadFrame:Show()
end)
-- After Login/Reload
AbyssUI_BetterFonts_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
AbyssUI_BetterFonts_CheckButton:SetScript("OnEvent", function(self, event, ...)
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    if ( AbyssUIAddonSettings.ExtraFunctionBetterFonts == true ) then
       ChatFrame1:SetFont("Fonts\\MORPHEUS.TTF", 13)
       ChatFrame1.editBox.header:SetFont("Fonts\\MORPHEUS.TTF",13)
    else 
      return nil
    end
  end
end)
-- Screenshot when you level up --
local AbyssUI_ScreenshotLevelUp_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_ScreenshotLevelUp_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUI_ScreenshotLevelUp_CheckButton:SetPoint("TOPLEFT", 10, -470)
AbyssUI_ScreenshotLevelUp_CheckButton.Text:SetText("Auto Screenshot")
AbyssUI_ScreenshotLevelUp_CheckButton.tooltip = "Automatically takes a screenshot when you level up"
AbyssUI_ScreenshotLevelUp_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionScreenshotLevelUp)
-- OnClick Function
AbyssUI_ScreenshotLevelUp_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.ExtraFunctionScreenshotLevelUp = self:GetChecked()
end)
--- Frames ---
-- Disable Nameplate Changes --
local AbyssUI_NameplateChanges_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_NameplateChanges_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUI_NameplateChanges_CheckButton:SetPoint("TOPLEFT", 400, -80)
AbyssUI_NameplateChanges_CheckButton.Text:SetText("Disable Nameplate Changes")
AbyssUI_NameplateChanges_CheckButton.tooltip = "This option will remove any change that was made to the nameplates (the bar above mobs and players)"
AbyssUI_NameplateChanges_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionNameplateChanges)
-- OnClick Function
AbyssUI_NameplateChanges_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.ExtraFunctionNameplateChanges = self:GetChecked()
  AbyssUI_ReloadFrame:Show()
end)
-- Disable ChatBubble --
local AbyssUI_ChatBubbleChanges_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_ChatBubbleChanges_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUI_ChatBubbleChanges_CheckButton:SetPoint("TOPLEFT", 400, -110)
AbyssUI_ChatBubbleChanges_CheckButton.Text:SetText("Disable ChatBubble Changes")
AbyssUI_ChatBubbleChanges_CheckButton.tooltip = "This option will remove any change that was made to the chatbubbles (the frame text above players)"
AbyssUI_ChatBubbleChanges_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionChatBubbleChanges)
-- OnClick Function
AbyssUI_ChatBubbleChanges_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.ExtraFunctionChatBubbleChanges = self:GetChecked()
  AbyssUI_ReloadFrame:Show()
end)
-- Disable Damage Font --
local AbyssUI_DamageFont_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_DamageFont_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUI_DamageFont_CheckButton:SetPoint("TOPLEFT", 400, -140)
AbyssUI_DamageFont_CheckButton.Text:SetText("Disable Damage Font (*)")
AbyssUI_DamageFont_CheckButton.tooltip = "This option will remove any change to the damage font text."..
"\n*You need to restart the game so the font can be reloaded. You can change it to any font, "..
"go to Textures->font and replace the file keeping the same name"
AbyssUI_DamageFont_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionDamageFont)
-- OnClick Function
AbyssUI_DamageFont_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.ExtraFunctionDamageFont = self:GetChecked()
  AbyssUI_ReloadFrame:Show()
end)
-- Disable Global Font --
local AbyssUI_GlobalFont_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_GlobalFont_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUI_GlobalFont_CheckButton:SetPoint("TOPLEFT", 400, -170)
AbyssUI_GlobalFont_CheckButton.Text:SetText("Disable Global Font (*)")
AbyssUI_GlobalFont_CheckButton.tooltip = "This option will remove any change to the global font text."..
"\n*You need to restart the game so the default font can be reloaded. You can change it to any font, "..
"go to Textures->font and replace the file keeping the same name"
AbyssUI_GlobalFont_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionGlobalFont)
-- OnClick Function
AbyssUI_GlobalFont_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.ExtraFunctionGlobalFont = self:GetChecked()
  AbyssUI_ReloadFrame:Show()
end)
-- Disable healing spam over player --
local AbyssUI_DisableHealingSpam_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_DisableHealingSpam_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUI_DisableHealingSpam_CheckButton:SetPoint("TOPLEFT", 400, -200)
AbyssUI_DisableHealingSpam_CheckButton.Text:SetText("|cfff2dc7fDisable Portrait Text Spam|r")
AbyssUI_DisableHealingSpam_CheckButton.tooltip = "Disable healing/damage spam over player"..
" and pet portraits"
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
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    if ( AbyssUIAddonSettings.ExtraFunctionDisableHealingSpam == true ) then
      PlayerHitIndicator:SetText(nil)
      PlayerHitIndicator.SetText = function() end

      PetHitIndicator:SetText(nil)
      PetHitIndicator.SetText = function() end
    end
  end
end)
-- Disable Square Minimap --
local DisableSquareMinimap_CheckButton = CreateFrame("CheckButton", "$parentUnitFrameImproved_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
DisableSquareMinimap_CheckButton:SetPoint("TOPLEFT", 400, -230)
DisableSquareMinimap_CheckButton.Text:SetText("Disable Square Minimap (*)")
DisableSquareMinimap_CheckButton.tooltip = "This option will get you back to the"..
" Blizzard default minimap style (round). *You need to restart the game so round textures can be re-loaded"
DisableSquareMinimap_CheckButton:SetChecked(AbyssUIAddonSettings.DisableSquareMinimap)
-- OnClick Function
DisableSquareMinimap_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.DisableSquareMinimap = self:GetChecked()
  AbyssUI_ReloadFrame:Show()
end)
-- Disable UnitFrame Smoke --
local DisableUnitFrameSmoke_CheckButton = CreateFrame("CheckButton", "$parentDisableUnitFrameSmoke_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
DisableUnitFrameSmoke_CheckButton:SetPoint("TOPLEFT", 400, -260)
DisableUnitFrameSmoke_CheckButton.Text:SetText("Disable Smoke Texture")
DisableUnitFrameSmoke_CheckButton.tooltip = "It will disable the 'smoke' texture around the portrait in "..
"the UnitFrame Improved version of it"
DisableUnitFrameSmoke_CheckButton:SetChecked(AbyssUIAddonSettings.UnitFrameImprovedDefaultTexture)
-- OnClick Function
DisableUnitFrameSmoke_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.UnitFrameImprovedDefaultTexture = self:GetChecked()
  AbyssUI_ReloadFrame:Show()
end)
-- Transparent Background Name --
local AbyssUI_TransparentName_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_TransparentName_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUI_TransparentName_CheckButton:SetPoint("TOPLEFT", 400, -290)
AbyssUI_TransparentName_CheckButton.Text:SetText("Transparent Name BKGD")
AbyssUI_TransparentName_CheckButton.tooltip = "Remove any color in the target name background"
AbyssUI_TransparentName_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionTransparentName)
-- OnClick Function
AbyssUI_TransparentName_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.ExtraFunctionTransparentName = self:GetChecked()
  AbyssUI_ReloadFrame:Show()
end)
-- Remove Background class color --
local AbyssUI_HideBackgroundClassColor_CheckButton = CreateFrame("CheckButton", "$parentAbyssUI_HideBackgroundClassColor_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
AbyssUI_HideBackgroundClassColor_CheckButton:SetPoint("TOPLEFT", 400, -320)
AbyssUI_HideBackgroundClassColor_CheckButton.Text:SetText("Default Background")
AbyssUI_HideBackgroundClassColor_CheckButton.tooltip = "Remove the class color background behind"..
" the player names to default values (Transparent Name needs to be unchecked)"
AbyssUI_HideBackgroundClassColor_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionHideBackgroundClassColor)
-- OnClick Function
AbyssUI_HideBackgroundClassColor_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.ExtraFunctionHideBackgroundClassColor = self:GetChecked()
  AbyssUI_ReloadFrame:Show()
end)
--End
----------------------------------- Tweaks & Extra  -----------------------------------
-- Read tooltip--
local PSINFOTweaks_CheckButton = CreateFrame("Frame","$parentPSINFOHide_CheckButton", AbyssUI_Config.childpanel5)
PSINFOTweaks_CheckButton:SetPoint("BOTTOMLEFT", AbyssUI_Config.childpanel5, "BOTTOMLEFT", 10, 10)
PSINFOTweaks_CheckButton:SetHeight(24)
PSINFOTweaks_CheckButton:SetWidth(200)
PSINFOTweaks_CheckButton:SetScale(1)
PSINFOTweaks_CheckButton = PSINFOTweaks_CheckButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
PSINFOTweaks_CheckButton:SetPoint("LEFT")
PSINFOTweaks_CheckButton:SetText("The symbol (*) in some options means that there is important information/instructions to be read.\n"..
  "Options with a different color are recommended settings.")
--- Global ---
-- Keep UnitFrame Dark --
local KeepUnitDark_CheckButton = CreateFrame("CheckButton", "$parentKeepUnitDark_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
KeepUnitDark_CheckButton:SetPoint("TOPLEFT", 10, -80)
KeepUnitDark_CheckButton.Text:SetText("Keep UnitFrame Dark")
KeepUnitDark_CheckButton.tooltip = "Even if you change theme, this will keep UnitFrame Dark"..
" (Player Frame, Boss, etc)."
KeepUnitDark_CheckButton:SetChecked(AbyssUIAddonSettings.KeepUnitDark)
-- OnClick Function
KeepUnitDark_CheckButton:SetScript("OnClick", function(self)
 if AbyssUIAddonSettings.KeepUnitBlizzard == true then
   KeepUnitDark_CheckButton:SetChecked(nil)
 else
   AbyssUIAddonSettings.KeepUnitDark = self:GetChecked()
   AbyssUI_ReloadFrame:Show()
 end
end)
 -- After Login/Reload
KeepUnitDark_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
KeepUnitDark_CheckButton:SetScript("OnEvent", function(self, event, ...)
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    if AbyssUIAddonSettings.KeepUnitDark == true then
      AbyssUIAddonSettings.KeepUnitDark = self:GetChecked()
    else
      KeepUnitDark_CheckButton:SetChecked(nil)
    end
  end
end)
-- Keep UnitFrame Blizzard Like --
local KeepUnitBlizzard_CheckButton = CreateFrame("CheckButton", "$parentKeepUnitBlizzard_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
KeepUnitBlizzard_CheckButton:SetPoint("TOPLEFT", 10, -110)
KeepUnitBlizzard_CheckButton.Text:SetText("Keep UnitFrame Blizzard Like")
KeepUnitBlizzard_CheckButton.tooltip = "Even if you change theme, this will keep UnitFrame"..
" Blizzard like (Player Frame, Boss, etc)."
KeepUnitBlizzard_CheckButton:SetChecked(AbyssUIAddonSettings.KeepUnitBlizzard)
-- OnClick Function
KeepUnitBlizzard_CheckButton:SetScript("OnClick", function(self)
  if AbyssUIAddonSettings.KeepUnitDark == true then
    KeepUnitBlizzard_CheckButton:SetChecked(nil)
  else
    AbyssUIAddonSettings.KeepUnitBlizzard = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  end
end)
-- After Login/Reload
KeepUnitBlizzard_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
KeepUnitBlizzard_CheckButton:SetScript("OnEvent", function(self, event, ...)
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    if AbyssUIAddonSettings.KeepUnitBlizzard == true then
      AbyssUIAddonSettings.KeepUnitBlizzard = self:GetChecked()
    else
      KeepUnitBlizzard_CheckButton:SetChecked(nil)
    end
  end
end)
-- Fade UI --
local FadeUI_CheckButton = CreateFrame("CheckButton", "$parentFadeUI_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
FadeUI_CheckButton:SetPoint("TOPLEFT", 10, -140)
FadeUI_CheckButton.Text:SetText("Fade UI")
FadeUI_CheckButton.tooltip = "Fade the UI when you are out of combat ('ATL-CTRL-P' to show frames)"
FadeUI_CheckButton:SetChecked(AbyssUIAddonSettings.FadeUI)
-- OnClick Function
FadeUI_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.FadeUI = self:GetChecked()
  AbyssUI_ReloadFrameFadeUI:Show()
end)
-- Minimal ActionBar --
local MinimalActionBar_CheckButton = CreateFrame("CheckButton", "$parentMinimalActionBar_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
MinimalActionBar_CheckButton:SetPoint("TOPLEFT", 10, -170)
MinimalActionBar_CheckButton.Text:SetText("Minimal ActionBar")
MinimalActionBar_CheckButton.tooltip = "Minimalist actionbar, hide all the textures"
MinimalActionBar_CheckButton:SetChecked(AbyssUIAddonSettings.MinimalActionBar)
-- OnClick Function
MinimalActionBar_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.MinimalActionBar = self:GetChecked()
  AbyssUI_ReloadFrame:Show()
end)
-- Disable Kill Announcer --
local KillAnnouncer_CheckButton = CreateFrame("CheckButton", "$parentKillAnnouncer_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
KillAnnouncer_CheckButton:SetPoint("TOPLEFT", 10, -200)
KillAnnouncer_CheckButton.Text:SetText("Disable Kill Announcer")
KillAnnouncer_CheckButton.tooltip = "Disable the Kill Announcer frame that show up when you kill someone"
KillAnnouncer_CheckButton:SetChecked(AbyssUIAddonSettings.DisableKillAnnouncer)
-- OnClick Function
KillAnnouncer_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.DisableKillAnnouncer = self:GetChecked()
  AbyssUI_ReloadFrame:Show()
end)
-- Silence Kill Announcer --
local SilenceKillAnnouncer_CheckButton = CreateFrame("CheckButton", "$parentUnitFrameImproved_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
SilenceKillAnnouncer_CheckButton:SetPoint("TOPLEFT", 10, -230)
SilenceKillAnnouncer_CheckButton.Text:SetText("Silence Kill Announcer")
SilenceKillAnnouncer_CheckButton.tooltip = "Remove boss/kill sounds from the Kill Announcer frame"
SilenceKillAnnouncer_CheckButton:SetChecked(AbyssUIAddonSettings.SilenceKillAnnouncer)
-- OnClick Function
SilenceKillAnnouncer_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.SilenceKillAnnouncer = self:GetChecked()
end)
--- Frames ---
-- Elite Portrait --
local ElitePortrait_CheckButton = CreateFrame("CheckButton", "$parentElitePortrait_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
ElitePortrait_CheckButton:SetPoint("TOPLEFT", 400, -80)
ElitePortrait_CheckButton.Text:SetText("|cfff2dc7fElite Portrait|r")
ElitePortrait_CheckButton.tooltip = "Add a elite texture to the portraits"
ElitePortrait_CheckButton:SetChecked(AbyssUIAddonSettings.ElitePortrait)
addonTable.ElitePortrait = ElitePortrait_CheckButton
-- OnClick Function
ElitePortrait_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.ElitePortrait = self:GetChecked()
  AbyssUI_ReloadFrame:Show()
end)
-- UnitFrame Improved --
local UnitFrameImproved_CheckButton = CreateFrame("CheckButton", "$parentUnitFrameImproved_CheckButton", AbyssUI_Config.childpanel5, "ChatConfigCheckButtonTemplate")
UnitFrameImproved_CheckButton:SetPoint("TOPLEFT", 400, -110)
UnitFrameImproved_CheckButton.Text:SetText("|cfff2dc7fUnitFrame Improved|r")
UnitFrameImproved_CheckButton.tooltip = "This is a improved version of unitframes,"..
" it changes those frames to a more beautiful and complete version"
UnitFrameImproved_CheckButton:SetChecked(AbyssUIAddonSettings.UnitFrameImproved)
addonTable.UnitFrameImproved = UnitFrameImproved_CheckButton
-- OnClick Function
UnitFrameImproved_CheckButton:SetScript("OnClick", function(self)
  AbyssUIAddonSettings.UnitFrameImproved = self:GetChecked()
  AbyssUI_ReloadFrame:Show()
end)
----------------------------- AbyssUI Stylization ------------------------------
-- Player Portrait Style --
local PSINFO_CheckButton = CreateFrame("Frame","$parentPSINFO_CheckButton", AbyssUI_Config.childpanel4)
PSINFO_CheckButton:SetPoint("BOTTOMLEFT", AbyssUI_Config.childpanel4, "BOTTOMLEFT", 10, 20)
PSINFO_CheckButton:SetHeight(24)
PSINFO_CheckButton:SetWidth(200)
PSINFO_CheckButton:SetScale(1)
PSINFO_CheckButton = PSINFO_CheckButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
PSINFO_CheckButton:SetPoint("LEFT")
PSINFO_CheckButton:SetText("Some of this options needs the AbyssUI_TexturePack. You can find a download link in the addon page.")
-- AbyssUIClassCircles01_CheckButton
local AbyssUIClassCircles01_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles01_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles01_CheckButton:SetPoint("TOPLEFT", 10, -80)
AbyssUIClassCircles01_CheckButton.Text:SetText("Artistic")
AbyssUIClassCircles01_CheckButton.tooltip = "A artistic version of UnitPlayerFrame"
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
    AbyssUIClassCircles01_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIClassCircles02_CheckButton
local AbyssUIClassCircles02_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles02_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles02_CheckButton:SetPoint("TOPLEFT", 10, -110)
AbyssUIClassCircles02_CheckButton.Text:SetText("Bright")
AbyssUIClassCircles02_CheckButton.tooltip = "A bright version of UnitPlayerFrame"
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
    AbyssUIClassCircles02_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIClassCircles03_CheckButton
local AbyssUIClassCircles03_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles03_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles03_CheckButton:SetPoint("TOPLEFT", 10, -140)
AbyssUIClassCircles03_CheckButton.Text:SetText("Classic")
AbyssUIClassCircles03_CheckButton.tooltip = "A classic version of UnitPlayerFrame"
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
    AbyssUIClassCircles03_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIClassCircles04_CheckButton
local AbyssUIClassCircles04_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles04_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles04_CheckButton:SetPoint("TOPLEFT", 10, -170)
AbyssUIClassCircles04_CheckButton.Text:SetText("Artistic_V2")
AbyssUIClassCircles04_CheckButton.tooltip = "Version two of artistic UnitPlayerFrame"
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
    AbyssUIClassCircles04_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIClassCircles05_CheckButton
local AbyssUIClassCircles05_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles05_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles05_CheckButton:SetPoint("TOPLEFT", 180 , -80)
AbyssUIClassCircles05_CheckButton.Text:SetText("Dark")
AbyssUIClassCircles05_CheckButton.tooltip = "Dark version of UnitPlayerFrame"
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
    AbyssUIClassCircles05_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIClassCircles06_CheckButton
local AbyssUIClassCircles06_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles06_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles06_CheckButton:SetPoint("TOPLEFT", 180, -110)
AbyssUIClassCircles06_CheckButton.Text:SetText("Dark_Gray")
AbyssUIClassCircles06_CheckButton.tooltip = "A dark gray version of UnitPlayerFrame"
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
    AbyssUIClassCircles06_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIClassCircles07_CheckButton
local AbyssUIClassCircles07_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles07_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles07_CheckButton:SetPoint("TOPLEFT", 180, -140)
AbyssUIClassCircles07_CheckButton.Text:SetText("Dark_V2")
AbyssUIClassCircles07_CheckButton.tooltip = "Version 2 of the dark UnitPlayerFrame"
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
    AbyssUIClassCircles07_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIClassCircles08_CheckButton
local AbyssUIClassCircles08_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles08_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles08_CheckButton:SetPoint("TOPLEFT", 180, -170)
AbyssUIClassCircles08_CheckButton.Text:SetText("GrayScale")
AbyssUIClassCircles08_CheckButton.tooltip = "A grayscale version of UnitPlayerFrame"
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
    AbyssUIClassCircles08_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIClassCircles09_CheckButton
local AbyssUIClassCircles09_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles09_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles09_CheckButton:SetPoint("TOPLEFT", 10, -200)
AbyssUIClassCircles09_CheckButton.Text:SetText("Light_Gray")
AbyssUIClassCircles09_CheckButton.tooltip = "A light gray version of UnitPlayerFrame"
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
    AbyssUIClassCircles09_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIClassCircles10_CheckButton
local AbyssUIClassCircles10_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles10_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles10_CheckButton:SetPoint("TOPLEFT", 180, -200)
AbyssUIClassCircles10_CheckButton.Text:SetText("Medium_Gray")
AbyssUIClassCircles10_CheckButton.tooltip = "A medium gray version of UnitPlayerFrame"
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
    AbyssUIClassCircles10_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIClassCircles11_CheckButton
local AbyssUIClassCircles11_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles11_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles11_CheckButton:SetPoint("TOPLEFT", 10, -230)
AbyssUIClassCircles11_CheckButton.Text:SetText("Minimal_Blue")
AbyssUIClassCircles11_CheckButton.tooltip = "A blue version of UnitPlayerFrame"
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
    AbyssUIClassCircles11_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIClassCircles12_CheckButton
local AbyssUIClassCircles12_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles12_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles12_CheckButton:SetPoint("TOPLEFT", 180, -230)
AbyssUIClassCircles12_CheckButton.Text:SetText("Minimal_Red")
AbyssUIClassCircles12_CheckButton.tooltip = "A red version of UnitPlayerFrame"
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
    AbyssUIClassCircles12_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIClassCircles13_CheckButton
local AbyssUIClassCircles13_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles13_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles13_CheckButton:SetPoint("TOPLEFT", 10, -260)
AbyssUIClassCircles13_CheckButton.Text:SetText("Muted")
AbyssUIClassCircles13_CheckButton.tooltip = "A muted version of UnitPlayerFrame"
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
    AbyssUIClassCircles13_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIClassCircles14_CheckButton
local AbyssUIClassCircles14_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles14_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles14_CheckButton:SetPoint("TOPLEFT", 180, -260)
AbyssUIClassCircles14_CheckButton.Text:SetText("Psychedelic")
AbyssUIClassCircles14_CheckButton.tooltip = "A psychedelic version of UnitPlayerFrame"
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
    AbyssUIClassCircles14_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIClassCircles15_CheckButton
local AbyssUIClassCircles15_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles14_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles15_CheckButton:SetPoint("TOPLEFT", 10, -290)
AbyssUIClassCircles15_CheckButton.Text:SetText("Retro")
AbyssUIClassCircles15_CheckButton.tooltip = "A retrowave version of UnitPlayerFrame"
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
    AbyssUIClassCircles15_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIClassCircles16_CheckButton
local AbyssUIClassCircles16_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles14_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIClassCircles16_CheckButton:SetPoint("TOPLEFT", 180, -290)
AbyssUIClassCircles16_CheckButton.Text:SetText("Vibrant")
AbyssUIClassCircles16_CheckButton.tooltip = "A vibrant version of UnitPlayerFrame"
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
    AbyssUIClassCircles16_CheckButton:SetChecked(nil)
  end
end)
-- Frame Colorization --
-- AbyssUIVertexColorFrames01_CheckButton
local AbyssUIVertexColorFrames01_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames01_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames01_CheckButton:SetPoint("TOPRIGHT", -250, -80)
AbyssUIVertexColorFrames01_CheckButton.Text:SetText("|cffc0c0c0Blizzard (Default)|r")
AbyssUIVertexColorFrames01_CheckButton.tooltip = "Blizzard Silver Colorization for Frames"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames01 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames01_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIVertexColorFrames02_CheckButton
local AbyssUIVertexColorFrames02_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames02_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames02_CheckButton:SetPoint("TOPRIGHT", -80, -80)
AbyssUIVertexColorFrames02_CheckButton.Text:SetText("|cff636363Blackout|r")
AbyssUIVertexColorFrames02_CheckButton.tooltip = "A completely Dark Frame Colorization"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames02 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames02_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIVertexColorFrames03_CheckButton
local AbyssUIVertexColorFrames03_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames03_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames03_CheckButton:SetPoint("TOPRIGHT", -250, -110)
AbyssUIVertexColorFrames03_CheckButton.Text:SetText("|cffb62a25Blood|r")
AbyssUIVertexColorFrames03_CheckButton.tooltip = "A Dark Red Frame Colorization"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames03 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames03_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIVertexColorFrames04_CheckButton
local AbyssUIVertexColorFrames04_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames04_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames04_CheckButton:SetPoint("TOPRIGHT", -80, -110)
AbyssUIVertexColorFrames04_CheckButton.Text:SetText("|cffecc13cGold|r")
AbyssUIVertexColorFrames04_CheckButton.tooltip = "A Golden Frame Colorization"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames04 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames04_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIVertexColorFrames05_CheckButton
local AbyssUIVertexColorFrames05_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames05_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames05_CheckButton:SetPoint("TOPRIGHT", -250, -140)
AbyssUIVertexColorFrames05_CheckButton.Text:SetText("|cffc41F3BDeath Knight|r")
AbyssUIVertexColorFrames05_CheckButton.tooltip = "DK Class Frame Colorization"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames05 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames05_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIVertexColorFrames06_CheckButton
local AbyssUIVertexColorFrames06_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames06_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames06_CheckButton:SetPoint("TOPRIGHT", -80, -140)
AbyssUIVertexColorFrames06_CheckButton.Text:SetText("|cffA330C9Demon\nHunter|r")
AbyssUIVertexColorFrames06_CheckButton.tooltip = "DH Class Frame Colorization"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames06 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames06_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIVertexColorFrames07_CheckButton
local AbyssUIVertexColorFrames07_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames07_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames07_CheckButton:SetPoint("TOPRIGHT", -250, -170)
AbyssUIVertexColorFrames07_CheckButton.Text:SetText("|cffFF7D0ADruid|r")
AbyssUIVertexColorFrames07_CheckButton.tooltip = "Druid Class Frame Colorization"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames07 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames07_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIVertexColorFrames08_CheckButton
local AbyssUIVertexColorFrames08_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames08_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames08_CheckButton:SetPoint("TOPRIGHT", -80, -170)
AbyssUIVertexColorFrames08_CheckButton.Text:SetText("|cffABD473Hunter|r")
AbyssUIVertexColorFrames08_CheckButton.tooltip = "Hunter Class Frame Colorization"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames08 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames08_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIVertexColorFrames09_CheckButton
local AbyssUIVertexColorFrames09_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames09_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames09_CheckButton:SetPoint("TOPRIGHT", -250, -200)
AbyssUIVertexColorFrames09_CheckButton.Text:SetText("|cff69CCF0Mage|r")
AbyssUIVertexColorFrames09_CheckButton.tooltip = "Mage Class Frame Colorization"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames09 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames09_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIVertexColorFrames10_CheckButton
local AbyssUIVertexColorFrames10_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames10_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames10_CheckButton:SetPoint("TOPRIGHT", -80, -200)
AbyssUIVertexColorFrames10_CheckButton.Text:SetText("|cff00FF96Monk|r")
AbyssUIVertexColorFrames10_CheckButton.tooltip = "Monk Class Frame Colorization"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames10 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames10_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIVertexColorFrames11_CheckButton
local AbyssUIVertexColorFrames11_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames11_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames11_CheckButton:SetPoint("TOPRIGHT", -250, -230)
AbyssUIVertexColorFrames11_CheckButton.Text:SetText("|cffF58CBAPaladin|r")
AbyssUIVertexColorFrames11_CheckButton.tooltip = "Paladin Class Frame Colorization"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames11 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames11_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIVertexColorFrames12_CheckButton
local AbyssUIVertexColorFrames12_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames12_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames12_CheckButton:SetPoint("TOPRIGHT", -80, -230)
AbyssUIVertexColorFrames12_CheckButton.Text:SetText("Priest")
AbyssUIVertexColorFrames12_CheckButton.tooltip = "Priest Class Frame Colorization (Shadow Priest)"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames12 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames12_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIVertexColorFrames13_CheckButton
local AbyssUIVertexColorFrames13_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames13_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames13_CheckButton:SetPoint("TOPRIGHT", -250, -260)
AbyssUIVertexColorFrames13_CheckButton.Text:SetText("|cffFFF569Rogue|r")
AbyssUIVertexColorFrames13_CheckButton.tooltip = "Rogue Class Frame Colorization"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames13 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames13_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIVertexColorFrames14_CheckButton
local AbyssUIVertexColorFrames14_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames14_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames14_CheckButton:SetPoint("TOPRIGHT", -80, -260)
AbyssUIVertexColorFrames14_CheckButton.Text:SetText("|cff0070DEShaman|r")
AbyssUIVertexColorFrames14_CheckButton.tooltip = "Shaman Class Frame Colorization"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames14 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames14_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIVertexColorFrames15_CheckButton
local AbyssUIVertexColorFrames15_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames15_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames15_CheckButton:SetPoint("TOPRIGHT", -250, -290)
AbyssUIVertexColorFrames15_CheckButton.Text:SetText("|cff9482C9Warlock|r")
AbyssUIVertexColorFrames15_CheckButton.tooltip = "Warlock Class Frame Colorization"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames15 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames15_CheckButton:SetChecked(nil)
  end
end)
-- AbyssUIVertexColorFrames16_CheckButton
local AbyssUIVertexColorFrames16_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames16_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFrames16_CheckButton:SetPoint("TOPRIGHT", -80, -290)
AbyssUIVertexColorFrames16_CheckButton.Text:SetText("|cffC79C6EWarrior|r")
AbyssUIVertexColorFrames16_CheckButton.tooltip = "Warrior Class Frame Colorization"
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
  AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true then
    AbyssUIAddonSettings.UIVertexColorFrames16 = self:GetChecked()
    AbyssUI_ReloadFrame:Show()
  else
    AbyssUIVertexColorFrames16_CheckButton:SetChecked(nil)
  end
end)
-- Choose a Color (Color Picker)
local AbyssUIVertexColorFramesColorPicker_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFramesColorPicker_CheckButton", AbyssUI_Config.childpanel4, "ChatConfigCheckButtonTemplate")
AbyssUIVertexColorFramesColorPicker_CheckButton:SetPoint("CENTER", AbyssUI_Config.childpanel4, "CENTER", 50, -80)
AbyssUIVertexColorFramesColorPicker_CheckButton.Text:SetText("Select a Color")
AbyssUIVertexColorFramesColorPicker_CheckButton.tooltip = "Choose a color for the frames (Color Picker)"
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
  AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
    AbyssUIAddonSettings.UIVertexColorFramesColorPicker = self:GetChecked()
    AbyssUI_ColorPickerFrame:Show()
  else
    AbyssUIVertexColorFramesColorPicker_CheckButton:SetChecked(nil)
  end
end)
-- End
end
--------------------------------- Save ---------------------------------
--This starts things off and once we're far enough into the game
--to check our SavedVariables and initialises if required
local f = CreateFrame("Frame", "AbyssUI_Config", UIParent)
f:SetSize(50, 50)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, ...)
    if not AbyssUIAddonSettings then
      AbyssUIAddonSettings = {}
    end
    -- Now we have SavedVarialbe loaded, create the interface options frame
    InitSettings()
end)
----------------------------------------------------
-- End
