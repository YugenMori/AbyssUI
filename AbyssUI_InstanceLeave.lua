-- Author: Yugen
--
-- Shadowlands
--
-- Simple Frame to leave instances for AbyssUI
--------------------------------------------------------------------------------
local AbyssUI_InstanceLeave_DynamicFrame = CreateFrame("Frame", "$parentAbyssUI_InstanceLeave_DynamicFrame", UIParent)
AbyssUI_InstanceLeave_DynamicFrame:SetClampedToScreen(true)
AbyssUI_InstanceLeave_DynamicFrame:SetMovable(true)
AbyssUI_InstanceLeave_DynamicFrame:EnableMouse(true)
AbyssUI_InstanceLeave_DynamicFrame:SetWidth(360)
AbyssUI_InstanceLeave_DynamicFrame:SetHeight(120)
AbyssUI_InstanceLeave_DynamicFrame:RegisterForDrag("LeftButton")
AbyssUI_InstanceLeave_DynamicFrame:SetFrameLevel(300)
AbyssUI_InstanceLeave_DynamicFrame:SetFrameStrata("HIGH")
AbyssUI_InstanceLeave_DynamicFrame:SetPoint("CENTER", 0, -140)
AbyssUI_InstanceLeave_DynamicFrame.text = AbyssUI_InstanceLeave_DynamicFrame.text or AbyssUI_InstanceLeave_DynamicFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUI_InstanceLeave_DynamicFrame.text:SetAllPoints(true)
AbyssUI_InstanceLeave_DynamicFrame.text:SetJustifyH("CENTER")
AbyssUI_InstanceLeave_DynamicFrame.text:SetJustifyV("CENTER")
AbyssUI_InstanceLeave_DynamicFrame.text:SetText("This instance is completed! Want to leave?")
AbyssUI_InstanceLeave_DynamicFrame.text:SetFont("Fonts\\FRIZQT__.TTF", 16, "THICKOUTLINE")
AbyssUI_InstanceLeave_DynamicFrame:Hide()
AbyssUI_InstanceLeave_DynamicFrame:SetScript("OnDragStart", AbyssUI_InstanceLeave_DynamicFrame.StartMoving)
AbyssUI_InstanceLeave_DynamicFrame:SetScript("OnDragStop", AbyssUI_InstanceLeave_DynamicFrame.StopMovingOrSizing)
--[[
AbyssUI_InstanceLeave_DynamicFrame:SetScript("OnDragStop", function(self)
  self:StopMovingOrSizing()
  settings.XPos = self:GetLeft()
  settings.YPos = self:GetBottom()
end)


AbyssUI_InstanceLeave_DynamicFrame:RegisterEvent("PLAYER_LOGIN")
AbyssUI_InstanceLeave_DynamicFrame:SetScript("OnEvent", function(self, event, ...)
  if event == "PLAYER_LOGIN" then
    InstanceLeavePerSettings = InstanceLeavePerSettings or {} -- create table if one doesn't exist
    settings = InstanceLeavePerSettings -- assign settings declared above
    if settings.XPos then
      AbyssUI_InstanceLeave_DynamicFrame:ClearAllPoints()
      AbyssUI_InstanceLeave_DynamicFrame:SetPoint("BOTTOMLEFT", settings.XPos, settings.YPos)
    end
  end
end)
--]]
-- Border --
local LeaveBorder = AbyssUI_InstanceLeave_DynamicFrame:CreateTexture(nil, "BACKGROUND")
LeaveBorder:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
LeaveBorder:SetPoint("TOPLEFT", -3, 3)
LeaveBorder:SetPoint("BOTTOMRIGHT", 3, -3)
LeaveBorder:SetVertexColor(0.2, 0.2, 0.2, 0.6)

local BorderBody = AbyssUI_InstanceLeave_DynamicFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUI_InstanceLeave_DynamicFrame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)

-- Texture --
local Texture = AbyssUI_InstanceLeave_DynamicFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUI_InstanceLeave_DynamicFrame)
AbyssUI_InstanceLeave_DynamicFrame.texture = Texture

