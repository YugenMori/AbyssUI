--------------------------------------------------------------------------------
-- Author: Abyss_Samurai
--
-- Battle for Azeroth
--
-- Hope you like my addOn ^^
--
-- Dark Minimalist UI for World of Warcraft
--
-- Thank you so much Fizzlemizz for the help with this Panel
--------------------------------------------------------------------------------
local addonName, addonTable = ...

local AbyssUI_Config = {}

local function InitSettings()
    AbyssUI_Config.panel = CreateFrame( "Frame", "AbyssUI_Config", InterfaceOptionsFramePanelContainer)
    -- Register in the Interface Addon Options GUI
    -- Set the name for the Category for the Options Panel
    AbyssUI_Config.panel.name = "Abyss|cff0d75d4UI|r"
    -- Add the panel to the Interface Options
    InterfaceOptions_AddCategory(AbyssUI_Config.panel, addonName)

    -- Title
    local Frame = CreateFrame("Frame","$parentFrameButtonTitle", AbyssUI_Config.panel)
    Frame:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 0, -20)
    Frame:SetHeight(24)
    Frame:SetWidth(70)
    Frame:SetScale(1.5)
    Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    Frame:SetPoint("CENTER")
    Frame:SetText("Abyss|cff0d75d4UI|r")

    -- Panel 01
    local Frame = CreateFrame("Frame","$parentFrameButtonPanel01", AbyssUI_Config.panel)
    Frame:SetPoint("TOPLEFT", AbyssUI_Config.panel, "TOPLEFT", 10, -40)
    Frame:SetWidth(120)
    Frame:SetHeight(24)
    Frame:SetScale(1.1)
    Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    Frame:SetPoint("CENTER")
    Frame:SetText("Hide Elements")

    -- Panel 02
    local Frame = CreateFrame("Frame","$parentFrameButtonPanel02", AbyssUI_Config.panel)
    Frame:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 0, -51)
    Frame:SetWidth(120)
    Frame:SetHeight(24)
    Frame:SetScale(1.1)
    Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    Frame:SetPoint("CENTER")
    Frame:SetText("Extras")

    -- Panel 03
    local Frame = CreateFrame("Frame","$parentFrameButtonPanel03", AbyssUI_Config.panel)
    Frame:SetPoint("TOPRIGHT", AbyssUI_Config.panel, "TOPRIGHT", -10, -40)
    Frame:SetWidth(120)
    Frame:SetHeight(24)
    Frame:SetScale(1.1)
    Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    Frame:SetPoint("CENTER")
    Frame:SetText("Miscellaneous")

    ---------------------------
    -- MicroMenu/Bags Option --
    ---------------------------

    local MicroMenu_CheckButton = CreateFrame("CheckButton", "$parentMicroMenu_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
    MicroMenu_CheckButton:SetPoint("TOPLEFT", 10, -80)
    MicroMenu_CheckButton.Text:SetText("Hide MicroMenu")
    MicroMenu_CheckButton.tooltip = "Hide the ActionBar MicroMenu (Bags Bar)"
    MicroMenu_CheckButton:SetChecked(AbyssUIAddonSettings.HideMicroMenu)
    -- OnClick Function
    MicroMenu_CheckButton:SetScript("OnClick", function(self)
      AbyssUIAddonSettings.HideMicroMenu = self:GetChecked()
      if AbyssUIAddonSettings.HideMicroMenu == true then
        HideMicroMenu_Function()
      else
        ShowMicroMenu_Function()
      end
    end)
    -- After Login/Reload
    MicroMenu_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
    MicroMenu_CheckButton:SetScript("OnEvent", function(self, event, ...)
    if ( event == "PLAYER_ENTERING_WORLD" ) then
      if AbyssUIAddonSettings.HideMicroMenu == true then
        HideMicroMenu_Function()
      else
        ShowMicroMenu_Function()
      end
    end
  end)

  --  Hide
  function HideMicroMenu_Function()
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
  function ShowMicroMenu_Function()
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

    --------------------
    -- Gryphons Option --
    --------------------

    local Gryphons_CheckButton = CreateFrame("CheckButton", "$parentGryphons_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
    Gryphons_CheckButton:SetPoint("TOPLEFT", 10, -120)
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

    --------------------
    -- Minimap Option --
    --------------------

    local Minimap_CheckButton = CreateFrame("CheckButton", "$parentMinimap_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
    Minimap_CheckButton:SetPoint("TOPLEFT", 10, -160)
    Minimap_CheckButton.Text:SetText("Hide Minimap")
    Minimap_CheckButton.tooltip = "Hide the Game Minimap"
    Minimap_CheckButton:SetChecked(AbyssUIAddonSettings.HideMinimap)
    -- OnClick Function
    Minimap_CheckButton:SetScript("OnClick", function(self)
      AbyssUIAddonSettings.HideMinimap = self:GetChecked()
      if AbyssUIAddonSettings.HideMinimap == true then
        MinimapCluster:Hide()
      else
        MinimapCluster:Show()
      end
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

    ----------------------------
    -- Objective Tracker Hide --
    ----------------------------

    local ObjTracker_CheckButton = CreateFrame("CheckButton", "$parentObjTracker_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
    ObjTracker_CheckButton:SetPoint("TOPLEFT", 10, -200)
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

--------------------------------- Extras ---------------------------------

    -----------------------
    -- AbyssUI DailyInfo --
    -----------------------
    local FrameButton = CreateFrame("Button","$parentExtraDailyInfoButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
    FrameButton:SetHeight(24)
    FrameButton:SetWidth(140)
    FrameButton:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 0, -90)
    FrameButton:SetText("AbyssUI DailyInfo")
    FrameButton:SetScript("OnClick", function()
      C_WowTokenPublic.UpdateMarketPrice()
      AbyssUIDailyInfo()
    end)

    ------------
    -- Reload --
    ------------
    local FrameButton = CreateFrame("Button","$parentExtraDailyInfoButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
    FrameButton:SetHeight(24)
    FrameButton:SetWidth(140)
    FrameButton:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 0, -130)
    FrameButton:SetText("Reload UI")
    FrameButton:SetScript("OnClick", function()
      ReloadUI()
    end)


------------------------------- Miscellaneous -------------------------------

    --------------------------------------
    -- Camera Pitch Function Option 50% --
    --------------------------------------

    local CameraSmooth50_CheckButton = CreateFrame("CheckButton", "$parentCameraSmooth50_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
    CameraSmooth50_CheckButton:SetPoint("TOPRIGHT", -120, -80)
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

    --------------------------------------
    -- Camera Pitch Function Option 70% --
    --------------------------------------

    local CameraSmooth70_CheckButton = CreateFrame("CheckButton", "$parentCameraSmooth70_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
    CameraSmooth70_CheckButton:SetPoint("TOPRIGHT", -120, -120)
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

    --------------------------------------
    -- Camera Pitch Function Option 90% --
    --------------------------------------

    local CameraSmooth90_CheckButton = CreateFrame("CheckButton", "$parentCameraSmooth90_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
    CameraSmooth90_CheckButton:SetPoint("TOPRIGHT", -120, -160)
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


  ------------------------------- Unit Frames -------------------------------

  -- AbyssUIClassCircles01_CheckButton
  local AbyssUIClassCircles01_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles01_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles01_CheckButton:SetPoint("CENTER", -290, 0)
  AbyssUIClassCircles01_CheckButton.Text:SetText("Blizzard UnitFrames (Default)")
  AbyssUIClassCircles01_CheckButton.tooltip = "Blizzard Normal Unit Player Frame"
  AbyssUIClassCircles01_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles01)
  -- OnClick Function
  AbyssUIClassCircles01_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.UIClassCircles01 = self:GetChecked()
  end)

  -- AbyssUIClassCircles02_CheckButton
  local AbyssUIClassCircles02_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles02_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles02_CheckButton:SetPoint("CENTER", -290, -40)
  AbyssUIClassCircles02_CheckButton.Text:SetText("Dark Class Color")
  AbyssUIClassCircles02_CheckButton.tooltip = "A Dark Unit Player Frame (UnitFrame02)"
  AbyssUIClassCircles02_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles02)
  -- OnClick Function
  AbyssUIClassCircles02_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.UIClassCircles02 = self:GetChecked()
  end)

  -- AbyssUIClassCircles03_CheckButton
  local AbyssUIClassCircles03_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles03_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles03_CheckButton:SetPoint("CENTER", -290, -80)
  AbyssUIClassCircles03_CheckButton.Text:SetText("Dark Grey Class Color")
  AbyssUIClassCircles03_CheckButton.tooltip = "A Dark Grey Unit Player Frame (UnitFrame03)"
  AbyssUIClassCircles03_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles03)
  -- OnClick Function
  AbyssUIClassCircles03_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.UIClassCircles03 = self:GetChecked()
  end)

  -- AbyssUIClassCircles04_CheckButton
  local AbyssUIClassCircles04_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles04_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles04_CheckButton:SetPoint("CENTER", -290, -120)
  AbyssUIClassCircles04_CheckButton.Text:SetText("Dark Class Color (V2)")
  AbyssUIClassCircles04_CheckButton.tooltip = "Version 2 of the Dark Unit Player Frame (UnitFrame04)"
  AbyssUIClassCircles04_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles04)
  -- OnClick Function
  AbyssUIClassCircles04_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.UIClassCircles04 = self:GetChecked()
  end)

  -- AbyssUIClassCircles05_CheckButton
  local AbyssUIClassCircles05_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles05_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles05_CheckButton:SetPoint("CENTER", -90, 0)
  AbyssUIClassCircles05_CheckButton.Text:SetText("Dark Class Color (V2) Small")
  AbyssUIClassCircles05_CheckButton.tooltip = "Smaller Version 2 of the Dark Unit Player Frame (UnitFrame05)"
  AbyssUIClassCircles05_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles05)
  -- OnClick Function
  AbyssUIClassCircles05_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.UIClassCircles05 = self:GetChecked()
  end)

  -- AbyssUIClassCircles06_CheckButton
  local AbyssUIClassCircles06_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles06_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles06_CheckButton:SetPoint("CENTER", -90, -40)
  AbyssUIClassCircles06_CheckButton.Text:SetText("Light Grey Class Color")
  AbyssUIClassCircles06_CheckButton.tooltip = "A Light Grey Unit Player Frame (UnitFrame06)"
  AbyssUIClassCircles06_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles06)
  -- OnClick Function
  AbyssUIClassCircles06_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.UIClassCircles06 = self:GetChecked()
  end)

  -- AbyssUIClassCircles07_CheckButton
  local AbyssUIClassCircles07_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles07_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles07_CheckButton:SetPoint("CENTER", -90, -80)
  AbyssUIClassCircles07_CheckButton.Text:SetText("Medium Grey Class Color")
  AbyssUIClassCircles07_CheckButton.tooltip = "A Medium Grey Unit Player Frame (UnitFrame07)"
  AbyssUIClassCircles07_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles07)
  -- OnClick Function
  AbyssUIClassCircles07_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.UIClassCircles07 = self:GetChecked()
  end)

  -- AbyssUIClassCircles08_CheckButton
  local AbyssUIClassCircles08_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles08_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles08_CheckButton:SetPoint("CENTER", -90, -120)
  AbyssUIClassCircles08_CheckButton.Text:SetText("Muted Class Color")
  AbyssUIClassCircles08_CheckButton.tooltip = "A Muted Version of the AbyssUI Unit Player Frame (UnitFrame08)"
  AbyssUIClassCircles08_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles08)
  -- OnClick Function
  AbyssUIClassCircles08_CheckButton:SetScript("OnClick", function(self)
    AbyssUIAddonSettings.UIClassCircles08 = self:GetChecked()
  end)

  -- End
