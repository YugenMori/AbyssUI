-- Author: Yugen
--
-- Supports any version of wow
--
-- NewUI (dragonflight+) module for AbyssUI
--------------------------------------------------------------
-- Init - Tables - Saves
local addonName, addonTable = ...
local GetWoWVersion = ((select(4, GetBuildInfo())))
local L = LibStub("AceLocale-3.0"):GetLocale("AbyssUI")
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
local function AbyssUI_Fontification(globalFont, subFont, damageFont, oldglobalFont)
local locale = GetLocale()
local fontName, fontHeight, fontFlags = MinimapZoneText:GetFont()
local mediaFolder = "Interface\\AddOns\\AbyssUI\\Textures\\font\\"
  if ( locale == "zhCN") then
    globalFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    subFont   = mediaFolder.."zhCN-TW\\senty.ttf"
    damageFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    oldglobalFont = mediaFolder.."zhCN-TW\\senty.ttf"
  elseif ( locale == "zhTW" ) then
    globalFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    subFont   = mediaFolder.."zhCN-TW\\senty.ttf"
    damageFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    oldglobalFont = mediaFolder.."zhCN-TW\\senty.ttf"
  elseif ( locale == "ruRU" ) then
    globalFont  = mediaFolder.."ruRU\\dejavu.ttf"
    subFont   = mediaFolder.."ruRU\\dejavu.ttf"
    damageFont  = mediaFolder.."ruRU\\dejavu.ttf"
    oldglobalFont = mediaFolder.."ruRU\\dejavu.ttf"
  elseif ( locale == "koKR" ) then
    globalFont  = mediaFolder.."koKR\\dxlbab.ttf"
    subFont   = mediaFolder.."koKR\\dxlbab.ttf"
    damageFont  = mediaFolder.."koKR\\dxlbab.ttf"
    oldglobalFont = mediaFolder.."koKR\\dxlbab.ttf"
  elseif ( locale == "frFR" or locale == "deDE" or locale == "enGB" or locale == "enUS" or locale == "itIT" or
    locale == "esES" or locale == "esMX" or locale == "ptBR") then
    globalFont  = mediaFolder.."global.ttf"
    subFont   = mediaFolder.."npcfont.ttf"
    damageFont  = mediaFolder.."damagefont.ttf"
    oldglobalFont = mediaFolder .. "damagefont_classic.ttf"
  else
    globalFont  = fontName
    subFont   = fontName
    damageFont  = fontName
    oldglobalFont = fontName
  end
  return globalFont, subFont, damageFont, oldglobalFont
end
-- declarations
local globalFont, subFont, damageFont, oldglobalFont = AbyssUI_Fontification(globalFont, subFont, damageFont, oldglobalFont)
local function AbyssUI_ColorizationFrameFunction(...)
    local v = ...
    if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
        v:SetVertexColor(1, 1, 1)
    elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
        v:SetVertexColor(.2, .2, .2)
    elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
        v:SetVertexColor(182/255, 42/255, 37/255)
    elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
        v:SetVertexColor(236/255, 193/255, 60/255)
    elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
        v:SetVertexColor(196/255, 31/255, 59/255)
    elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
        v:SetVertexColor(163/255, 48/255, 201/255)
    elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
        v:SetVertexColor(252/255, 163/255, 85/255)
    elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
        v:SetVertexColor(190/255, 221/255, 115/255)
    elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
        v:SetVertexColor(64/255, 220/255, 255/255)
    elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
        v:SetVertexColor(86/255, 255/255, 184/255)
    elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
        v:SetVertexColor(255/255, 155/255, 195/255)
    elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
        v:SetVertexColor(23/255, 28/255, 99/255)
    elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
        v:SetVertexColor(255/255, 255/255, 0/255)
    elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
        v:SetVertexColor(0/255, 112/255, 222/255)
    elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
        v:SetVertexColor(135/255, 135/255, 237/255)
    elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
        v:SetVertexColor(199/255, 156/255, 110/255)
    elseif AbyssUIAddonSettings.UIVertexColorFrames17 == true then
        v:SetVertexColor(51/255, 147/255, 127/255)
    elseif AbyssUIAddonSettings.UIVertexColorFramesColorPicker == true then
        local character = UnitName("player").."-"..GetRealmName()
        v:SetVertexColor(COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b)    
    else
        v:SetVertexColor(.4, .4, .4)
    end
