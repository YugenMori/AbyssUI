-- Author: Yugen
--
-- Supports any version of wow
--
-- Icon Style Module
--
-- This module is inpired in LortiUI, so many users of AbyssUI have requested this section to be implemented, so I did,
-- this module is basically a revamp of LortiUI with modifications to better fit AbyssUI. Thanks to the creator of LortiUI for this amazing
-- code compilation and to make AbyssUI even better, please check his work!
-- Also check suicidalkatt icons pack at wowinterface, mostly icon borders are inspired in his work.
--------------------------------------------------------------
-- Init - Tables - Saves
local addon, ns = ...
local Abconfig = CreateFrame("Frame")
local addonName, addonTable = ...
local L = LibStub("AceLocale-3.0"):GetLocale("AbyssUI")
local GetWoWVersion = ((select(4, GetBuildInfo())))
local f = CreateFrame("Frame", "AbyssUI_Config", UIParent)
f:SetSize(50, 50)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, ...)
  character = UnitName("player").."-"..GetRealmName()
  -- Config/Panel
  if not AbyssUI_Config then
    local AbyssUI_Config = {}
  end
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
    globalFont  = mediaFolder.."global.tff"
    subFont   = mediaFolder.."damagefont_classic.ttf"
    damageFont  = mediaFolder.."damagefont_classic.ttf"
    oldglobalFont = mediaFolder .. "damagefont_classic.ttf"
  else
    globalFont  = fontName
    subFont   = fontName
    damageFont  = fontName
    oldglobalFont = fontName
  end
  return globalFont, subFont, damageFont, oldglobalFont
end
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
	elseif AbyssUIAddonSettings.UIVertexColorFramesColorPicker == true then
		local character = UnitName("player").."-"..GetRealmName()
		v:SetVertexColor(COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b)	
	else
		v:SetVertexColor(.4, .4, .4)
	end
end
local function GlossTheme()
  Abconfig.textures = {
    normal            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss",
    bags              = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss",
    flash             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\flash",
    hover             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\hover",
    pushed            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\pushed",
    checked           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\checked",
    equipped          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss_grey",
    buttonback        = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background",
    buttonbackflat    = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background_flat",
    outer_shadow      = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
  }

  Abconfig.background = {
    showbg            = true,   --show a background image?
    showshadow        = true,   --show an outer shadow?
    useflatbackground = false,  --true uses plain flat color instead
    backgroundcolor   = { r = 0.2, g = 0.2, b = 0.2, a = 0.3 },
    shadowcolor       = { r = 0, g = 0, b = 0, a = 0.9 },
    classcolored      = false,
    inset             = 5,
  }

  Abconfig.color = {
    normal            = { r = 0.37, g = 0.3, b = 0.3, },
    equipped          = { r = 0.1, g = 0.5, b = 0.1, },
    classcolored      = false,
  }

  Abconfig.hotkeys = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "TOPRIGHT", x = 0, y = 0 },
    pos2             = { a1 = "TOPLEFT", x = 0, y = 0 }, --important! two points are needed to make the hotkeyname be inside of the button
  }

  Abconfig.macroname = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMLEFT", x = 0, y = 0 },
    pos2             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 }, --important! two points are needed to make the macroname be inside of the button
  }

  Abconfig.itemcount = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 },
  }

  Abconfig.cooldown = {
    spacing          = 0,
  }

  Abconfig.font = globalFont

  --adjust the oneletter abbrev?
  Abconfig.adjustOneletterAbbrev = true

  --scale of the consolidated tooltip
  Abconfig.consolidatedTooltipScale = 1.2

  --combine buff and debuff frame - should buffs and debuffs be displayed in one single frame?
  --if you disable this it is intended that you unlock the buff and debuffs and move them apart!
  Abconfig.combineBuffsAndDebuffs = false

  -- buff frame settings
  Abconfig.buffFrame = {
    pos                 = { a1 = "TOPRIGHT", af = "Minimap", a2 = "TOPLEFT", x = -35, y = 0 },
    gap                 = 40, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 12,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -1,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss",
      color             = { r = 0.4, g = 0.35, b = 0.35, },
      classcolored      = false,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.8},
      classcolored      = false,
      inset             = 6,
      padding           = 4,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 3, y = -10 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }

  -- debuff frame settings
  Abconfig.debuffFrame = {
    pos = {
      a1 = "TOPRIGHT",
      af = "Minimap",
      a2 = "TOPLEFT",
      x = -35,
      y = -85
    },
    gap                 = 20, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 10,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -2,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss",
      color             = { r = 0.4, g = 0.35, b = 0.35, },
      classcolored      = false,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.9},
      classcolored      = false,
      inset             = 6,
      padding           = 4,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 0, y = 0 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }
end

local function ClassColor() 
  Abconfig.textures = {
    normal            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\classcolor",
    bags              = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\classcolor",
    flash             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\flash",
    hover             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\hover",
    pushed            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\pushed",
    checked           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\checked",
    equipped          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss_grey",
    buttonback        = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background",
    buttonbackflat    = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background_flat",
    outer_shadow      = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
  }

  Abconfig.background = {
    showbg            = true,   --show a background image?
    showshadow        = true,   --show an outer shadow?
    useflatbackground = false,  --true uses plain flat color instead
    backgroundcolor   = { r = 0.2, g = 0.2, b = 0.2, a = 0.3 },
    shadowcolor       = { r = 0, g = 0, b = 0, a = 0.9 },
    classcolored      = true,
    inset             = 5,
  }

  Abconfig.color = {
    normal            = { r = 0.37, g = 0.3, b = 0.3, },
    equipped          = { r = 0.1, g = 0.5, b = 0.1, },
    classcolored      = false,
  }

  Abconfig.hotkeys = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "TOPRIGHT", x = 0, y = 0 },
    pos2             = { a1 = "TOPLEFT", x = 0, y = 0 }, --important! two points are needed to make the hotkeyname be inside of the button
  }

  Abconfig.macroname = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMLEFT", x = 0, y = 0 },
    pos2             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 }, --important! two points are needed to make the macroname be inside of the button
  }

  Abconfig.itemcount = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 },
  }

  Abconfig.cooldown = {
    spacing          = 0,
  }

  Abconfig.font = globalFont

  --adjust the oneletter abbrev?
  Abconfig.adjustOneletterAbbrev = true

  --scale of the consolidated tooltip
  Abconfig.consolidatedTooltipScale = 1.2

  --combine buff and debuff frame - should buffs and debuffs be displayed in one single frame?
  --if you disable this it is intended that you unlock the buff and debuffs and move them apart!
  Abconfig.combineBuffsAndDebuffs = false

  -- buff frame settings
  Abconfig.buffFrame = {
    pos                 = { a1 = "TOPRIGHT", af = "Minimap", a2 = "TOPLEFT", x = -35, y = 0 },
    gap                 = 40, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 12,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -2,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\classcolor",
      color             = { r = 0.4, g = 0.35, b = 0.35, },
      classcolored      = true,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.9},
      classcolored      = true,
      inset             = 6,
      padding           = 4,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 3, y = -10 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }

  -- debuff frame settings
  Abconfig.debuffFrame = {
    pos = {
      a1 = "TOPRIGHT",
      af = "Minimap",
      a2 = "TOPLEFT",
      x = -35,
      y = -85
    },
    gap                 = 20, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 10,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -2,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\classcolor",
      color             = { r = 1, g = 1, b = 1, },
      classcolored      = true,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0.3, g = 0.3, b = 0.3, a = 0.8},
      classcolored      = true,
      inset             = 6,
      padding           = 4,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 0, y = 0 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }
end

local function CrispTheme() 
  Abconfig.textures = {
    normal            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\crisp",
    bags              = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\crisp",
    flash             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\flash",
    hover             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\hover",
    pushed            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\pushed",
    checked           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\checked",
    equipped          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss_grey",
    buttonback        = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background",
    buttonbackflat    = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background_flat",
    outer_shadow      = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
  }

  Abconfig.background = {
    showbg            = true,   --show a background image?
    showshadow        = true,   --show an outer shadow?
    useflatbackground = false,  --true uses plain flat color instead
    backgroundcolor   = { r = 0.2, g = 0.2, b = 0.2, a = 0.3 },
    shadowcolor       = { r = 0, g = 0, b = 0, a = 0.9 },
    classcolored      = false,
    inset             = 5,
  }

  Abconfig.color = {
    normal            = { r = 0.5, g = 0.5, b = 0.5, },
    equipped          = { r = 0.3, g = 0.5, b = 0.3, },
    classcolored      = false,
  }

  Abconfig.hotkeys = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "TOPRIGHT", x = 0, y = 0 },
    pos2             = { a1 = "TOPLEFT", x = 0, y = 0 }, --important! two points are needed to make the hotkeyname be inside of the button
  }

  Abconfig.macroname = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMLEFT", x = 0, y = 0 },
    pos2             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 }, --important! two points are needed to make the macroname be inside of the button
  }

  Abconfig.itemcount = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 },
  }

  Abconfig.cooldown = {
    spacing          = 0,
  }

  Abconfig.font = globalFont

  --adjust the oneletter abbrev?
  Abconfig.adjustOneletterAbbrev = true

  --scale of the consolidated tooltip
  Abconfig.consolidatedTooltipScale = 1.2

  --combine buff and debuff frame - should buffs and debuffs be displayed in one single frame?
  --if you disable this it is intended that you unlock the buff and debuffs and move them apart!
  Abconfig.combineBuffsAndDebuffs = false

  -- buff frame settings
  Abconfig.buffFrame = {
    pos                 = { a1 = "TOPRIGHT", af = "Minimap", a2 = "TOPLEFT", x = -35, y = 0 },
    gap                 = 40, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 12,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -2,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\crisp",
      color             = { r = 0.77, g = 0.7, b = 0.7, },
      classcolored      = false,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.8},
      classcolored      = false,
      inset             = 6,
      padding           = 4,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 3, y = -10 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }

  -- debuff frame settings
  Abconfig.debuffFrame = {
    pos = {
      a1 = "TOPRIGHT",
      af = "Minimap",
      a2 = "TOPLEFT",
      x = -35,
      y = -85
    },
    gap                 = 20, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 10,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -2,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\crisp",
      color             = { r = 0.77, g = 0.7, b = 0.7, },
      classcolored      = false,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.8},
      classcolored      = false,
      inset             = 6,
      padding           = 4,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 0, y = 0 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }
end

