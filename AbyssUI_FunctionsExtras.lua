-- Author: Yugen
--
-- Shadowlands
--
-- Extra functions for AbyssUI
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
local function AbyssUI_Fontification(globalFont, subFont, damageFont)
local locale = GetLocale()
local fontName, fontHeight, fontFlags = MinimapZoneText:GetFont()
local mediaFolder = "Interface\\AddOns\\AbyssUI\\Textures\\font\\"
	if ( locale == "zhCN") then
		globalFont	= mediaFolder.."zhCN-TW\\senty.ttf"
		subFont 	= mediaFolder.."zhCN-TW\\senty.ttf"
		damageFont 	= mediaFolder.."zhCN-TW\\senty.ttf"
	elseif ( locale == "zhTW" ) then
		globalFont	= mediaFolder.."zhCN-TW\\senty.ttf"
		subFont 	= mediaFolder.."zhCN-TW\\senty.ttf"
		damageFont 	= mediaFolder.."zhCN-TW\\senty.ttf"
	elseif ( locale == "ruRU" ) then
		globalFont	= mediaFolder.."ruRU\\dejavu.ttf"
		subFont 	= mediaFolder.."ruRU\\dejavu.ttf"
		damageFont 	= mediaFolder.."ruRU\\dejavu.ttf"
	elseif ( locale == "koKR" ) then
		globalFont	= mediaFolder.."koKR\\dxlbab.ttf"
		subFont 	= mediaFolder.."koKR\\dxlbab.ttf"
		damageFont 	= mediaFolder.."koKR\\dxlbab.ttf"
	elseif ( locale == "frFR" or locale == "deDE" or locale == "enGB" or locale == "enUS" or locale == "itIT" or
		locale == "esES" or locale == "esMX" or locale == "ptBR") then
		globalFont	= mediaFolder.."global.ttf"
		subFont 	= mediaFolder.."npcfont.ttf"
		damageFont 	= mediaFolder.."damagefont.ttf"
	else
		globalFont	= fontName
		subFont 	= fontName
		damageFont 	= fontName
	end
	return globalFont, subFont, damageFont
end
local globalFont, subFont, damageFont = AbyssUI_Fontification(globalFont, subFont, damageFont)
-- RegionList
local function AbyssUI_RegionListSize(self, width, height)
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
-- FrameSize
local function AbyssUI_FrameSize(self, width, height)
	self:SetWidth(width)
	self:SetHeight(height)
end
--------------------------------------------------------------
--------------------------------------------------------------
-- Fonts
----------------------------------------------------
local AbyssUI_FontString = CreateFrame("Frame", "$parentAbyssUI_FontString", nil)
AbyssUI_FontString:RegisterEvent("ADDON_LOADED")
AbyssUI_FontString:RegisterEvent("PLAYER_LOGOUT")
AbyssUI_FontString:SetScript("OnEvent", function(self, event, arg1)
	if ( event == "ADDON_LOADED" and arg1 == "AbyssUI" )  then
		STANDARD_TEXT_FONT          = globalFont
		DAMAGE_TEXT_FONT          	= damageFont
		UNIT_NAME_FONT              = subFont
		NAMEPLATE_FONT              = subFont
		NAMEPLATE_SPELLCAST_FONT    = subFont
		
		-- XML changes
		local ForcedFontSize = {10, 14, 20, 64, 64}
		local BlizFontObjects = {
			-- These five fonts use the fixedSize argument, causing an incorrent font size return, so input our own sizes (ForcedFontSize)
			SystemFont_NamePlateCastBar, SystemFont_NamePlateFixed, SystemFont_LargeNamePlateFixed, SystemFont_World, SystemFont_World_ThickOutline,
			
			SystemFont_Outline_Small, SystemFont_Outline, SystemFont_InverseShadow_Small, SystemFont_Med2, SystemFont_Med3, SystemFont_Shadow_Med3,
			SystemFont_Huge1, SystemFont_Huge1_Outline, SystemFont_OutlineThick_Huge2, SystemFont_OutlineThick_Huge4, SystemFont_OutlineThick_WTF,
			NumberFont_GameNormal, NumberFont_Shadow_Small, NumberFont_OutlineThick_Mono_Small, NumberFont_Shadow_Med, NumberFont_Normal_Med, 
			NumberFont_Outline_Med, NumberFont_Outline_Large, NumberFont_Outline_Huge, Fancy22Font, QuestFont_Huge, QuestFont_Outline_Huge,
			QuestFont_Super_Huge, QuestFont_Super_Huge_Outline, SplashHeaderFont, Game11Font, Game12Font, Game13Font, Game13FontShadow,
			Game15Font, Game18Font, Game20Font, Game24Font, Game27Font, Game30Font, Game32Font, Game36Font, Game48Font, Game48FontShadow,
			Game60Font, Game72Font, Game11Font_o1, Game12Font_o1, Game13Font_o1, Game15Font_o1, QuestFont_Enormous, DestinyFontLarge,
			CoreAbilityFont, DestinyFontHuge, QuestFont_Shadow_Small, MailFont_Large, SpellFont_Small, InvoiceFont_Med, InvoiceFont_Small,
			Tooltip_Med, Tooltip_Small, AchievementFont_Small, ReputationDetailFont, FriendsFont_Normal, FriendsFont_Small, FriendsFont_Large,
			FriendsFont_UserText, GameFont_Gigantic, ChatBubbleFont, Fancy16Font, Fancy18Font, Fancy20Font, Fancy24Font, Fancy27Font, Fancy30Font,
			Fancy32Font, Fancy48Font, SystemFont_NamePlate, SystemFont_LargeNamePlate,
			
			-- SharedFonts.xml
			
			SystemFont_Tiny2, SystemFont_Tiny, SystemFont_Shadow_Small, SystemFont_Small, SystemFont_Small2, SystemFont_Shadow_Small2, SystemFont_Shadow_Med1_Outline,
			SystemFont_Shadow_Med1, QuestFont_Large, SystemFont_Large, SystemFont_Shadow_Large_Outline, SystemFont_Shadow_Med2, SystemFont_Shadow_Large, 
			SystemFont_Shadow_Large2, SystemFont_Shadow_Huge1, SystemFont_Huge2, SystemFont_Shadow_Huge2, SystemFont_Shadow_Huge3, SystemFont_Shadow_Outline_Huge3,
			SystemFont_Shadow_Outline_Huge2, SystemFont_Med1, SystemFont_WTF2, SystemFont_Outline_WTF2, 
			GameTooltipHeader, System_IME,
		}

		for i, FontObject in pairs(BlizFontObjects) do
			local _, oldSize, oldStyle  = FontObject:GetFont()
			FontObject:SetFont(globalFont, ForcedFontSize[i] or oldSize, oldStyle)
		end
		
		BlizFontObjects = nil
	end
end)
-- Change yellow fonts text color
local f, _ = CreateFrame("frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event)
  f.yellow = {
    "AchievementDateFont",
    "AchievementPointsFont",
    "AchievementPointsFontSmall",
    "BossEmoteNormalHuge",
    "DialogButtonNormalText",
    "FocusFontSmall",
    "GameFontNormal",
    "GameFontNormalHuge",
    "GameFontNormalLarge",
    "GameFontNormalMed3",
    "GameFontNormalSmall",
    "GameFont_Gigantic",
    "NumberFontNormalLargeRightYellow",
    "NumberFontNormalLargeYellow",
    "NumberFontNormalRightYellow",
    "NumberFontNormalYellow",
    "QuestFont_Enormous",
    "QuestFont_Super_Huge",
    "QuestFont_Super_Huge_Outline",
    "QuestTitleFontBlackShadow",
    "SplashHeaderFont",
  }
  if ( AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true ) then
    for _, v in next, f.yellow do 
      _G[v]:SetTextColor(229/255, 229/255, 229/255)
    end
      _G.WorldMapFrame.NavBar.home.text:SetTextColor(229/255, 229/255, 229/255)
  end
end)
----------------------------------------------------
-- UnitColor
local UnitColor
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