end
--------------------------------------------------------------
-- UnitColor
local function UnitColor(unit)
  local r, g, b, a
  --if (not InCombatLockdown()) then
    --if ((not UnitIsPlayer(unit)) and ((not UnitIsConnected(unit)) or (UnitIsDeadOrGhost(unit)))) then -- removed "and ((not UnitIsConnected(unit))" since it's different in dragonflight
      -- Turn it Gray
      --r, g, b, a = 0.5, 0.5, 0.5, 1
    if (UnitIsPlayer(unit)) then
      --Try to color it by class.
      local localizedClass, englishClass = UnitClass(unit)
      local classColor = RAID_CLASS_COLORS[englishClass]
      if (classColor and not AbyssUIAddonSettings.GreenHealth) then
        r, g, b, a = classColor.r, classColor.g, classColor.b, classColor.a
      else
        if (UnitIsFriend("player", unit)) then
          r, g, b, a = 0.0, 1.0, 0.0, 1
        else
          r, g, b, a = 1.0, 0.0, 0.0, 1
        end
      end
    else
      if (unit ~= nil) then
        r, g, b, a = UnitSelectionColor(unit)
      end
    end
  --end
  return r, g, b, a
end
---------------------------- NewUI Functions ----------------------------------
local function AbyssUI_TooltipSetUnit()
  if AbyssUIAddonSettings.DefaultTooltipColor ~= true then
    -- OnTooltipSetUnit
    local _, unit = GameTooltip:GetUnit()
    if  UnitIsPlayer(unit) then
      local _, class = UnitClass(unit)
      local color = class and (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
      if (color ~= nil) then
        local text  = GameTooltipTextLeft1:GetText()
        local text2 = GameTooltipTextLeft2:GetText()
        local text3 = GameTooltipTextLeft3:GetText()
        local text4 = GameTooltipTextLeft4:GetText()
        local englishFaction, localizedFaction = UnitFactionGroup(unit)
        if (text ~= nil and text2 ~= nil) then
          GameTooltipTextLeft1:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text:match("|cff\x\x\x\x\x\x(.+)|r") or text)
          GameTooltipTextLeft2:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text2:match("|cff\x\x\x\x\x\x(.+)|r") or text2)
        end
        if (text ~= nil and text2 ~= nil and text3 ~= nil) then
          GameTooltipTextLeft3:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text3:match("|cff\x\x\x\x\x\x(.+)|r") or text3)
        end
        if (text ~= nil and text2 ~= nil and text3 ~= nil and text4 ~= nil) then
          GameTooltipTextLeft4:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text4:match("|cff\x\x\x\x\x\x(.+)|r") or text4)
        end
        if (text ~= nil and text2 ~= nil and text3 ~= nil and text4 ~= nil) then
          local text5 = GameTooltipTextLeft5:GetText()
          if (text5 ~= nil) then
            GameTooltipTextLeft5:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text5:match("|cff\x\x\x\x\x\x(.+)|r") or text5)
          end
        end
        if (text ~= nil and text2 ~= nil and text3 ~= nil and text4 ~= nil and text5 ~= nil) then
          local text6 = GameTooltipTextLeft6:GetText()
          if (text6 ~= nil) then
            GameTooltipTextLeft6:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text6:match("|cff\x\x\x\x\x\x(.+)|r") or text6)
          end
        end
      end
    end
  end
end
-- Tooltip Class Color and extras 
if (GetWoWVersion >= 90500) then
  GameTooltip:HookScript("OnUpdate", function(self, elapsed)
    -- Call AbyssUI_TooltipSetUnit() every 0.5 seconds
    if not self.lastUpdate or self.lastUpdate < GetTime() - 0.1 then
      AbyssUI_TooltipSetUnit()
      self.lastUpdate = GetTime()
    end
  end)
