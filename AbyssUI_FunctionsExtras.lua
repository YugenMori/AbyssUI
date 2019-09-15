--------------------------------------------------------------------------------
-- Author: Yugen
--
-- Battle for Azeroth
--
-- Hope you like my addOn ^^
--
-- Extra functions for AbyssUI
--------------------------------------------------------------------------------
-- Fade UI
local FadeUI = CreateFrame("CheckButton", "$parentFadeUI", UIParent, "ChatConfigCheckButtonTemplate")
FadeUI:RegisterEvent("PLAYER_REGEN_DISABLED")
FadeUI:RegisterEvent("PLAYER_REGEN_ENABLED")
FadeUI:RegisterEvent("PLAYER_ENTERING_WORLD")
--FadeUI:RegisterEvent("CURSOR_UPDATE")
FadeUI:SetScript("OnEvent", function(self, event, ...)
	if ( AbyssUIAddonSettings.FadeUI == true ) then
		if ( event == "PLAYER_REGEN_DISABLED" ) then
			for i, v in pairs ({
				BuffFrame,
				QuestWatchFrame,
				GeneralDockManager,
				ChatFrameMenuButton,
				ChatFrameChannelButton,
				MainMenuBar,
				VerticalMultiBarsContainer,
				MultiBarLeft,
			}) do
				UIFrameFadeIn(v, 1, 0, 1)
			end
		elseif ( (event == "PLAYER_REGEN_ENABLED" or "PLAYER_ENTERING_WORLD") ) then
			for i, v in pairs ({
				BuffFrame,
				QuestWatchFrame,
				GeneralDockManager,
				ChatFrameMenuButton,
				ChatFrameChannelButton,
				MainMenuBar,
				VerticalMultiBarsContainer,
				MultiBarLeft,
			}) do
				UIFrameFadeIn(v, 1, 1, 0)
			end
		else
			return nil
		end
	else
		return nil
	end
end)
local FadeUI_MouseOver = CreateFrame("CheckButton", "$parentFadeUI_MouseOver", UIParent, "ChatConfigCheckButtonTemplate")
FadeUI_MouseOver:RegisterEvent("PLAYER_ENTERING_WORLD")
FadeUI_MouseOver:RegisterForClicks("AnyDown")
FadeUI_MouseOver:SetScript("OnEvent", function()
	SetBindingClick("ALT-CTRL-P", FadeUI_MouseOver:GetName())
end)
FadeUI_MouseOver:SetScript("OnClick", function()
	if ( AbyssUIAddonSettings.FadeUI == true ) then
		for i, v in pairs ({
			BuffFrame,
			QuestWatchFrame,
			GeneralDockManager,
			ChatFrameMenuButton,
			ChatFrameChannelButton,
			MainMenuBar,
			VerticalMultiBarsContainer,
			MultiBarLeft,
		}) do
			UIFrameFadeIn(v, 1, 0, 1)
		end
	else
		return nil
	end
end)
----------------------------------------------
-- ActionBar
local f = CreateFrame("Frame", nil, UIParent)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self, event, ...)
	if ( AbyssUIAddonSettings.AbyssUINewActionBar3x12 == true ) then
		-- Straig line
		    local _G = _G
		      for i = 2, 12 do
		        local r = "MultiBarBottomRightButton"
		        local btr = _G[r..i]
		        btr:SetClampedToScreen(true)
		        btr:SetMovable(true)
		        btr:SetUserPlaced(true)
		        btr:ClearAllPoints()
		        btr.ClearAllPoints = function() end
		        btr:SetPoint("LEFT", r..i - 1, "RIGHT", 6, 0)
		      end
		--]]
		for id=13,24 do
			local b = CreateFrame("CheckButton", "ExtraBarButton"..(id-12), UIParent, "ActionBarButtonTemplate")
		      --MultiBarBottomRightButton
			b:SetSize(40*UIParent:GetScale(), 40*UIParent:GetScale())
			b:SetAttribute("action", id)
			b:SetID(id)
			b:SetPoint("CENTER", _G["MultiBarBottomRightButton"..(id-12)], "CENTER", -545, 90)
			b:Show()
		end
	 --PetBar
    PetActionBarFrame.ClearAllPoints = function() end
    PetActionBarFrame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", 0, 45)
    PetActionBarFrame:SetScale(0.85)
    PetActionBarFrame.SetPoint = function() end
    --StanceBar
    StanceBarFrame:ClearAllPoints()
    StanceBarFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 100, 0)
    StanceBarFrame.SetPoint = function() end
    --ExtraBar
    ExtraActionBarFrame.ClearAllPoints = function() end
    ExtraActionBarFrame:SetPoint("BOTTOMRIGHT", MainMenuBar, "BOTTOMRIGHT", 70, 30)
    ExtraActionBarFrame.SetPoint = function() end
    --VehicleBar
    MainMenuBarVehicleLeaveButton.ClearAllPoints = function() end
    MainMenuBarVehicleLeaveButton:SetPoint("TOPLEFT", MainMenuBar, "TOPLEFT", -70, 70)
    MainMenuBarVehicleLeaveButton.SetPoint = function() end
	else
		return nil
	end
end)

--End