local function OriginalTheme() 
  Abconfig.textures = {
    normal            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\original",
    bags              = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\original",
    flash             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\flash",
    hover             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\hover",
    pushed            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\pushed",
    checked           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\checked",
    equipped          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss_grey",
    buttonback        = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background",
    buttonbackflat    = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background_flat",
    outer_shadow      = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
  }

  Abconfig.background = {
    showbg            = true,   --show a background image?
    showshadow        = true,   --show an outer shadow?
    useflatbackground = false,  --true uses plain flat color instead
    backgroundcolor   = { r = 0.2, g = 0.2, b = 0.2, a = 0.3 },
    shadowcolor       = { r = 0, g = 0, b = 0, a = 0.9 },
    classcolored      = false,
    inset             = 5,
  }

  Abconfig.color = {
    normal            = { r = 0.7, g = 0.7, b = 0.7, },
    equipped          = { r = 0.1, g = 0.5, b = 0.1, },
    classcolored      = false,
  }

  Abconfig.hotkeys = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "TOPRIGHT", x = 0, y = 0 },
    pos2             = { a1 = "TOPLEFT", x = 0, y = 0 }, --important! two points are needed to make the hotkeyname be inside of the button
  }

  Abconfig.macroname = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMLEFT", x = 0, y = 0 },
    pos2             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 }, --important! two points are needed to make the macroname be inside of the button
  }

  Abconfig.itemcount = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 },
  }

  Abconfig.cooldown = {
    spacing          = 0,
  }

  Abconfig.font = globalFont

  --adjust the oneletter abbrev?
  Abconfig.adjustOneletterAbbrev = true

  --scale of the consolidated tooltip
  Abconfig.consolidatedTooltipScale = 1.2

  --combine buff and debuff frame - should buffs and debuffs be displayed in one single frame?
  --if you disable this it is intended that you unlock the buff and debuffs and move them apart!
  Abconfig.combineBuffsAndDebuffs = false

  -- buff frame settings
  Abconfig.buffFrame = {
    pos                 = { a1 = "TOPRIGHT", af = "Minimap", a2 = "TOPLEFT", x = -35, y = 0 },
    gap                 = 40, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 12,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -2,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\original",
      color             = { r = 0.77, g = 0.7, b = 0.7, },
      classcolored      = false,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.9},
      classcolored      = false,
      inset             = 6,
      padding           = 4,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 3, y = -10 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }

  -- debuff frame settings
  Abconfig.debuffFrame = {
    pos = {
      a1 = "TOPRIGHT",
      af = "Minimap",
      a2 = "TOPLEFT",
      x = -35,
      y = -85
    },
    gap                 = 20, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 10,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -2,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\original",
      color             = { r = 0.77, g = 0.7, b = 0.7, },
      classcolored      = false,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.9},
      classcolored      = false,
      inset             = 6,
      padding           = 4,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 0, y = 0 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }
end

local function SquareTheme() 
Abconfig.textures = {
    normal            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\square",
    bags              = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\square",
    flash             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\flash",
    hover             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\hover",
    pushed            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\pushed",
    checked           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\checked",
    equipped          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss_grey",
    buttonback        = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background",
    buttonbackflat    = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background_flat",
    outer_shadow      = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
  }

  Abconfig.background = {
    showbg            = true,   --show a background image?
    showshadow        = true,   --show an outer shadow?
    useflatbackground = false,  --true uses plain flat color instead
    backgroundcolor   = { r = 0.2, g = 0.2, b = 0.2, a = 0.3 },
    shadowcolor       = { r = 0, g = 0, b = 0, a = 0.9 },
    classcolored      = false,
    inset             = 5,
  }

  Abconfig.color = {
    normal            = { r = 0.5, g = 0.5, b = 0.5, },
    equipped          = { r = 0.3, g = 0.5, b = 0.3, },
    classcolored      = false,
  }

  Abconfig.hotkeys = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "TOPRIGHT", x = 0, y = 0 },
    pos2             = { a1 = "TOPLEFT", x = 0, y = 0 }, --important! two points are needed to make the hotkeyname be inside of the button
  }

  Abconfig.macroname = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMLEFT", x = 0, y = 0 },
    pos2             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 }, --important! two points are needed to make the macroname be inside of the button
  }

  Abconfig.itemcount = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 },
  }

  Abconfig.cooldown = {
    spacing          = 0,
  }

  Abconfig.font = globalFont

  --adjust the oneletter abbrev?
  Abconfig.adjustOneletterAbbrev = true

  --scale of the consolidated tooltip
  Abconfig.consolidatedTooltipScale = 1.2

  --combine buff and debuff frame - should buffs and debuffs be displayed in one single frame?
  --if you disable this it is intended that you unlock the buff and debuffs and move them apart!
  Abconfig.combineBuffsAndDebuffs = false

  -- buff frame settings
  Abconfig.buffFrame = {
    pos                 = { a1 = "TOPRIGHT", af = "Minimap", a2 = "TOPLEFT", x = -35, y = 0 },
    gap                 = 40, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 12,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -2,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\square",
      color             = { r = 0.7, g = 0.7, b = 0.7, },
      classcolored      = false,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.9},
      classcolored      = false,
      inset             = 6,
      padding           = 4,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 3, y = -10 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }

  -- debuff frame settings
  Abconfig.debuffFrame = {
    pos = {
      a1 = "TOPRIGHT",
      af = "Minimap",
      a2 = "TOPLEFT",
      x = -35,
      y = -85
    },
    gap                 = 20, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 10,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -2,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\square",
      color             = { r = 0.4, g = 0.35, b = 0.35, },
      classcolored      = false,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.9},
      classcolored      = false,
      inset             = 6,
      padding           = 4,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 0, y = 0 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }
end

local function ThinTheme() 
  Abconfig.textures = {
    normal            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\thin",
    bags              = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\thin",
    flash             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\flash",
    hover             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\hover",
    pushed            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\pushed",
    checked           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\checked",
    equipped          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss_grey",
    buttonback        = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background",
    buttonbackflat    = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background_flat",
    outer_shadow      = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
  }

  Abconfig.background = {
    showbg            = true,   --show a background image?
    showshadow        = true,   --show an outer shadow?
    useflatbackground = false,  --true uses plain flat color instead
    backgroundcolor   = { r = 0.2, g = 0.2, b = 0.2, a = 0.3 },
    shadowcolor       = { r = 0, g = 0, b = 0, a = 0.9 },
    classcolored      = false,
    inset             = 5,
  }

  Abconfig.color = {
    normal            = { r = 0.37, g = 0.3, b = 0.3, },
    equipped          = { r = 0.1, g = 0.5, b = 0.1, },
    classcolored      = false,
  }

  Abconfig.hotkeys = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "TOPRIGHT", x = 0, y = 0 },
    pos2             = { a1 = "TOPLEFT", x = 0, y = 0 }, --important! two points are needed to make the hotkeyname be inside of the button
  }

  Abconfig.macroname = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMLEFT", x = 0, y = 0 },
    pos2             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 }, --important! two points are needed to make the macroname be inside of the button
  }

  Abconfig.itemcount = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 },
  }

  Abconfig.cooldown = {
    spacing          = 0,
  }

  Abconfig.font = globalFont

  --adjust the oneletter abbrev?
  Abconfig.adjustOneletterAbbrev = true

  --scale of the consolidated tooltip
  Abconfig.consolidatedTooltipScale = 1.2

  --combine buff and debuff frame - should buffs and debuffs be displayed in one single frame?
  --if you disable this it is intended that you unlock the buff and debuffs and move them apart!
  Abconfig.combineBuffsAndDebuffs = false

  -- buff frame settings
  Abconfig.buffFrame = {
    pos                 = { a1 = "TOPRIGHT", af = "Minimap", a2 = "TOPLEFT", x = -35, y = 0 },
    gap                 = 40, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 12,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -2,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\thin",
      color             = { r = 0.4, g = 0.35, b = 0.35, },
      classcolored      = false,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.9},
      classcolored      = false,
      inset             = 6,
      padding           = 4,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 3, y = -10 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }

  -- debuff frame settings
  Abconfig.debuffFrame = {
    pos = {
      a1 = "TOPRIGHT",
      af = "Minimap",
      a2 = "TOPLEFT",
      x = -35,
      y = -85
    },
    gap                 = 20, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 10,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -2,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\thin",
      color             = { r = 0.4, g = 0.35, b = 0.35, },
      classcolored      = false,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.9},
      classcolored      = false,
      inset             = 6,
      padding           = 4,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 0, y = 0 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }
end

local function GlassTheme() 
  Abconfig.textures = {
    normal            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\glass",
    bags              = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\glass",
    flash             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\flash",
    hover             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\hover",
    pushed            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\pushed",
    checked           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\checked",
    equipped          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss_grey",
    buttonback        = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background",
    buttonbackflat    = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background_flat",
    outer_shadow      = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
  }

  Abconfig.background = {
    showbg            = true,   --show a background image?
    showshadow        = true,   --show an outer shadow?
    useflatbackground = false,  --true uses plain flat color instead
    backgroundcolor   = { r = 0.2, g = 0.2, b = 0.2, a = 0.3 },
    shadowcolor       = { r = 0, g = 0, b = 0, a = 0.9 },
    classcolored      = false,
    inset             = 5,
  }

  Abconfig.color = {
    normal            = { r = 1, g = 1, b = 1, 0.8},
    equipped          = { r = 0.1, g = 0.5, b = 0.1, },
    classcolored      = false,
  }

  Abconfig.hotkeys = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "TOPRIGHT", x = 0, y = 0 },
    pos2             = { a1 = "TOPLEFT", x = 0, y = 0 }, --important! two points are needed to make the hotkeyname be inside of the button
  }

  Abconfig.macroname = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMLEFT", x = 0, y = 0 },
    pos2             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 }, --important! two points are needed to make the macroname be inside of the button
  }

  Abconfig.itemcount = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 },
  }

  Abconfig.cooldown = {
    spacing          = 0,
  }

  Abconfig.font = globalFont

  --adjust the oneletter abbrev?
  Abconfig.adjustOneletterAbbrev = true

  --scale of the consolidated tooltip
  Abconfig.consolidatedTooltipScale = 1.2

  --combine buff and debuff frame - should buffs and debuffs be displayed in one single frame?
  --if you disable this it is intended that you unlock the buff and debuffs and move them apart!
  Abconfig.combineBuffsAndDebuffs = false

  -- buff frame settings
  Abconfig.buffFrame = {
    pos                 = { a1 = "TOPRIGHT", af = "Minimap", a2 = "TOPLEFT", x = -35, y = 0 },
    gap                 = 40, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 12,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -1,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\glass",
      color             = { r = 1, g = 1, b = 1, 0.8},
      classcolored      = false,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.8},
      classcolored      = false,
      inset             = 6,
      padding           = 4,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 3, y = -10 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }

  -- debuff frame settings
  Abconfig.debuffFrame = {
    pos = {
      a1 = "TOPRIGHT",
      af = "Minimap",
      a2 = "TOPLEFT",
      x = -35,
      y = -85
    },
    gap                 = 20, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 10,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -1,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\glass",
      color             = { r = 1, g = 1, b = 1, 0.8},
      classcolored      = false,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.8},
      classcolored      = false,
      inset             = 6,
      padding           = 4,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 0, y = 0 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }
end

local function ClassicTheme() 
    Abconfig.textures = {
    normal            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\original",
    bags              = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\original",
    flash             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\flash",
    hover             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\hover",
    pushed            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\pushed",
    checked           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\checked",
    equipped          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss_grey",
    buttonback        = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background",
    buttonbackflat    = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background_flat",
    outer_shadow      = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
  }

  Abconfig.background = {
    showbg            = true,   --show a background image?
    showshadow        = true,   --show an outer shadow?
    useflatbackground = false,  --true uses plain flat color instead
    backgroundcolor   = { r = 0.2, g = 0.2, b = 0.2, a = 0.3 },
    shadowcolor       = { r = 0, g = 0, b = 0, a = 0.9 },
    classcolored      = false,
    inset             = 5,
  }

  Abconfig.color = {
    normal            = { r = 0.5, g = 0.5, b = 0.5, },
    equipped          = { r = 0.3, g = 0.5, b = 0.3, },
    classcolored      = false,
  }

  Abconfig.hotkeys = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "TOPRIGHT", x = 0, y = 0 },
    pos2             = { a1 = "TOPLEFT", x = 0, y = 0 }, --important! two points are needed to make the hotkeyname be inside of the button
  }

  Abconfig.macroname = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMLEFT", x = 0, y = 0 },
    pos2             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 }, --important! two points are needed to make the macroname be inside of the button
  }

  Abconfig.itemcount = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 },
  }

  Abconfig.cooldown = {
    spacing          = 0,
  }

  Abconfig.font = globalFont

  --adjust the oneletter abbrev?
  Abconfig.adjustOneletterAbbrev = true

  --scale of the consolidated tooltip
  Abconfig.consolidatedTooltipScale = 1.2

  --combine buff and debuff frame - should buffs and debuffs be displayed in one single frame?
  --if you disable this it is intended that you unlock the buff and debuffs and move them apart!
  Abconfig.combineBuffsAndDebuffs = false

  -- buff frame settings
  Abconfig.buffFrame = {
    pos                 = { a1 = "TOPRIGHT", af = "Minimap", a2 = "TOPLEFT", x = -35, y = 0 },
    gap                 = 40, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 12,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -2,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\classic",
      color             = { r = 0.5, g = 0.5, b = 0.5, },
      classcolored      = false,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.8},
      classcolored      = false,
      inset             = 4,
      padding           = 2,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 3, y = -10 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }

  -- debuff frame settings
  Abconfig.debuffFrame = {
    pos = {
      a1 = "TOPRIGHT",
      af = "Minimap",
      a2 = "TOPLEFT",
      x = -35,
      y = -85
    },
    gap                 = 20, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 10,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -2,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\classic",
      color             = { r = 1, g = 1, b = 1, },
      classcolored      = false,
    },
    background = {
      show              = true,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.8},
      classcolored      = false,
      inset             = 4,
      padding           = 2,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 0, y = 0 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }
end

local function OldSchoolTheme() 
    Abconfig.textures = {
    normal            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\oldschoolbackup",
    bags              = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\oldschoolbackup",
    flash             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\flash",
    hover             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\hover",
    pushed            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\pushed",
    checked           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\checked",
    equipped          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss_grey",
    buttonback        = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background",
    buttonbackflat    = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background_flat",
    outer_shadow      = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
  }

  Abconfig.background = {
    showbg            = true,   --show a background image?
    showshadow        = false, --show an outer shadow?
    useflatbackground = false,  --true uses plain flat color instead
    backgroundcolor   = { r = 0.2, g = 0.2, b = 0.2, a = 0.3 },
    shadowcolor       = { r = 0, g = 0, b = 0, a = 0.9 },
    classcolored      = false,
    inset             = 5,
  }

  Abconfig.color = {
    normal            = { r = 0.5, g = 0.5, b = 0.5, },
    equipped          = { r = 0.3, g = 0.5, b = 0.3, },
    classcolored      = false,
  }

  Abconfig.hotkeys = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "TOPRIGHT", x = 0, y = 0 },
    pos2             = { a1 = "TOPLEFT", x = 0, y = 0 }, --important! two points are needed to make the hotkeyname be inside of the button
  }

  Abconfig.macroname = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMLEFT", x = 0, y = 0 },
    pos2             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 }, --important! two points are needed to make the macroname be inside of the button
  }

  Abconfig.itemcount = {
    show             = true,
    fontsize         = 12,
    pos1             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 },
  }

  Abconfig.cooldown = {
    spacing          = 0,
  }

  Abconfig.font = globalFont

  --adjust the oneletter abbrev?
  Abconfig.adjustOneletterAbbrev = true

  --scale of the consolidated tooltip
  Abconfig.consolidatedTooltipScale = 1.2

  --combine buff and debuff frame - should buffs and debuffs be displayed in one single frame?
  --if you disable this it is intended that you unlock the buff and debuffs and move them apart!
  Abconfig.combineBuffsAndDebuffs = false

  -- buff frame settings
  Abconfig.buffFrame = {
    pos                 = { a1 = "TOPRIGHT", af = "Minimap", a2 = "TOPLEFT", x = -35, y = 0 },
    gap                 = 40, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 12,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -1,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\oldschoolbackup",
      color             = { r = 0.5, g = 0.5, b = 0.5, },
      classcolored      = false,
    },
    background = {
      show              = false,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0.2, g = 0.2, b = 0.2, a = 0.9},
      classcolored      = false,
      inset             = 4,
      padding           = 2,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 3, y = -10 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }

  -- debuff frame settings
  Abconfig.debuffFrame = {
    pos = {
      a1 = "TOPRIGHT",
      af = "Minimap",
      a2 = "TOPLEFT",
      x = -35,
      y = -85
    },
    gap                 = 20, --gap between buff and debuff rows
    userplaced          = true, --want to place the bar somewhere else?
    rowSpacing          = 13,
    colSpacing          = 10,
    buttonsPerRow       = 10,
    button = {
      size              = 28,
    },
    icon = {
      padding           = -1,
    },
    border = {
      texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\oldschoolbackup",
      color             = { r = 1, g = 1, b = 1, },
      classcolored      = false,
    },
    background = {
      show              = false,   --show backdrop
      edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
      color             = { r = 0, g = 0, b = 0, a = 0.9},
      classcolored      = false,
      inset             = 6,
      padding           = 4,
    },
    duration = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "BOTTOM", x = 0, y = 0 },
    },
    count = {
      font              = globalFont,
      size              = 11,
      pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    },
  }
end

local function DefaultTheme() 
  Abconfig.textures = {
  normal            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\oldschoolbackup",
  bags              = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\oldschoolbackup",
  flash             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\flash",
  hover             = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\hover",
  pushed            = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\pushed",
  checked           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\checked",
  equipped          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss_grey",
  buttonback        = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background",
  buttonbackflat    = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\button_background_flat",
  outer_shadow      = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
}

Abconfig.background = {
  showbg            = true,   --show a background image?
  showshadow        = false, --show an outer shadow?
  useflatbackground = false,  --true uses plain flat color instead
  backgroundcolor   = { r = 0.2, g = 0.2, b = 0.2, a = 0.3 },
  shadowcolor       = { r = 0, g = 0, b = 0, a = 0.9 },
  classcolored      = false,
  inset             = 5,
}

Abconfig.color = {
  normal            = { r = 0.5, g = 0.5, b = 0.5, },
  equipped          = { r = 0.3, g = 0.5, b = 0.3, },
  classcolored      = false,
}

Abconfig.hotkeys = {
  show             = true,
  fontsize         = 12,
  pos1             = { a1 = "TOPRIGHT", x = 0, y = 0 },
  pos2             = { a1 = "TOPLEFT", x = 0, y = 0 }, --important! two points are needed to make the hotkeyname be inside of the button
}

Abconfig.macroname = {
  show             = true,
  fontsize         = 12,
  pos1             = { a1 = "BOTTOMLEFT", x = 0, y = 0 },
  pos2             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 }, --important! two points are needed to make the macroname be inside of the button
}

Abconfig.itemcount = {
  show             = true,
  fontsize         = 12,
  pos1             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 },
}

Abconfig.cooldown = {
  spacing          = 0,
}

Abconfig.font = globalFont

--adjust the oneletter abbrev?
Abconfig.adjustOneletterAbbrev = true

--scale of the consolidated tooltip
Abconfig.consolidatedTooltipScale = 1.2

--combine buff and debuff frame - should buffs and debuffs be displayed in one single frame?
--if you disable this it is intended that you unlock the buff and debuffs and move them apart!
Abconfig.combineBuffsAndDebuffs = false

-- buff frame settings
Abconfig.buffFrame = {
  pos                 = { a1 = "TOPRIGHT", af = "Minimap", a2 = "TOPLEFT", x = -35, y = 0 },
  gap                 = 40, --gap between buff and debuff rows
  userplaced          = true, --want to place the bar somewhere else?
  rowSpacing          = 13,
  colSpacing          = 10,
  buttonsPerRow       = 12,
  button = {
    size              = 28,
  },
  icon = {
    padding           = -1,
  },
  border = {
    texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\oldschoolbackup",
    color             = { r = 0.5, g = 0.5, b = 0.5, },
    classcolored      = false,
  },
  background = {
    show              = false,   --show backdrop
    edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
    color             = { r = 0.2, g = 0.2, b = 0.2, a = 0.9},
    classcolored      = false,
    inset             = 4,
    padding           = 2,
  },
  duration = {
    font              = globalFont,
    size              = 11,
    pos               = { a1 = "BOTTOM", x = 3, y = -10 },
  },
  count = {
    font              = globalFont,
    size              = 11,
    pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
  },
}

-- debuff frame settings
Abconfig.debuffFrame = {
  pos = {
    a1 = "TOPRIGHT",
    af = "Minimap",
    a2 = "TOPLEFT",
    x = -35,
    y = -85
  },
  gap                 = 20, --gap between buff and debuff rows
  userplaced          = true, --want to place the bar somewhere else?
  rowSpacing          = 13,
  colSpacing          = 10,
  buttonsPerRow       = 10,
  button = {
    size              = 28,
  },
  icon = {
    padding           = -1,
  },
  border = {
    texture           = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\oldschoolbackup",
    color             = { r = 1, g = 1, b = 1, },
    classcolored      = false,
  },
  background = {
    show              = false,   --show backdrop
    edgeFile          = "Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\outer_shadow",
    color             = { r = 0, g = 0, b = 0, a = 0.9},
    classcolored      = false,
    inset             = 6,
    padding           = 4,
  },
  duration = {
    font              = globalFont,
    size              = 11,
    pos               = { a1 = "BOTTOM", x = 0, y = 0 },
  },
  count = {
    font              = globalFont,
    size              = 11,
    pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
  },
}
end

-- Textures and borders
-- action bars settings
local function IconThemeInit()
  if (AbyssUIAddonSettings.DefaultIconBorder ~= true) then
    if (AbyssUIAddonSettings.AbyssIconBorder ~= true) then
      if (AbyssUIAddonSettings.GlossIconBorder   ~= true and 
        AbyssUIAddonSettings.CrispIconBorder     ~= true and
        AbyssUIAddonSettings.OriginalIconBorder  ~= true and 
        AbyssUIAddonSettings.SquareIconBorder    ~= true and
        AbyssUIAddonSettings.ThinIconBorder      ~= true and 
        AbyssUIAddonSettings.GlassIconBorder     ~= true and 
        AbyssUIAddonSettings.ClassicIconBorder   ~= true and
        AbyssUIAddonSettings.OldSchoolIconBorder ~= true) then
        GlossTheme()
      end
      if AbyssUIAddonSettings.GlossIconBorder then 
        ClassColor()
        --if Abconfig.background.showshadow then edgefile = Abconfig.textures.classcolor end
      end
      if AbyssUIAddonSettings.CrispIconBorder then
        CrispTheme()
        --if Abconfig.background.showshadow then edgefile = Abconfig.textures.crisp end
      end
      if AbyssUIAddonSettings.OriginalIconBorder then
        OriginalTheme()
        --if Abconfig.background.showshadow then edgefile = Abconfig.textures.original end
      end
      if AbyssUIAddonSettings.SquareIconBorder then
        SquareTheme()
        --if Abconfig.background.showshadow then edgefile = Abconfig.textures.square end
      end
      if AbyssUIAddonSettings.ThinIconBorder then
        ThinTheme()
        --if Abconfig.background.showshadow then edgefile = Abconfig.textures.thin end
      end
      if AbyssUIAddonSettings.GlassIconBorder then
        GlassTheme()
        --if Abconfig.background.showshadow then edgefile = Abconfig.textures.glass end
      end
      if AbyssUIAddonSettings.ClassicIconBorder then
        ClassicTheme()
        --if Abconfig.background.showshadow then edgefile = Abconfig.textures.crisp end
      end
      if AbyssUIAddonSettings.OldSchoolIconBorder then
        OldSchoolTheme()
        --if Abconfig.background.showshadow then edgefile = Abconfig.textures.crisp end
      end
    end
  end