end

-- AbyssUI_ReloadFrame
AbyssUI_ReloadFrame = CreateFrame("Frame", nil, UIParent)
AbyssUI_ReloadFrame:Hide()
AbyssUI_ReloadFrame:SetWidth(400)
AbyssUI_ReloadFrame:SetHeight(150)
AbyssUI_ReloadFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, -100)
AbyssUI_ReloadFrame:EnableMouse(true)
AbyssUI_ReloadFrame:SetFrameStrata("Dialog")
AbyssUI_ReloadFrame.text = AbyssUI_ReloadFrame.text or AbyssUI_ReloadFrame:CreateFontString(nil,"ARTWORK","QuestMapRewardsFont")
AbyssUI_ReloadFrame.text:SetScale(1.5)
AbyssUI_ReloadFrame.text:SetAllPoints(true)
AbyssUI_ReloadFrame.text:SetJustifyH("CENTER")
AbyssUI_ReloadFrame.text:SetJustifyV("CENTER")
AbyssUI_ReloadFrame.text:SetText("A reload is necessary so this configuration can be save!\nClick the |cffffcc00'Confirm'|r button to Reload.\nYou still can make changes (do before you confirm).")
----------------------------------------------------
local Border = AbyssUI_ReloadFrame:CreateTexture(nil,"BACKGROUND")
Border:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Border:SetPoint("TOPLEFT", -3, 3)
Border:SetPoint("BOTTOMRIGHT", 3, -3)
Border:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUI_ReloadFrame:CreateTexture(nil,"ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUI_ReloadFrame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUI_ReloadFrame:CreateTexture(nil,"BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUI_ReloadFrame)
AbyssUI_ReloadFrame.texture = Texture
----------------------------------------------------
local FrameButtonConfirm = CreateFrame("Button","FrameButton", AbyssUI_ReloadFrame, "UIPanelButtonTemplate")
FrameButtonConfirm:SetHeight(24)
FrameButtonConfirm:SetWidth(70)
FrameButtonConfirm:SetPoint("BOTTOM", AbyssUI_ReloadFrame, "BOTTOM", 0, 10)
FrameButtonConfirm:SetText("Confirm")
FrameButtonConfirm:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
----------------------------------------------------
local BorderButton = FrameButtonConfirm:CreateTexture(nil,"ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButtonConfirm)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)
FrameButtonConfirm:SetScript("OnClick", function()
	AbyssUI_ReloadFrame:Hide()
	ReloadUI()
end)
----------------------------------------------------

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