end
---------------------------- NewUI Frames ----------------------------------
local ClassicFrames = CreateFrame("Frame")
ClassicFrames:RegisterEvent("ADDON_LOADED")
ClassicFrames:SetScript("OnEvent", function(self, event, addon)
    if (addon == "AbyssUI") then
        if GetWoWVersion >= 90500 then
            -- General
            for i, v in pairs({ 
                PlayerFrame.PlayerFrameContainer.FrameTexture,
                PlayerFrame.PlayerFrameContainer.AlternatePowerFrameTexture,
                TargetFrame.TargetFrameContainer.FrameTexture,
                FocusFrame.TargetFrameContainer.FrameTexture,
                TargetFrameToT.FrameTexture,
                PlayerFrameAlternateManaBarBorder,
                PlayerFrameAlternateManaBarLeftBorder,
                PlayerFrameAlternateManaBarRightBorder,
                MinimapCompassTexture,
             }) do
                if AbyssUIAddonSettings ~= nil then
                    AbyssUI_ColorizationFrameFunction(v)
                end
            end
             -- SettingsPanel
            for i, v in pairs({ 
                SettingsPanel.NineSlice.RightEdge,
                SettingsPanel.NineSlice.LeftEdge,
                SettingsPanel.NineSlice.TopEdge,
                SettingsPanel.NineSlice.BottomEdge,
                SettingsPanel.NineSlice.PortraitFrame,
                SettingsPanel.NineSlice.TopRightCorner,
                SettingsPanel.NineSlice.TopLeftCorner,
                SettingsPanel.NineSlice.BottomLeftCorner,
                SettingsPanel.NineSlice.BottomRightCorner,
             }) do
                if AbyssUIAddonSettings ~= nil then
                    AbyssUI_ColorizationFrameFunction(v)
                end
            end
            -- HelpFrame
            for i, v in pairs({ 
                HelpFrame.NineSlice.RightEdge,
                HelpFrame.NineSlice.LeftEdge,
                HelpFrame.NineSlice.TopEdge,
                HelpFrame.NineSlice.BottomEdge,
                HelpFrame.NineSlice.PortraitFrame,
                HelpFrame.NineSlice.TopRightCorner,
                HelpFrame.NineSlice.TopLeftCorner,
                HelpFrame.NineSlice.BottomLeftCorner,
                HelpFrame.NineSlice.BottomRightCorner,
             }) do
                if AbyssUIAddonSettings ~= nil then
                    AbyssUI_ColorizationFrameFunction(v)
                end
            end
            -- Action Bar
            for i, v in pairs({ 
                MainMenuBar.EndCaps.RightEndCap,
                MainMenuBar.EndCaps.LeftEndCap,
                MainStatusTrackingBarContainer.BarFrameTexture,
                MainMenuBar.BorderArt,
                ActionButton1NormalTexture,
                ActionButton2NormalTexture,
                ActionButton3NormalTexture,
                ActionButton4NormalTexture,
                ActionButton5NormalTexture,
                ActionButton6NormalTexture,
                ActionButton7NormalTexture,
                ActionButton8NormalTexture,
                ActionButton9NormalTexture,
                ActionButton10NormalTexture,
                ActionButton11NormalTexture,
                ActionButton12NormalTexture,
                ActionButton1.RightDivider,
                ActionButton2.RightDivider,
                ActionButton3.RightDivider,
                ActionButton4.RightDivider,
                ActionButton5.RightDivider,
                ActionButton6.RightDivider,
                ActionButton7.RightDivider,
                ActionButton8.RightDivider,
                ActionButton9.RightDivider,
                ActionButton10.RightDivider,
                ActionButton11.RightDivider,
                MultiBarLeftButton1NormalTexture,
                MultiBarLeftButton2NormalTexture,
                MultiBarLeftButton3NormalTexture,
                MultiBarLeftButton4NormalTexture,
                MultiBarLeftButton5NormalTexture,
                MultiBarLeftButton6NormalTexture,
                MultiBarLeftButton7NormalTexture,
                MultiBarLeftButton8NormalTexture,
                MultiBarLeftButton9NormalTexture,
                MultiBarLeftButton10NormalTexture,
                MultiBarLeftButton11NormalTexture,
                MultiBarLeftButton12NormalTexture,
                MultiBarRightButton1NormalTexture,
                MultiBarRightButton2NormalTexture,
                MultiBarRightButton3NormalTexture,
                MultiBarRightButton4NormalTexture,
                MultiBarRightButton5NormalTexture,
                MultiBarRightButton6NormalTexture,
                MultiBarRightButton7NormalTexture,
                MultiBarRightButton8NormalTexture,
                MultiBarRightButton9NormalTexture,
                MultiBarRightButton10NormalTexture,
                MultiBarRightButton11NormalTexture,
                MultiBarRightButton12NormalTexture,
                MultiBarBottomLeftButton1NormalTexture,
                MultiBarBottomLeftButton2NormalTexture,
                MultiBarBottomLeftButton3NormalTexture,
                MultiBarBottomLeftButton4NormalTexture,
                MultiBarBottomLeftButton5NormalTexture,
                MultiBarBottomLeftButton6NormalTexture,
                MultiBarBottomLeftButton7NormalTexture,
                MultiBarBottomLeftButton8NormalTexture,
                MultiBarBottomLeftButton9NormalTexture,
                MultiBarBottomLeftButton10NormalTexture,
                MultiBarBottomLeftButton11NormalTexture,
                MultiBarBottomLeftButton12NormalTexture,
                MultiBarBottomRightButton1NormalTexture,
                MultiBarBottomRightButton2NormalTexture,
                MultiBarBottomRightButton3NormalTexture,
                MultiBarBottomRightButton4NormalTexture,
                MultiBarBottomRightButton5NormalTexture,
                MultiBarBottomRightButton6NormalTexture,
                MultiBarBottomRightButton7NormalTexture,
                MultiBarBottomRightButton8NormalTexture,
                MultiBarBottomRightButton9NormalTexture,
                MultiBarBottomRightButton10NormalTexture,
                MultiBarBottomRightButton11NormalTexture,
                MultiBarBottomRightButton12NormalTexture,
             }) do
                if AbyssUIAddonSettings ~= nil then
                    AbyssUI_ColorizationFrameFunction(v)
                end
            end
            -- Bags
            for i, v in pairs({ 
                ContainerFrame1.NineSlice,
                ContainerFrame2.NineSlice,
                ContainerFrame3.NineSlice,
                ContainerFrame4.NineSlice,
                ContainerFrame5.NineSlice,
                ContainerFrame6.NineSlice,
                ContainerFrame7.NineSlice,
                ContainerFrame8.NineSlice,
                ContainerFrame9.NineSlice,
                ContainerFrame10.NineSlice,
                ContainerFrame11.NineSlice,
                ContainerFrame12.NineSlice,
                ContainerFrame13.NineSlice,
                ContainerFrameCombinedBags.NineSlice,
             }) do
                if AbyssUIAddonSettings ~= nil then
                    AbyssUI_ColorizationFrameFunction(v)
                end
            end
            -- StatusTrackingBarManager
            for i, v in pairs({ 
                StatusTrackingBarManager.BottomBarFrameTexture,
                StatusTrackingBarManager.TopBarFrameTexture,
             }) do
                if AbyssUIAddonSettings ~= nil then
                    AbyssUI_ColorizationFrameFunction(v)
                end
            end
       -- End
        else
            return nil
        end
    end     
end)
---------------------------- NewUI Functions ----------------------------------
-- ClassTalentFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
  if name == "Blizzard_ClassTalentUI" and GetWoWVersion >= 90500 then
    for i, v in pairs({ 
      ClassTalentFrame.NineSlice.RightEdge,
      ClassTalentFrame.NineSlice.LeftEdge,
      ClassTalentFrame.NineSlice.TopEdge,
      ClassTalentFrame.NineSlice.BottomEdge,
      ClassTalentFrame.NineSlice.PortraitFrame,
      ClassTalentFrame.NineSlice.TopRightCorner,
      ClassTalentFrame.NineSlice.TopLeftCorner,
      ClassTalentFrame.NineSlice.BottomLeftCorner,
      ClassTalentFrame.NineSlice.BottomRightCorner,
     }) do
      if AbyssUIAddonSettings ~= nil then
        AbyssUI_ColorizationFrameFunction(v)
      end
    end
  end