-- Button --
local FrameButton = CreateFrame("Button","$parentFrameButton", AbyssUI_InstanceLeave_DynamicFrame, "UIPanelButtonTemplate")
FrameButton:SetHeight(24)
FrameButton:SetWidth(70)
FrameButton:SetPoint("BOTTOM", AbyssUI_InstanceLeave_DynamicFrame, "BOTTOM", -100, 10)
FrameButton:SetText("Leave")
FrameButton:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")

local BorderButton = FrameButton:CreateTexture(nil, "ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButton)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)

FrameButton:SetScript("OnClick", function()
	local isDg = IsInLFGDungeon()
	local isComplete = IsLFGComplete()
	local isPt = IsInGroup()
	local isLFG = IsPartyLFG()
	if ( isComplete and isDg and isPt ) then 
		LeaveParty() 
		LeaveBattlefield() 
		UIFrameFadeIn(AbyssUI_InstanceLeave_DynamicFrame, 1, 1, 0)
		C_Timer.After(2, function()
			AbyssUI_InstanceLeave_DynamicFrame:Hide()
	    end)
	elseif ( not isDg and not isLFG and not isPt ) then 
		UIFrameFadeIn(AbyssUI_InstanceLeave_DynamicFrame, 1, 1, 0)
		C_Timer.After(2, function()
			AbyssUI_InstanceLeave_DynamicFrame:Hide()
	    end)
	elseif ( isComplete and not isDg and isPt ) then 
		LeaveParty() 
		LeaveBattlefield() 
		UIFrameFadeIn(AbyssUI_InstanceLeave_DynamicFrame, 1, 1, 0)
		C_Timer.After(2, function()
			AbyssUI_InstanceLeave_DynamicFrame:Hide()
	    end)
	else
		UIFrameFadeIn(AbyssUI_InstanceLeave_DynamicFrame, 1, 1, 0)
		C_Timer.After(2, function()
			AbyssUI_InstanceLeave_DynamicFrame:Hide()
	    end)
	end
end)

local FrameButton = CreateFrame("Button","$parentFrameButton", AbyssUI_InstanceLeave_DynamicFrame, "UIPanelButtonTemplate")
FrameButton:SetHeight(24)
FrameButton:SetWidth(70)
FrameButton:SetPoint("BOTTOM", AbyssUI_InstanceLeave_DynamicFrame, "BOTTOM", 0, 10)
FrameButton:SetText("Teleport")
FrameButton:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")

local BorderButton = FrameButton:CreateTexture(nil, "ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButton)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)

FrameButton:SetScript("OnClick", function()
	local isDg = IsInLFGDungeon()
	local isPt = IsInGroup()
	local isLFG = IsPartyLFG()
	if ( isDg and isLFG and isPt ) then LFGTeleport(isDg)
	elseif ( isLFG and isPt and not isDg ) then LFGTeleport(isDg)
	elseif ( not isDg and not isLFG and not isPt ) then AbyssUI_InstanceLeave_DynamicFrame:Hide()
	else
		AbyssUI_InstanceLeave_DynamicFrame:Hide()
	end
end)

local FrameButton = CreateFrame("Button","$parentFrameButton", AbyssUI_InstanceLeave_DynamicFrame, "UIPanelButtonTemplate")
FrameButton:SetHeight(24)
FrameButton:SetWidth(70)
FrameButton:SetPoint("BOTTOM", AbyssUI_InstanceLeave_DynamicFrame, "BOTTOM", 100, 10)
FrameButton:SetText("Close")
FrameButton:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")

local BorderButton = FrameButton:CreateTexture(nil, "ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButton)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)

FrameButton:SetScript("OnClick", function()
	AbyssUI_InstanceLeave_DynamicFrame:Hide()
end)

-- DynamicFrame --
local frame = CreateFrame("Frame", "$parentFrame", nil)
frame:RegisterEvent("LFG_COMPLETION_REWARD")
frame:SetScript("OnEvent", function(self, event)
	if ( event == "LFG_COMPLETION_REWARD" and AbyssUIAddonSettings.ExtraFunctionInstanceLeave == true ) then
		UIFrameFadeIn(AbyssUI_InstanceLeave_DynamicFrame, 1, 0, 1)
	else 
		return nil
	end
end)
-- End
