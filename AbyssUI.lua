--------------------------------------------------------------------------------
-- Author: SirMarklan
--
-- BFA Version
--
-- Hope you like my addOn ^^
--
-- Minimalist UI for World of Warcraft
--------------------------------------------------------------------------------

-- DarkerUI (Need Texture Pack eg. Santa Texture Pack)

local frame=CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")

frame:SetScript("OnEvent", function(self, event, addon)
    if (addon == "Blizzard_TimeManager") then
        for i, v in pairs({PlayerFrameTexture, TargetFrameTextureFrameTexture, PetFrameTexture, PartyMemberFrame1Texture, PartyMemberFrame2Texture, PartyMemberFrame3Texture, PartyMemberFrame4Texture,
            PartyMemberFrame1PetFrameTexture, PartyMemberFrame2PetFrameTexture, PartyMemberFrame3PetFrameTexture, PartyMemberFrame4PetFrameTexture, FocusFrameTextureFrameTexture,
            TargetFrameToTTextureFrameTexture, FocusFrameToTTextureFrameTexture, BonusActionBarFrameTexture0, BonusActionBarFrameTexture1, BonusActionBarFrameTexture2, BonusActionBarFrameTexture3,
            BonusActionBarFrameTexture4, MainMenuBarTexture0, MainMenuBarTexture1, MainMenuBarTexture2, MainMenuBarTexture3, MainMenuMaxLevelBar0, MainMenuMaxLevelBar1, MainMenuMaxLevelBar2,
            MainMenuMaxLevelBar3, MinimapBorder, CastingBarFrameBorder, FocusFrameSpellBarBorder, TargetFrameSpellBarBorder, MiniMapTrackingButtonBorder, MiniMapLFGFrameBorder, MiniMapBattlefieldBorder,
            MiniMapMailBorder, MinimapBorderTop,
            select(1, TimeManagerClockButton:GetRegions())
        }) do
            v:SetVertexColor(.4, .4, .4)
        end

        for i,v in pairs({ select(2, TimeManagerClockButton:GetRegions()) }) do
            v:SetVertexColor(1, 1, 1)
        end

        self:UnregisterEvent("ADDON_LOADED")
        frame:SetScript("OnEvent", nil)
    end
end)

for i, v in pairs({ MainMenuBarLeftEndCap, MainMenuBarRightEndCap }) do
    v:SetVertexColor(.35, .35, .35)
end


-- Class Icons (Need Flat Icons or some Texture Pack)

hooksecurefunc("UnitFramePortrait_Update",function(self)
    if self.portrait then
        if UnitIsPlayer(self.unit) then
            local t = CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))]
            if t then
                self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
                self.portrait:SetTexCoord(unpack(t))
            end
        else
            self.portrait:SetTexCoord(0,1,0,1)
        end
    end
end)


-- Class HP Colours

local function colour(statusbar, unit)
    local _, class, c
    if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
        _, class = UnitClass(unit)
        c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
        statusbar:SetStatusBarColor(c.r, c.g, c.b)
        --PlayerFrameHealthBar:SetStatusBarColor(0,1,0)
    end
end

hooksecurefunc("UnitFrameHealthBar_Update", colour)
hooksecurefunc("HealthBar_OnValueChanged", function(self)
    colour(self, self.unit)
end)


-- Class colours on players names

local frame = CreateFrame("FRAME")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
frame:RegisterEvent("UNIT_FACTION")

local function eventHandler(self, event, ...)
    if UnitIsPlayer("target") then
        c = RAID_CLASS_COLORS[select(2, UnitClass("target"))]
        TargetFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
    end
    if UnitIsPlayer("focus") then
        c = RAID_CLASS_COLORS[select(2, UnitClass("focus"))]
        FocusFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
    end
end

frame:SetScript("OnEvent", eventHandler)

for _, BarTextures in pairs({TargetFrameNameBackground, FocusFrameNameBackground}) do
    BarTextures:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
end


-- Text round values

hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", function()
    PlayerFrameHealthBar.TextString:SetText(AbbreviateLargeNumbers(UnitHealth("player")))
    --PlayerFrameManaBar.TextString:SetText(AbbreviateLargeNumbers(UnitMana("player")))

    TargetFrameHealthBar.TextString:SetText(AbbreviateLargeNumbers(UnitHealth("target")))
    --TargetFrameManaBar.TextString:SetText(AbbreviateLargeNumbers(UnitMana("target")))

    FocusFrameHealthBar.TextString:SetText(AbbreviateLargeNumbers(UnitHealth("focus")))
    --FocusFrameManaBar.TextString:SetText(AbbreviateLargeNumbers(UnitMana("focus")))
end)


--[[ Gryphons hide

MainMenuBarLeftEndCap:Hide()
MainMenuBarRightEndCap:Hide()
]]

-- Cast timer text

CastingBarFrame.timer = CastingBarFrame:CreateFontString(nil);
CastingBarFrame.timer:SetFont(STANDARD_TEXT_FONT,12,"OUTLINE");
CastingBarFrame.timer:SetPoint("TOP", CastingBarFrame, "BOTTOM", 0, 0);
CastingBarFrame.update = .1;

hooksecurefunc("CastingBarFrame_OnUpdate", function(self, elapsed)
    if not self.timer then return end
    if self.update and self.update < elapsed then
        if self.casting then
            self.timer:SetText(format("%2.1f/%1.1f", max(self.maxValue - self.value, 0), self.maxValue))
        elseif self.channeling then
            self.timer:SetText(format("%.1f", max(self.value, 0)))
        else
            self.timer:SetText("")
        end
        self.update = .1
    else
        self.update = self.update - elapsed
    end
end)


-- Minimap  plus things (tweaks)

MinimapZoomIn:Hide()
MinimapZoomOut:Hide()
Minimap:EnableMouseWheel(true)
Minimap:SetScript('OnMouseWheel', function(self, delta)
    if delta > 0 then
        Minimap_ZoomIn()
    else
        Minimap_ZoomOut()
    end
end)
MiniMapTracking:ClearAllPoints()
MiniMapTracking:SetPoint("TOPRIGHT", -26, 7)


-- Disable spam healing over player frame

PlayerHitIndicator:SetText(nil)
PlayerHitIndicator.SetText = function() end

PetHitIndicator:SetText(nil)
PetHitIndicator.SetText = function() end