end)
-- CharacterMainHandSlot
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion >= 100000 then
    self:UnregisterAllEvents()
    local ChildRegions = { CharacterMainHandSlot:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
-- CharacterSecondaryHandSlot
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion >= 100000 then
    self:UnregisterAllEvents()
    local ChildRegions = { CharacterSecondaryHandSlot:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
-- PlayerSpellsFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
  if name == "Blizzard_PlayerSpells" and GetWoWVersion >= 10500 then
    for i, v in pairs({ 
                PlayerSpellsFrame.NineSlice.TopEdge,
                PlayerSpellsFrame.NineSlice.RightEdge,
                PlayerSpellsFrame.NineSlice.LeftEdge,
                PlayerSpellsFrame.NineSlice.TopEdge,
                PlayerSpellsFrame.NineSlice.BottomEdge,
                PlayerSpellsFrame.NineSlice.PortraitFrame,
                PlayerSpellsFrame.NineSlice.TopRightCorner,
                PlayerSpellsFrame.NineSlice.TopLeftCorner,
                PlayerSpellsFrame.NineSlice.BottomLeftCorner,
                PlayerSpellsFrame.NineSlice.BottomRightCorner,
     }) do
      if AbyssUIAddonSettings ~= nil then
        AbyssUI_ColorizationFrameFunction(v)
      end
    end
  end
end)
-- ProfessionsFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
  if name == "Blizzard_Professions" and GetWoWVersion >= 90500 then
    for i, v in pairs({ 
        ProfessionsFrame.NineSlice.TopEdge,
        ProfessionsFrame.NineSlice.RightEdge,
        ProfessionsFrame.NineSlice.BottomEdge,
        ProfessionsFrame.NineSlice.LeftEdge,
        ProfessionsFrame.NineSlice.TopRightCorner,
        ProfessionsFrame.NineSlice.TopLeftCorner,
        ProfessionsFrame.NineSlice.BottomLeftCorner,
        ProfessionsFrame.NineSlice.BottomRightCorner,
        ProfessionsFrame.CraftingPage.RankBar.Border,
        ProfessionsFrame.CraftingPage.SchematicForm.OutputIcon.IconBorder,
        DropDownList1MenuBackdrop.NineSlice.TopEdge,
        DropDownList1MenuBackdrop.NineSlice.RightEdge,
        DropDownList1MenuBackdrop.NineSlice.BottomEdge,
        DropDownList1MenuBackdrop.NineSlice.LeftEdge,
        DropDownList1MenuBackdrop.NineSlice.TopRightCorner,
        DropDownList1MenuBackdrop.NineSlice.TopLeftCorner,
        DropDownList1MenuBackdrop.NineSlice.BottomLeftCorner,
        DropDownList1MenuBackdrop.NineSlice.BottomRightCorner,
        DropDownList2MenuBackdrop.NineSlice.TopEdge,
        DropDownList2MenuBackdrop.NineSlice.RightEdge,
        DropDownList2MenuBackdrop.NineSlice.BottomEdge,
        DropDownList2MenuBackdrop.NineSlice.LeftEdge,
        DropDownList2MenuBackdrop.NineSlice.TopRightCorner,
        DropDownList2MenuBackdrop.NineSlice.TopLeftCorner,
        DropDownList2MenuBackdrop.NineSlice.BottomLeftCorner,
    DropDownList2MenuBackdrop.NineSlice.BottomRightCorner,
     }) do
      if AbyssUIAddonSettings ~= nil then
        AbyssUI_ColorizationFrameFunction(v)
      end
    end
  end
end)
---------------------------- NewUI Health Bar Color ----------------------------------
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event)
  if (GetWoWVersion >= 90500) then
    local TEXTURE = "Interface\\AddOns\\AbyssUI\\textures\\Raid-Bar-Hp-Fill"
    local UnitFrames = {
      --PlayerFrame,
      PetFrame,
      TargetFrameToT,
      FocusFrameToT,
      --PartyMemberFrame1,
      --PartyMemberFrame2,
      --PartyMemberFrame3,
      --PartyMemberFrame4,
    }
    local UnitFrameRegions = {
      "healthbar",
      "myHealPredictionBar",
      "otherHealPredictionBar",
      "healAbsorbBar",
      "totalAbsorbBar",
      --"manabar",
      "myManaCostPredictionBar",
      "spellbar",
    }
    local OtherStatusBars = {
      CastingBarFrame,
      MirrorTimer1StatusBar,
      MirrorTimer2StatusBar,
      MirrorTimer3StatusBar,
    }
    if (AbyssUIAddonSettings.FlatHealth == true) then
      for _, frame in next, UnitFrames do
        for _, region in next, UnitFrameRegions do
          local bar = frame[region]
          if bar and bar.SetStatusBarTexture then
            bar:SetStatusBarTexture(TEXTURE)
            bar:GetStatusBarTexture():SetHorizTile(true)
          elseif bar and bar.SetTexture then
            bar:SetTexture(TEXTURE)
            bar:SetHorizTile(true)
          end
        end
      end
      for _, bar in next, OtherStatusBars do
        bar:SetStatusBarTexture(TEXTURE)
        bar:GetStatusBarTexture():SetHorizTile(true)
      end
    end
  end
