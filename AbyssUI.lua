-- Author: Yugen
--
-- Battle for Azeroth
--
-- Hope you like my addOn ^^
--
-- Dark Minimalist UI for World of Warcraft
--------------------------------------------------------------------------------

--------------------------------------------------------------
-- DarkerUI Core (Need Texture Pack e.g Santa Texture Pack) --
--------------------------------------------------------------

local frame1 = CreateFrame("Frame")
frame1:RegisterEvent("ADDON_LOADED")
frame1:SetScript("OnEvent", function(self, event, addon)
	if (addon == "AbyssUI") then
		for i, v in pairs({	PlayerFrameTexture,
			TargetFrameTextureFrameTexture,
			PetFrameTexture,
			PartyMemberFrame1Texture,
			PartyMemberFrame2Texture,
			PartyMemberFrame3Texture,
			PartyMemberFrame4Texture,
			PartyMemberFrame1PetFrameTexture,
			PartyMemberFrame2PetFrameTexture,
			PartyMemberFrame3PetFrameTexture,
			PartyMemberFrame4PetFrameTexture,
			FocusFrameTextureFrameTexture,
			TargetFrameToTTextureFrameTexture,
			FocusFrameToTTextureFrameTexture,
			BonusActionBarFrameTexture0,
			BonusActionBarFrameTexture1,
			BonusActionBarFrameTexture2,
			BonusActionBarFrameTexture3,
			BonusActionBarFrameTexture4,
			MainMenuBarTexture0,
			MainMenuBarTexture1,
			MainMenuBarTexture2,
			MainMenuBarTexture3,
			MainMenuMaxLevelBar0,
			MainMenuMaxLevelBar1,
			MainMenuMaxLevelBar2,
			MainMenuMaxLevelBar3,
			MinimapBorder,
			CastingBarFrameBorder,
			FocusFrameSpellBarBorder,
			TargetFrameSpellBarBorder,
			MiniMapTrackingButtonBorder,
			MiniMapLFGFrameBorder,
			MiniMapBattlefieldBorder,
			MiniMapMailBorder,
			MiniMapBorderTop, }) do
			MiniMapWorldMapButton:SetAlpha(0.3)
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.35, .35, .35)
				end
			else
				return nil
			end
		end
		self:UnregisterEvent("ADDON_LOADED")
		frame1:SetScript("OnEvent", nil)
	end
end)

------------------------- New Darker Parts -------------------------