end
local function IconBackInit()
  if (AbyssUIAddonSettings.DefaultIconBorder ~= true) then
    if (AbyssUIAddonSettings.AbyssIconBorder ~= true) then
      ns.Abconfig = Abconfig
      -- Action Bar
      --get the config values
      local Abconfig = ns.Abconfig

      if Abconfig.color.classcolored then
        Abconfig.color.normal = classcolor
      end

      --backdrop settings
      local bgfile, edgefile = "", ""
      if Abconfig.background.showshadow then edgefile = Abconfig.textures.outer_shadow end
      if Abconfig.background.useflatbackground and Abconfig.background.showbg then bgfile = Abconfig.textures.buttonbackflat end

      --backdrop
      local backdrop = {
        bgFile = bgfile,
        edgeFile = edgefile,
        tile = false,
        tileSize = 32,
        edgeSize = Abconfig.background.inset,
        insets = {
          left = Abconfig.background.inset,
          right = Abconfig.background.inset,
          top = Abconfig.background.inset,
          bottom = Abconfig.background.inset,
        },
      }
      local classcolor = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
      local dominos = IsAddOnLoaded("Dominos")
      local bartender4 = IsAddOnLoaded("Bartender4")
      if IsAddOnLoaded("Masque") and (dominos or bartender4) then return end
      local function applyBackground(bu)
        if not bu or (bu and bu.bg) then return end
        --shadows+background
        if bu:GetFrameLevel() < 1 then bu:SetFrameLevel(1) end
        if Abconfig.background.showbg or Abconfig.background.showshadow then
          bu.bg = CreateFrame("Frame", nil, bu, BackdropTemplateMixin and "BackdropTemplate")
        -- bu.bg:SetAllPoints(bu)
          bu.bg:SetPoint("TOPLEFT", bu, "TOPLEFT", -4, 4)
          bu.bg:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", 4, -4)
          bu.bg:SetFrameLevel(bu:GetFrameLevel() - 1)
          if Abconfig.background.classcolored then
            Abconfig.background.backgroundcolor = classcolor
            Abconfig.background.shadowcolor = classcolor
          end
          if Abconfig.background.showbg and not Abconfig.background.useflatbackground then
            local t = bu.bg:CreateTexture(nil, "BACKGROUND", nil, -8)
            t:SetTexture(Abconfig.textures.buttonback)
            --t:SetAllPoints(bu)
            t:SetVertexColor(Abconfig.background.backgroundcolor.r, Abconfig.background.backgroundcolor.g, Abconfig.background.backgroundcolor.b, Abconfig.background.backgroundcolor.a)
          end
          bu.bg:SetBackdrop(backdrop)
          if Abconfig.background.useflatbackground then
            bu.bg:SetBackdropColor(Abconfig.background.backgroundcolor.r, Abconfig.background.backgroundcolor.g, Abconfig.background.backgroundcolor.b, Abconfig.background.backgroundcolor.a)
          end
          if Abconfig.background.showshadow then
            bu.bg:SetBackdropBorderColor(Abconfig.background.shadowcolor.r, Abconfig.background.shadowcolor.g, Abconfig.background.shadowcolor.b, Abconfig.background.shadowcolor.a)
          end
        end
      end

      --initial style func
      local function styleActionButton(bu)
        if not bu or (bu and bu.rabs_styled) then
          return
        end
        local action = bu.action
        local name = bu:GetName()
        local ic   = _G[name.."Icon"]
        local co   = _G[name.."Count"]
        local bo   = _G[name.."Border"]
        local ho   = _G[name.."HotKey"]
        local cd   = _G[name.."Cooldown"]
        local na   = _G[name.."Name"]
        local fl   = _G[name.."Flash"]
        local nt   = _G[name.."NormalTexture"]
        local fbg  = _G[name.."FloatingBG"]
        local fob  = _G[name.."FlyoutBorder"]
        local fobs = _G[name.."FlyoutBorderShadow"]
        if (AbyssUIAddonSettings.OldSchoolIconBorder ~= true) then
          if fbg then fbg:Hide() end  --floating background
          --flyout border stuff
          if fob then fob:SetTexture(nil) end
          if fobs then fobs:SetTexture(nil) end
          bo:SetTexture(nil) --hide the border (plain ugly, sry blizz)
        else
          if fbg then fbg:Hide() end  --floating background
          --flyout border stuff
          --if fob then fob:SetTexture(nil) end
          --if fobs then fobs:SetTexture(nil) end
          bo:SetTexture(nil)
        end
        --hotkey
        if (AbyssUIAddonSettings.OldSchoolIconBorder ~= true) then
          ho:SetFont(Abconfig.font, Abconfig.hotkeys.fontsize, "OUTLINE")
          ho:ClearAllPoints()
          ho:SetPoint(Abconfig.hotkeys.pos1.a1, bu, Abconfig.hotkeys.pos1.x, Abconfig.hotkeys.pos1.y)
          ho:SetPoint(Abconfig.hotkeys.pos2.a1, bu, Abconfig.hotkeys.pos2.x, Abconfig.hotkeys.pos2.y)
          if not dominos and not bartender4 and not Abconfig.hotkeys.show then
            ho:Hide()
          end  
        end
        --macro name
        if (AbyssUIAddonSettings.OldSchoolIconBorder ~= true) then
          na:SetFont(Abconfig.font, Abconfig.macroname.fontsize, "OUTLINE")
          na:ClearAllPoints()
          na:SetPoint(Abconfig.macroname.pos1.a1, bu, Abconfig.macroname.pos1.x, Abconfig.macroname.pos1.y)
          na:SetPoint(Abconfig.macroname.pos2.a1, bu, Abconfig.macroname.pos2.x, Abconfig.macroname.pos2.y)

          if not dominos and not bartender4 and not Abconfig.macroname.show then
            na:Hide()
          end
        end
        --item stack count
        if (AbyssUIAddonSettings.OldSchoolIconBorder ~= true) then
          co:SetFont(Abconfig.font, Abconfig.itemcount.fontsize, "OUTLINE")
          co:ClearAllPoints()
          co:SetPoint(Abconfig.itemcount.pos1.a1, bu, Abconfig.itemcount.pos1.x, Abconfig.itemcount.pos1.y)

          if not dominos and not bartender4 and not Abconfig.itemcount.show then
            co:Hide()
          end
        end
        --applying the textures
        fl:SetTexture(Abconfig.textures.flash)
        --bu:SetHighlightTexture(Abconfig.textures.hover)
        --bu:SetPushedTexture(Abconfig.textures.pushed)
        --bu:SetCheckedTexture(Abconfig.textures.checked)
        bu:SetNormalTexture(Abconfig.textures.normal)
        if not nt then
          --fix the non existent texture problem (no clue what is causing this)
          nt = bu:GetNormalTexture()
        end
        --cut the default border of the icons and make them shiny
        if (AbyssUIAddonSettings.OldSchoolIconBorder == true) then
          ic:SetTexCoord(0.05, 0.9, 0.05, 0.9)
          ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 2, -2)
          ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -2, 2)
        elseif (AbyssUIAddonSettings.ThinIconBorder == true or AbyssUIAddonSettings.GlassIconBorder == true) then
          ic:SetTexCoord(0.06, 0.9, 0.06, 0.9)
          ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 1, -1)
          ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -1, 1)
        elseif ( AbyssUIAddonSettings.OriginalIconBorder == true or AbyssUIAddonSettings.ClassicIconBorder == true) then
          ic:SetTexCoord(0.05, 0.9, 0.05, 0.9)
          ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 1, -1)
          ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -1, 1)
        else
          ic:SetTexCoord(0.08, 0.9, 0.08, 0.9)
          ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 2, -2)
          ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -2, 2)
        end
        --adjust the cooldown frame
        if (AbyssUIAddonSettings.OldSchoolIconBorder ~= true) then
          cd:SetPoint("TOPLEFT", bu, "TOPLEFT", Abconfig.cooldown.spacing, -Abconfig.cooldown.spacing)
          cd:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -Abconfig.cooldown.spacing, Abconfig.cooldown.spacing)
        end
        --apply the normaltexture
        if action and IsEquippedAction(action) then
          --bu:SetNormalTexture(Abconfig.textures.equipped)
          nt:SetVertexColor(Abconfig.color.equipped.r, Abconfig.color.equipped.g, Abconfig.color.equipped.b, 1)
        else
          bu:SetNormalTexture(Abconfig.textures.normal)
          nt:SetVertexColor(Abconfig.color.normal.r, Abconfig.color.normal.g, Abconfig.color.normal.b, 1)
        end
        --make the normaltexture match the buttonsize
        nt:SetAllPoints(bu)
        --hook to prevent Blizzard from reseting our colors
        hooksecurefunc(nt, "SetVertexColor", function(nt, r, g, b, a)
          local bu = nt:GetParent()
          local action = bu.action
          --print("bu"..bu:GetName().."R"..r.."G"..g.."B"..b)
          if r == 1 and g == 1 and b == 1 and action and (IsEquippedAction(action)) then
            if Abconfig.color.equipped.r == 1 and Abconfig.color.equipped.g == 1 and Abconfig.color.equipped.b == 1 then
              nt:SetVertexColor(0.999, 0.999, 0.999, 1)
            else
              nt:SetVertexColor(Abconfig.color.equipped.r, Abconfig.color.equipped.g, Abconfig.color.equipped.b, 1)
            end
          elseif r == 0.5 and g == 0.5 and b == 1 then
            --blizzard oom color
            if Abconfig.color.normal.r == 0.5 and Abconfig.color.normal.g == 0.5 and Abconfig.color.normal.b == 1 then
              nt:SetVertexColor(0.499, 0.499, 0.999, 1)
            else
              nt:SetVertexColor(Abconfig.color.normal.r, Abconfig.color.normal.g, Abconfig.color.normal.b, 1)
            end
          elseif r == 1 and g == 1 and b == 1 then
            if Abconfig.color.normal.r == 1 and Abconfig.color.normal.g == 1 and Abconfig.color.normal.b == 1 then
              nt:SetVertexColor(0.999, 0.999, 0.999, 1)
            else
              nt:SetVertexColor(Abconfig.color.normal.r, Abconfig.color.normal.g, Abconfig.color.normal.b, 1)
            end
          end
        end)
        --shadows+background
        if not bu.bg then applyBackground(bu) end
          bu.rabs_styled = true
        if bartender4 then --fix the normaltexture
          nt:SetTexCoord(0, 1, 0, 1)
          nt.SetTexCoord = function() return end
          bu.SetNormalTexture = function() return end
        end
      end
      -- style leave button
      local function styleLeaveButton(bu)
        if not bu or (bu and bu.rabs_styled) then return end
        --local region = select(1, bu:GetRegions())
        local name = bu:GetName()
        local nt = bu:GetNormalTexture()
        local bo = bu:CreateTexture(name.."Border", "BACKGROUND", nil, -7)
        nt:SetTexCoord(0.2,0.8,0.2,0.8)
        nt:SetPoint("TOPLEFT", bu, "TOPLEFT", 2, -2)
        nt:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -2, 2)
        bo:SetTexture(Abconfig.textures.normal)
        bo:SetTexCoord(0, 1, 0, 1)
        bo:SetDrawLayer("BACKGROUND", -7)
        bo:SetVertexColor(0.4, 0.35, 0.35)
        bo:ClearAllPoints()
        bo:SetAllPoints(bu)
        --shadows+background
        if not bu.bg then applyBackground(bu) end
        bu.rabs_styled = true
      end

      --style pet buttons
      local function stylePetButton(bu)
        if not bu or (bu and bu.rabs_styled) then return end
        local name = bu:GetName()
        local ic  = _G[name.."Icon"]
        local fl  = _G[name.."Flash"]
        local nt  = _G[name.."NormalTexture2"]
        --setting the textures
        fl:SetTexture(Abconfig.textures.flash)
        --bu:SetHighlightTexture(Abconfig.textures.hover)
        --bu:SetPushedTexture(Abconfig.textures.pushed)
        --bu:SetCheckedTexture(Abconfig.textures.checked)
        bu:SetNormalTexture(Abconfig.textures.normal)
        if not nt then
          --fix the non existent texture problem (no clue what is causing this)
          nt = bu:GetNormalTexture()
        end
        if (nt ~= nil) then
          nt:SetAllPoints(bu)
          --applying color
          nt:SetVertexColor(Abconfig.color.normal.r, Abconfig.color.normal.g, Abconfig.color.normal.b, 1)
        end
        hooksecurefunc(bu, "SetNormalTexture", function(self, texture)
          --make sure the normaltexture stays the way we want it
          if texture and texture ~= Abconfig.textures.normal then
            self:SetNormalTexture(Abconfig.textures.normal)
          end
        end)
        --cut the default border of the icons and make them shiny
        if (AbyssUIAddonSettings.OldSchoolIconBorder == true) then
          ic:SetTexCoord(0.1, 0.9, 0.1, 0.9)
          ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 2, -2)
          ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -2, 2)
        else
          ic:SetTexCoord(0.1, 0.9, 0.1, 0.9)
          ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 1, -1)
          ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -1, 1)
        end
        --shadows+background
        if not bu.bg then applyBackground(bu) end
        bu.rabs_styled = true
      end

      --style stance buttons
      local function styleStanceButton(bu)
        if not bu or (bu and bu.rabs_styled) then return end
        local name = bu:GetName()
        local ic  = _G[name.."Icon"]
        local fl  = _G[name.."Flash"]
        local nt  = _G[name.."NormalTexture2"]
        --setting the textures
        fl:SetTexture(Abconfig.textures.flash)
        --bu:SetHighlightTexture(Abconfig.textures.hover)
        --bu:SetPushedTexture(Abconfig.textures.pushed)
        --bu:SetCheckedTexture(Abconfig.textures.checked)
        bu:SetNormalTexture(Abconfig.textures.normal)
        if not nt then
          --fix the non existent texture problem (no clue what is causing this)
          nt = bu:GetNormalTexture()
        end
        if (nt ~= nil) then
          nt:SetAllPoints(bu)
          --applying color
          nt:SetVertexColor(Abconfig.color.normal.r, Abconfig.color.normal.g, Abconfig.color.normal.b, 1)
        end
        --cut the default border of the icons and make them shiny
        ic:SetTexCoord(0.1, 0.9, 0.1, 0.9)
        ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 1, -1)
        ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -1, 1)
        --shadows+background
        if not bu.bg then applyBackground(bu) end
        bu.rabs_styled = true
      end

      --style possess buttons
      local function stylePossessButton(bu)
        if not bu or (bu and bu.rabs_styled) then return end
        local name = bu:GetName()
        local ic  = _G[name.."Icon"]
        local fl  = _G[name.."Flash"]
        local nt  = _G[name.."NormalTexture"]
        nt:SetAllPoints(bu)
        --applying color
        nt:SetVertexColor(Abconfig.color.normal.r,Abconfig.color.normal.g,Abconfig.color.normal.b,1)
        --setting the textures
        fl:SetTexture(Abconfig.textures.flash)
        --bu:SetHighlightTexture(Abconfig.textures.hover)
        --bu:SetPushedTexture(Abconfig.textures.pushed)
        --bu:SetCheckedTexture(Abconfig.textures.checked)
        bu:SetNormalTexture(Abconfig.textures.normal)
        --cut the default border of the icons and make them shiny
        ic:SetTexCoord(0.1, 0.9, 0.1, 0.9)
        ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 2, -2)
        ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -2, 2)
        --shadows+background
        if not bu.bg then applyBackground(bu) end
        bu.rabs_styled = true
      end

      -- style bags
      local function styleBag(bu)
        if (GetWoWVersion <= 90500) then
          if not bu or (bu and bu.rabs_styled) then return end
          local name = bu:GetName()
          local ic  = _G[name.."IconTexture"]
          local nt  = _G[name.."NormalTexture"]
          nt:SetTexCoord(0, 1, 0, 1)
          nt:SetDrawLayer("BACKGROUND", -7)
          if (AbyssUIAddonSettings.OldSchoolIconBorder == true) then
            nt:SetVertexColor(0.5, 0.5, 0.5)
          else
            nt:SetVertexColor(0.4, 0.35, 0.35)
          end
          nt:SetAllPoints(bu)
          local bo = bu.IconBorder
          bo:Hide()
          bo.Show = function() end
          ic:SetTexCoord(0.1, 0.9, 0.1, 0.9)
          ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 2, -2)
          ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -2, 2)
          bu:SetNormalTexture(Abconfig.textures.bags)
          --bu:SetHighlightTexture(Abconfig.textures.hover)
          --bu:SetPushedTexture(Abconfig.textures.pushed)
          --bu:SetCheckedTexture(Abconfig.textures.checked)
          
          --make sure the normaltexture stays the way we want it
          hooksecurefunc(bu, "SetNormalTexture", function(self, texture)
            if texture and texture ~= Abconfig.textures.bags then
              self:SetNormalTexture(Abconfig.textures.bags)
            end
          end)
          bu.Back = CreateFrame("Frame", nil, bu, BackdropTemplateMixin and "BackdropTemplate")
          bu.Back:SetPoint("TOPLEFT", bu, "TOPLEFT", -4, 4)
          bu.Back:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", 4, -4)
          bu.Back:SetFrameLevel(bu:GetFrameLevel() - 1)
          bu.Back:SetBackdrop(backdrop)
          bu.Back:SetBackdropBorderColor(0, 0, 0, 0.9)
        end
      end

      -- style bags
      local function styleOtherBag(bu)
        if (GetWoWVersion <= 90500) then
          if not bu or (bu and bu.rabs_styled) then return end
          local name = bu:GetName()
          local ic  = _G[name.."IconTexture"]
          local nt  = _G[name.."NormalTexture"]
          nt:SetTexCoord(0, 1, 0, 1)
          nt:SetDrawLayer("BACKGROUND", -7)
          nt:SetAllPoints(bu)
          local bo = bu.IconBorder
          bo:Hide()
          bo.Show = function() end
          ic:SetTexCoord(0.1, 0.9, 0.1, 0.9)
          ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 2, -2)
          ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -2, 2)
          bu:SetNormalTexture(Abconfig.textures.bags)
          --bu:SetHighlightTexture(Abconfig.textures.hover)
          --bu:SetPushedTexture(Abconfig.textures.pushed)
          --bu:SetCheckedTexture(Abconfig.textures.checked)
          
          --make sure the normaltexture stays the way we want it
          hooksecurefunc(bu, "SetNormalTexture", function(self, texture)
            if texture and texture ~= Abconfig.textures.bags then
              self:SetNormalTexture(Abconfig.textures.bags)
            end
          end)
          bu.Back = CreateFrame("Frame", nil, bu, BackdropTemplateMixin and "BackdropTemplate")
          bu.Back:SetPoint("TOPLEFT", bu, "TOPLEFT", -4, 4)
          bu.Back:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", 4, -4)
          bu.Back:SetFrameLevel(bu:GetFrameLevel() - 1)
          bu.Back:SetBackdrop(backdrop)
          bu.Back:SetBackdropBorderColor(0, 0, 0, 0.9)
          C_Timer.After(0.2, function() 
            nt:SetVertexColor(0.5, 0.5, 0.5)
          end)
        end
      end
      local f = CreateFrame("Frame")
      f:RegisterEvent("Bag_Update")
      f:SetScript("OnEvent", function(self)
        for i = 0, 3 do
          styleOtherBag(_G["CharacterBag"..i.."Slot"])
        end
      end)
      --update hotkey func
      local function updateHotkey(self, actionButtonType)
        local ho = _G[self:GetName().."HotKey"]
        if ho and not Abconfig.hotkeys.show and ho:IsShown() then
          ho:Hide()
        end
      end
      local function init()
      local dominos = IsAddOnLoaded("Dominos")
      local bartender4 = IsAddOnLoaded("Bartender4")
      --style the actionbar buttons
      for i = 1, NUM_ACTIONBAR_BUTTONS do
        styleActionButton(_G["ActionButton"..i])
        styleActionButton(_G["MultiBarBottomLeftButton"..i])
        styleActionButton(_G["MultiBarBottomRightButton"..i])
        styleActionButton(_G["MultiBarRightButton"..i])
        styleActionButton(_G["MultiBarLeftButton"..i])
      end
      --style bags
        --for i = 0, 3 do
          --styleBag(_G["CharacterBag"..i.."Slot"])
        --end
        for i = 0, 3 do
          styleOtherBag(_G["CharacterBag"..i.."Slot"])
        end
          styleBag(MainMenuBarBackpackButton)
        for i = 1, 6 do
          styleActionButton(_G["OverrideActionBarButton"..i])
        end
        --style leave button
        styleLeaveButton(MainMenuBarVehicleLeaveButton)
        styleLeaveButton(rABS_LeaveVehicleButton)
        --petbar buttons
        for i = 1, NUM_PET_ACTION_SLOTS do
          stylePetButton(_G["PetActionButton"..i])
        end
        --stancebar buttons
        local nStance = GetNumShapeshiftForms ()
        if (nStance ~= nil) then
          for i = 1, nStance do
            styleStanceButton(_G["StanceButton"..i])
          end
        end
        --dominos styling
        if dominos then
          --print("Dominos found")
          for i = 1, 60 do
            styleActionButton(_G["DominosActionButton"..i])
          end
        end
        --bartender4 styling
        if bartender4 then
          --print("Bartender4 found")
          for i = 1, 120 do
            styleActionButton(_G["BT4Button"..i])
            stylePetButton(_G["BT4PetButton"..i])
          end
        end
        --hide the hotkeys if needed
        if not dominos and not bartender4 and not Abconfig.hotkeys.show then
          hooksecurefunc("ActionButton_UpdateHotkeys", updateHotkey)
        end
      end

      local a = CreateFrame("Frame")
      a:RegisterEvent("PLAYER_ENTERING_WORLD")
      a:SetScript("OnEvent", init)

      -- Auras
      --apply aura frame texture func
      local function applySkin(b)
        if not b or (b and b.styled) then return end
        --button name
        local name = b:GetName()
        if (name:match("Debuff")) then
          b.debuff = true
        else
          b.buff = true
        end
        --icon
        local icon = _G[name.."Icon"]
        icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
        icon:SetDrawLayer("BACKGROUND",-8)
        b.icon = icon
        --border
        local border = _G[name.."Border"] or b:CreateTexture(name.."Border", "BACKGROUND", nil, -7)
          if (AbyssUIAddonSettings.GlossIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss")
          elseif (AbyssUIAddonSettings.CrispIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\classcolor")
          elseif (AbyssUIAddonSettings.CrispIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\crisp")
          elseif (AbyssUIAddonSettings.OriginalIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\original")
          elseif (AbyssUIAddonSettings.SquareIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\square")
          elseif (AbyssUIAddonSettings.ThinIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\thin")
          elseif (AbyssUIAddonSettings.GlassIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\glass")
          elseif (AbyssUIAddonSettings.ClassicIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\classic")
          elseif (AbyssUIAddonSettings.OldSchoolIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\oldschoolbackup")
          else
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\classic")
          end
        border:SetTexCoord(0, 1, 0, 1)
        border:SetDrawLayer("BACKGROUND",- 7)
        if b.buff then
          border:SetVertexColor(0.5, 0.5, 0.5)
        end
        border:ClearAllPoints()
        border:SetPoint("TOPLEFT", b, "TOPLEFT", -1, 1)
        border:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", 1, -1)
        b.border = border
        --shadow
        local back = CreateFrame("Frame", nil, b, BackdropTemplateMixin and "BackdropTemplate")
        back:SetPoint("TOPLEFT", b, "TOPLEFT", -2, 2)
        back:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", 2, -2)
        back:SetFrameLevel(b:GetFrameLevel() - 1)
        back:SetBackdrop(backdrop)
        back:SetBackdropBorderColor(0, 0, 0, 0.9)
        b.bg = back
        --set button styled variable
        b.styled = true
      end

      --apply castbar texture
      local function applycastSkin(b)
        if not b or (b and b.styled) then return end
        -- parent
        if b == TargetFrameSpellBar.Icon then
          b.parent = TargetFrameSpellBar
        end
        -- frame
        frame = CreateFrame("Frame", nil, b.parent, BackdropTemplateMixin and "BackdropTemplate")
        --icon
        b:SetTexCoord(0.1, 0.9, 0.1, 0.9)
        --border
        local border = frame:CreateTexture(nil, "BACKGROUND")
          if (AbyssUIAddonSettings.GlossIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\gloss")
          elseif (AbyssUIAddonSettings.CrispIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\classcolor")
          elseif (AbyssUIAddonSettings.CrispIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\crisp")
          elseif (AbyssUIAddonSettings.OriginalIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\original")
          elseif (AbyssUIAddonSettings.SquareIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\square")
          elseif (AbyssUIAddonSettings.ThinIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\thin")
          elseif (AbyssUIAddonSettings.GlassIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\glass")
          elseif (AbyssUIAddonSettings.ClassicIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\classic")
          elseif (AbyssUIAddonSettings.OldSchoolIconBorder) then
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\oldschoolbackup")
          else
            border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\classic")
          end
        border:SetTexCoord(0, 1, 0, 1)
        border:SetDrawLayer("BACKGROUND",- 7)
        border:SetVertexColor(0.5, 0.5, 0.5)
        border:ClearAllPoints()
        border:SetPoint("TOPLEFT", b, "TOPLEFT", -1, 1)
        border:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", 1, -1)
        b.border = border
        --shadow
        local back = CreateFrame("Frame", nil, b.parent, BackdropTemplateMixin and "BackdropTemplate")
        back:SetPoint("TOPLEFT", b, "TOPLEFT", -2, 2)
        back:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", 2, -2)
        back:SetFrameLevel(frame:GetFrameLevel() - 1)
        back:SetBackdrop(backdrop)
        back:SetBackdropBorderColor(0, 0, 0, 0.9)
        b.bg = back
        --set button styled variable
        b.styled = true
      end

      -- setting timer for castbar icons
      function UpdateTimer(self, elapsed)
        total = total + elapsed
        if TargetFrameSpellBar.Icon then 
          applycastSkin(TargetFrameSpellBar.Icon)
        end
        if TargetFrameSpellBar.Icon.styled then
          cf:SetScript("OnUpdate", nil)
        end
      end
      if (GetWoWVersion <= 90500) then
        hooksecurefunc("TargetFrame_UpdateAuras", function(self)
          for i = 1, MAX_TARGET_BUFFS do
            b = _G["TargetFrameBuff"..i]
            applySkin(b)
          end
          for i = 1, MAX_TARGET_DEBUFFS do
            b = _G["TargetFrameDebuff"..i]
            applySkin(b)
          end
          for i = 1, MAX_TARGET_BUFFS do
            b = _G["FocusFrameBuff"..i]
            applySkin(b)
          end
          for i = 1, MAX_TARGET_DEBUFFS do
            b = _G["FocusFrameDebuff"..i]
            applySkin(b)
          end
        end)
      end
      
      total = 0
      cf = CreateFrame("Frame")
      cf:SetScript("OnUpdate", UpdateTimer)

      -- Buff Frames
      local dragFrameList = ns.dragFrameList

      --rCreateDragFrame func
      function rCreateDragFrame(self, dragFrameList, inset, clamp)
        if not self or not dragFrameList then return end
        --save the default position for later
        self.defaultPoint = rGetPoint(self)
        table.insert(dragFrameList,self) --add frame object to the list
        --anchor a dragable frame on self
        local df = CreateFrame("Frame",nil,self)
        df:SetAllPoints(self)
        df:SetFrameStrata("HIGH")
        df:SetHitRectInsets(inset or 0,inset or 0,inset or 0,inset or 0)
        df:EnableMouse(true)
        df:RegisterForDrag("LeftButton")
        df:SetScript("OnDragStart", function(self) if IsAltKeyDown() and IsShiftKeyDown() then self:GetParent():StartMoving() end end)
        df:SetScript("OnDragStop", function(self) self:GetParent():StopMovingOrSizing() end)
        df:SetScript("OnEnter", function(self)
          GameTooltip:SetOwner(self, "ANCHOR_TOP")
          GameTooltip:AddLine(self:GetParent():GetName(), 0, 1, 0.5, 1, 1, 1)
          GameTooltip:AddLine("Hold down ALT+SHIFT to drag!", 1, 1, 1, 1, 1, 1)
          GameTooltip:Show()
        end)
        df:SetScript("OnLeave", function(s) GameTooltip:Hide() end)
        df:Hide()
        --overlay texture
        local t = df:CreateTexture(nil,"OVERLAY",nil,6)
        t:SetAllPoints(df)
        t:SetTexture(0,1,0)
        t:SetAlpha(0.2)
        df.texture = t
        --self stuff
        self.dragFrame = df
        self:SetClampedToScreen(clamp or false)
        self:SetMovable(true)
        self:SetUserPlaced(true)
      end

      --rewrite the oneletter shortcuts
      if Abconfig.adjustOneletterAbbrev then
        HOUR_ONELETTER_ABBR   = "%dh"
        DAY_ONELETTER_ABBR    = "%dd"
        MINUTE_ONELETTER_ABBR = "%dm"
        SECOND_ONELETTER_ABBR = "%ds"
      end

      --backdrop debuff
      local backdropDebuff = {
        bgFile = nil,
        edgeFile = Abconfig.debuffFrame.background.edgeFile,
        tile = false,
        tileSize = 32,
        edgeSize = Abconfig.debuffFrame.background.inset,
        insets = {
          left = Abconfig.debuffFrame.background.inset,
          right = Abconfig.debuffFrame.background.inset,
          top = Abconfig.debuffFrame.background.inset,
          bottom = Abconfig.debuffFrame.background.inset,
        },
      }

      --backdrop buff
      local backdropBuff = {
        bgFile = nil,
        edgeFile = Abconfig.buffFrame.background.edgeFile,
        tile = false,
        tileSize = 32,
        edgeSize = Abconfig.buffFrame.background.inset,
        insets = {
          left = Abconfig.buffFrame.background.inset,
          right = Abconfig.buffFrame.background.inset,
          top = Abconfig.buffFrame.background.inset,
          bottom = Abconfig.buffFrame.background.inset,
        },
      }

      local ceil, min, max = ceil, min, max
      local ShouldShowConsolidatedBuffFrame = ShouldShowConsolidatedBuffFrame

      local buffFrameHeight = 0

      --apply aura frame texture func
      local function applySkin(b)
        if not b or (b and b.styled) then return end
        --button name
        local name = b:GetName()
        --check the button type
        local tempenchant, consolidated, debuff, buff = false, false, false, false
        if (name:match("TempEnchant")) then
          tempenchant = true
        elseif (name:match("Consolidated")) then
          consolidated = true
        elseif (name:match("Debuff")) then
          debuff = true
        else
          buff = true
        end
        --get Abconfig and backdrop
        local Abconfig, backdrop
        if debuff then
          Abconfig = ns.Abconfig.debuffFrame
          backdrop = backdropDebuff
        else
          Abconfig = ns.Abconfig.buffFrame
          backdrop = backdropBuff
        end
        --check class coloring options
        if Abconfig.border.classcolored then
          Abconfig.border.color = classcolor
        end
        if Abconfig.background.classcolored then
          Abconfig.background.color = classcolor
        end

        --button
        b:SetSize(Abconfig.button.size, Abconfig.button.size)

        --icon
        local icon = _G[name.."Icon"]
        if consolidated then
          if select(1,UnitFactionGroup("player")) == "Alliance" then  
            icon:SetTexture(select(3,GetSpellInfo(61573)))
          elseif select(1,UnitFactionGroup("player")) == "Horde" then
            icon:SetTexture(select(3,GetSpellInfo(61574)))
          end
        end
        icon:SetTexCoord(0.1,0.9,0.1,0.9)
        icon:ClearAllPoints()
        icon:SetPoint("TOPLEFT", b, "TOPLEFT", -Abconfig.icon.padding, Abconfig.icon.padding)
        icon:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", Abconfig.icon.padding, -Abconfig.icon.padding)
        icon:SetDrawLayer("BACKGROUND", -8)
        b.icon = icon

        --border
        local border = _G[name.."Border"] or b:CreateTexture(name.."Border", "BACKGROUND", nil, -7)
        border:SetTexture(Abconfig.border.texture)
        border:SetTexCoord(0, 1, 0, 1)
        border:SetDrawLayer("BACKGROUND", -7)
        if tempenchant then
          border:SetVertexColor(0.7, 0, 1)
        elseif not debuff then
          border:SetVertexColor(Abconfig.border.color.r, Abconfig.border.color.g, Abconfig.border.color.b)
        end
        border:ClearAllPoints()
        border:SetAllPoints(b)
        b.border = border

        --duration
        b.duration:SetFont(Abconfig.duration.font, Abconfig.duration.size, "THINOUTLINE")
        b.duration:ClearAllPoints()
        b.duration:SetPoint(Abconfig.duration.pos.a1, Abconfig.duration.pos.x, Abconfig.duration.pos.y)

        --count
        b.count:SetFont(Abconfig.count.font, Abconfig.count.size, "THINOUTLINE")
        b.count:ClearAllPoints()
        b.count:SetPoint(Abconfig.count.pos.a1, Abconfig.count.pos.x, Abconfig.count.pos.y)

        --shadow
        if Abconfig.background.show then
          local back = CreateFrame("Frame", nil, b, BackdropTemplateMixin and "BackdropTemplate")
          back:SetPoint("TOPLEFT", b, "TOPLEFT", -Abconfig.background.padding, Abconfig.background.padding)
          back:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", Abconfig.background.padding, -Abconfig.background.padding)
          back:SetFrameLevel(b:GetFrameLevel() - 1)
          back:SetBackdrop(backdrop)
          back:SetBackdropBorderColor(Abconfig.background.color.r, Abconfig.background.color.g, Abconfig.background.color.b, Abconfig.background.color.a)
          b.bg = back
        end

        --set button styled variable
        b.styled = true
      end

      --update debuff anchors
      local function updateDebuffAnchors(buttonName,index)
        local button = _G[buttonName..index]
        if not button then return end
        --apply skin
        if not button.styled then applySkin(button) end
        --position button
        button:ClearAllPoints()
        if index == 1 then
          if Abconfig.combineBuffsAndDebuffs then
            button:SetPoint("TOPRIGHT", rBFS_BuffDragFrame, "TOPRIGHT", 0, -buffFrameHeight)
          else
            --debuffs and buffs are not combined anchor the debuffs to its own frame
            button:SetPoint("TOPRIGHT", rBFS_DebuffDragFrame, "TOPRIGHT", 0, 0)      
          end
        elseif index > 1 and mod(index, Abconfig.debuffFrame.buttonsPerRow) == 1 then
          button:SetPoint("TOPRIGHT", _G[buttonName..(index-Abconfig.debuffFrame.buttonsPerRow)], "BOTTOMRIGHT", 0, -Abconfig.debuffFrame.rowSpacing)
        else
          button:SetPoint("TOPRIGHT", _G[buttonName..(index-1)], "TOPLEFT", -Abconfig.debuffFrame.colSpacing, 0)
        end
      end
      --update buff anchors
      local function updateAllBuffAnchors()
        --variables
        local buttonName  = "BuffButton"
        local numEnchants = BuffFrame.numEnchants
        local numBuffs    = BUFF_ACTUAL_DISPLAY
        local offset      = numEnchants
        local realIndex, previousButton, aboveButton
        --position the tempenchant button depending on the consolidated button status
        --if ShouldShowConsolidatedBuffFrame() then
          --TempEnchant1:ClearAllPoints()
          --TempEnchant1:SetPoint("TOPRIGHT", ConsolidatedBuffs, "TOPLEFT", -Abconfig.buffFrame.colSpacing, 0)
          --offset = offset + 1
        --else
          TempEnchant1:ClearAllPoints()
          TempEnchant1:SetPoint("TOPRIGHT", rBFS_BuffDragFrame, "TOPRIGHT", 0, 0)
        --end
        
        --calculate the previous button in case tempenchant or consolidated buff are loaded
        if BuffFrame.numEnchants > 0 then
          previousButton = _G["TempEnchant"..numEnchants]
        end
        --elseif ShouldShowConsolidatedBuffFrame() then
        -- previousButton = ConsolidatedBuffs
        --end
        --calculate the above button in case tempenchant or consolidated buff are loaded
        --if ShouldShowConsolidatedBuffFrame() then
          --aboveButton = ConsolidatedBuffs
          if numEnchants > 0 then
            aboveButton = TempEnchant1
          end
          --loop on all active buff buttons
          local buffCounter = 0
          for index = 1, numBuffs do
            local button = _G[buttonName..index]
            if not button then return end
            if not button.consolidated then
              buffCounter = buffCounter + 1
              --apply skin
              if not button.styled then applySkin(button) end
              --position button
              button:ClearAllPoints()
              realIndex = buffCounter+offset
              if realIndex == 1 then
                button:SetPoint("TOPRIGHT", rBFS_BuffDragFrame, "TOPRIGHT", 0, 0)
                aboveButton = button
              elseif realIndex > 1 and mod(realIndex, Abconfig.buffFrame.buttonsPerRow) == 1 then
                button:SetPoint("TOPRIGHT", aboveButton, "BOTTOMRIGHT", 0, -Abconfig.buffFrame.rowSpacing)
                aboveButton = button
              else
                button:SetPoint("TOPRIGHT", previousButton, "TOPLEFT", -Abconfig.buffFrame.colSpacing, 0)
              end
              previousButton = button
            end
          --end
        end
        --calculate the height of the buff rows for the debuff frame calculation later
        local rows = ceil((buffCounter+offset)/Abconfig.buffFrame.buttonsPerRow)
        local height = Abconfig.buffFrame.button.size*rows + Abconfig.buffFrame.rowSpacing*rows + Abconfig.buffFrame.gap*min(1,rows)
        buffFrameHeight = height
        --make sure the debuff frames update the position asap
        if DebuffButton1 and Abconfig.combineBuffsAndDebuffs then    
          updateDebuffAnchors("DebuffButton", 1)
        end
      end

      --buff drag frame
      local bf = CreateFrame("Frame", "rBFS_BuffDragFrame", UIParent)
      bf:SetSize(Abconfig.buffFrame.button.size,Abconfig.buffFrame.button.size)
      bf:SetPoint(Abconfig.buffFrame.pos.a1,Abconfig.buffFrame.pos.af,Abconfig.buffFrame.pos.a2,Abconfig.buffFrame.pos.x,Abconfig.buffFrame.pos.y)
      if Abconfig.buffFrame.userplaced then
        rCreateDragFrame(bf, dragFrameList, -2 , true) --frame, dragFrameList, inset, clamp
      end

      if not Abconfig.combineBuffsAndDebuffs then
        --debuff drag frame
        local df = CreateFrame("Frame", "rBFS_DebuffDragFrame", UIParent)
        df:SetSize(Abconfig.debuffFrame.button.size,Abconfig.debuffFrame.button.size)
        df:SetPoint(Abconfig.debuffFrame.pos.a1,Abconfig.debuffFrame.pos.af,Abconfig.debuffFrame.pos.a2,Abconfig.debuffFrame.pos.x,Abconfig.debuffFrame.pos.y)
        if Abconfig.debuffFrame.userplaced then
          rCreateDragFrame(df, dragFrameList, -2 , true) --frame, dragFrameList, inset, clamp
        end
      end
      --temp enchant stuff
      applySkin(TempEnchant1)
      applySkin(TempEnchant2)
      applySkin(TempEnchant3)
      --position the temp enchant buttons
      if (GetWoWVersion <= 90500) then
        TempEnchant1:ClearAllPoints()
        TempEnchant1:SetPoint("TOPRIGHT", rBFS_BuffDragFrame, "TOPRIGHT", 0, 0) --button will be repositioned later in case temp enchant and consolidated buffs are both available
        TempEnchant2:ClearAllPoints()
        TempEnchant2:SetPoint("TOPRIGHT", TempEnchant1, "TOPLEFT", -Abconfig.buffFrame.colSpacing, 0)
        TempEnchant3:ClearAllPoints()
        TempEnchant3:SetPoint("TOPRIGHT", TempEnchant2, "TOPLEFT", -Abconfig.buffFrame.colSpacing, 0)

        --consolidated buff stuff
        --ConsolidatedBuffs:SetScript("OnLoad", nil) --do not  mess the icon anymore
        --applySkin(ConsolidatedBuffs)
        --position the consolidate buff button
        --ConsolidatedBuffs:ClearAllPoints()
        --ConsolidatedBuffs:SetPoint("TOPRIGHT", rBFS_BuffDragFrame, "TOPRIGHT", 0, 0)
        --ConsolidatedBuffsTooltip:SetScale(Abconfig.consolidatedTooltipScale)

        --hook Blizzard functions
        hooksecurefunc("BuffFrame_UpdateAllBuffAnchors", updateAllBuffAnchors)
        hooksecurefunc("DebuffButton_UpdateAnchors", updateDebuffAnchors)
      end
    end
  end
end
-- Default Icons
local function styleDefaultActionButton(bu)
  if not bu or (bu and bu.rabs_styled) then
    return
  end
  local action = bu.action
  local name = bu:GetName()
  local ic   = _G[name.."Icon"]
  local co   = _G[name.."Count"]
  local bo   = _G[name.."Border"]
  local ho   = _G[name.."HotKey"]
  local cd   = _G[name.."Cooldown"]
  local na   = _G[name.."Name"]
  local fl   = _G[name.."Flash"]
  local nt   = _G[name.."NormalTexture"]
  local fbg  = _G[name.."FloatingBG"]
  local fob  = _G[name.."FlyoutBorder"]
  local fobs = _G[name.."FlyoutBorderShadow"]

  --if fbg then fbg:Hide() end  --floating background
  --flyout border stuff
  --if fob then fob:SetTexture(nil) end
  --if fobs then fobs:SetTexture(nil) end
  --bo:SetTexture(nil) --hide the border (plain ugly, sry blizz)

  --if not nt then
    --fix the non existent texture problem (no clue what is causing this)
    --nt = bu:GetNormalTexture()
  --end
  
  AbyssUI_ColorizationFrameFunction(nt)
  --make the normaltexture match the buttonsize
  --nt:SetAllPoints(bu)
  if (GetWoWVersion <= 90600) then
    ic:SetTexCoord(0.06, 0.9, 0.06, 0.9)
    --ic:SetTexCoord(0.02, 1, 0.08, 1)
    ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 0, 1)
    ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", 1, 0)
  end
  --hook to prevent Blizzard from reseting our colors
  hooksecurefunc(nt, "SetVertexColor", function(nt, r, g, b, a)
    local bu = nt:GetParent()
    local action = bu.action
    --print("bu"..bu:GetName().."R"..r.."G"..g.."B"..b)
    if r == 1 and g == 1 and b == 1 and action and (IsEquippedAction(action)) then
      nt:SetVertexColor(124/255, 252/255, 10/255, 1)
    elseif r == 0.5 and g == 0.5 and b == 1 then
      --blizzard oom color
      nt:SetVertexColor(0.4, 0.4, 0.4, 1)
    elseif r == 1 and g == 1 and b == 1 then
      AbyssUI_ColorizationFrameFunction(nt)
    end
  end)
end
-- style bags
local function styleDefaultBag(bu)
  if (GetWoWVersion <= 90500) then
    if not bu or (bu and bu.rabs_styled) then return end
    local name = bu:GetName()
    local ic  = _G[name.."IconTexture"]
    local nt  = _G[name.."NormalTexture"]
    AbyssUI_ColorizationFrameFunction(nt)
    local bo = bu.IconBorder
    bo:Hide()
    bo.Show = function() end
    ic:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 1, -1)
    ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -1, 1)
    bu.Back = CreateFrame("Frame", nil, bu, BackdropTemplateMixin and "BackdropTemplate")
    bu.Back:SetPoint("TOPLEFT", bu, "TOPLEFT", -4, 4)
    bu.Back:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", 4, -4)
    bu.Back:SetFrameLevel(bu:GetFrameLevel() - 1)
    bu.Back:SetBackdrop(backdrop)
    bu.Back:SetBackdropBorderColor(0, 0, 0, 0.9)
  end
end
-- style bags
local function styleDefaultOtherBag(bu)
  if (GetWoWVersion <= 90500) then
    if not bu or (bu and bu.rabs_styled) then return end
    local name = bu:GetName()
    local ic  = _G[name.."IconTexture"]
    local nt  = _G[name.."NormalTexture"]
    local bo = bu.IconBorder
    bo:Hide()
    bo.Show = function() end
    ic:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 1, -1)
    ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -1, 1)
    bu.Back = CreateFrame("Frame", nil, bu, BackdropTemplateMixin and "BackdropTemplate")
    bu.Back:SetPoint("TOPLEFT", bu, "TOPLEFT", -4, 4)
    bu.Back:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", 4, -4)
    bu.Back:SetFrameLevel(bu:GetFrameLevel() - 1)
    bu.Back:SetBackdrop(backdrop)
    bu.Back:SetBackdropBorderColor(0, 0, 0, 0.9)
    C_Timer.After(0.1, function()
      AbyssUI_ColorizationFrameFunction(nt)
    end)
  end
end
local f = CreateFrame("Frame")
f:RegisterEvent("Bag_Update")
f:SetScript("OnEvent", function(self)
  for i = 0, 3 do
    styleDefaultOtherBag(_G["CharacterBag"..i.."Slot"])
  end
end)
-- style leave button
local function styleDefaultLeaveButton(bu)
  if not bu or (bu and bu.rabs_styled) then return end
  local region = select(1, bu:GetRegions())
  local name = bu:GetName()
  local nt = bu:GetNormalTexture()
  --nt:SetTexCoord(0.2, 0.8, 0.2, 0.8)
  --nt:SetPoint("TOPLEFT", bu, "TOPLEFT", 2, -2)
  --nt:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -2, 2)
  AbyssUI_ColorizationFrameFunction(nt)
end
--style pet buttons
local function styleDefaultPetButton(bu)
  if not bu or (bu and bu.rabs_styled) then return end
  local name = bu:GetName()
  local nt  = _G[name.."NormalTexture2"]
  if not nt then
    --fix the non existent texture
    nt = bu:GetNormalTexture()
  end
  if (nt ~= nil) then
    AbyssUI_ColorizationFrameFunction(nt)
  end
end
--style stance buttons
local function styleDefaultStanceButton(bu)
  if not bu or (bu and bu.rabs_styled) then return end
  local name = bu:GetName()
  local nt  = _G[name.."NormalTexture2"]
  if not nt then
    --fix the non existent texture
    nt = bu:GetNormalTexture()
  end
  if (nt ~= nil) then
    AbyssUI_ColorizationFrameFunction(nt)
  end
end
-- Default Init
local function DefaultInit()
  if (AbyssUIAddonSettings.AbyssIconBorder == true) then
    DefaultTheme()
    ns.Abconfig = Abconfig
    -- Action Bar
    --get the config values
    local Abconfig = ns.Abconfig

    if Abconfig.color.classcolored then
      Abconfig.color.normal = classcolor
    end

    --backdrop settings
    local bgfile, edgefile = "", ""
    if Abconfig.background.showshadow then edgefile = Abconfig.textures.outer_shadow end
    if Abconfig.background.useflatbackground and Abconfig.background.showbg then bgfile = Abconfig.textures.buttonbackflat end

    --backdrop
    local backdrop = {
      bgFile = bgfile,
      edgeFile = edgefile,
      tile = false,
      tileSize = 32,
      edgeSize = Abconfig.background.inset,
      insets = {
        left = Abconfig.background.inset,
        right = Abconfig.background.inset,
        top = Abconfig.background.inset,
        bottom = Abconfig.background.inset,
      },
    }
    local classcolor = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
    local dominos = IsAddOnLoaded("Dominos")
    local bartender4 = IsAddOnLoaded("Bartender4")
    if IsAddOnLoaded("Masque") and (dominos or bartender4) then return end
    --style the actionbar buttons
    for i = 1, NUM_ACTIONBAR_BUTTONS do
      styleDefaultActionButton(_G["ActionButton"..i])
      styleDefaultActionButton(_G["MultiBarBottomLeftButton"..i])
      styleDefaultActionButton(_G["MultiBarBottomRightButton"..i])
      styleDefaultActionButton(_G["MultiBarRightButton"..i])
      styleDefaultActionButton(_G["MultiBarLeftButton"..i])
    end
    --style bags
    for i = 0, 3 do
      styleDefaultOtherBag(_G["CharacterBag"..i.."Slot"])
    end
      styleDefaultBag(MainMenuBarBackpackButton)
    for i = 1, 6 do
      styleDefaultActionButton(_G["OverrideActionBarButton"..i])
    end
    --style leave button
    styleDefaultLeaveButton(MainMenuBarVehicleLeaveButton)
    styleDefaultLeaveButton(rABS_LeaveVehicleButton)
    --petbar buttons
    for i = 1, NUM_PET_ACTION_SLOTS do
      styleDefaultPetButton(_G["PetActionButton"..i])
    end
    --stancebar buttons
    local nStance = GetNumShapeshiftForms ()
    if (nStance ~= nil) then
      for i = 1, nStance do
        styleDefaultStanceButton(_G["StanceButton"..i])
      end
    end
    --dominos styling
    if dominos then
      --print("Dominos found")
      for i = 1, 60 do
        styleDefaultActionButton(_G["DominosActionButton"..i])
      end
    end
    --bartender4 styling
    if bartender4 then
      --print("Bartender4 found")
      for i = 1, 120 do
        styleDefaultActionButton(_G["BT4Button"..i])
        styleDefaultPetButton(_G["BT4PetButton"..i])
      end
    end
    -- Auras / Buff
    --apply aura frame texture func (auraframe)
    local function applySkin(b)
      if not b or (b and b.styled) then return end
      --button name
      local name = b:GetName()
      if (name:match("Debuff")) then
        b.debuff = true
      else
        b.buff = true
      end
      --icon
      local icon = _G[name.."Icon"]
      icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
      icon:SetDrawLayer("BACKGROUND", -8)
      b.icon = icon
      --border
      local border = _G[name.."Border"] or b:CreateTexture(name.."Border", "BACKGROUND", nil, -7)
      border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\classic")
      border:SetTexCoord(0, 1, 0, 1)
      border:SetDrawLayer("BACKGROUND", -7)
      if b.buff then
        AbyssUI_ColorizationFrameFunction(border)
      end
      border:ClearAllPoints()
      border:SetPoint("TOPLEFT", b, "TOPLEFT", -1, 1)
      border:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", 1, -1)
      b.border = border
    end

    --apply castbar texture
    local function applycastSkin(b)
      if not b or (b and b.styled) then return end
      -- parent
      if b == TargetFrameSpellBar.Icon then
        b.parent = TargetFrameSpellBar
      end
      -- frame
      frame = CreateFrame("Frame", nil, b.parent, BackdropTemplateMixin and "BackdropTemplate")
      --icon
      b:SetTexCoord(0.1, 0.9, 0.1, 0.9)
      --border
      local border = frame:CreateTexture(nil, "BACKGROUND")
      border:SetTexture("Interface\\AddOns\\AbyssUI\\textures\\iconstyle\\classic")
      border:SetTexCoord(0, 1, 0, 1)
      border:SetDrawLayer("BACKGROUND", -7)
      AbyssUI_ColorizationFrameFunction(border)
      border:ClearAllPoints()
      border:SetPoint("TOPLEFT", b, "TOPLEFT", -1, 1)
      border:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", 1, -1)
      b.border = border
    end
    -- setting timer for castbar icons
    function UpdateTimer(self, elapsed)
      total = total + elapsed
      if TargetFrameSpellBar.Icon then 
        applycastSkin(TargetFrameSpellBar.Icon)
      end
      if TargetFrameSpellBar.Icon.styled then
        cf:SetScript("OnUpdate", nil)
      end
    end
    if (GetWoWVersion <= 90500) then
      hooksecurefunc("TargetFrame_UpdateAuras", function(self)
        for i = 1, MAX_TARGET_BUFFS do
          b = _G["TargetFrameBuff"..i]
          applySkin(b)
        end
        for i = 1, MAX_TARGET_DEBUFFS do
          b = _G["TargetFrameDebuff"..i]
          applySkin(b)
        end
        for i = 1, MAX_TARGET_BUFFS do
          b = _G["FocusFrameBuff"..i]
          applySkin(b)
        end
        for i = 1, MAX_TARGET_DEBUFFS do
          b = _G["FocusFrameDebuff"..i]
          applySkin(b)
        end
      end)
    end
    
    total = 0
    cf = CreateFrame("Frame")
    cf:SetScript("OnUpdate", UpdateTimer)

    -- Buff Frames
    --rewrite the oneletter shortcuts
    if Abconfig.adjustOneletterAbbrev then
      HOUR_ONELETTER_ABBR   = "%dh"
      DAY_ONELETTER_ABBR    = "%dd"
      MINUTE_ONELETTER_ABBR = "%dm"
      SECOND_ONELETTER_ABBR = "%ds"
    end

    --backdrop debuff
    local backdropDebuff = {
      bgFile = nil,
      edgeFile = Abconfig.debuffFrame.background.edgeFile,
      tile = false,
      tileSize = 32,
      edgeSize = Abconfig.debuffFrame.background.inset,
      insets = {
        left = Abconfig.debuffFrame.background.inset,
        right = Abconfig.debuffFrame.background.inset,
        top = Abconfig.debuffFrame.background.inset,
        bottom = Abconfig.debuffFrame.background.inset,
      },
    }

    --backdrop buff
    local backdropBuff = {
      bgFile = nil,
      edgeFile = Abconfig.buffFrame.background.edgeFile,
      tile = false,
      tileSize = 32,
      edgeSize = Abconfig.buffFrame.background.inset,
      insets = {
        left = Abconfig.buffFrame.background.inset,
        right = Abconfig.buffFrame.background.inset,
        top = Abconfig.buffFrame.background.inset,
        bottom = Abconfig.buffFrame.background.inset,
      },
    }

    local ceil, min, max = ceil, min, max
    local ShouldShowConsolidatedBuffFrame = ShouldShowConsolidatedBuffFrame
    local buffFrameHeight = 0
    --apply aura frame texture func (buff frame)
    local function applySkin(b)
      if not b or (b and b.styled) then return end
      --button name
      local name = b:GetName()
      --check the button type
      local tempenchant, consolidated, debuff, buff = false, false, false, false
      if (name:match("TempEnchant")) then
        tempenchant = true
      elseif (name:match("Consolidated")) then
        consolidated = true
      elseif (name:match("Debuff")) then
        debuff = true
      else
        buff = true
      end
      --get Abconfig and backdrop
      local Abconfig, backdrop
      if debuff then
        Abconfig = ns.Abconfig.debuffFrame
        backdrop = backdropDebuff
      else
        Abconfig = ns.Abconfig.buffFrame
        backdrop = backdropBuff
      end
      --check class coloring options
      if Abconfig.border.classcolored then
        Abconfig.border.color = classcolor
      end
      if Abconfig.background.classcolored then
        Abconfig.background.color = classcolor
      end

      --button
      b:SetSize(Abconfig.button.size, Abconfig.button.size)
      --icon
      local icon = _G[name.."Icon"]
      if consolidated then
        if select(1,UnitFactionGroup("player")) == "Alliance" then  
          icon:SetTexture(select(3,GetSpellInfo(61573)))
        elseif select(1,UnitFactionGroup("player")) == "Horde" then
          icon:SetTexture(select(3,GetSpellInfo(61574)))
        end
      end
      icon:SetTexCoord(0.06, 0.9, 0.06, 0.9)
      icon:ClearAllPoints()
      icon:SetPoint("TOPLEFT", b, "TOPLEFT", -Abconfig.icon.padding, Abconfig.icon.padding)
      icon:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", Abconfig.icon.padding, -Abconfig.icon.padding)
      icon:SetDrawLayer("BACKGROUND", -8)
      b.icon = icon

      --border
      local border = _G[name.."Border"] or b:CreateTexture(name.."Border", "BACKGROUND", nil, -7)
      border:SetTexture(Abconfig.border.texture)
      border:SetTexCoord(0, 1, 0, 1)
      border:SetDrawLayer("BACKGROUND", -7)
      AbyssUI_ColorizationFrameFunction(border)
      border:ClearAllPoints()
      border:SetAllPoints(b)
      b.border = border
    end
    --update debuff anchors
    local function updateDebuffAnchors(buttonName,index)
      local button = _G[buttonName..index]
      if not button then return end
      --apply skin
      if not button.styled then applySkin(button) end
    end
    --update buff anchors
    local function updateAllBuffAnchors()
      --variables
      local buttonName  = "BuffButton"
      local numEnchants = BuffFrame.numEnchants
      local numBuffs    = BUFF_ACTUAL_DISPLAY
      local offset      = numEnchants
      local realIndex, previousButton, aboveButton
      if BuffFrame.numEnchants > 0 then
        previousButton = _G["TempEnchant"..numEnchants]
      end
      if numEnchants > 0 then
        aboveButton = TempEnchant1
      end
      --loop on all active buff buttons
      local buffCounter = 0
      for index = 1, numBuffs do
        local button = _G[buttonName..index]
        if not button then return end
        if not button.consolidated then
          --apply skin
          if not button.styled then applySkin(button) end
        end
      end
      --calculate the height of the buff rows for the debuff frame calculation later
      local rows = ceil((buffCounter+offset)/Abconfig.buffFrame.buttonsPerRow)
      local height = Abconfig.buffFrame.button.size*rows + Abconfig.buffFrame.rowSpacing*rows + Abconfig.buffFrame.gap*min(1,rows)
      buffFrameHeight = height
      --make sure the debuff frames update the position asap
      if DebuffButton1 and Abconfig.combineBuffsAndDebuffs then    
        updateDebuffAnchors("DebuffButton", 1)
      end
    end
    --temp enchant stuff
    applySkin(TempEnchant1)
    applySkin(TempEnchant2)
    applySkin(TempEnchant3)
    --position the temp enchant buttons
    if (GetWoWVersion <= 90500) then
      --hook Blizzard functions
      hooksecurefunc("BuffFrame_UpdateAllBuffAnchors", updateAllBuffAnchors)
      hooksecurefunc("DebuffButton_UpdateAnchors", updateDebuffAnchors)
    end
  else
    return nil
  end
  --End
end

-- Init
local f = CreateFrame("Frame")
f:SetSize(50, 50)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, ...)
  if not AbyssUIAddonSettings then
    AbyssUIAddonSettings = {}
  end
  IconThemeInit()
  IconBackInit()
  DefaultInit()
end)