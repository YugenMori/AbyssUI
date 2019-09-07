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
local resting = IsResting()
	if ( AbyssUIAddonSettings.FadeUI == true ) then
		if ( event == "PLAYER_REGEN_DISABLED" ) then
			for i, v in pairs ({
				PlayerFrame,
				TargetFrame,
				BuffFrame,
				QuestWatchFrame,
				GeneralDockManager,
				ChatFrameMenuButton,
				ChatFrameChannelButton,
				MainMenuBar,
			}) do
				UIFrameFadeIn(v, 1, 1, 1)
			end
		elseif ( (event == "PLAYER_REGEN_ENABLED" or "PLAYER_ENTERING_WORLD")  and resting ~= true ) then
			for i, v in pairs ({
				PlayerFrame,
				TargetFrame,
				BuffFrame,
				QuestWatchFrame,
				GeneralDockManager,
				ChatFrameMenuButton,
				ChatFrameChannelButton,
				MainMenuBar,
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


