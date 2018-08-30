-- Author: Abyss_Samurai
--
-- Battle for Azeroth
--
-- Hope you like my addOn ^^
--
-- Dark Minimalist UI for World of Warcraft
--------------------------------------------------------------------------------

-------------------------- Save and Extra Stuff --------------------------

-- AbyssUIFirstFrame
AbyssUIFirstFrame = CreateFrame("Frame", nil, UIParent)
AbyssUIFirstFrame:Hide()
AbyssUIFirstFrame:SetWidth(400)
AbyssUIFirstFrame:SetHeight(140)
AbyssUIFirstFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 200)
AbyssUIFirstFrame:EnableMouse(true)
AbyssUIFirstFrame:SetFrameStrata("HIGH")
AbyssUIFirstFrame.text = AbyssUIFirstFrame.text or AbyssUIFirstFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUIFirstFrame.text:SetScale(1.5)
AbyssUIFirstFrame.text:SetAllPoints(true)
AbyssUIFirstFrame.text:SetJustifyH("CENTER")
AbyssUIFirstFrame.text:SetJustifyV("CENTER")
AbyssUIFirstFrame.text:SetText("Thanks for using |cff0d75d4AbyssUI!|r\nThe |cff5f545eDark|r Blizzard UI revamp.\nCheck my other addons:\nEasyLeave, EasyConfirm and HideonCombat.")
----------------------------------------------------
local AbyssUIBorder = AbyssUIFirstFrame:CreateTexture(nil, "BACKGROUND")
AbyssUIBorder:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
AbyssUIBorder:SetPoint("TOPLEFT", -3, 3)
AbyssUIBorder:SetPoint("BOTTOMRIGHT", 3, -3)
AbyssUIBorder:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUIFirstFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderBody:SetAllPoints(AbyssUIFirstFrame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUIFirstFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
Texture:SetAllPoints(AbyssUIFirstFrame)
AbyssUIFirstFrame.texture = Texture
----------------------------------------------------
local FrameButton = CreateFrame("Button", "FrameButton", AbyssUIFirstFrame, "UIPanelButtonTemplate")
FrameButton:SetHeight(24)
FrameButton:SetWidth(70)
FrameButton:SetPoint("BOTTOM", AbyssUIFirstFrame, "BOTTOM", 0, 10)
FrameButton:SetText("Close")
FrameButton:SetNormalTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
----------------------------------------------------
local BorderButton = FrameButton:CreateTexture(nil, "ARTWORK")
BorderButton:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
BorderButton:SetAllPoints(FrameButton)
BorderButton:SetVertexColor(0.34, 0.34, 0.34, 0.7)
FrameButton:SetScript("OnClick", function()
	AbyssUIFirstFrame:Hide()
end)
----------------------------------------------------

--------------------------------- Save ---------------------------------
local AbyssUISave = CreateFrame("Frame")
AbyssUISave:RegisterEvent("ADDON_LOADED")
AbyssUISave:RegisterEvent("PLAYER_LOGOUT")
AbyssUISave:SetScript("OnEvent", function(self, event, arg1)
	if ( event == "ADDON_LOADED" and arg1 == "AbyssUI" ) then
		if ( AbyssUICount == nil ) then
			AbyssUICount = 0
		end
		if ( AbyssUIProfile == nil ) then
			AbyssUICount = AbyssUICount + 1
				AbyssUIStart()
		else
			local name, elapsed = UnitName("player"), time() - AbyssUIProfile
			C_Timer.After(4, function()
				print("Thanks for using |cff0d75d4AbyssUI!|r The |cff5f545eDark|r Blizzard UI revamp.")
			end)
			C_Timer.After(5, function()
				AbyssUIDailyInfo()
				print("|cffa5f6f3Time since last login: |r" .. name .. " you leave for |cffffcc00" .. SecondsToTime(elapsed) .. "|r")
			end)
			AbyssUIFirstFrame:Hide()
		end
	elseif ( event == "PLAYER_LOGOUT" ) then
		AbyssUIProfile = time()
	end
end)

-- End