-- Fade UI
local _G = _G
local FadeUIFirstHide = CreateFrame("CheckButton", "$parentFadeUIFirstHide", UIParent, "ChatConfigCheckButtonTemplate")
FadeUIFirstHide:RegisterEvent("PLAYER_ENTERING_WORLD")
FadeUIFirstHide:SetScript("OnEvent", function(self, event, ...)
	if ( AbyssUIAddonSettings.FadeUI == true ) then
		C_Timer.After(1, function() 
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
			for i=1, 12 do
				UIFrameFadeIn(_G["ExtraBarButton"..i], 1, 1, 0)			
			end
		end)
	else
		return nil
	end
end)
local FadeUI = CreateFrame("CheckButton", "$parentFadeUI", UIParent, "ChatConfigCheckButtonTemplate")
FadeUI:RegisterEvent("PLAYER_REGEN_DISABLED")
FadeUI:RegisterEvent("PLAYER_REGEN_ENABLED")
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
			for i=1, 12 do
				UIFrameFadeIn(_G["ExtraBarButton"..i], 1, 0, 1)	
			end
		elseif ( event == "PLAYER_REGEN_ENABLED" ) then
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
			for i=1, 12 do
				UIFrameFadeIn(_G["ExtraBarButton"..i], 1, 1, 0)			
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
		for i=1, 12 do
			UIFrameFadeIn(_G["ExtraBarButton"..i], 1, 0, 1)			
		end
	else
		return nil
	end