-- New Interface Action Bar
local NewFrames = CreateFrame("Frame")
NewFrames:RegisterEvent("ADDON_LOADED")
NewFrames:SetScript("OnEvent", function(self, event, addon)
	if (addon == "AbyssUI") then
		for i, v in pairs({ MainMenuBarArtFrame.LeftEndCap,
			MainMenuBarArtFrame.RightEndCap,
			MainMenuBarArtFrameBackground.BackgroundSmall,
			MainMenuBarArtFrameBackground.BackgroundLarge, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.5, .5, .5)
				end
			else
				return nil
			end
		end
		-- Character
		for i, v in pairs({ 	CharacterFrame.NineSlice.RightEdge,
			CharacterFrame.NineSlice.LeftEdge,
			CharacterFrame.NineSlice.TopEdge,
			CharacterFrame.NineSlice.BottomEdge,
			CharacterFrame.NineSlice.PortraitFrame,
			CharacterFrame.NineSlice.TopRightCorner,
			CharacterFrame.NineSlice.TopLeftCorner,
			CharacterFrame.NineSlice.BottomLeftCorner,
			CharacterFrame.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- SpellBook
		for i, v in pairs({ SpellBookFrame.NineSlice.TopEdge,
			SpellBookFrame.NineSlice.RightEdge,
			SpellBookFrame.NineSlice.LeftEdge,
			SpellBookFrame.NineSlice.TopEdge,
			SpellBookFrame.NineSlice.BottomEdge,
			SpellBookFrame.NineSlice.PortraitFrame,
			SpellBookFrame.NineSlice.TopRightCorner,
			SpellBookFrame.NineSlice.TopLeftCorner,
			SpellBookFrame.NineSlice.BottomLeftCorner,
			SpellBookFrame.NineSlice.BottomRightCorner,
		 	SpellBookFrameInset.NineSlice.BottomEdge,
			SpellBookFrameInset.NineSlice.BottomLeftCorner,	}) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- PvE/Pvp
		for i, v in pairs({ PVEFrame.NineSlice.TopEdge,
		PVEFrame.NineSlice.TopRightCorner,
		PVEFrame.NineSlice.RightEdge,
		PVEFrame.NineSlice.BottomRightCorner,
		PVEFrame.NineSlice.BottomEdge,
		PVEFrame.NineSlice.BottomLeftCorner,
		PVEFrame.NineSlice.LeftEdge,
		PVEFrame.NineSlice.TopLeftCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- Friends
		for i, v in pairs({ FriendsFrame.NineSlice.TopEdge,
			FriendsFrame.NineSlice.TopEdge,
			FriendsFrame.NineSlice.TopRightCorner,
			FriendsFrame.NineSlice.RightEdge,
			FriendsFrame.NineSlice.BottomRightCorner,
			FriendsFrame.NineSlice.BottomEdge,
			FriendsFrame.NineSlice.BottomLeftCorner,
			FriendsFrame.NineSlice.LeftEdge,
			FriendsFrame.NineSlice.TopLeftCorner,
			FriendsFrameInset.NineSlice.BottomEdge,
			FriendsFrameInset.NineSlice.BottomLeftCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- Map
		for i, v in pairs({ WorldMapFrame.BorderFrame.NineSlice.TopEdge,
			WorldMapFrame.BorderFrame.NineSlice.TopEdge,
			WorldMapFrame.BorderFrame.NineSlice.TopEdge,
			WorldMapFrame.BorderFrame.NineSlice.TopRightCorner,
			WorldMapFrame.BorderFrame.NineSlice.RightEdge,
			WorldMapFrame.BorderFrame.NineSlice.BottomRightCorner,
			WorldMapFrame.BorderFrame.NineSlice.BottomEdge,
			WorldMapFrame.BorderFrame.NineSlice.BottomLeftCorner,
			WorldMapFrame.BorderFrame.NineSlice.LeftEdge,
			WorldMapFrame.BorderFrame.NineSlice.TopLeftCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- Channels
		for i, v in pairs({ ChannelFrame.NineSlice.TopEdge,
			ChannelFrame.NineSlice.TopEdge,
			ChannelFrame.NineSlice.TopRightCorner,
			ChannelFrame.NineSlice.RightEdge,
			ChannelFrame.NineSlice.BottomRightCorner,
			ChannelFrame.NineSlice.BottomEdge,
			ChannelFrame.NineSlice.BottomLeftCorner,
			ChannelFrame.NineSlice.LeftEdge,
			ChannelFrame.NineSlice.TopLeftCorner,
			ChannelFrame.LeftInset.NineSlice.BottomEdge,
			ChannelFrame.LeftInset.NineSlice.BottomLeftCorner,
			ChannelFrame.LeftInset.NineSlice.BottomRightCorner,
			ChannelFrame.RightInset.NineSlice.BottomEdge,
			ChannelFrame.RightInset.NineSlice.BottomLeftCorner,
			ChannelFrame.RightInset.NineSlice.BottomRightCorner,
			ChannelFrameInset.NineSlice.BottomEdge,
			ChannelFrameInset.NineSlice.BottomLeftCorner,	}) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- Chat
		for i, v in pairs({ ChatFrame1EditBoxLeft,
			ChatFrame1EditBoxRight,
			ChatFrame1EditBoxMid,
			ChatFrame2EditBoxLeft,
			ChatFrame2EditBoxRight,
			ChatFrame2EditBoxMid,
			ChatFrame3EditBoxLeft,
			ChatFrame3EditBoxRight,
			ChatFrame3EditBoxMid,
			ChatFrame4EditBoxLeft,
			ChatFrame4EditBoxRight,
			ChatFrame4EditBoxMid,
			ChatFrame5EditBoxLeft,
			ChatFrame5EditBoxRight,
			ChatFrame5EditBoxMid,
			ChatFrame6EditBoxLeft,
			ChatFrame6EditBoxRight,
			ChatFrame6EditBoxMid,
			ChatFrame7EditBoxLeft,
			ChatFrame7EditBoxRight,
			ChatFrame7EditBoxMid,	}) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- StatusBar (ExpBar)
		for i, v in pairs({ StatusTrackingBarManager.SingleBarLarge,
			StatusTrackingBarManager.SingleBarSmall,
			StatusTrackingBarManager.SingleBarLargeUpper,
			StatusTrackingBarManager.SingleBarSmallUpper,	}) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- Mail
		for i, v in pairs({ MailFrame.NineSlice.TopEdge,
			MailFrame.NineSlice.TopRightCorner,
			MailFrame.NineSlice.RightEdge,
			MailFrame.NineSlice.BottomRightCorner,
			MailFrame.NineSlice.BottomEdge,
			MailFrame.NineSlice.BottomLeftCorner,
			MailFrame.NineSlice.LeftEdge,
			MailFrame.NineSlice.TopLeftCorner,
			MailFrameInset.NineSlice.BottomEdge,	}) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- Merchant
		for i, v in pairs({ MerchantFrame.NineSlice.TopEdge,
			MerchantFrame.NineSlice.RightEdge,
			MerchantFrame.NineSlice.BottomEdge,
			MerchantFrame.NineSlice.LeftEdge,
			MerchantFrame.NineSlice.TopRightCorner,
			MerchantFrame.NineSlice.TopLeftCorner,
			MerchantFrame.NineSlice.BottomLeftCorner,
			MerchantFrame.NineSlice.BottomRightCorner,	}) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- Gossip (e.g NPC dialog frame and interactions)
		for i, v in pairs({ GossipFrame.NineSlice.TopEdge,
			GossipFrame.NineSlice.RightEdge,
			GossipFrame.NineSlice.BottomEdge,
			GossipFrame.NineSlice.LeftEdge,
			GossipFrame.NineSlice.TopRightCorner,
			GossipFrame.NineSlice.TopLeftCorner,
			GossipFrame.NineSlice.BottomLeftCorner,
			GossipFrame.NineSlice.BottomRightCorner,
		 	GossipFrameInset.NineSlice.BottomEdge,	}) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- Bank
		for i, v in pairs({ BankFrame.NineSlice.TopEdge,
			BankFrame.NineSlice.RightEdge,
			BankFrame.NineSlice.BottomEdge,
			BankFrame.NineSlice.LeftEdge,
			BankFrame.NineSlice.TopRightCorner,
			BankFrame.NineSlice.TopLeftCorner,
			BankFrame.NineSlice.BottomLeftCorner,
			BankFrame.NineSlice.BottomRightCorner,	}) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- Quest
		for i, v in pairs({ QuestFrame.NineSlice.TopEdge,
			QuestFrame.NineSlice.RightEdge,
			QuestFrame.NineSlice.BottomEdge,
			QuestFrame.NineSlice.LeftEdge,
			QuestFrame.NineSlice.TopRightCorner,
			QuestFrame.NineSlice.TopLeftCorner,
			QuestFrame.NineSlice.BottomLeftCorner,
			QuestFrame.NineSlice.BottomRightCorner,
			QuestFrameInset.NineSlice.BottomEdge, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- Taxi
		for i, v in pairs({ TaxiFrame.TopBorder,
			TaxiFrame.RightBorder,
			TaxiFrame.BottomBorder,
			TaxiFrame.LeftBorder,
			TaxiFrame.TopRightCorner,
			TaxiFrame.TopLeftCorner,
			TaxiFrame.BtnCornerLeft,
			TaxiFrame.BtnCornerRight,
			TaxiFrame.BotLeftCorner,
			TaxiFrame.BotRightCorner,
			TaxiFrame.InsetBorderBottom,
			TaxiFrame.InsetBorderBottomLeft,
			TaxiFrame.InsetBorderLeft,
		 	TaxiFrame.InsetBorderBottomRight, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- Micro Menu and Bag Bar
		for i, v in pairs({ MicroButtonAndBagsBar.MicroBagBar, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- StanceBar
		for i, v in pairs({ StanceBarLeft,
			StanceBarMiddle,
			StanceBarRight, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- DressUP
		for i, v in pairs({ DressUpFrameTopBorder,
			DressUpFrameRightBorder,
			DressUpFrameBottomBorder,
			DressUpFrameLeftBorder,
			DressUpFramePortraitFrame,
			DressUpFrameTopRightCorner,
			DressUpFrameBtnCornerLeft,
			DressUpFrameBtnCornerRight,
			DressUpFrameBotLeftCorner,
			DressUpFrameBotRightCorner,
		 	DressUpFrameButtonBottomBorder,
		 	DressUpFrameInsetInsetBottomBorder, }) do
			MaximizeMinimizeFrame:SetAlpha(0.3)
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- WorldStateScoreFrame
		for i, v in pairs({ WorldStateScoreFrameTopBorder,
			WorldStateScoreFrameTopRightCorner,
			WorldStateScoreFrameRightBorder,
		 	WorldStateScoreFrameBotRightCorner,
			WorldStateScoreFrameBottomBorder,
		 	WorldStateScoreFrameBotLeftBorder,
			WorldStateScoreFrameLeftBorder,
			WorldStateScoreFrameTopLeftCorner,
			WorldStateScoreFrameBotLeftCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
		-- End
		self:UnregisterEvent("ADDON_LOADED")
		NewFrames:SetScript("OnEvent", nil)
	end
end)
----------------------------------------------------


-------------- Frames that need a load to work properly --------------
-- Specialization
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
		if name == "Blizzard_TalentUI" then
			for i, v in pairs({ PlayerTalentFrameTopBorder,
				PlayerTalentFrameRightBorder,
				PlayerTalentFrameLeftBorder,
				PlayerTalentFrameBottomBorder,
				PlayerTalentFramePortraitFrame,
				PlayerTalentFrameTopRightCorner,
				PlayerTalentFrameBtnCornerLeft,
				PlayerTalentFrameBtnCornerRight,
				PlayerTalentFrameBotLeftCorner,
				PlayerTalentFrameBotRightCorner,
				PlayerTalentFrameButtonBottomBorder,
				PlayerTalentFrameInsetInsetBottomBorder, }) do
				if AbyssUIAddonSettings ~= nil then
					if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
						v:SetVertexColor(1, 1, 1)
					elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
						v:SetVertexColor(.01, .01, .01)
					elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
						v:SetVertexColor(182/255, 42/255, 37/255)
					elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
						v:SetVertexColor(236/255, 193/255, 60/255)
					elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
						v:SetVertexColor(196/255, 31/255, 59/255)
					elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
						v:SetVertexColor(163/255, 48/255, 201/255)
					elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
						v:SetVertexColor(255/255, 125/255, 10/255)
					elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
						v:SetVertexColor(171/255, 212/255, 115/255)
					elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
						v:SetVertexColor(64/255, 199/255, 235/255)
					elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
						v:SetVertexColor(0/255, 255/255, 150/255)
					elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
						v:SetVertexColor(245/255, 140/255, 186/255)
					elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
						v:SetVertexColor(255/255, 255/255, 255/255)
					elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
						v:SetVertexColor(255/255, 245/255, 105/255)
					elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
						v:SetVertexColor(0/255, 112/255, 222/255)
					elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
						v:SetVertexColor(135/255, 135/255, 237/255)
					elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
						v:SetVertexColor(199/255, 156/255, 110/255)
					else
						v:SetVertexColor(.4, .4, .4)
					end
				else
					return nil
				end
			end
		end
end)
-- Collections
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" then
		for i, v in pairs({ CollectionsJournalTopBorder,
			CollectionsJournalRightBorder,
			CollectionsJournalLeftBorder,
			CollectionsJounalBottomBorder,
			CollectionsJournalPortraitFrame,
			CollectionsJournalTopRightCorner,
			CollectionsJournalBotLeftCorner,
			CollectionsJournalBotRightCorner,
			CollectionsJournalParentFrameBtnCornerRight,
			CollectionsJournalBottomBorder,
		 	MountJournalInsetBottomBorder,
			MountJournalInsetBotLeftCorner,
			MountJournalInsetBotRightCorner,
			PetJournalLeftInsetInsetBottomBorder,
			PetJournalRightInsetInsetBottomBorder,
			PetJournalLeftInsetInsetBotLeftCorner,
		 	PetJournalLeftInsetInsetBotRightCorner,
			PetJournalRightInsetInsetBotLeftCorner,
			PetJournalRightInsetInsetBotRightCorner,
		 	ToyBoxInsetBottomBorder,
			ToyBoxInsetLeftBorder,
			ToyBoxInsetBotLeftCorner,
			ToyBoxInsetBotRightCorner,
			HeirloomsJournalInsetBottomBorder,
			HeirloomsJournalInsetLeftBorder,
			HeirloomsJournalInsetBotLeftCorner,
			HeirloomsJournalInsetBotRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- Honor (Extra from PVE)
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_PVPUI" then
		for i, v in pairs({ HonorFrameInsetBottomBorder,
			HonorFrameInsetBotLeftCorner,
			HonorFrameInsetBotRightCorner,
			HonorFrameInsetLeftBorder,
			PVPQueueFrameInsetBottomBorder,
			PVPQueueFrameInsetBotLeftCorner,
			PVPQueueFrameInsetBotRightCorner,
			ConquestFrameInsetBottomBorder,
			ConquestFrameInsetLeftBorder,
			ConquestFrameInsetBotLeftCorner,
			ConquestFrameInsetBotRightCorner,
			LFGListFrameInsetLeftBorder,
		 	LFGListFrameInsetBotRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- AdventureGuide
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_EncounterJournal" then
		for i, v in pairs({ EncounterJournalTopBorder,
			EncounterJournalRightBorder,
			EncounterJournalLeftBorder,
			EncounterJournalBottomBorder,
			EncounterJournalPortraitFrame,
			EncounterJournalTopRightCorner,
			EncounterJournalBtnCornerLeft,
			EncounterJournalBtnCornerRight,
			EncounterJournalBotLeftCorner,
			EncounterJournalBotRightCorner,
		 	EncounterJournalInsetInsetBottomBorder, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- Communities
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Communities" then
		for i, v in pairs({ CommunitiesFrameTopBorder,
			CommunitiesFrameRightBorder,
			CommunitiesFrameBottomBorder,
			CommunitiesFrameLeftBorder,
			CommunitiesFrameTopRightCorner,
			CommunitiesFrameTopLeftCorner,
			CommunitiesFrameBotRightCorner,
			CommunitiesFrameBotLeftCorner,
			CommunitiesFrameBtnCornerLeft,
			CommunitiesFramePortraitFrame,
			CommunitiesFrameBtnCornerRight,
		 	CommunitiesFrameButtonBottomBorder,
			CommunitiesFrameInsetInsetLeftBorder,
		 	CommunitiesFrameInsetInsetBottomBorder,
			CommunitiesFrame.PortraitOverlay.PortraitFrame,
		 	CommunitiesFrameCommunitiesListInsetLeftBorder,
		 	CommunitiesFrameCommunitiesListInsetBottomBorder,
			CommunitiesFrameInsetBottomBorder,
		 	CommunitiesFrameCommunitiesListInsetBotLeftCorner,
			CommunitiesFrameCommunitiesListInsetBotRightCorner,
			CommunitiesFrameInsetBotLeftCorner,
			CommunitiesFrameInsetBotRightCorner,
			CommunitiesFrame.ChatEditBox.Mid,
			CommunitiesFrame.ChatEditBox.Right,
		 	CommunitiesFrame.ChatEditBox.Left,
			CommunitiesFrame.GuildBenefitsFrame.InsetBorderLeft,
		 	CommunitiesFrame.GuildBenefitsFrame.InsetBorderBottomLeft,
			CommunitiesFrame.GuildBenefitsFrame.InsetBorderBottomLeft2,
			CommunitiesFrame.GuildBenefitsFrame.InsetBorderBottomRight,
			CommunitiesFrameGuildDetailsFrame.InsetBorderLeft,
			CommunitiesFrameGuildDetailsFrame.InsetBorderBottomLeft,
			CommunitiesFrameGuildDetailsFrame.InsetBorderBottomLeft2,
			CommunitiesFrameGuildDetailsFrame.InsetBorderBottomRight, }) do
			CommunitiesFrame.MaximizeMinimizeFrame:SetAlpha(0.3)
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- Macro
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_MacroUI" then
		for i, v in pairs({ MacroFrameTopBorder,
			MacroFrameRightBorder,
			MacroFrameBottomBorder,
			MacroFrameLeftBorder,
			MacroFramePortraitFrame,
			MacroFrameBtnCornerLeft,
			MacroFrameBtnCornerRight,
			MacroFrameBotLeftCorner,
			MacroFrameBotRightCorner,
		 	MacroFrameButtonBottomBorder,
			MacroFrameInsetInsetBottomBorder,
			MacroFrameTopRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- AuctionHouse
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AuctionUI" then
		for i, v in pairs({ AuctionFrameTop, AuctionFrameTopLeft, AuctionFrameTopRight,
			AuctionFrameBot, AuctionFrameBotLeft, AuctionFrameBotRight, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- FlightMap
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_FlightMap" then
		for i, v in pairs({ FlightMapFrameTopBorder,
			FlightMapFrameRightBorder,
			FlightMapFrameBottomBorder,
			FlightMapFrameLeftBorder,
			FlightMapFramePortraitFrame,
			FlightMapFrameTopRightCorner,
			FlightMapFrameBtnCornerLeft,
			FlightMapFrameBtnCornerRight,
			FlightMapFrameBotLeftCorner,
			FlightMapFrameBotRightCorner,	}) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- TradeSkill
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TradeSkillUI" then
		for i, v in pairs({ TradeSkillFrameTopBorder,
			TradeSkillFrameRightBorder,
			TradeSkillFrameBottomBorder,
			TradeSkillFrameLeftBorder,
			TradeSkillFramePortraitFrame,
			TradeSkillFrameTopRightCorner,
			TradeSkillFrameBtnCornerLeft,
			TradeSkillFrameBtnCornerRight,
			TradeSkillFrameBotLeftCorner,
			TradeSkillFrameBotRightCorner,
		 	TradeSkillFrameInsetBottomBorder,
			TradeSkillFrameInsetBotLeftCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- Inspect
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_InspectUI" then
		for i, v in pairs({ InspectFrameTopBorder,
			InspectFrameRightBorder,
			InspectFrameBottomBorder,
			InspectFrameLeftBorder,
			InspectFramePortraitFrame,
			InspectFrameTopRightCorner,
			InspectFrameBtnCornerLeft,
			InspectFrameBtnCornerRight,
			InspectFrameBotLeftCorner,
			InspectFrameBotRightCorner,
		 	InspectFrameInsetInsetBottomBorder,
			InspectFrameInsetInsetBotLeftCorner,
			InspectFrameInsetInsetBotRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- Wardrobe/Transmogrify (Some parts missing)
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" or name == "Blizzard_Wardrobe" then
		for i, v in pairs({ WardrobeFrameTopBorder,
			WardrobeFrameRightBorder,
			WardrobeFrameBottomBorder,
			WardrobeFrameLeftBorder,
			WardrobeFramePortraitFrame,
			WardrobeFrameTopRightCorner,
			WardrobeFrameBtnCornerLeft,
			WardrobeFrameBtnCornerRight,
			WardrobeFrameBotLeftCorner,
			WardrobeFrameBotRightCorner,
		 	WardrobeTransmogFrameInsetBottomBorder,
			WardrobeTransmogFrameInsetBotLeftCorner,
		  WardrobeTransmogFrameInsetBotRightCorner,
			WardrobeCollectionFrameInsetLeftBorder,
			WardrobeCollectionFrameInsetBottomBorder,
			WardrobeCollectionFrameInsetBotLeftCorner,
			WardrobeCollectionFrameInsetBotRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- ClassTrainer/FlightMaster
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TrainerUI" then
		for i, v in pairs({ ClassTrainerFrameTopBorder,
			ClassTrainerFrameRightBorder,
			ClassTrainerFrameBottomBorder,
			ClassTrainerFrameLeftBorder,
			ClassTrainerFramePortraitFrame,
			ClassTrainerFrameTopRightCorner,
			ClassTrainerFrameBtnCornerLeft,
			ClassTrainerFrameBtnCornerRight,
			ClassTrainerFrameBotLeftCorner,
			ClassTrainerFrameBotRightCorner,
		 	ClassTrainerFrameButtonBottomBorder,
			ClassTrainerFrameBottomInsetInsetBottomBorder, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- Achievement
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AchievementUI" then
		for i, v in pairs({ AchievementFrameHeaderRight,
	 		AchievementFrameHeaderLeft,
			AchievementFrameWoodBorderTopLeft,
			AchievementFrameWoodBorderBottomLeft,
			AchievementFrameWoodBorderTopRight,
			AchievementFrameWoodBorderBottomRight,
		 	AchievementFrameMetalBorderBottom,
			AchievementFrameMetalBorderBottomLeft,
			AchievementFrameMetalBorderBottomRight,
			AchievementFrameMetalBorderLeft,
			AchievementFrameMetalBorderRight,
			AchievementFrameMetalBorderTop,
			AchievementFrameMetalBorderTopLeft,
			AchievementFrameMetalBorderTopRight, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- Azerite
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AzeriteUI" then
		for i, v in pairs({ AzeriteEmpoweredItemUITopBorder,
			AzeriteEmpoweredItemUIRightBorder,
			AzeriteEmpoweredItemUIBottomBorder,
			AzeriteEmpoweredItemUILeftBorder,
			AzeriteEmpoweredItemUIPortraitFrame,
			AzeriteEmpoweredItemUIBotLeftCorner,
			AzeriteEmpoweredItemUIBotRightCorner,
			AzeriteEmpoweredItemUIBotTopRightCorner,
		 	AzeriteEmpoweredItemUITopRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- AlliedRaces
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AlliedRacesUI" then
		for i, v in pairs({ AlliedRacesFrameTopBorder,
			AlliedRacesFrameRightBorder,
			AlliedRacesFrameBottomBorder,
			AlliedRacesFrameLeftBorder,
			AlliedRacesFramePortraitFrame,
			AlliedRacesFrameBotLeftCorner,
			AlliedRacesFrameBotRightCorner,
			AlliedRacesFrameBotTopRightCorner,
		 	AlliedRacesFrameTopRightCorner,
		 	AlliedRacesFrameBtnCornerLeft,
		 	AlliedRacesFrameBtnCornerRight,
			AlliedRacesFrameButtonBottomBorder, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- Inslands
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_IslandsQueueUI" then
		for i, v in pairs({ IslandsQueueFrameTopBorder,
			IslandsQueueFrameRightBorder,
			IslandsQueueFrameBottomBorder,
			IslandsQueueFrameLeftBorder,
			IslandsQueueFramePortraitFrame,
			IslandsQueueFrameTopRightCorner,
			IslandsQueueFrameBtnCornerLeft,
			IslandsQueueFrameBtnCornerRight,
			IslandsQueueFrameBotLeftCorner,
			IslandsQueueFrameBotRightCorner,
		 	IslandsQueueFrame.ArtOverlayFrame.PortraitFrame, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- GarrisonCapacitive
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_GarrisonUI" then
		for i, v in pairs({ GarrisonCapacitiveDisplayFrameTopBorder,
			GarrisonCapacitiveDisplayFrameRightBorder,
			GarrisonCapacitiveDisplayFrameBottomBorder,
			GarrisonCapacitiveDisplayFrameLeftBorder,
			GarrisonCapacitiveDisplayFramePortraitFrame,
			GarrisonCapacitiveDisplayFrameTopRightCorner,
			GarrisonCapacitiveDisplayFrameBtnCornerLeft,
			GarrisonCapacitiveDisplayFrameBtnCornerRight,
			GarrisonCapacitiveDisplayFrameBotLeftCorner,
			GarrisonCapacitiveDisplayFrameBotRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)
-- Calendar
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Calendar" then
		for i, v in pairs({ CalendarFrameTopLeftTexture,
			CalendarFrameTopMiddleTexture,
			CalendarFrameTopRightTexture,
		 	CalendarFrameRightTopTexture,
			CalendarFrameRightMiddleTexture,
			CalendarFrameRightBottomTexture,
			CalendarFrameBottomRightTexture,
			CalendarFrameBottomMiddleTexture,
			CalendarFrameBottomLeftTexture,
			CalendarFrameLeftBottomTexture,
			CalendarFrameLeftMiddleTexture,
			CalendarFrameLeftTopTexture, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
					v:SetVertexColor(1, 1, 1)
				elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
					v:SetVertexColor(.01, .01, .01)
				elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
					v:SetVertexColor(182/255, 42/255, 37/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
					v:SetVertexColor(236/255, 193/255, 60/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
					v:SetVertexColor(196/255, 31/255, 59/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
					v:SetVertexColor(163/255, 48/255, 201/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
					v:SetVertexColor(255/255, 125/255, 10/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
					v:SetVertexColor(171/255, 212/255, 115/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
					v:SetVertexColor(64/255, 199/255, 235/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
					v:SetVertexColor(0/255, 255/255, 150/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
					v:SetVertexColor(245/255, 140/255, 186/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
					v:SetVertexColor(255/255, 255/255, 255/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
					v:SetVertexColor(255/255, 245/255, 105/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
					v:SetVertexColor(0/255, 112/255, 222/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
					v:SetVertexColor(135/255, 135/255, 237/255)
				elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
					v:SetVertexColor(199/255, 156/255, 110/255)
				else
					v:SetVertexColor(.4, .4, .4)
				end
			else
				return nil
			end
		end
	end
end)


----------------------------------------------------


----------------------------- Needs Review -----------------------------
--[[

-- PlayerFrame (not necessary delete in 2 or more patchs)
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "PlayerFrame" then
		for i, v in pairs({ PlayerFrameTexture, }) do
			if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
				v:SetVertexColor(1, 1, 1)
			elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
				v:SetVertexColor(.01, .01, .01)
			elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
				v:SetVertexColor(182/255, 42/255, 37/255)
			elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
				v:SetVertexColor(236/255, 193/255, 60/255)
			else
				v:SetVertexColor(.4, .4, .4)
			end
		end
	end
end)

------------------------------------------------------------------------


------------------------------------------------------------------------
--]]

------- Scripts that need to be tested/fixed or are not used (not trash) -------

--[[
if not AbyssUI.modifyUnitTooltips then
	return
end
--]]

--[[
-- Target Cast Top Frame
 Not Used because its being messy in boss encounters
TargetFrameSpellBar:ClearAllPoints()
TargetFrameSpellBar:SetPoint("BOTTOM", TargetFrame, "TOP", -35, 0)
TargetFrameSpellBar.SetPoint = function() end
----------------------------------------------------
--]]

--[[
--------------------------
-- Tooltip Faction Icon --
--------------------------

-- Faction Frame
FactionFrameIcon = CreateFrame("Button","FrameButton", GameTooltip, "UIPanelButtonTemplate")
FactionFrameIcon:SetHeight(20)
FactionFrameIcon:SetWidth(20)
FactionFrameIcon:SetPoint("BOTTOM", GameTooltip, "BOTTOMRIGHT", -13, 3.8)
FactionFrameIcon:Hide()

GameTooltip:HookScript("OnUpdate", function(GameTooltip)
	if GameTooltipTextLeft3:GetText() == "Horde" or GameTooltipTextLeft4:GetText() == "Horde" then
		FactionFrameIcon:SetNormalTexture("Interface\\ICONS\\pvpcurrency-honor-horde")
		FactionFrameIcon:Show()
	elseif GameTooltipTextLeft3:GetText() == "Alliance" or GameTooltipTextLeft4:GetText() == "Alliance" then
		FactionFrameIcon:SetNormalTexture("Interface\\ICONS\\pvpcurrency-honor-alliance")
		FactionFrameIcon:Show()
	else
		FactionFrameIcon:Hide()
	end
end)
----------------------------------------------------
--]]


-- End
