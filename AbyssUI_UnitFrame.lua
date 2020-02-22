-- Author: KawF (Author), Yugen (changes, fixes and enchantments)
--
-- Battle for Azeroth
--
-- Hope you like my addOn ^^
--
-- UnitFrameImproved for AbyssUI.
--------------------------------------------------------------------------------
-- UnitFrameImproved
local AbyssUI_UnitFrame = CreateFrame("Frame", "$parentAbyssUI_UnitFrame", nil)
AbyssUI_UnitFrame:RegisterEvent("ADDON_LOADED")
AbyssUI_UnitFrame:RegisterEvent("PLAYER_LOGOUT")
AbyssUI_UnitFrame:SetScript("OnEvent", function(self, event, arg1)
	if ( event == "ADDON_LOADED" and arg1 == "AbyssUI" )  then
		local function tokenize(str)
			if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
				local tbl = {}
				for v in string.gmatch(str, "[^ ]+") do
					tinsert(tbl, v)
				end
				return tbl
			else 
				return nil
			end
		end
		-- FrameScale
		local function UnitFramesImproved_SetFrameScale(scale)
			if not InCombatLockdown() then 
				-- Scale the main frames
				PlayerFrame:SetScale(scale)
				TargetFrame:SetScale(scale)
				if (FocusFrame) then -- Support WoW Classic by checking for FocusFrame
					FocusFrame:SetScale(scale)
				end
				
				-- Scale sub-frames
				ComboFrame:SetScale(scale) -- Still needed

				characterSettings["FrameScale"] = scale
			end
		end
		-- Event listener to make sure we've loaded our settings and that we apply them
		-- ApllySettings
		local function UnitFramesImproved_ApplySettings(settings)
			UnitFramesImproved_SetFrameScale(settings["FrameScale"])
		end
		-- LoadDefault
		local function UnitFramesImproved_LoadDefaultSettings()
			if characterSettings == nil then
				characterSettings = {}
				characterSettings["FrameScale"] = "1.0"
			end
			
			if not TargetFrame:IsUserPlaced() then
				TargetFrame:SetPoint("TOPLEFT", PlayerFrame, "TOPRIGHT", 36, 0)
			end
		end
		-- ToT color
		local function UnitFramesImproved_Style_TargetOfTargetFrame()
			if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
				if not InCombatLockdown() then 
					TargetFrameToTHealthBar.lockColor = true
				end
			else
				return nil
			end
		end
		-- Unit Color
		local function UnitColor(unit)
			if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
				local r, g, b
				if ( ( not UnitIsPlayer(unit) ) and ( ( not UnitIsConnected(unit) ) or ( UnitIsDeadOrGhost(unit) ) ) ) then
					--Color it gray
					r, g, b = 0.5, 0.5, 0.5
				elseif ( UnitIsPlayer(unit) ) then
					--Try to color it by class.
					local localizedClass, englishClass = UnitClass(unit)
					local classColor = RAID_CLASS_COLORS[englishClass]
					if ( classColor ) then
						r, g, b = classColor.r, classColor.g, classColor.b
					else
						if ( UnitIsFriend("player", unit) ) then
							r, g, b = 0.0, 1.0, 0.0
						else
							r, g, b = 1.0, 0.0, 0.0
						end
					end
				else
					r, g, b = UnitSelectionColor(unit)
				end
				return r, g, b
			else
				return nil
			end
		end
		-- PlayerFrameStyle
		local function UnitFramesImproved_Style_PlayerFrame()
			if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
				if not InCombatLockdown() then 
					PlayerFrameHealthBar.lockColor = true
					PlayerFrameHealthBar.capNumericDisplay = true
					PlayerFrameHealthBar:SetWidth(119)
					PlayerFrameHealthBar:SetHeight(29)
					PlayerFrameHealthBar:SetPoint("TOPLEFT", 106, -22)
					PlayerFrameHealthBarText:SetPoint("CENTER", 50, 6)
				end
				if ( AbyssUIAddonSettings.UnitFrameImprovedDefaultTexture ~= true ) then
					if ( AbyssUIAddonSettings.ElitePortrait == true and AbyssUIAddonSettings.UnitFrameImproved == true ) then
						PlayerFrameTexture:SetTexture("Interface\\Addons\\AbyssUI\\Textures\\UI-TargetingFrame-Elite")
					else 
						PlayerFrameTexture:SetTexture("Interface\\Addons\\AbyssUI\\Textures\\UI-TargetingFrame")
					end
					PlayerStatusTexture:SetTexture("Interface\\Addons\\AbyssUI\\Textures\\UI-Player-Status")
					PlayerFrameHealthBar:SetStatusBarColor(UnitColor("player"))
				else
					if ( AbyssUIAddonSettings.ElitePortrait == true and AbyssUIAddonSettings.UnitFrameImproved == true ) then
						PlayerFrameTexture:SetTexture("Interface\\Addons\\AbyssUI\\Textures\\backup\\UI-TargetingFrame-Elite")
					else 
						PlayerFrameTexture:SetTexture("Interface\\Addons\\AbyssUI\\Textures\\backup\\UI-TargetingFrame")
					end
					PlayerStatusTexture:SetTexture("Interface\\Addons\\AbyssUI\\Textures\\backup\\UI-Player-Status")
					PlayerFrameHealthBar:SetStatusBarColor(UnitColor("player"))
				end
			else 
				return nil
			end
		end
		local eventVehicleHandle = CreateFrame("Frame", "$parent_eventVehicleHandle", nil)
		eventVehicleHandle:RegisterEvent("UNIT_EXITED_VEHICLE")
		eventVehicleHandle:SetScript("OnEvent", function(self, event, ...)
			if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
				C_Timer.After(0.1, function () 
					PlayerFrameHealthBar:SetWidth(119)
					PlayerFrameHealthBar:SetHeight(29)
					PlayerFrameHealthBar:SetPoint("TOPLEFT", PlayerFrame,"TOPLEFT", 106, -22)
					PlayerFrameHealthBarText:SetPoint("CENTER", 50, 6)
				end)
			else
				return nil
			end
		end)
		-- TargetFrameStyle
		local function UnitFramesImproved_Style_TargetFrame(self)
			if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
			--if not InCombatLockdown() then
				local classification = UnitClassification(self.unit)
				if (classification == "minus") then
					self.healthbar:SetHeight(12)
					self.healthbar:SetPoint("TOPLEFT",7,-41)
					if (self.healthbar.TextString) then
						self.healthbar.TextString:SetPoint("CENTER",-50,4)
					end
					self.deadText:SetPoint("CENTER",-50,4)
					self.Background:SetPoint("TOPLEFT",7,-41)
				else
					self.healthbar:SetHeight(29)
					self.healthbar:SetPoint("TOPLEFT",7,-22)
					if (self.healthbar.TextString) then
						self.healthbar.TextString:SetPoint("CENTER",-50,6)
					end
					self.deadText:SetPoint("CENTER",-50,6)
					self.nameBackground:Hide()
					self.Background:SetPoint("TOPLEFT",7,-22)
				end
				
				self.healthbar:SetWidth(119)
				self.healthbar.lockColor = true
			--end
			else
				return nil
			end
		end
		-- BossStyle
		local function UnitFramesImproved_BossTargetFrame_Style(self)
			if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
				if ( AbyssUIAddonSettings.UnitFrameImprovedDefaultTexture ~= true ) then
					self.borderTexture:SetTexture("Interface\\Addons\\AbyssUI\\Textures\\UI-UnitFrame-Boss")
				else
					self.borderTexture:SetTexture("Interface\\Addons\\AbyssUI\\Textures\\backup\\UI-UnitFrame-Boss")
				end
				UnitFramesImproved_Style_TargetFrame(self)
				if (not (characterSettings["FrameScale"] == nil)) then
					if not InCombatLockdown() then 
						self:SetScale(characterSettings["FrameScale"] * 0.9)
					end
				end
			else 
				return nil
			end
		end
		-- Utility functions
		 local function UnitFramesImproved_AbbreviateLargeNumbers(value)
		 	if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
				local strLen = strlen(value)
				local retString = value
				
				if ( strLen >= 10 ) then
					retString = string.sub(value, 1, -10).."."..string.sub(value, -9, -8).."G"
				elseif ( strLen >= 7 ) then
					retString = string.sub(value, 1, -7).."."..string.sub(value, -6, -5).."M"
				elseif ( strLen >= 4 ) then
					retString = string.sub(value, 1, -4).."."..string.sub(value, -3, -3).."k"
				end
				return retString
			else
				return nil
			end
		end
		-- UpdateTextString Values
		local function UnitFramesImproved_TextStatusBar_UpdateTextStringWithValues(statusFrame, textString, value, valueMin, valueMax)
			if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
				if( statusFrame.LeftText and statusFrame.RightText ) then
					statusFrame.LeftText:SetText("")
					statusFrame.RightText:SetText("")
					statusFrame.LeftText:Hide()
					statusFrame.RightText:Hide()
					textString:Show()
				end
				if ( ( tonumber(valueMax) ~= valueMax or valueMax > 0 ) and not ( statusFrame.pauseUpdates ) ) then
					local valueDisplay = value
					local valueMaxDisplay = valueMax
					if ( statusFrame.capNumericDisplay ) then
						valueDisplay = UnitFramesImproved_AbbreviateLargeNumbers(value)
						valueMaxDisplay = UnitFramesImproved_AbbreviateLargeNumbers(valueMax)
					else
						valueDisplay = BreakUpLargeNumbers(value)
						valueMaxDisplay = BreakUpLargeNumbers(valueMax)
					end
					local textDisplay = GetCVar("statusTextDisplay")
					if (textDisplay == "NONE") then return end
					if ( value and valueMax > 0 and ( textDisplay ~= "NUMERIC" or statusFrame.showPercentage ) and not statusFrame.showNumeric) then
						-- if ( value == 0 and statusFrame.zeroText ) then
							-- textString:SetText(statusFrame.zeroText)
							-- statusFrame.isZero = 1
							-- textString:Show()
							-- return
						-- end
						percent = math.ceil((value / valueMax) * 100) .. "%"
						if ( textDisplay == "BOTH" and not statusFrame.showPercentage) then
							valueDisplay = valueDisplay .. " (" .. percent .. ")"
							textString:SetText(valueDisplay)
						else
							valueDisplay = percent
							if ( statusFrame.prefix and (statusFrame.alwaysPrefix or not (statusFrame.cvar and GetCVar(statusFrame.cvar) == "1" and statusFrame.textLockable) ) ) then
								textString:SetText(statusFrame.prefix .. " " .. valueDisplay)
							else
								textString:SetText(valueDisplay)
							end
						end
					elseif ( value == 0 and statusFrame.zeroText ) then
						-- textString:SetText(statusFrame.zeroText)
						-- statusFrame.isZero = 1
						-- textString:Show()
						return
					else
						statusFrame.isZero = nil
						if ( statusFrame.prefix and (statusFrame.alwaysPrefix or not (statusFrame.cvar and GetCVar(statusFrame.cvar) == "1" and statusFrame.textLockable) ) ) then
							textString:SetText(statusFrame.prefix.." "..valueDisplay.."/"..valueMaxDisplay)
						else
							textString:SetText(valueDisplay.."/"..valueMaxDisplay)
						end
					end
				end
			else
				return nil
			end
		end
		-- PlayerArt
		local function UnitFramesImproved_PlayerFrame_ToPlayerArt(self)
			if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
				if not InCombatLockdown() then
					UnitFramesImproved_Style_PlayerFrame()
				end
			else
				return nil
			end
		end
		-- VehicleArt
		 local function UnitFramesImproved_PlayerFrame_ToVehicleArt(self)
		 	if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
				if not InCombatLockdown() then
					PlayerFrameHealthBar:SetHeight(12)
					PlayerFrameHealthBarText:SetPoint("CENTER", 50, 3)
				end
			else
				return nil
			end
		end
		-- Unit Name
		 local function UnitFramesImproved_UnitName_Color(self)
		 	if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
				if not InCombatLockdown() then
					for i, v in pairs ({
						PlayerName,
						PlayerFrameHealthBarText,
						PlayerFrameManaBarText,
						TargetFrameTextureFrameName,
						TargetFrameTextureFrameHealthBarText,
						TargetFrameTextureFrameManaBarText,
						FocusFrameTextureFrameName,
						FocusFrameTextureFrameHealthBarText,
						FocusFrameTextureFrameManaBarText, }) do 
						v:SetFont("Interface\\AddOns\\AbyssUI\\Textures\\font\\damagefontcyrillic.ttf", 10)
						v:SetVertexColor(255/255, 255/255, 255/255)
						v:SetShadowColor(0, 0, 0)
						v:SetShadowOffset(1, -1)
					end
				end
			else
				return nil
			end
		end
		-- TargetUpdate
		 local function UnitFramesImproved_TargetFrame_Update(self)
		 	if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
				-- Set back color of health bar
				if ( not UnitPlayerControlled(self.unit) and UnitIsTapDenied(self.unit) ) then
					-- Gray if npc is tapped by other player
					self.healthbar:SetStatusBarColor(0.5, 0.5, 0.5)
				else
					-- Standard by class etc if not
					self.healthbar:SetStatusBarColor(UnitColor(self.healthbar.unit))
				end
				if ((UnitHealth(self.unit) <= 0) and UnitIsConnected(self.unit)) then
					if (not UnitIsUnconscious(self.unit)) then
						if (self.healthbar.TextString) then
							self.healthbar.TextString:Hide()
							self.healthbar.forceHideText = true
						end
					end
				end
			else 
				return nil
			end
		end
		-- CheckClassification
		 local function UnitFramesImproved_TargetFrame_CheckClassification(self, forceNormalTexture)
		 	if ( AbyssUIAddonSettings.UnitFrameImprovedDefaultTexture ~= true ) then
				if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
					local texture
					local classification = UnitClassification(self.unit)
					if ( classification == "worldboss" or classification == "elite" ) then
						texture = "Interface\\Addons\\AbyssUI\\Textures\\UI-TargetingFrame-Elite"
					elseif ( classification == "rareelite" ) then
						texture = "Interface\\Addons\\AbyssUI\\Textures\\UI-TargetingFrame-Rare-Elite"
					elseif ( classification == "rare" ) then
						texture = "Interface\\Addons\\AbyssUI\\Textures\\UI-TargetingFrame-Rare"
					end
					if ( texture and not forceNormalTexture) then
						self.borderTexture:SetTexture(texture)
					else
						if ( not (classification == "minus") ) then
							self.borderTexture:SetTexture("Interface\\Addons\\AbyssUI\\Textures\\UI-TargetingFrame")
						end
					end
					self.nameBackground:Hide()
				else
					return nil
				end
				else
				if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
					local texture
					local classification = UnitClassification(self.unit)
					if ( classification == "worldboss" or classification == "elite" ) then
						texture = "Interface\\Addons\\AbyssUI\\Textures\\backup\\UI-TargetingFrame-Elite"
					elseif ( classification == "rareelite" ) then
						texture = "Interface\\Addons\\AbyssUI\\Textures\\backup\\UI-TargetingFrame-Rare-Elite"
					elseif ( classification == "rare" ) then
						texture = "Interface\\Addons\\AbyssUI\\Textures\\backup\\UI-TargetingFrame-Rare"
					end
					if ( texture and not forceNormalTexture) then
						self.borderTexture:SetTexture(texture)
					else
						if ( not (classification == "minus") ) then
							self.borderTexture:SetTexture("Interface\\Addons\\AbyssUI\\Textures\\backup\\UI-TargetingFrame")
						end
					end
					self.nameBackground:Hide()
				else
					return nil
				end
			end
		end
		-- CheckFaction
		 local function UnitFramesImproved_TargetFrame_CheckFaction(self)
			local factionGroup = UnitFactionGroup(self.unit)
			local creatureType = UnitCreatureType(self.unit)
			if ( creatureType == "Humanoid" or UnitIsPlayer(self.unit) ) then
				if ( UnitIsPVPFreeForAll(self.unit) ) then
					self.pvpIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-FFA")
					if ( AbyssUIAddonSettings.HideUnitImprovedFaction ~= true ) then
						self.pvpIcon:Show()
					else
						self.pvpIcon:Hide()
					end
				elseif ( factionGroup and UnitIsPVP(self.unit) and UnitIsEnemy("player", self.unit) ) then
					self.pvpIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-FFA")
					if ( AbyssUIAddonSettings.HideUnitImprovedFaction ~= true ) then
						self.pvpIcon:Show()
					else
						self.pvpIcon:Hide()
					end
				elseif ( factionGroup == "Alliance" or factionGroup == "Horde" ) then
					self.pvpIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-"..factionGroup)
					if ( AbyssUIAddonSettings.HideUnitImprovedFaction ~= true ) then
						self.pvpIcon:Show()
					else
						self.pvpIcon:Hide()
					end
				else
					self.pvpIcon:Hide()
				end
			else
				self.pvpIcon:Hide()
			end
			UnitFramesImproved_Style_TargetFrame(self)
		end
		-- EnableFrame
		local function EnableUnitFramesImproved()
			-- Generic status text hook
			hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", UnitFramesImproved_TextStatusBar_UpdateTextStringWithValues)
			
			-- Hook PlayerFrame functions
			hooksecurefunc("PlayerFrame_ToPlayerArt", UnitFramesImproved_PlayerFrame_ToPlayerArt)
			hooksecurefunc("PlayerFrame_ToVehicleArt", UnitFramesImproved_PlayerFrame_ToVehicleArt)
			
			-- Hook TargetFrame functions
			hooksecurefunc("TargetFrame_CheckDead", UnitFramesImproved_TargetFrame_Update)
			hooksecurefunc("TargetFrame_Update", UnitFramesImproved_TargetFrame_Update)
			hooksecurefunc("TargetFrame_CheckFaction", UnitFramesImproved_TargetFrame_CheckFaction)
			hooksecurefunc("TargetFrame_CheckClassification", UnitFramesImproved_TargetFrame_CheckClassification)
			hooksecurefunc("TargetofTarget_Update", UnitFramesImproved_TargetFrame_Update)
			
			-- BossFrame hooks
			hooksecurefunc("BossTargetFrame_OnLoad", UnitFramesImproved_BossTargetFrame_Style)
			
			-- Set up some stylings
			UnitFramesImproved_Style_PlayerFrame()
			UnitFramesImproved_BossTargetFrame_Style(Boss1TargetFrame)
			UnitFramesImproved_BossTargetFrame_Style(Boss2TargetFrame)
			UnitFramesImproved_BossTargetFrame_Style(Boss3TargetFrame)
			UnitFramesImproved_BossTargetFrame_Style(Boss4TargetFrame)
			UnitFramesImproved_Style_TargetFrame(TargetFrame)
			UnitFramesImproved_Style_TargetFrame(FocusFrame)
			UnitFramesImproved_UnitName_Color()
			if (not FocusFrame) then
				UnitFramesImproved_Style_TargetOfTargetFrame()
				if (not FocusFrame) then
					-- Update some values
					TextStatusBar_UpdateTextString(PlayerFrame.healthbar)
					TextStatusBar_UpdateTextString(PlayerFrame.manabar)
					
					TargetFrameHealthBar.TextString = CreateStatusBarText("Text", "TargetFrameHealthBar", TargetFrameTextureFrame, "CENTER", -50, 3)
					TargetFrameHealthBar.LeftText = CreateStatusBarText("TextLeft", "TargetFrameHealthBar", TargetFrameTextureFrame, "LEFT", 8, 3)
					TargetFrameHealthBar.RightText = CreateStatusBarText("TextRight", "TargetFrameHealthBar", TargetFrameTextureFrame, "RIGHT", -110, 3)
					
					TargetFrameManaBar.TextString = CreateStatusBarText("Text", "TargetFrameManaBar", TargetFrameTextureFrame, "CENTER", -50, -8)
					TargetFrameManaBar.LeftText = CreateStatusBarText("TextLeft", "TargetFrameManaBar", TargetFrameTextureFrame, "LEFT", 8, -8)
					TargetFrameManaBar.RightText = CreateStatusBarText("TextRight", "TargetFrameManaBar", TargetFrameTextureFrame, "RIGHT", -110, -8)
				end
			else
				return nil
			end
		end
		-- Create the addon main instance
		local UnitFramesImprovedSettings = CreateFrame('Button', 'UnitFramesImproved')
		-- Event listener to make sure we enable the addon at the right time
		UnitFramesImprovedSettings:RegisterEvent("PLAYER_ENTERING_WORLD")
		UnitFramesImprovedSettings:SetScript("OnEvent", function(self, event)
			if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
				-- Set some default settings
				if (characterSettings == nil) then
					UnitFramesImproved_LoadDefaultSettings()
				end
				EnableUnitFramesImproved()
			else
				return nil
			end
		end)
		local UnitFramesImprovedApplySettings = CreateFrame('Button', 'UnitFramesImproved')
		-- Event listener to make sure we enable the addon at the right time
		UnitFramesImprovedApplySettings:RegisterEvent("VARIABLES_LOADED")
		UnitFramesImprovedApplySettings:SetScript("OnEvent", function(self, event)
			-- Set some default settings
			if ( characterSettings == nil ) then
				UnitFramesImproved_LoadDefaultSettings()
			end
			if (not (characterSettings["PlayerFrameAnchor"] == nil)) then
				StaticPopup_Show("LAYOUT_RESETDEFAULT")
				characterSettings["PlayerFrameX"] = nil
				characterSettings["PlayerFrameY"] = nil
				characterSettings["PlayerFrameMoved"] = nil
				characterSettings["PlayerFrameAnchor"] = nil
			end
			UnitFramesImproved_ApplySettings(characterSettings)
		end)
		--StatusBarTextString
		local function CreateStatusBarText(name, parentName, parent, point, x, y)
			if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
				local fontString = parent:CreateFontString(parentName..name, nil, "TextStatusBarText")
				fontString:SetPoint(point, parent, point, x, y)
				
				return fontString
			else
				return nil
			end
		end
		-- Bootstrap
		--[[
		local function UnitFramesImproved_StartUp(self)
			if ( AbyssUIAddonSettings.UnitFrameImproved == true ) then
				--self:SetScript('OnEvent', function(self, event) self[event](self) end)
				--self:RegisterEvent('PLAYER_ENTERING_WORLD')
				self:RegisterEvent('VARIABLES_LOADED')
			else
				return nil
			end
		end
		--]]
		--UnitFramesImproved_StartUp(UnitFramesImproved)
	else
		return nil
	end
end)
----------------------------------------------------