end)
----------------------------------------------
-- NamePlate Style
--  Move nametag
hooksecurefunc("DefaultCompactNamePlateFrameAnchorInternal", function(frame)
	if ( not frame:IsForbidden() and AbyssUIAddonSettings.ExtraFunctionNameplateChanges ~= true ) then
		frame.name:ClearAllPoints()
		PixelUtil.SetPoint(frame.name, "BOTTOM", frame.healthBar, "TOP", 0, 4)
	end
end)
----------------------------------------------
-- Nameplate Health Percent
hooksecurefunc("CompactUnitFrame_UpdateStatusText", function(frame)
	if ( AbyssUIAddonSettings.ExtraFunctionNameplateChanges ~= true ) then
			if frame:IsForbidden() or ( UnitIsFriend("player", frame.displayedUnit) and not UnitIsUnit(frame.displayedUnit, "player") ) then return end
			if not frame.healthBar.percent then
				frame.healthBar.percent = frame.healthBar:CreateFontString(nil,"OVERLAY")
				frame.healthBar.percent:SetPoint("LEFT", frame.healthBar)
				frame.healthBar.percent:SetFont(damageFont, 10)
				frame.healthBar.percent:SetShadowColor(0, 0, 0)
				frame.healthBar.percent:SetShadowOffset(1, -0.25)
			end
			local percentcalc = ceil(((UnitHealth(frame.displayedUnit) / UnitHealthMax(frame.displayedUnit)) * 1000) /10)
			if ( percentcalc == 0 ) then return end
			frame.healthBar.percent:SetFormattedText("%d%%", percentcalc)
			--frame.healthBar.percent:Show()
	end
end)
-- Nameplate colorization
-- Player
hooksecurefunc("CompactUnitFrame_UpdateHealthColor", function(self)
	if ( not self:IsForbidden() and AbyssUIAddonSettings.ExtraFunctionNameplateChanges ~= true ) then
    local _, class = UnitClass('player')
    local color = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
		local unitIsPlayer = UnitIsPlayer('player')
		if self.optionTable.colorNameBySelection and not self:IsForbidden() then
			-- Player
		 	if ( unitIsPlayer == true ) then
				if C_NamePlate.GetNamePlateForUnit(self.unit) == C_NamePlate.GetNamePlateForUnit('player') then
					local healthPercentage = ceil(((UnitHealth(self.displayedUnit) / UnitHealthMax(self.displayedUnit)) * 1000) /10)
					if ( healthPercentage == 0 ) then return end
          if ( healthPercentage == 100 ) then
            self.healthBar:SetStatusBarColor(color.r, color.g, color.b)
					elseif healthPercentage < 100 and healthPercentage > 21 then
						self.healthBar:SetStatusBarColor(color.r, color.g, color.b)
					elseif healthPercentage < 21 then
						self.healthBar:SetStatusBarColor(255/255, 255/255, 255/255)
					end
				end
			end
		end
	else
		return nil
	end
end)
-- Target
hooksecurefunc("CompactUnitFrame_UpdateHealthColor", function(self)
	if ( not self:IsForbidden() and AbyssUIAddonSettings.ExtraFunctionNameplateChanges ~= true ) then
		local unitTarget = UnitIsPlayer("target")
		local reaction = UnitReaction("player", "target") or 4
		if self.optionTable.colorNameBySelection and not self:IsForbidden() then
			-- Mobs
		 	if  ( unitTarget ~= true and reaction < 5 ) then
				if C_NamePlate.GetNamePlateForUnit(self.unit) == C_NamePlate.GetNamePlateForUnit("target") then
					local healthPercentage = ceil(((UnitHealth(self.displayedUnit) / UnitHealthMax(self.displayedUnit)) * 1000) /10)
					if ( healthPercentage == 0 ) then return end
					if healthPercentage == 100 then
						-- do nothing keep frame color
					elseif healthPercentage < 100 and healthPercentage > 21 then
            self.healthBar:SetStatusBarColor(UnitColor(self.unit))
          elseif healthPercentage < 21 then
            self.healthBar:SetStatusBarColor(255/255, 255/255, 255/255)
          end
				end
			end
		end
	else
		return nil
	end
end)
----------------------------------------------------
-- ChatBubble
-- Thanks to cokedrivers for this awesome code
local ChatBubbleColorization = CreateFrame("CheckButton", "$parentChatBubbleColorization", UIParent, "ChatConfigCheckButtonTemplate")
ChatBubbleColorization:RegisterEvent("PLAYER_ENTERING_WORLD")
ChatBubbleColorization:SetScript("OnEvent", function(self, event, ...)
	if ( AbyssUIAddonSettings.ExtraFunctionChatBubbleChanges ~= true ) then
		if ( event == "PLAYER_ENTERING_WORLD" ) then
			local reaction = UnitReaction("target", "player")
			local CUSTOM_CLASS_COLORS = CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS
			local color = CUSTOM_CLASS_COLORS
			local events = {
				CHAT_MSG_SAY = 'chatBubbles', 
				CHAT_MSG_YELL = 'chatBubbles',
				CHAT_MSG_PARTY = 'chatBubblesParty', 
				CHAT_MSG_PARTY_LEADER = 'chatBubblesParty',
				CHAT_MSG_MONSTER_SAY = 'chatBubbles', 
				CHAT_MSG_MONSTER_YELL = 'chatBubbles', 
				CHAT_MSG_MONSTER_PARTY = 'chatBubblesParty',
			}
			
			local function SkinFrame(frame)
				if ( not frame:IsForbidden() ) then
					for i = 1, select('#', frame:GetRegions()) do
						local region = select(i, frame:GetRegions())
						if (region:GetObjectType() == 'FontString') then
							frame.text = region
						else
							region:Hide()
						end
					end
					
					frame.text:SetFontObject('SystemFont_Tiny')
					frame.text:SetJustifyH('LEFT')
					
					frame:ClearAllPoints()
					frame:SetPoint('TOPLEFT', frame.text, -10, 25)
					frame:SetPoint('BOTTOMRIGHT', frame.text, 10, -10)
					frame:SetBackdrop({
						bgFile = [[Interface\DialogFrame\UI-DialogBox-Background-Dark]],
						edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],
						tile = true, tileSize = 16, edgeSize = 18,
						insets = {left = 3, right = 3, top = 3, bottom = 3}
					})
					frame:SetBackdropColor(0, 0, 0, 1)
					local r, g, b = frame.text:GetTextColor()
					frame:SetBackdropBorderColor(r, g, b, .8)
					
					frame.sender = frame:CreateFontString(nil, 'OVERLAY', 'GameFontNormalSmall')
					frame.sender:SetPoint('BOTTOMLEFT', frame.text, 'TOPLEFT', 0, 4)
					frame.sender:SetJustifyH('LEFT')
					
					frame:HookScript('OnHide', function() 
						frame.inUse = false 
					end)
				end
			end
			
			local function UpdateFrame(frame, guid, name)
				if ( not frame:IsForbidden() ) then
					if (not frame.text) then
						SkinFrame(frame) 
					end
					frame.inUse = true
					
					local ccolor
					if (guid ~= nil and guid ~= '') then
						_, ccolor, _, _, _, _ = GetPlayerInfoByGUID(guid)
					end
					
					if (name) then
						local color = RAID_CLASS_COLORS[ccolor] or {r = 1, g = 1, b = 0}
						frame.sender:SetText(('|cFF%2x%2x%2x%s|r'):format(color.r * 255, color.g * 255, color.b * 255, name))
						if frame.text:GetWidth() < frame.sender:GetWidth() then
							frame.text:SetWidth(frame.sender:GetWidth())
						end
					end
				end
			end
			
			local function FindFrame(msg)
				for i = 1, WorldFrame:GetNumChildren() do
					local frame = select(i, WorldFrame:GetChildren())
					if (not frame:IsForbidden() and not frame:GetName() and not frame.inUse) then
						for i = 1, select('#', frame:GetRegions()) do
							local region = select(i, frame:GetRegions())
							if region:GetObjectType() == 'FontString' and region:GetText() == msg then
								return frame
							end
						end
					end
				end
			end
			
			local ChatBubbleFrame = CreateFrame('Frame')
			for event, cvar in pairs(events) do 
				ChatBubbleFrame:RegisterEvent(event) 
			end
			
			ChatBubbleFrame:SetScript('OnEvent', function(self, event, msg, sender, _, _, _, _, _, _, _, _, _, guid)
				if (GetCVarBool(events[event])) then
					ChatBubbleFrame.elapsed = 0
					ChatBubbleFrame:SetScript('OnUpdate', function(self, elapsed)
						self.elapsed = self.elapsed + elapsed
						local frame = FindFrame(msg)
						if (frame or self.elapsed > 0.3) then
							ChatBubbleFrame:SetScript('OnUpdate', nil)
							if (frame) then 
								UpdateFrame(frame, guid, sender) 
							end
						end
					end)
				end
			end)
		end
	else
		return nil
	end
