-- Author: Yugen
--
-- Battle for Azeroth
--
-- Hope you like my addOn ^^
--
-- Dark Minimalist UI for World of Warcraft
--
-- Thank you so much Fizzlemizz for helping me with this Panel
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

    --Child Panels
     AbyssUI_Config.childpanel1 = CreateFrame( "Frame", "$ConfigChild_HideElements", AbyssUI_Config.panel)
     AbyssUI_Config.childpanel1.name = "HideElements"
     AbyssUI_Config.childpanel1.parent = AbyssUI_Config.panel.name
     InterfaceOptions_AddCategory(AbyssUI_Config.childpanel1)

     AbyssUI_Config.childpanel2 = CreateFrame( "Frame", "$ConfigChild_PortraitColorization", AbyssUI_Config.panel)
     AbyssUI_Config.childpanel2.name = "Themes/Colorization"
     AbyssUI_Config.childpanel2.parent = AbyssUI_Config.panel.name
     InterfaceOptions_AddCategory(AbyssUI_Config.childpanel2)

     AbyssUI_Config.childpanel3 = CreateFrame( "Frame", "$ConfigChild_Miscellaneous", AbyssUI_Config.panel)
     AbyssUI_Config.childpanel3.name = "Miscellaneous"
     AbyssUI_Config.childpanel3.parent = AbyssUI_Config.panel.name
     InterfaceOptions_AddCategory(AbyssUI_Config.childpanel3)


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
    Frame:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 0, -80)
    Frame:SetHeight(24)
    Frame:SetWidth(200)
    Frame:SetScale(1.1)
    Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    Frame:SetPoint("CENTER")
    Frame:SetText("Thanks for using Abyss|cff0d75d4UI|r.\nIf you liked, share with your friends, or make a donation. Helps a lot!\nThis is a Minimalist UI that make changes directly to the WoW frames,\n using almost nothing more than the Blizzard use of CPU/RAM.\n\nCheck the options by clicking in the (+) button")

    -- Panel 01
    local Frame = CreateFrame("Frame","$parentFrameButtonPanel01", AbyssUI_Config.childpanel1)
    Frame:SetPoint("CENTER", AbyssUI_Config.childpanel1, "TOP", 0, -20)
    Frame:SetWidth(120)
    Frame:SetHeight(24)
    Frame:SetScale(1.5)
    Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    Frame:SetPoint("CENTER")
    Frame:SetText("Hide Elements")

    -- Panel 02 (old)

    -- Panel 03
    local Frame = CreateFrame("Frame","$parentFrameButtonPanel03", AbyssUI_Config.childpanel3)
    Frame:SetPoint("CENTER", AbyssUI_Config.childpanel3, "TOP", 0, -20)
    Frame:SetWidth(120)
    Frame:SetHeight(24)
    Frame:SetScale(1.5)
    Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    Frame:SetPoint("CENTER")
    Frame:SetText("Miscellaneous")

    -- Panel 04
    local Frame = CreateFrame("Frame","$parentFrameButtonPanel03", AbyssUI_Config.childpanel2)
    Frame:SetPoint("CENTER", AbyssUI_Config.childpanel2, "TOP", -150, -20)
    Frame:SetWidth(120)
    Frame:SetHeight(24)
    Frame:SetScale(1.5)
    Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    Frame:SetPoint("CENTER")
    Frame:SetText("Player Portrait")

    -- Panel 05
    local Frame = CreateFrame("Frame","$parentFrameButtonPanel03", AbyssUI_Config.childpanel2)
    Frame:SetPoint("CENTER", AbyssUI_Config.childpanel2, "TOP", 150, -20)
    Frame:SetWidth(120)
    Frame:SetHeight(24)
    Frame:SetScale(1.5)
    Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    Frame:SetPoint("CENTER")
    Frame:SetText("Frame Colorization")

    -- Panel 06
    local Frame = CreateFrame("Frame","$parentFrameButtonPanel03", AbyssUI_Config.childpanel2)
    Frame:SetPoint("CENTER", AbyssUI_Config.childpanel2, "CENTER", -160, -20)
    Frame:SetWidth(120)
    Frame:SetHeight(24)
    Frame:SetScale(1.5)
    Frame = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    Frame:SetPoint("CENTER")
    Frame:SetText("Extras")

    ------------------------------ Hide Elements  ------------------------------
    ---------------------
    -- MicroMenu/Bags  --
    ---------------------
    local MicroMenu_CheckButton = CreateFrame("CheckButton", "$parentMicroMenu_CheckButton", AbyssUI_Config.childpanel1, "ChatConfigCheckButtonTemplate")
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
    local Gryphons_CheckButton = CreateFrame("CheckButton", "$parentGryphons_CheckButton", AbyssUI_Config.childpanel1, "ChatConfigCheckButtonTemplate")
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
    local Minimap_CheckButton = CreateFrame("CheckButton", "$parentMinimap_CheckButton", AbyssUI_Config.childpanel1, "ChatConfigCheckButtonTemplate")
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
    local ObjTracker_CheckButton = CreateFrame("CheckButton", "$parentObjTracker_CheckButton", AbyssUI_Config.childpanel1, "ChatConfigCheckButtonTemplate")
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
   local FPSMSFrame_CheckButton = CreateFrame("CheckButton", "$parentFPSMSFrame_CheckButton", AbyssUI_Config.childpanel1, "ChatConfigCheckButtonTemplate")
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
 local YouDiedLevelUpFrame_CheckButton = CreateFrame("CheckButton", "$parentYouDiedLevelUpFrame_CheckButton", AbyssUI_Config.childpanel1, "ChatConfigCheckButtonTemplate")
 YouDiedLevelUpFrame_CheckButton:SetPoint("TOPLEFT", 10, -230)
 YouDiedLevelUpFrame_CheckButton.Text:SetText("Hide YouDied/LevelUp Frame")
 YouDiedLevelUpFrame_CheckButton.tooltip = "Hide the 'You Died' and 'Level Up' frame when you die/level in the game"
 YouDiedLevelUpFrame_CheckButton:SetChecked(AbyssUIAddonSettings.HideYouDiedLevelUpFrame)
 -- OnClick Function
 YouDiedLevelUpFrame_CheckButton:SetScript("OnClick", function(self)
   AbyssUIAddonSettings.HideYouDiedLevelUpFrame = self:GetChecked()
 end)
 -----------------------
 -- Hide Macro Labels --
 -----------------------
 local HideMacroLabels_CheckButton = CreateFrame("CheckButton", "$parentHideMacroLabels_CheckButton", AbyssUI_Config.childpanel1, "ChatConfigCheckButtonTemplate")
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
------------------
-- Hide Hotkeys --
------------------
local HideHotkeysLabels_CheckButton = CreateFrame("CheckButton", "$parentHideHotkeysLabels_CheckButton", AbyssUI_Config.childpanel1, "ChatConfigCheckButtonTemplate")
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
----------------------------------- Extras  -----------------------------------
 -------------------------
 -- Keep UnitFrame Dark --
 -------------------------
 local KeepUnitDark_CheckButton = CreateFrame("CheckButton", "$parentKeepUnitDark_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
 KeepUnitDark_CheckButton:SetPoint("CENTER", -290, -80)
 KeepUnitDark_CheckButton.Text:SetText("Keep UnitFrame Dark")
 KeepUnitDark_CheckButton.tooltip = "Even if you change theme, this will keep Unit Frames Dark (Player Frame, Target Frame, Boss, etc...)."
 KeepUnitDark_CheckButton:SetChecked(AbyssUIAddonSettings.KeepUnitDark)
 -- OnClick Function
 KeepUnitDark_CheckButton:SetScript("OnClick", function(self)
   AbyssUIAddonSettings.KeepUnitDark = self:GetChecked()
   AbyssUI_ReloadFrame:Show()
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

--------------------------------- Buttons ---------------------------------

    -----------------------
    -- AbyssUI DailyInfo --
    -----------------------
    local FrameButton = CreateFrame("Button","$parentExtraDailyInfoButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
    FrameButton:SetHeight(24)
    FrameButton:SetWidth(140)
    FrameButton:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", -200, -200)
    FrameButton:SetText("AbyssUI DailyInfo")
    FrameButton:SetScript("OnClick", function()
      C_WowTokenPublic.UpdateMarketPrice()
      AbyssUIDailyInfo()
    end)
    ----------------------
    -- Clear Action Bar --
    ----------------------
    local FrameButton = CreateFrame("Button","$parentExtraReloadInterfaceButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
    FrameButton:SetHeight(24)
    FrameButton:SetWidth(140)
    FrameButton:SetPoint("CENTER",  AbyssUI_Config.panel, "TOP", 0, -200)
    FrameButton:SetText("Clear Action Bar")
    FrameButton:SetScript("OnClick", function()
      AbyssUI_ActionBarCleaner:Show()
    end)
    ------------
    -- Reload --
    ------------
    local FrameButton = CreateFrame("Button","$parentExtraReloadInterfaceButton", AbyssUI_Config.panel, "UIPanelButtonTemplate")
    FrameButton:SetHeight(24)
    FrameButton:SetWidth(140)
    FrameButton:SetPoint("CENTER", AbyssUI_Config.panel, "TOP", 200, -200)
    FrameButton:SetText("Reload UI")
    FrameButton:SetScript("OnClick", function()
      ReloadUI()
    end)

------------------------------- Miscellaneous -------------------------------

    ------------------
    -- Camera Pitch --
    ------------------
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
    ----------------
    -- Action Cam --
    ----------------
    local AbyssUIActionCam_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIActionCam_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
    AbyssUIActionCam_CheckButton:SetPoint("TOPLEFT", 180, -80)
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
    local AbyssUIAutoSellGray_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIAutoSellGray_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
    AbyssUIAutoSellGray_CheckButton:SetPoint("TOPLEFT", 180, -110)
    AbyssUIAutoSellGray_CheckButton.Text:SetText("Auto Repair\nSell Gray Itens")
    AbyssUIAutoSellGray_CheckButton.tooltip = "When you open a Merchant shop, auto sell gray and repair itens"
    AbyssUIAutoSellGray_CheckButton:SetChecked(AbyssUIAddonSettings.ExtraFunctionSellGray)
    -- OnClick Function
    AbyssUIAutoSellGray_CheckButton:SetScript("OnClick", function(self)
      AbyssUIAddonSettings.ExtraFunctionSellGray = self:GetChecked()
    end)
    --------------------------------------
    -- Stack Action Bar (3rd ActionBar) --
    --------------------------------------
    local AbyssUINewActionBar_CheckButton = CreateFrame("CheckButton", "$parentAbyssUINewActionBar_CheckButton", AbyssUI_Config.childpanel3, "ChatConfigCheckButtonTemplate")
    AbyssUINewActionBar_CheckButton:SetPoint("TOPLEFT", 180, -140)
    AbyssUINewActionBar_CheckButton.Text:SetText("3rd ActionBar (Beta)")
    AbyssUINewActionBar_CheckButton.tooltip = "This add a third bar for the small version of Blizard Main Bar"
    AbyssUINewActionBar_CheckButton:SetChecked(AbyssUIAddonSettings.AbyssUI_ActionRight)
    -- Main Function and Button
    local function AbyssUI_AddactionBar()
           for i = 2, 12 do
               local n = "MultiBarRightButton"
               local btn = _G[n..i]
               btn:ClearAllPoints()
               btn:SetPoint("LEFT", n..i - 1, "RIGHT", 6, 0)
           end
           MultiBarRight:ClearAllPoints()
           MultiBarRight:SetPoint("TOPLEFT", MainMenuBar, "BOTTOMLEFT", 5, 140)
           MultiBarRight:SetScale(1)
       end
    -- OnClick Function
    AbyssUINewActionBar_CheckButton:SetScript("OnClick", function(self)
      AbyssUIAddonSettings.AbyssUI_ActionRight = self:GetChecked()
      AbyssUI_AddactionBar()
      AbyssUI_ActionBarInfo:Show()
      end)
      -- After Login/Reload
    AbyssUINewActionBar_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
    AbyssUINewActionBar_CheckButton:SetScript("OnEvent", function(self, event, ...)
      if ( event == "PLAYER_ENTERING_WORLD" ) then
        if AbyssUIAddonSettings.AbyssUI_ActionRight == true then
          C_Timer.After(0.5, function()
            AbyssUI_AddactionBar()
          end)
        end
      end
    end)
  ---------------------------- AbyssUI Stylization ----------------------------
  ---------------------------
  -- Player Portrait Style --
  ---------------------------
  -- AbyssUIClassCircles01_CheckButton
  local AbyssUIClassCircles01_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles01_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles01_CheckButton:SetPoint("TOPLEFT", 10, -80)
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
  local AbyssUIClassCircles02_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles02_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles02_CheckButton:SetPoint("TOPLEFT", 10, -110)
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
  local AbyssUIClassCircles03_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles03_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles03_CheckButton:SetPoint("TOPLEFT", 10, -140)
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
  local AbyssUIClassCircles04_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles04_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles04_CheckButton:SetPoint("TOPLEFT", 10, -170)
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
  local AbyssUIClassCircles05_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles05_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles05_CheckButton:SetPoint("TOPLEFT", 180 , -80)
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
  local AbyssUIClassCircles06_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles06_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles06_CheckButton:SetPoint("TOPLEFT", 180, -110)
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
  local AbyssUIClassCircles07_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles07_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles07_CheckButton:SetPoint("TOPLEFT", 180, -140)
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
  local AbyssUIClassCircles08_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIClassCircles08_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIClassCircles08_CheckButton:SetPoint("TOPLEFT", 180, -170)
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
  local AbyssUIVertexColorFrames01_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames01_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames01_CheckButton:SetPoint("TOPRIGHT", -220, -80)
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
  local AbyssUIVertexColorFrames02_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames02_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames02_CheckButton:SetPoint("TOPRIGHT", -50, -80)
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
  local AbyssUIVertexColorFrames03_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames03_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames03_CheckButton:SetPoint("TOPRIGHT", -220, -110)
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
  local AbyssUIVertexColorFrames04_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames04_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames04_CheckButton:SetPoint("TOPRIGHT", -50, -110)
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
  local AbyssUIVertexColorFrames05_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames05_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames05_CheckButton:SetPoint("TOPRIGHT", -220, -140)
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
  local AbyssUIVertexColorFrames06_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames06_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames06_CheckButton:SetPoint("TOPRIGHT", -50, -140)
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
  local AbyssUIVertexColorFrames07_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames07_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames07_CheckButton:SetPoint("TOPRIGHT", -220, -170)
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
  local AbyssUIVertexColorFrames08_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames08_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames08_CheckButton:SetPoint("TOPRIGHT", -50, -170)
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
  local AbyssUIVertexColorFrames09_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames09_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames09_CheckButton:SetPoint("TOPRIGHT", -220, -200)
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
  local AbyssUIVertexColorFrames10_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames10_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames10_CheckButton:SetPoint("TOPRIGHT", -50, -200)
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
  local AbyssUIVertexColorFrames11_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames11_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames11_CheckButton:SetPoint("TOPRIGHT", -220, -230)
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
  local AbyssUIVertexColorFrames12_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames12_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames12_CheckButton:SetPoint("TOPRIGHT", -50, -230)
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
  local AbyssUIVertexColorFrames13_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames13_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames13_CheckButton:SetPoint("TOPRIGHT", -220, -260)
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
  local AbyssUIVertexColorFrames14_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames14_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames14_CheckButton:SetPoint("TOPRIGHT", -50, -260)
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
  local AbyssUIVertexColorFrames15_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames15_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames15_CheckButton:SetPoint("TOPRIGHT", -220, -290)
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
  local AbyssUIVertexColorFrames16_CheckButton = CreateFrame("CheckButton", "$parentAbyssUIVertexColorFrames16_CheckButton", AbyssUI_Config.childpanel2, "ChatConfigCheckButtonTemplate")
  AbyssUIVertexColorFrames16_CheckButton:SetPoint("TOPRIGHT", -50, -290)
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