end)
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_TARGET_CHANGED")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("PLAYER_LOGIN")
if (GetWoWVersion > 12400) then
  f:RegisterEvent("PLAYER_FOCUS_CHANGED")
end
f:SetScript("OnEvent", function(self, event, name)
  if ((event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_FOCUS_CHANGED" or event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_LOGIN") and GetWoWVersion >= 90500) then
    PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarsContainer.HealthBar:SetStatusBarColor(UnitColor("player"))
    TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBarsContainer.HealthBar:SetStatusBarColor(UnitColor("target"))
    FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBarsContainer.HealthBar:SetStatusBarColor(UnitColor("focus"))
    PetFrameHealthBar:SetStatusBarColor(UnitColor("player"))
    --TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.HealthBarTexture:SetColorTexture(UnitColor("target"))
    --FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.HealthBarTexture:SetColorTexture(UnitColor("focus"))
    TargetFrameToT.HealthBar:SetStatusBarColor(UnitColor("targettarget"))
    FocusFrameToT.HealthBar:SetStatusBarColor(UnitColor("focustarget"))
  end
end)
----------------------------------------------------
-- For the new texture bars
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("PLAYER_TARGET_CHANGED")
f:RegisterEvent("PLAYER_LOGIN")
if (GetWoWVersion > 12400) then
  f:RegisterEvent("PLAYER_FOCUS_CHANGED")
end
f:SetScript("OnEvent", function(self, event, name)
 if ((event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_FOCUS_CHANGED" or event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_LOGIN") and GetWoWVersion >= 90500) then
    for i, v in pairs({ 
      PlayerFrame.HealthBar,
      PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarsContainer.HealthBar,
      TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBarsContainer.HealthBar,
      FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBarsContainer.HealthBar,
    }) do
      if AbyssUIAddonSettings ~= nil and AbyssUIAddonSettings.GreenHealth ~= true then
        v:SetStatusBarTexture("Interface\\AddOns\\AbyssUI\\textures\\Raid-Bar-Hp-Fill")
        v:GetStatusBarTexture():SetHorizTile(false)
      end
    end
  end
end)