end)
----------------------------------------------------
-- New Minimap
----------------------------------------------------
-- Thanks to Dawn for this amazing minimap code
local SquareMinimap_ = CreateFrame("CheckButton", "$parentSquareMinimap_", UIParent, "ChatConfigCheckButtonTemplate")
SquareMinimap_:RegisterEvent("PLAYER_ENTERING_WORLD")
SquareMinimap_:SetScript("OnEvent", function(self, event, ...)
	-- minimap default position - you can move it ingame by holding down ALT!
	if ( AbyssUIAddonSettings.DisableSquareMinimap ~= true and AbyssUIAddonSettings.HideMinimap ~= true ) then
		local position = "TOPRIGHT"     	
		local position_x = -11          		
		local position_y = -5     

		-- achievement/quest tracker position
		local moveWatchFrame = false
		local qparent = UIParent
		local qanchor = "TOPRIGHT"  	 
		local qposition_x = -60           
		local qposition_y = -260         
		local qheight = 400             

		local useInfoPanel = true		
		local showclock = false			
		local AddonNumb = 30			

		local mediaFolder = "Interface\\AddOns\\AbyssUI\\Textures\\minimap\\"
		local texture = "Interface\\Buttons\\WHITE8x8"
		--local backdrop = {bgFile = texture, edgeFile = texture, edgeSize = 1, insets = { left = -1, right = -1, top = -1, bottom = -1}}
		local backdrop = {edgeFile = texture, edgeSize = 1}

		local mailicon = mediaFolder.."mail"
		local calendaricon = mediaFolder.."calendar"
		local font = subFont
		local fontSize = 11
		local fontFlag = "THINOUTLINE"						-- "THINOUTLINE", "OUTLINE MONOCHROME", "OUTLINE" or nil (no outline)

		local backdropcolor = {0/255, 0/255, 0/255}			-- backdrop color	
		local brdcolor = {0/255, 0/255, 0/255}				-- backdrop border color
		local infocolor = {41/255, 41/255, 41/255}			-- info panel color
		local IpanelBGalpha = 0.5							-- info panel background alpha

		local classColoredBorder = true						-- color border by class
		local scale = 1

		local enableCombatFade = true						-- enable/disable fade out in combat
		local inCombatAlpha = 0.3							-- in combat alpha
		local outCombatAlpha = 1.0							-- ooc alpha
		-- Global String
		local _G = _G
		local fpsStringLabel 	 = _G["FRAMERATE_LABEL"]
		local latencyStringLabel = _G["NETWORK_LABEL"]
		local totalStringLabel   = _G["TOTAL"]
		local systemStringLabel  = _G["SYSTEMOPTIONS_MENU"]
		local cleanStringLabel   = _G["BAG_FILTER_CLEANUP"]

		-----------
		-- style --
		-----------

		local _, class = UnitClass('player')
		local color = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]			
		
		Minimap:SetSize(182*scale, 182*scale)
		Minimap:SetMaskTexture(mediaFolder.."rectangle")
		Minimap:SetHitRectInsets(0, 0, 21*scale, 2*scale)
		Minimap:ClearAllPoints()
		Minimap:SetPoint(position, UIParent, position_x, position_y)
		Minimap:SetScale(scale)
		Minimap:SetFrameLevel(6)

		BorderFrame = CreateFrame("Frame", nil, self, BackdropTemplateMixin and "BackdropTemplate")
		BorderFrame:SetPoint("TOPLEFT", Minimap, "TOPLEFT", -1, -(21*scale))
		BorderFrame:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 1, (2*scale))
		BorderFrame:SetBackdrop(backdrop)
		if not classColoredBorder then
			BorderFrame:SetBackdropBorderColor(unpack(brdcolor))
		else
			if ( AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true ) then
				if ( AbyssUIAddonSettings.KeepUnitDark == true and AbyssUIAddonSettings.UIVertexColorFrames02 ~= true ) then
					BorderFrame:SetBackdropBorderColor(unpack(brdcolor))
				elseif ( AbyssUIAddonSettings.UIVertexColorFrames02 == true and AbyssUIAddonSettings.KeepUnitDark ~= true ) then
					BorderFrame:SetBackdropBorderColor(unpack(brdcolor))
				else
					BorderFrame:SetBackdropBorderColor(color.r, color.g, color.b)
				end
			else
				local character = UnitName("player").."-"..GetRealmName()
				BorderFrame:SetBackdropBorderColor(COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b)
			end
		end	
		BorderFrame:SetBackdropColor(unpack(backdropcolor))
		BorderFrame:SetFrameLevel(5)
		------------------------
		-- fps latency memory --
		------------------------
		if useInfoPanel then	

			local FLMframe = CreateFrame("Button", nil, self, BackdropTemplateMixin and "BackdropTemplate")
			FLMframe:SetPoint("TOP", Minimap, "TOP", 0, 1*scale)
			FLMframe:SetSize((Minimap:GetWidth()+2)*scale, fontSize+6)
			FLMframe:SetFrameLevel(4)
			FLMframe:SetBackdrop(backdrop)
			if not classColoredBorder then
				FLMframe:SetBackdropBorderColor(unpack(brdcolor))
			else
				if ( AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true ) then
					if ( AbyssUIAddonSettings.KeepUnitDark == true and AbyssUIAddonSettings.UIVertexColorFrames02 ~= true ) then
						FLMframe:SetBackdropBorderColor(unpack(brdcolor))
					elseif ( AbyssUIAddonSettings.UIVertexColorFrames02 == true and AbyssUIAddonSettings.KeepUnitDark ~= true ) then
						FLMframe:SetBackdropBorderColor(unpack(brdcolor))
					else
						FLMframe:SetBackdropBorderColor(color.r, color.g, color.b)
					end
				else
					local character = UnitName("player").."-"..GetRealmName()
					FLMframe:SetBackdropBorderColor(COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b)
				end
			end	
			FLMframe:SetBackdropColor(unpack(backdropcolor))

			local FLMframeT = FLMframe:CreateTexture(nil, "ARTWORK")
			FLMframeT:SetPoint("TOPLEFT", FLMframe, "TOPLEFT", 1, -1)
			FLMframeT:SetPoint("BOTTOMRIGHT", FLMframe, "BOTTOMRIGHT", -1, 1)	
			--FLMframeT:SetTexture(mediaFolder.."dO")
			FLMframeT:SetTexture(texture)
			FLMframeT:SetVertexColor(unpack(infocolor))
			FLMframeT:SetAlpha(IpanelBGalpha)

			local text = FLMframe:CreateFontString(nil, "OVERLAY")
			text:SetPoint("CENTER", FLMframe, 4, 0)
			text:SetFont(font, fontSize, fontFlag)
			text:SetShadowOffset(1, -1)
			if ( AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true ) then
				text:SetTextColor(color.r, color.g, color.b)
			else
				local character = UnitName("player").."-"..GetRealmName()
				text:SetTextColor(COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b )	
			end
			
			--========[ important functions ]========--
			local function Addoncompare(a, b)
				return a.memory > b.memory
			end

			local function MemFormat(v)
				if (v > 1024) then
					return string.format("%.2f MiB", v / 1024)
				else
					return string.format("%.2f KiB", v)
				end
			end

			local function ColorGradient(perc, ...)
				if (perc > 1) then
					local r, g, b = select(select('#', ...) - 2, ...)
					return r, g, b
				elseif (perc < 0) then
					local r, g, b = ...
					return r, g, b
				end
				
				local num = select('#', ...) / 3

				local segment, relperc = math.modf(perc*(num-1))
				local r1, g1, b1, r2, g2, b2 = select((segment*3)+1, ...)

				return r1 + (r2-r1)*relperc, g1 + (g2-g1)*relperc, b1 + (b2-b1)*relperc
			end

			local function TimeFormat(time)
				local t = format("%.1ds",floor(mod(time,60)))
				if (time > 60) then
					time = floor(time / 60)
					t = format("%.1dm ",mod(time,60))..t
					if (time > 60) then
						time = floor(time / 60)
						t = format("%.1dh ",mod(time,24))..t
						if (time > 24) then
							time = floor(time / 24)
							t = format("%dd ",time)..t
						end
					end
				end
				return t
			end

			local function ColorizeLatency(v)
				if (v < 100) then
					return {r = 0, g = 1, b = 0}
				elseif (v < 300) then
					return {r = 1, g = 1, b = 0}
				else
					return {r = 1, g = 0, b = 0}
				end
			end

			local function ColorizeFramerate(v)
				if (v < 10) then
					return {r = 1, g = 0, b = 0}
				elseif (v < 30) then
					return {r = 1, g = 1, b = 0}
				else
					return {r = 0, g = 1, b = 0}
				end
			end
			
			--========[ update ]========--
			local lastUpdate = 0
			local updateDelay = 1
			FLMframe:SetScript("OnUpdate", function(self, elapsed)
				lastUpdate = lastUpdate + elapsed
				if (lastUpdate > updateDelay) then
					lastUpdate = 0
					local time = date("|c00ffffff%H|r:|c00ffffff%M|r")
					fps = GetFramerate()
					fps = "|c00ffffff"..floor(fps+0.5).."|r fps   "
					lag = select(4, GetNetStats())
					lag = "|c00ffffff"..lag.."|r ms   "
					text:SetText(lag..fps..time)
				end
			end)

			FLMframe:SetScript("OnEnter", function()
				GameTooltip:SetOwner(FLMframe)
				collectgarbage()
				local memory, i, addons, total, entry, total
				local latencycolor = ColorizeLatency(select(3, GetNetStats()))
				local fpscolor = ColorizeFramerate(GetFramerate())
				
				if ( AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true ) then
					GameTooltip:AddLine(date("%A, %d %B, %Y"), 1, 1, 1)
					GameTooltip:AddDoubleLine(fpsStringLabel, format("%.1f fps", GetFramerate()), color.r, color.g, color.b, fpscolor.r, fpscolor.g, fpscolor.b)
					GameTooltip:AddDoubleLine(latencyStringLabel..":", format("%d ms", select(3, GetNetStats())), color.r, color.g, color.b, latencycolor.r, latencycolor.g, latencycolor.b)
					GameTooltip:AddDoubleLine(systemStringLabel..":", TimeFormat(GetTime()), color.r, color.g, color.b, 1, 1, 1)
					GameTooltip:AddDoubleLine(". . . . . . . . . . .", ". . . . . . . . . . .", 1, 1, 1, 1, 1, 1)
				else
					local character = UnitName("player").."-"..GetRealmName()
					GameTooltip:AddLine(date("%A, %d %B, %Y"), 1, 1, 1)
					GameTooltip:AddDoubleLine(fpsStringLabel, format("%.1f fps", GetFramerate()), COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b, fpscolor.r, fpscolor.g, fpscolor.b)
					GameTooltip:AddDoubleLine(latencyStringLabel..":", format("%d ms", select(3, GetNetStats())), COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b, latencycolor.r, latencycolor.g, latencycolor.b)
					GameTooltip:AddDoubleLine(systemStringLabel..":", TimeFormat(GetTime()), COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b, 1, 1, 1)
					GameTooltip:AddDoubleLine(". . . . . . . . . . .", ". . . . . . . . . . .", 1, 1, 1, 1, 1, 1)
				end
				addons = {}
				total = 0
				UpdateAddOnMemoryUsage()
				for i = 1, GetNumAddOns(), 1 do
					if GetAddOnMemoryUsage(i) > 0 then
						memory = GetAddOnMemoryUsage(i)
						entry = {name = GetAddOnInfo(i), memory = memory}
						table.insert(addons, entry)
						total = total + memory
					end
				end
				
				table.sort(addons, Addoncompare)

				i = 0
				for _,entry in pairs(addons) do
					local cr, cg, cb = ColorGradient((entry.memory / 800), 0, 1, 0, 1, 1, 0, 1, 0, 0)
					GameTooltip:AddDoubleLine(entry.name, MemFormat(entry.memory), 1, 1, 1, cr, cg, cb)
					
					i = i + 1
					if i >= AddonNumb then
						break
					end		
				end

				local cr, cg, cb = ColorGradient((entry.memory / 800), 0, 1, 0, 1, 1, 0, 1, 0, 0) 
				if ( AbyssUIAddonSettings.UIVertexColorFramesColorPicker ~= true ) then
					GameTooltip:AddDoubleLine(". . . . . . . . . . .", ". . . . . . . . . . .", 1, 1, 1, 1, 1, 1)
					GameTooltip:AddDoubleLine(totalStringLabel..":", MemFormat(total), color.r, color.g, color.b, cr, cg, cb)
					GameTooltip:AddDoubleLine("+ Blizzard:", MemFormat(collectgarbage("count")), color.r, color.g, color.b, cr, cg, cb)
					GameTooltip:Show()
				else
					local character = UnitName("player").."-"..GetRealmName()
					GameTooltip:AddDoubleLine(". . . . . . . . . . .", ". . . . . . . . . . .", 1, 1, 1, 1, 1, 1)
					GameTooltip:AddDoubleLine(totalStringLabel..":", MemFormat(total), COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b, cr, cg, cb)
					GameTooltip:AddDoubleLine("+ Blizzard:", MemFormat(collectgarbage("count")), COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b, cr, cg, cb)
					GameTooltip:Show()
				end
			end)

			FLMframe:SetScript("OnLeave", function() 
				GameTooltip:Hide() 
			end)

			--========[ mem cleanup ]========--
			FLMframe:SetScript("OnClick", function()
				if (not IsAltKeyDown()) then
					UpdateAddOnMemoryUsage()
					local memBefore = gcinfo()
					collectgarbage()
					UpdateAddOnMemoryUsage()
					local memAfter = gcinfo()
					DEFAULT_CHAT_FRAME:AddMessage(cleanStringLabel..": |cff00FF00"..MemFormat(memBefore - memAfter))
				end
			end)	
		end
		
		-----------------------------------------
		-- hide some stuff and set positioins --
		-----------------------------------------
		-- Hide
		MinimapBorder:Hide()
		MinimapBorderTop:Hide()
		MinimapZoomIn:Hide()
		MinimapZoomOut:Hide()
		MiniMapTracking:Hide()
		GameTimeFrame:Hide()
		MinimapZoneTextButton:Hide()
		MiniMapMailBorder:Hide()
		-- Sets
		MinimapNorthTag:SetAlpha(0)
		MinimapBackdrop:SetFrameLevel(1)
		Minimap:SetQuestBlobRingAlpha(0)
		Minimap:SetArchBlobRingScalar(0)
		Minimap:SetQuestBlobRingScalar(0)
		--MiniMapInstanceDifficulty:SetAlpha(0)
		--GuildInstanceDifficulty:SetAlpha(0)
		-- Extra
		if ( GarrisonLandingPageMinimapButton:IsShown() ) then
			GarrisonLandingPageMinimapButton:SetAlpha(0)
		end
		GarrisonLandingPageMinimapButton:ClearAllPoints()
		GarrisonLandingPageMinimapButton:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 0, 0)
		GarrisonLandingPageMinimapButton:SetFrameLevel(10)

		if showclock then
			LoadAddOn('Blizzard_TimeManager')
			local clockFrame, clockTime = TimeManagerClockButton:GetRegions()
			clockFrame:Hide()
			clockTime:Show()
			clockTime:SetFont(font, fontSize, fontFlag)
			TimeManagerClockButton:SetPoint("BOTTOM", Minimap, 0, -6)
		else
			LoadAddOn('Blizzard_TimeManager')
			TimeManagerClockButton.Show = TimeManagerClockButton.Hide
			local region = TimeManagerClockButton:GetRegions()
			region:Hide()	
			TimeManagerClockButton:ClearAllPoints()	
			TimeManagerClockButton:Hide()	
		end
		-- mail icon
		MiniMapMailFrame:ClearAllPoints()
		MiniMapMailFrame:SetPoint("TOPRIGHT", Minimap, 1, -20)
		MiniMapMailIcon:SetTexture(mailicon)

		MiniMapWorldMapButton:Hide()
		MiniMapInstanceDifficulty:ClearAllPoints()
		MiniMapInstanceDifficulty:SetParent(Minimap)
		MiniMapInstanceDifficulty:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, -22)
		DropDownList1:SetClampedToScreen(true)

		MiniMapMailFrame:SetFrameLevel(10)
		MiniMapInstanceDifficulty:SetFrameLevel(10)
		-- calendar icon
		local CalendarFrameIcon = CreateFrame("Frame", "$parentCalendarFrameIcon", Minimap)
		CalendarFrameIcon:SetFrameLevel(10)
		CalendarFrameIcon:SetWidth(22)
		CalendarFrameIcon:SetHeight(22)
		CalendarFrameIcon:SetPoint("TOPLEFT", Minimap, 1, -22)
		CalendarFrameIcon:Hide()
		local t = CalendarFrameIcon:CreateTexture(nil, "BACKGROUND")
		t:SetTexture(calendaricon)
		t:SetAllPoints(CalendarFrameIcon)
		CalendarFrameIcon.texture = t
		-- OnClick
		CalendarFrameIcon:SetScript("OnMouseDown", function (self, button)
		    if ( button == 'LeftButton' ) then 
				if(not CalendarFrame) then
					LoadAddOn("Blizzard_Calendar")
				end
				Calendar_Toggle()
	    	end
		end)

		MiniMapInstanceDifficulty:ClearAllPoints()
		MiniMapInstanceDifficulty:SetParent(Minimap)
		MiniMapInstanceDifficulty:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, -22)
		DropDownList1:SetClampedToScreen(true)

		MiniMapMailFrame:SetFrameLevel(10)
		MiniMapInstanceDifficulty:SetFrameLevel(10)

		-- extra align
		QueueStatusMinimapButton:SetSize(20, 20)
		QueueStatusMinimapButton:ClearAllPoints()
		QueueStatusMinimapButton:SetParent(Minimap)
		QueueStatusMinimapButton:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMLEFT", 0, 22)
		QueueStatusMinimapButton:SetFrameLevel(10)
		QueueStatusMinimapButtonBorder:Hide()

		---------------------
		-- mousewheel zoom --
		---------------------
		Minimap:EnableMouseWheel(true)
		Minimap:SetScript("OnMouseWheel", function(self, direction)
			if(direction > 0) then
				Minimap_ZoomIn()
			else
				Minimap_ZoomOut()
			end
		end)
		
		------------------------
		-- move and clickable --
		------------------------

		--[[
		Minimap:SetMovable(true)
		Minimap:SetUserPlaced(true)
		Minimap:SetScript("OnMouseDown", function()
		    if (IsAltKeyDown()) then
		        Minimap:ClearAllPoints()
		        Minimap:StartMoving()
		    end
		end)

		---------------------
		-- move some stuff --
		---------------------
		if moveWatchFrame then
			ObjectiveTrackerFrame:ClearAllPoints()	
			ObjectiveTrackerFrame.ClearAllPoints = function() end
			ObjectiveTrackerFrame:SetPoint(qanchor, qparent, qanchor, qposition_x, qposition_y)
			ObjectiveTrackerFrame.SetPoint = function() end
			ObjectiveTrackerFrame:SetClampedToScreen(true)
			ObjectiveTrackerFrame:SetHeight(qheight)
		end
		--]]
		Minimap:SetScript('OnMouseUp', function(self, button)
			Minimap:StopMovingOrSizing()
			if (button == 'RightButton') then
				ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, self, - (Minimap:GetWidth() * 0.7), -3)
				CalendarFrameIcon:Show()
			elseif (button == 'MiddleButton') then
				if(not CalendarFrame) then
					LoadAddOn("Blizzard_Calendar")
				end
				Calendar_Toggle()
			else
				Minimap_OnClick(self)
			end
		end)
		
		local function GetMinimapShape() return 'SQUARE' end

		-------------------------------
		-- style Battlefield Minimap --
		-------------------------------
		local function hide(f)
			f:SetTexture()
			f.SetTexture = function() end
		end

		hooksecurefunc("LoadAddOn", function(addon)
			if addon ~= "Blizzard_BattlefieldMinimap" then return end

			BattlefieldMinimapBackground:Hide()
			BattlefieldMinimapCorner:Hide()
			BattlefieldMinimapCloseButton:Hide()
			BattlefieldMinimapTab:Hide()
			
			BBorderFrame = CreateFrame("Frame", nil, BattlefieldMinimap)
			BBorderFrame:SetPoint("TOPLEFT", BattlefieldMinimap, "TOPLEFT", -1, 1)
			BBorderFrame:SetPoint("BOTTOMRIGHT", BattlefieldMinimap, "BOTTOMRIGHT", -5, 3)	
			BBorderFrame:SetBackdrop(backdrop)
			if not classColoredBorder then
				BBorderFrame:SetBackdropBorderColor(unpack(brdcolor))
			else
				BBorderFrame:SetBackdropBorderColor(color.r, color.g, color.b)
			end	
			BBorderFrame:SetBackdropColor(unpack(backdropcolor))
			BBorderFrame:SetFrameLevel(6)		
		end)
	else
		Minimap:SetMaskTexture("Interface\\AddOns\\AbyssUI\\Textures\\minimap\\round")
	end
