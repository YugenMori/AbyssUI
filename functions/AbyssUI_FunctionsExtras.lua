-- Author: Yugen
--
-- Supports any version of wow
--
-- Extra functions for AbyssUI
--------------------------------------------------------------
-- Init - Tables - Saves
local addonName, addonTable = ...
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
	elseif AbyssUIAddonSettings.UIVertexColorFrames17 == true then
		v:SetVertexColor(51/255, 147/255, 127/255)
	elseif AbyssUIAddonSettings.UIVertexColorFramesColorPicker == true then
		local character = UnitName("player").."-"..GetRealmName()
		v:SetVertexColor(COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b)	
	else
		v:SetVertexColor(.4, .4, .4)
	end
end
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
-- UnitColor
local UnitColor
local function UnitColor(unit)
  --if (AbyssUIAddonSettings.UnitFrameImproved ~= true) then
    local r, g, b, a
    if ((not UnitIsPlayer(unit)) and ((not UnitIsConnected(unit)) or (UnitIsDeadOrGhost(unit)))) then
      --Color it gray
      r, g, b, a = 0.5, 0.5, 0.5, 1
    elseif (UnitIsPlayer(unit)) then
      --Try to color it by class.
      local localizedClass, englishClass = UnitClass(unit)
      local classColor = RAID_CLASS_COLORS[englishClass]
      if (classColor and not AbyssUIAddonSettings.GreenHealth) then
        r, g, b, a = classColor.r, classColor.g, classColor.b, classColor.a
      else
        if (UnitIsFriend("player", unit)) then
          r, g, b, a = 0.0, 1.0, 0.0, 1
        else
          r, g, b, a = 1.0, 0.0, 0.0, 1
        end
      end
    else
      r, g, b, a = UnitSelectionColor(unit)
    end
    return r, g, b, a
  --end
end
-- Fade UI
local _G = _G
-- check hide
local function checkForWhatToHide(self, event)
	local inInstance, instanceType = IsInInstance()
	if (instanceType == "pvp" or instanceType == "arena" or instanceType == "party" or instanceType == "raid") then
		self:SetAlpha(1)
	else
		if((self:GetAlpha() == 0 or not self:IsShown()) and (not TargetFrame:IsShown() or TargetFrame:GetAlpha() == 0)) then
			--UIFrameFadeIn(self, 1, 0, 1)
			self:SetAlpha(1)
		elseif ((self:GetAlpha() == 1 or self:IsShown()) and (not TargetFrame:IsShown() or TargetFrame:GetAlpha() == 0)) then
			--UIFrameFadeIn(self, 1, 1, 0)
			self:SetAlpha(0)
		elseif ((self:GetAlpha() == 0 or self:IsShown()) and (TargetFrame:IsShown() or TargetFrame:GetAlpha() == 1)) then
			self:SetAlpha(1)
		elseif ((self:GetAlpha() == 0 or not self:IsShown()) and (TargetFrame:IsShown() or TargetFrame:GetAlpha() == 1)) then
			self:SetAlpha(1)
		elseif ((self:GetAlpha() == 1 or self:IsShown()) and (TargetFrame:IsShown() or TargetFrame:GetAlpha() == 1) and event == "PLAYER_REGEN_ENABLED") then
			--UIFrameFadeIn(self, 1, 1, 0)
			self:SetAlpha(0)
		else
			return nil
		end
		if (event == "PLAYER_REGEN_ENABLED") then
			--UIFrameFadeIn(self, 1, 1, 0)
			self:SetAlpha(0)
		end
	end
end
local function checkUnitToHide(self)
	if(self:IsShown() and (not PlayerFrame:IsShown() or PlayerFrame:GetAlpha() == 0)) then
		--UIFrameFadeIn(self, 1, 1, 0)
		self:SetAlpha(0)
	elseif (not self:IsShown() and (PlayerFrame:IsShown() or PlayerFrame:GetAlpha() == 1)) then
		self:SetAlpha(1)
	else
		return nil
	end
end
local FadeUIFirstHide = CreateFrame("CheckButton", "$parentFadeUIFirstHide", UIParent, "ChatConfigCheckButtonTemplate")
FadeUIFirstHide:RegisterEvent("PLAYER_ENTERING_WORLD")
FadeUIFirstHide:SetScript("OnEvent", function(self, event, ...)
	if (AbyssUIAddonSettings.FadeUI == true) then
		C_Timer.After(1, function() 
			for i, v in pairs ({
				PlayerFrame,
				BuffFrame,
				QuestWatchFrame,
				GeneralDockManager,
				ChatFrameMenuButton,
				ChatFrameChannelButton,
				MainMenuBar,
				VerticalMultiBarsContainer,
				MultiBarLeft,
				ObjectiveTrackerFrame,
			}) do
				checkForWhatToHide(v, event)
			end
			for i=1, 12 do
				UIFrameFadeIn(_G["ExtraBarButton"..i], 1, 1, 0)			
			end
			for i, v in pairs({
				TargetFrame,
				FocusFrame,
			}) do
				checkUnitToHide(v) 
			end
		end)
	else
		return nil
	end
end)
local FadeUI = CreateFrame("CheckButton", "$parentFadeUI", UIParent, "ChatConfigCheckButtonTemplate")
FadeUI:RegisterEvent("PLAYER_REGEN_DISABLED")
FadeUI:RegisterEvent("PLAYER_REGEN_ENABLED")
FadeUI:RegisterEvent("PLAYER_TARGET_CHANGED")
if (GetWoWVersion > 12400) then
	FadeUI:RegisterEvent("PLAYER_FOCUS_CHANGED")
