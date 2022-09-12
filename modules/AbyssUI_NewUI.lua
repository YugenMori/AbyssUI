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
local globalFont, subFont, damageFont = AbyssUI_Fontification(globalFont, subFont, damageFont)
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
    elseif AbyssUIAddonSettings.UIVertexColorFramesColorPicker == true then
        local character = UnitName("player").."-"..GetRealmName()
        v:SetVertexColor(COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b)    
    else
        v:SetVertexColor(.4, .4, .4)
    end
end
--------------------------------------------------------------
-- UnitColor
local UnitColor
local function UnitColor(unit)
    local r, g, b, a
    if (not InCombatLockdown()) then
        if ((not UnitIsPlayer(unit)) and ((not UnitIsConnected(unit)) or (UnitIsDeadOrGhost(unit)))) then
            --Color it gray
            r, g, b, a = 0.5, 0.5, 0.5, 1
        elseif (UnitIsPlayer(unit)) then
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
            r, g, b, a = UnitSelectionColor(unit)
        end
    end
    return r, g, b, a
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

        -- End
        else
            return nil
        end
    end     
end)
---------------------------- NewUI Functions ----------------------------------
-- KeyBindingFrame
--[[
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
    if name == "Blizzard_BindingUI" and GetWoWVersion == 20502 and GetWoWVersion >= 12000 then
        for i, v in pairs({
            KeyBindingFrame.BottomEdge,
            KeyBindingFrame.BottomLeftCorner,
            KeyBindingFrame.BottomRightCorner,
            KeyBindingFrame.Center,
            KeyBindingFrame.LeftEdge,
            KeyBindingFrame.RightEdge,
            KeyBindingFrame.TopEdge,
            KeyBindingFrame.TopLeftCorner,
            KeyBindingFrame.TopRightCorner,
            KeyBindingFrameHeader, }) do
            if AbyssUIAddonSettings ~= nil then
                AbyssUI_ColorizationFrameFunction(v)
            else
                return nil
            end
        end
    end
end)
--]]



-- testing stuff
-- /run ActionButton1.RightDivider:SetVertexColor(0,0,0)
--[[
AbyssUI = LibStub("AceAddon-3.0"):NewAddon("AbyssUI", "AceConsole-3.0", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("AbyssUI")


local options = {
    name = "AbyssUI",
    handler = AbyssUI,
    type = "group",
    args = {
        msg = {
            type = "input",
            name = L["Message"],
            desc = L["The message to be displayed when you get home."],
            usage = L["<Your message>"],
            get = "GetMessage",
            set = "SetMessage",
        },
        showInChat = {
            type = "toggle",
            name = L["Show in Chat"],
            desc = L["Toggles the display of the message in the chat window."],
            get = "IsShowInChat",
            set = "ToggleShowInChat",
        },
        showOnScreen = {
            type = "toggle",
            name = L["Show on Screen"],
            desc = L["Toggles the display of the message on the screen."],
            get = "IsShowOnScreen",
            set = "ToggleShowOnScreen",
        },
    },
}

local defaults = {
    profile =  {
        message = L["Welcome Home!"],
        showInChat = false,
        showOnScreen = true,
    },
}

function AbyssUI:OnInitialize()
    -- Called when the addon is loaded
    self.db = LibStub("AceDB-3.0"):New("AbyssuiDB", defaults, true)

    LibStub("AceConfig-3.0"):RegisterOptionsTable("AbyssUI", options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("AbyssUI", "AbyssUI")
    self:RegisterChatCommand("ab", "ChatCommand")
    self:RegisterChatCommand("abyssui", "ChatCommand")
end

function AbyssUI:OnEnable()
    -- Called when the addon is enabled
    self:RegisterEvent("ZONE_CHANGED")
end

function AbyssUI:ZONE_CHANGED()
    if GetBindLocation() == GetSubZoneText() then
        if self.db.profile.showInChat then
            self:Print(self.db.profile.message)
        end

        if self.db.profile.showOnScreen then
            UIErrorsFrame:AddMessage(self.db.profile.message, 1.0, 1.0, 1.0, 5.0)
        end
    end
end

function AbyssUI:ChatCommand(input)
    if not input or input:trim() == "" then
        InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
    else
        LibStub("AceConfigCmd-3.0"):HandleCommand("ab", "abyssui", input)
    end
end

function AbyssUI:GetMessage(info)
    return self.db.profile.message
end

function AbyssUI:SetMessage(info, newValue)
    self.db.profile.message = newValue
end

function AbyssUI:IsShowInChat(info)
    return self.db.profile.showInChat
end

function AbyssUI:ToggleShowInChat(info, value)
    self.db.profile.showInChat = value
end

function AbyssUI:IsShowOnScreen(info)
    return self.db.profile.showOnScreen
end

function AbyssUI:ToggleShowOnScreen(info, value)
    self.db.profile.showOnScreen = value
end

--]]