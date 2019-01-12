--------------------------------------------------------------------------------
-- Author: Yugen
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

    -- Panel 04
    local Frame = CreateFrame("Frame","$parentFrameButtonPanel03", AbyssUI_Config.panel)
    Frame:SetPoint("CENTER", AbyssUI_Config.panel, "CENTER", -150, 0)
    Frame:SetWidth(120)
    Frame:SetHeight(24)
    Frame:SetScale(1.1)
    Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    Frame:SetPoint("CENTER")
    Frame:SetText("Player Portrait")

    -- Panel 05
    local Frame = CreateFrame("Frame","$parentFrameButtonPanel03", AbyssUI_Config.panel)
    Frame:SetPoint("CENTER", AbyssUI_Config.panel, "CENTER", 150, 0)
    Frame:SetWidth(120)
    Frame:SetHeight(24)
    Frame:SetScale(1.1)
    Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    Frame:SetPoint("CENTER")
    Frame:SetText("Frame Colorization")

    ------------------------------ Hide Elements  ------------------------------
    ---------------------
    -- MicroMenu/Bags  --
    ---------------------
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
    ---------------------
    -- Gryphons Option --
    ---------------------
    local Gryphons_CheckButton = CreateFrame("CheckButton", "$parentGryphons_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
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
    local Minimap_CheckButton = CreateFrame("CheckButton", "$parentMinimap_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
    Minimap_CheckButton:SetPoint("TOPLEFT", 10, -140)
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
    -----------------------
    -- Objective Tracker --
    -----------------------
    local ObjTracker_CheckButton = CreateFrame("CheckButton", "$parentObjTracker_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
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
   ------------------
   -- FPS/MS Frame --
   ------------------
   local FPSMSFrame_CheckButton = CreateFrame("CheckButton", "$parentFPSMSFrame_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
   FPSMSFrame_CheckButton:SetPoint("TOPLEFT", 10, -200)
   FPSMSFrame_CheckButton.Text:SetText("Hide FPS/MS Frame")
   FPSMSFrame_CheckButton.tooltip = "Hide the fps/ms frame (Bottom left frame)"
   FPSMSFrame_CheckButton:SetChecked(AbyssUIAddonSettings.HideFPSMSFrame)
   -- OnClick Function
   FPSMSFrame_CheckButton:SetScript("OnClick", function(self)
     AbyssUIAddonSettings.HideFPSMSFrame = self:GetChecked()
      if ( AbyssUIAddonSettings.HideFPSMSFrame == true ) then
        AbyssUI_StatsFrames1Hide()
      else
        AbyssUI_StatsFrames1Show()
      end
   end)
   -- After Login/Reload
   FPSMSFrame_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
   FPSMSFrame_CheckButton:SetScript("OnEvent", function(self, event, ...)
   if ( event == "PLAYER_ENTERING_WORLD" ) then
     if AbyssUIAddonSettings.HideFPSMSFrame == true then
       AbyssUI_StatsFrames1Hide()
     else
       AbyssUI_StatsFrames1Show()
     end
   end
 end)
 ----------------------------
 -- YouDied LevelUp Frame --
 ---------------------------
 local YouDiedLevelUpFrame_CheckButton = CreateFrame("CheckButton", "$parentYouDiedLevelUpFrame_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
 YouDiedLevelUpFrame_CheckButton:SetPoint("TOPLEFT", 10, -230)
 YouDiedLevelUpFrame_CheckButton.Text:SetText("Hide YouDied/LevelUp Frame")
 YouDiedLevelUpFrame_CheckButton.tooltip = "Hide the 'You Died' and 'Level Up' frame when you die/level in the game"
 YouDiedLevelUpFrame_CheckButton:SetChecked(AbyssUIAddonSettings.HideYouDiedLevelUpFrame)
 -- OnClick Function
 YouDiedLevelUpFrame_CheckButton:SetScript("OnClick", function(self)
   AbyssUIAddonSettings.HideYouDiedLevelUpFrame = self:GetChecked()
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
    local FrameButton = CreateFrame("Button","$parentExtraReloadInterfaceButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
    FrameButton:SetHeight(24)
    FrameButton:SetWidth(140)
    FrameButton:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 0, -130)
    FrameButton:SetText("Reload UI")
    FrameButton:SetScript("OnClick", function()
      ReloadUI()
    end)

------------------------------- Miscellaneous -------------------------------

    ------------------
    -- Camera Pitch --
    ------------------
    -- Camera Pitch Function Option 50%
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
    -- Camera Pitch Function Option 70%
    local CameraSmooth70_CheckButton = CreateFrame("CheckButton", "$parentCameraSmooth70_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
    CameraSmooth70_CheckButton:SetPoint("TOPRIGHT", -120, -110)
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
    local CameraSmooth90_CheckButton = CreateFrame("CheckButton", "$parentCameraSmooth90_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
    CameraSmooth90_CheckButton:SetPoint("TOPRIGHT", -120, -140)
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
    ----------------
    -- Action Cam --
    ----------------
    local AbyssUIActionCam_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIActionCam_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
    AbyssUIActionCam_CheckButton:SetPoint("TOPRIGHT", -120, -170)
    AbyssUIActionCam_CheckButton.Text:SetText("Combat Cursor\nMode")
    AbyssUIActionCam_CheckButton.tooltip = "Makes the camera turns with your mouse when in combat (right-click to show cursor)"
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
    ---------------------------
    -- Auto Repair/Sell Gray --
    ---------------------------
    local AbyssUIAutoSellGray_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIAutoSellGray_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
    AbyssUIAutoSellGray_CheckButton:SetPoint("TOPRIGHT", -120, -200)
    AbyssUIAutoSellGray_CheckButton.Text:SetText("Auto Repair\nSell Gray Itens")
    AbyssUIAutoSellGray_CheckButton.tooltip = "When you open a Merchant shop, auto sell gray and repair itens"
    AbyssUIAutoSellGray_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionSellGray)
    -- OnClick Function
    AbyssUIAutoSellGray_CheckButton:SetScript("OnClick", function(self)
      AbyssUIAddonSettings.ExtraFunctionSellGray = self:GetChecked()
    end)

  ---------------------------- AbyssUI Stylization ----------------------------

  ---------------------------
  -- Player Portrait Style --
  ---------------------------

  -- AbyssUIClassCircles01_CheckButton
  local AbyssUIClassCircles01_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles01_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles01_CheckButton:SetPoint("CENTER", -290, -20)
  AbyssUIClassCircles01_CheckButton.Text:SetText("Blizzard (Default)")
  AbyssUIClassCircles01_CheckButton.tooltip = "Blizzard Default UnitPlayerFrame (UnitFrame01)"
  AbyssUIClassCircles01_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles01)
  -- OnClick Function
  AbyssUIClassCircles01_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles02 ~= true and AbyssUIAddonSettings.UIClassCircles03 ~= true and AbyssUIAddonSettings.UIClassCircles04 ~= true and AbyssUIAddonSettings.UIClassCircles05 ~= true and AbyssUIAddonSettings.UIClassCircles06 ~= true and AbyssUIAddonSettings.UIClassCircles07 ~= true and AbyssUIAddonSettings.UIClassCircles08 ~= true then
      AbyssUIAddonSettings.UIClassCircles01 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIClassCircles01_CheckButton:SetChecked(nil)
    end
  end)

  -- AbyssUIClassCircles02_CheckButton
  local AbyssUIClassCircles02_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles02_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles02_CheckButton:SetPoint("CENTER", -290, -50)
  AbyssUIClassCircles02_CheckButton.Text:SetText("Dark")
  AbyssUIClassCircles02_CheckButton.tooltip = "A Dark UnitPlayerFrame (UnitFrame02)"
  AbyssUIClassCircles02_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles02)
  -- OnClick Function
  AbyssUIClassCircles02_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and AbyssUIAddonSettings.UIClassCircles03 ~= true and AbyssUIAddonSettings.UIClassCircles04 ~= true and AbyssUIAddonSettings.UIClassCircles05 ~= true and AbyssUIAddonSettings.UIClassCircles06 ~= true and AbyssUIAddonSettings.UIClassCircles07 ~= true and AbyssUIAddonSettings.UIClassCircles08 ~= true then
      AbyssUIAddonSettings.UIClassCircles02 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIClassCircles02_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles03_CheckButton
  local AbyssUIClassCircles03_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles03_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles03_CheckButton:SetPoint("CENTER", -290, -80)
  AbyssUIClassCircles03_CheckButton.Text:SetText("Dark Grey")
  AbyssUIClassCircles03_CheckButton.tooltip = "A Dark Grey UnitPlayerFrame (UnitFrame03)"
  AbyssUIClassCircles03_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles03)
  -- OnClick Function
  AbyssUIClassCircles03_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and AbyssUIAddonSettings.UIClassCircles02 ~= true and AbyssUIAddonSettings.UIClassCircles04 ~= true and AbyssUIAddonSettings.UIClassCircles05 ~= true and AbyssUIAddonSettings.UIClassCircles06 ~= true and AbyssUIAddonSettings.UIClassCircles07 ~= true and AbyssUIAddonSettings.UIClassCircles08 ~= true then
      AbyssUIAddonSettings.UIClassCircles03 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIClassCircles03_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles04_CheckButton
  local AbyssUIClassCircles04_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles04_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles04_CheckButton:SetPoint("CENTER", -290, -110)
  AbyssUIClassCircles04_CheckButton.Text:SetText("Dark(V2)")
  AbyssUIClassCircles04_CheckButton.tooltip = "Version 2 of the Dark UnitPlayerFrame (UnitFrame04)"
  AbyssUIClassCircles04_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles04)
  -- OnClick Function
  AbyssUIClassCircles04_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and AbyssUIAddonSettings.UIClassCircles02 ~= true and AbyssUIAddonSettings.UIClassCircles03 ~= true and AbyssUIAddonSettings.UIClassCircles05 ~= true and AbyssUIAddonSettings.UIClassCircles06 ~= true and AbyssUIAddonSettings.UIClassCircles07 ~= true and AbyssUIAddonSettings.UIClassCircles08 ~= true then
      AbyssUIAddonSettings.UIClassCircles04 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIClassCircles04_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles05_CheckButton
  local AbyssUIClassCircles05_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles05_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles05_CheckButton:SetPoint("CENTER", -120, -20)
  AbyssUIClassCircles05_CheckButton.Text:SetText("Dark(V2) Small")
  AbyssUIClassCircles05_CheckButton.tooltip = "Smaller version of the Dark(V2) UnitPlayerFrame (UnitFrame05)"
  AbyssUIClassCircles05_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles05)
  -- OnClick Function
  AbyssUIClassCircles05_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and AbyssUIAddonSettings.UIClassCircles02 ~= true and AbyssUIAddonSettings.UIClassCircles03 ~= true and AbyssUIAddonSettings.UIClassCircles04 ~= true and AbyssUIAddonSettings.UIClassCircles06 ~= true and AbyssUIAddonSettings.UIClassCircles07 ~= true and AbyssUIAddonSettings.UIClassCircles08 ~= true then
      AbyssUIAddonSettings.UIClassCircles05 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIClassCircles05_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles06_CheckButton
  local AbyssUIClassCircles06_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles06_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles06_CheckButton:SetPoint("CENTER", -120, -50)
  AbyssUIClassCircles06_CheckButton.Text:SetText("Light Grey")
  AbyssUIClassCircles06_CheckButton.tooltip = "A Light Grey UnitPlayerFrame (UnitFrame06)"
  AbyssUIClassCircles06_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles06)
  -- OnClick Function
  AbyssUIClassCircles06_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and AbyssUIAddonSettings.UIClassCircles02 ~= true and AbyssUIAddonSettings.UIClassCircles03 ~= true and AbyssUIAddonSettings.UIClassCircles04 ~= true and AbyssUIAddonSettings.UIClassCircles05 ~= true and AbyssUIAddonSettings.UIClassCircles07 ~= true and AbyssUIAddonSettings.UIClassCircles08 ~= true then
      AbyssUIAddonSettings.UIClassCircles06 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIClassCircles06_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles07_CheckButton
  local AbyssUIClassCircles07_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles07_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles07_CheckButton:SetPoint("CENTER", -120, -80)
  AbyssUIClassCircles07_CheckButton.Text:SetText("Medium Grey")
  AbyssUIClassCircles07_CheckButton.tooltip = "A Medium Grey UnitPlayerFrame (UnitFrame07)"
  AbyssUIClassCircles07_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles07)
  -- OnClick Function
  AbyssUIClassCircles07_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and AbyssUIAddonSettings.UIClassCircles02 ~= true and AbyssUIAddonSettings.UIClassCircles03 ~= true and AbyssUIAddonSettings.UIClassCircles04 ~= true and AbyssUIAddonSettings.UIClassCircles05 ~= true and AbyssUIAddonSettings.UIClassCircles06 ~= true and AbyssUIAddonSettings.UIClassCircles08 ~= true then
      AbyssUIAddonSettings.UIClassCircles07 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIClassCircles07_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIClassCircles08_CheckButton
  local AbyssUIClassCircles08_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles08_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles08_CheckButton:SetPoint("CENTER", -120, -110)
  AbyssUIClassCircles08_CheckButton.Text:SetText("Muted")
  AbyssUIClassCircles08_CheckButton.tooltip = "A Muted version of the AbyssUI UnitPlayerFrame (UnitFrame08)"
  AbyssUIClassCircles08_CheckButton:SetChecked(AbyssUIAddonSettings.UIClassCircles08)
  -- OnClick Function
  AbyssUIClassCircles08_CheckButton:SetScript("OnClick", function(self)
    if AbyssUIAddonSettings.UIClassCircles01 ~= true and AbyssUIAddonSettings.UIClassCircles02 ~= true and AbyssUIAddonSettings.UIClassCircles03 ~= true and AbyssUIAddonSettings.UIClassCircles04 ~= true and AbyssUIAddonSettings.UIClassCircles05 ~= true and AbyssUIAddonSettings.UIClassCircles06 ~= true and AbyssUIAddonSettings.UIClassCircles07 ~= true then
      AbyssUIAddonSettings.UIClassCircles08 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIClassCircles08_CheckButton:SetChecked(nil)
    end
  end)

  ------------------------
  -- Frame Colorization --
  ------------------------

  -- AbyssUIVertexColorFrames01_CheckButton
  local AbyssUIVertexColorFrames01_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames01_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames01_CheckButton:SetPoint("CENTER", 50, -20)
  AbyssUIVertexColorFrames01_CheckButton.Text:SetText("Blizzard (Default)")
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
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames01 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames01_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames02_CheckButton
  local AbyssUIVertexColorFrames02_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames02_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames02_CheckButton:SetPoint("CENTER", 220, -20)
  AbyssUIVertexColorFrames02_CheckButton.Text:SetText("Blackout")
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
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames02 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames02_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames03_CheckButton
  local AbyssUIVertexColorFrames03_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames03_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames03_CheckButton:SetPoint("CENTER", 50, -50)
  AbyssUIVertexColorFrames03_CheckButton.Text:SetText("Blood")
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
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames03 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames03_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames04_CheckButton
  local AbyssUIVertexColorFrames04_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames04_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames04_CheckButton:SetPoint("CENTER", 220, -50)
  AbyssUIVertexColorFrames04_CheckButton.Text:SetText("Gold")
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
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames04 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames04_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames05_CheckButton
  local AbyssUIVertexColorFrames05_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames05_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames05_CheckButton:SetPoint("CENTER", 50, -80)
  AbyssUIVertexColorFrames05_CheckButton.Text:SetText("Death Knight")
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
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames05 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames05_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames06_CheckButton
  local AbyssUIVertexColorFrames06_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames06_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames06_CheckButton:SetPoint("CENTER", 220, -80)
  AbyssUIVertexColorFrames06_CheckButton.Text:SetText("Demon\nHunter")
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
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames06 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames06_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames07_CheckButton
  local AbyssUIVertexColorFrames07_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames07_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames07_CheckButton:SetPoint("CENTER", 50, -110)
  AbyssUIVertexColorFrames07_CheckButton.Text:SetText("Druid")
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
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames07 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames07_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames08_CheckButton
  local AbyssUIVertexColorFrames08_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames08_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames08_CheckButton:SetPoint("CENTER", 220, -110)
  AbyssUIVertexColorFrames08_CheckButton.Text:SetText("Hunter")
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
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames08 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames08_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames09_CheckButton
  local AbyssUIVertexColorFrames09_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames09_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames09_CheckButton:SetPoint("CENTER", 50, -140)
  AbyssUIVertexColorFrames09_CheckButton.Text:SetText("Mage")
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
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames09 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames09_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames10_CheckButton
  local AbyssUIVertexColorFrames10_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames10_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames10_CheckButton:SetPoint("CENTER", 220, -140)
  AbyssUIVertexColorFrames10_CheckButton.Text:SetText("Monk")
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
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames10 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames10_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames11_CheckButton
  local AbyssUIVertexColorFrames11_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames11_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames11_CheckButton:SetPoint("CENTER", 50, -170)
  AbyssUIVertexColorFrames11_CheckButton.Text:SetText("Paladin")
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
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames11 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames11_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames12_CheckButton
  local AbyssUIVertexColorFrames12_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames12_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames12_CheckButton:SetPoint("CENTER", 220, -170)
  AbyssUIVertexColorFrames12_CheckButton.Text:SetText("Priest")
  AbyssUIVertexColorFrames12_CheckButton.tooltip = "Priest Class Frame Colorization (Same as Blizzard Default)"
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
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames12 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames12_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames13_CheckButton
  local AbyssUIVertexColorFrames13_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames13_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames13_CheckButton:SetPoint("CENTER", 50, -200)
  AbyssUIVertexColorFrames13_CheckButton.Text:SetText("Rogue")
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
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames13 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames13_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames14_CheckButton
  local AbyssUIVertexColorFrames14_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames14_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames14_CheckButton:SetPoint("CENTER", 220, -200)
  AbyssUIVertexColorFrames14_CheckButton.Text:SetText("Shaman")
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
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames14 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames14_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames15_CheckButton
  local AbyssUIVertexColorFrames15_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames15_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames15_CheckButton:SetPoint("CENTER", 50, -230)
  AbyssUIVertexColorFrames15_CheckButton.Text:SetText("Warlock")
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
    AbyssUIAddonSettings.UIVertexColorFrames16 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames15 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames15_CheckButton:SetChecked(nil)
    end
  end)
  -- AbyssUIVertexColorFrames16_CheckButton
  local AbyssUIVertexColorFrames16_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames16_CheckButton", AbyssUI_Config.panel, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames16_CheckButton:SetPoint("CENTER", 220, -230)
  AbyssUIVertexColorFrames16_CheckButton.Text:SetText("Warrior")
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
    AbyssUIAddonSettings.UIVertexColorFrames15 ~= true then
      AbyssUIAddonSettings.UIVertexColorFrames16 = self:GetChecked()
      AbyssUI_ReloadFrame:Show()
    else
      AbyssUIVertexColorFrames16_CheckButton:SetChecked(nil)
    end
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