end
--FadeUI:RegisterEvent("PARTY_MEMBERS_CHANGED")
FadeUI:RegisterEvent("RAID_ROSTER_UPDATE")
FadeUI:SetScript("OnEvent", function(self, event, ...)
	if (AbyssUIAddonSettings.FadeUI == true) then
		if (event == "PLAYER_REGEN_DISABLED" or event == "PLAYER_REGEN_ENABLED") then
			for i, v in pairs ({
				PlayerFrame,
				BuffFrame,
				QuestWatchFrame,
				GeneralDockManager,
				ChatFrameMenuButton,
				ChatFrameChannelButton,
				MainMenuBar,
				VerticalMultiBarsContainer,
				MultiBarLeft,
				ObjectiveTrackerFrame,
			}) do
				checkForWhatToHide(v, event)
			end
			--for i=1, 12 do
				--UIFrameFadeIn(_G["ExtraBarButton"..i], 1, 1, 0)			
			--end
			for i, v in pairs({
				TargetFrame,
				FocusFrame,
			}) do
				checkUnitToHide(v) 
			end
		elseif (event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_FOCUS_CHANGED") then
			for i, v in pairs ({
				PlayerFrame,
				BuffFrame,
				QuestWatchFrame,
				GeneralDockManager,
				ChatFrameMenuButton,
				ChatFrameChannelButton,
				MainMenuBar,
				VerticalMultiBarsContainer,
				MultiBarLeft,
				ObjectiveTrackerFrame,
			}) do
				checkForWhatToHide(v, event)
			end
			for i, v in pairs({
				TargetFrame,
				FocusFrame,
			}) do
				checkUnitToHide(v) 
			end
		elseif (event == "PARTY_MEMBERS_CHANGED" or event == "RAID_ROSTER_UPDATE") then
			for i, v in pairs ({
				PlayerFrame,
				BuffFrame,
				QuestWatchFrame,
				GeneralDockManager,
				ChatFrameMenuButton,
				ChatFrameChannelButton,
				MainMenuBar,
				VerticalMultiBarsContainer,
				MultiBarLeft,
				ObjectiveTrackerFrame,
			}) do
				checkForWhatToHide(v, event)
			end
			for i, v in pairs({
				TargetFrame,
				FocusFrame,
			}) do
				checkUnitToHide(v) 
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
	if (AbyssUIAddonSettings.FadeUI == true) then
		for i, v in pairs ({
			PlayerFrame,
			BuffFrame,
			QuestWatchFrame,
			GeneralDockManager,
			ChatFrameMenuButton,
			ChatFrameChannelButton,
			MainMenuBar,
			VerticalMultiBarsContainer,
			MultiBarLeft,
			ObjectiveTrackerFrame,
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
----------------------------------------------------
-- ChatBubble
-- Thanks to cokedrivers for this awesome code
local ChatBubbleColorization = CreateFrame("CheckButton", "$parentChatBubbleColorization", UIParent, "ChatConfigCheckButtonTemplate")
ChatBubbleColorization:RegisterEvent("PLAYER_ENTERING_WORLD")
ChatBubbleColorization:SetScript("OnEvent", function(self, event, ...)
	if (AbyssUIAddonSettings.ExtraFunctionChatBubbleChanges ~= true) then
		if (event == "PLAYER_ENTERING_WORLD") then
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
				if (not frame:IsForbidden()) then
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
				if (not frame:IsForbidden()) then
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
t:SetTexture("Interface\\Addons\\AbyssUI\\textures\\extra\\bloodtexture")
t:SetAllPoints(KillAnouncerFrame)
KillAnouncerFrame.texture = t
-- Text
KillAnouncerFrame.text = KillAnouncerFrame.text or KillAnouncerFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
KillAnouncerFrame.text:SetScale(1)
KillAnouncerFrame.text:SetPoint("BOTTOM")
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
KillAnouncerHeader.text:SetPoint("BOTTOM")
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
	if (englishFaction == "Horde") then
		PlaySound(soundIDSHorde[random(1, numSoundsHorde)], "MASTER")
	elseif (englishFaction == "Alliance") then
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
	if (AbyssUIAddonSettings.DisableKillAnnouncer ~= true) then
	    local timeStamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, prefixParam1, prefixParam2, dummyparam, suffixParam1, suffixParam2 = CombatLogGetCurrentEventInfo()
	    if (event == "SPELL_DAMAGE" or event == "SPELL_PERIODIC_DAMAGE" or event == "RANGE_DAMAGE") and suffixParam2 > 0 then
			if (suffixParam2 ~= nil) then
				if (sourceName == name) then
					if (string.find(destGUID, "Player")) then
						KillAnouncerFrame:Hide()
						KillAnouncerFrame.text:SetText("|cfff2f2f2"..destName.."|r")
						if (AbyssUIAddonSettings.SilenceKillAnnouncer ~= true) then
							PlaySoundRandom()
						end
						UIFrameFadeIn(KillAnouncerFrame, 4, 1, 0)
					end
		  		end
		  	end
	  	elseif (event == "SWING_DAMAGE") and prefixParam2 > 0 then
	  		if (prefixParam2 ~= nil) then
				if (sourceName == name) then
					if (string.find(destGUID, "Player")) then
						KillAnouncerFrame:Hide()
						KillAnouncerFrame.text:SetText("|cfff2f2f2"..destName.."|r")
						if (AbyssUIAddonSettings.SilenceKillAnnouncer ~= true) then
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
--End
