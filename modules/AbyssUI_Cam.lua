-- Author: Yugen
--
-- Supports any version of wow
--
-- Cam Tricks
--------------------------------------------------------------
-- Init - Tables - Saves
local addonName, addonTable = ...
if not AbyssUI_Config then
  local AbyssUI_Config = {}
end
-- Color Init
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event)
    character = UnitName("player").."-"..GetRealmName()
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
local texturepackCheck    = "1.0.1.2"
local texturepackDate     = "01/10/20"
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
--------------------------------------------------------------
--------------------------------------------------------------
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function()
  if (AbyssUIAddonSettings.FirstPerson == true) then
    SetView(5)
  else
    return nil
  end
end)
--[[
local function CheckLocal()
  inInstance, instanceType = IsInInstance()
  --"none" when outside an instance
  --"pvp" when in a battleground
  --"arena" when in an arena
  --"party" when in a 5-man instance
  --"raid" when in a raid instance
  --"scenario" when in a scenario
  if (instanceType == "scenario" or instanceType == "party" ) then
    SetView(3)
  elseif (instanceType == "raid") then
    SetView(1)
  elseif (instanceType == "arena" or instanceType == "none" or instanceType == "pvp") then
    SetView(5)
  else
    return nil
  end
end 
-- DynanimcCamera
local AbyssUI_DynamicCam = CreateFrame("Frame", nil)
AbyssUI_DynamicCam:RegisterEvent("PLAYER_ENTERING_WORLD")
AbyssUI_DynamicCam:RegisterEvent("PLAYER_REGEN_DISABLED")
AbyssUI_DynamicCam:SetScript("OnEvent", function()
  if (AbyssUIAddonSettings.DynanimcCamera == true) then
    CheckLocal()
  else
    return nil
  end
end)
--]]
-- FirstPerson Cam
local AbyssUI_FirstPerson = CreateFrame("Frame", nil)
AbyssUI_FirstPerson:RegisterEvent("PLAYER_ENTERING_WORLD")
AbyssUI_FirstPerson:RegisterEvent("PLAYER_REGEN_DISABLED")
AbyssUI_FirstPerson:SetScript("OnEvent", function()
  if (AbyssUIAddonSettings.FirstPerson == true) then
    SetView(3)
  else
    return nil
  end
end)
--------------------------------------------------------------
-- End