end)
----------------------------------------------------
-- Kill Announcer Frame
----------------------------------------------------
local KillAnouncerFrame = CreateFrame("Frame", "$parentKillAnouncerFrame", UIParent)
KillAnouncerFrame:SetFrameStrata("BACKGROUND")
KillAnouncerFrame:SetWidth(128)
KillAnouncerFrame:SetHeight(128)
KillAnouncerFrame:SetAlpha(.90)
KillAnouncerFrame:SetClampedToScreen(true)
KillAnouncerFrame:SetPoint("CENTER", 120, 5)
KillAnouncerFrame:Hide()
local t = KillAnouncerFrame:CreateTexture(nil, "BACKGROUND")
t:SetTexture("Interface\\Addons\\AbyssUI\\Textures\\extra\\bloodtexture")
t:SetAllPoints(KillAnouncerFrame)
KillAnouncerFrame.texture = t
-- Text
KillAnouncerFrame.text = KillAnouncerFrame.text or KillAnouncerFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
KillAnouncerFrame.text:SetScale(1)
KillAnouncerFrame.text:SetJustifyH("CENTER")
KillAnouncerFrame.text:SetJustifyV("CENTER")
KillAnouncerFrame.text:SetPoint("CENTER", KillAnouncerFrame, "CENTER", 0, -15)
KillAnouncerFrame.text:SetFont(damageFont, 14, "THINOUTLINE")
KillAnouncerFrame.text:SetShadowColor(0/255, 0/255, 0/255)
KillAnouncerFrame.text:SetShadowOffset(1, -1)
-- KillAnouncerHeader
local _G = _G
local KillText = _G["KILLS"]
local KillAnouncerHeader = CreateFrame("Frame", "$parentKillAnouncerHeader", KillAnouncerFrame)
KillAnouncerHeader:SetFrameStrata("BACKGROUND")
KillAnouncerHeader:SetWidth(128)
KillAnouncerHeader:SetHeight(128)
KillAnouncerHeader:SetPoint("CENTER", 0, 20)
-- Text
KillAnouncerHeader.text = KillAnouncerHeader.text or KillAnouncerHeader:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
KillAnouncerHeader.text:SetScale(1.25)
KillAnouncerHeader.text:SetJustifyH("CENTER")
KillAnouncerHeader.text:SetJustifyV("CENTER")
KillAnouncerHeader.text:SetPoint("CENTER", KillAnouncerHeader, "CENTER", 0, -8)
KillAnouncerHeader.text:SetFont(damageFont, 14, "THINOUTLINE")
KillAnouncerHeader.text:SetShadowColor(0/255, 0/255, 0/255)
KillAnouncerHeader.text:SetShadowOffset(1, -1)
KillAnouncerHeader.text:SetText(strupper("|cfffd0101"..KillText.."|r"))
-- Kill SoundList
local soundIDSHorde = { 
	24531,  -- RAGNAROS 
	24530,  -- RAGNAROS2
	38065,  -- GARROSH 
	38066,  -- GARROSH2
	16020,  -- GARROSH3
	24477,  -- FANDRAL 
	13324,  -- Telestra 
	45439,  -- BLACKHAND2 
	21164,  -- Baine
	43913,  -- Koromar
	16146,  -- JARAXXUS
	109300, -- Bwonsamdi
	15591,  -- Kologarn
	42070,  -- Gugrokk2
	50083,  -- Kormrok
	24226,  -- DAAKARA
	44525,  -- KARGATH
	17067,  -- Valithria
	48498, 	-- Orc Male
	14506,  -- Xevozz
	16695,  -- Dsaurfang 
	16854,  -- Taldaram
	16681,  -- Valanar
	35572, 	-- KAZRAJIN
	50594,  -- DARKVINDICATOR
	50593,	-- DARKVINDICATOR2
	8894, 	-- BLA_NAXX
	8801,	-- FAER_NAXX
	10169,	-- Keli
	12027,	-- Halazzi
	10334,	-- Garg
	5831,	-- Herod
	15740,	-- Thorim
	10454,  -- Thrall
	35591, 	-- LeiShen
}
local soundIDSAlly = { 
	24531,  -- RAGNAROS 
	24530,  -- RAGNAROS2
	24477,  -- FANDRAL
	13324,  -- Telestra
	43913,  -- Koromar
	21576,  -- Muradin
	21574,  -- Muradin2
	16146,  -- JARAXXUS
	109300, -- Bwonsamdi
	15591,  -- Kologarn
	16061,  -- Varian
	16062, 	-- Varian2
	42070,  -- Gugrokk2
	43254,  -- Leroy Jenkins
	50083,  -- Kormrok
	44525,  -- KARGATH
	17067,  -- Valithria
	14506,  -- Xevozz
	16854,  -- Taldaram
	16681,  -- Valanar
	35572, 	-- KAZRAJIN
	50594,  -- DARKVINDICATOR
	50593,	-- DARKVINDICATOR2
	8894, 	-- BLA_NAXX
	8801,	-- FAER_NAXX
	10169,	-- Keli
	12027,	-- Halazzi
	10334,	-- Garg
	5831,	-- Herod
	15740,	-- Thorim
	35591, 	-- LeiShen
}
local numSoundsHorde = #soundIDSHorde
local numSoundsAlly  = #soundIDSAlly
local englishFaction, localizedFaction = UnitFactionGroup("player")
local function PlaySoundRandom()
	if ( englishFaction == "Horde") then
		PlaySound(soundIDSHorde[random(1, numSoundsHorde)], "MASTER")
	elseif ( englishFaction == "Alliance") then
		PlaySound(soundIDSAlly[random(1, numSoundsAlly)], "MASTER")
	else
		return nil
	end
end
-- Kill Announcer
local KillAnouncer = CreateFrame("FRAME", "$parentKillAnouncer")
local name = GetUnitName("player")
KillAnouncer:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
KillAnouncer:SetScript("OnEvent", function(self)
	if ( AbyssUIAddonSettings.DisableKillAnnouncer ~= true ) then
	    local timeStamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, prefixParam1, prefixParam2, dummyparam, suffixParam1, suffixParam2 = CombatLogGetCurrentEventInfo()
	    if ( event == "SPELL_DAMAGE" or event == "SPELL_PERIODIC_DAMAGE" or event == "RANGE_DAMAGE" ) and suffixParam2 > 0 then
			if ( suffixParam2 ~= nil ) then
				if ( sourceName == name ) then
					if ( string.find(destGUID, "Player") ) then
						KillAnouncerFrame:Hide()
						KillAnouncerFrame.text:SetText("|cfff2f2f2"..destName.."|r")
						if ( AbyssUIAddonSettings.SilenceKillAnnouncer ~= true ) then
							PlaySoundRandom()
						end
						UIFrameFadeIn(KillAnouncerFrame, 4, 1, 0)
					end
		  		end
		  	end
	  	elseif ( event == "SWING_DAMAGE" ) and prefixParam2 > 0 then
	  		if ( prefixParam2 ~= nil ) then
				if ( sourceName == name ) then
					if ( string.find(destGUID, "Player") ) then
						KillAnouncerFrame:Hide()
						KillAnouncerFrame.text:SetText("|cfff2f2f2"..destName.."|r")
						if ( AbyssUIAddonSettings.SilenceKillAnnouncer ~= true ) then
							PlaySoundRandom()
						end
						UIFrameFadeIn(KillAnouncerFrame, 4, 1, 0)
					end
		  		end
		  	end
	    else
	    	return nil
	    end
	else
		return nil
	end
end)
----------------------------------------------------
-- Tooltip on cursor
local function cursorSetPoint(self)
	local scale = self:GetEffectiveScale()
	local x, y = GetCursorPosition()
	self:ClearAllPoints()
	self:SetPoint("BOTTOMLEFT", UIParent, x / scale + 16, (y / scale - self:GetHeight() - 16))
end
local TooltipOnCursor = CreateFrame("Frame", nil)
TooltipOnCursor:RegisterEvent("PLAYER_ENTERING_WORLD")
TooltipOnCursor:SetScript("OnEvent", function()
	if ( AbyssUIAddonSettings.TooltipOnCursor == true ) then
		hooksecurefunc("GameTooltip_SetDefaultAnchor", function(tooltip, parent)
			if GetMouseFocus() ~= WorldFrame then return end
			tooltip:SetOwner(parent, "ANCHOR_CURSOR")
			cursorSetPoint(tooltip)
			-- tooltip.default = 1
		end)
	end
end)
----------------------------------------------------
-- Talking Head Move
local function RemoveAnchor()
  for i, alertSubSystem in pairs(AlertFrame.alertFrameSubSystems) do
    if alertSubSystem.anchorFrame == THF then
      tremove(AlertFrame.alertFrameSubSystems, i)
      return 
    end
  end
end   

local function TalkingHeadFrameMover()
  MoveTalkingHeadDB = MoveTalkingHeadDB or {}

  TalkingHeadFrame:SetMovable(true)
  TalkingHeadFrame:SetClampedToScreen(true)
  TalkingHeadFrame.ignoreFramePositionManager = true -- important
  
  TalkingHeadFrame:RegisterForDrag("LeftButton")
  TalkingHeadFrame:SetScript("OnDragStart", function(self)
    if IsModifierKeyDown() then -- allow ctrl/shift/alt
      self:StartMoving()
    end
  end)
  TalkingHeadFrame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    if not MoveTalkingHeadDB.point then
      RemoveAnchor()
    end
    local point, _, relPoint, dx, dy = self:GetPoint()
    MoveTalkingHeadDB.point = point
    MoveTalkingHeadDB.relPoint = relPoint
    MoveTalkingHeadDB.dx = dx
    MoveTalkingHeadDB.dy = dy
  end)

  if MoveTalkingHeadDB.point then
    TalkingHeadFrame:ClearAllPoints()
    TalkingHeadFrame:SetPoint(MoveTalkingHeadDB.point, nil, MoveTalkingHeadDB.relPoint, MoveTalkingHeadDB.dx, MoveTalkingHeadDB.dy)
    RemoveAnchor() -- only remove the anchor if the frame has been moved
  end
end

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, ...)
    local addon = ...
    if addon == "Blizzard_TalkingHeadUI" then
        TalkingHeadFrameMover()
        self:UnregisterAllEvents()
    end
end)
----------------------------------------------------
--End
