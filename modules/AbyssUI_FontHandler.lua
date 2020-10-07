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
    globalFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    subFont   = mediaFolder.."zhCN-TW\\senty.ttf"
    damageFont  = mediaFolder.."zhCN-TW\\senty.ttf"
  elseif ( locale == "zhTW" ) then
    globalFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    subFont   = mediaFolder.."zhCN-TW\\senty.ttf"
    damageFont  = mediaFolder.."zhCN-TW\\senty.ttf"
  elseif ( locale == "ruRU" ) then
    globalFont  = mediaFolder.."ruRU\\dejavu.ttf"
    subFont   = mediaFolder.."ruRU\\dejavu.ttf"
    damageFont  = mediaFolder.."ruRU\\dejavu.ttf"
  elseif ( locale == "koKR" ) then
    globalFont  = mediaFolder.."koKR\\dxlbab.ttf"
    subFont   = mediaFolder.."koKR\\dxlbab.ttf"
    damageFont  = mediaFolder.."koKR\\dxlbab.ttf"
  elseif ( locale == "frFR" or locale == "deDE" or locale == "enGB" or locale == "enUS" or locale == "itIT" or
    locale == "esES" or locale == "esMX" or locale == "ptBR") then
    globalFont  = mediaFolder.."global.ttf"
    subFont   = mediaFolder.."npcfont.ttf"
    damageFont  = mediaFolder.."damagefont.ttf"
  else
    globalFont  = fontName
    subFont   = fontName
    damageFont  = fontName
  end
  return globalFont, subFont, damageFont
end
-- declarations
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
    DAMAGE_TEXT_FONT            = damageFont
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
----------------------------------------------------
local function AbyssUI_CheckFonts()
  local FontsValue = CreateFrame("CheckButton", "$parentFontsValue", nil, "ChatConfigCheckButtonTemplate")
  local tx = FontsValue:CreateTexture()
  tx:SetPoint('TOPLEFT', nil, -500, -500)
  tx:SetTexture('Interface\\TargetingFrame\\UI-CLASSES-CIRCLES_RETRO')
  tx:SetSize(0,0) 
  tx:SetAlpha(0)
  FontsValue:SetAllPoints(tx)
  FontsValue:SetAlpha(0)
  FontsValue:SetScript('OnSizeChanged', function(self, width, height)
      local size = format('%.0f%.0f', width, height)
      if size == '11' then  
        AbyssUIAddonSettings.FontsValue = false
      else
        AbyssUIAddonSettings.FontsValue = true
      end
  end)
end
local init = CreateFrame("Frame", nil)
init:RegisterEvent("ADDON_LOADED")
init:RegisterEvent("PLAYER_LOGOUT")
init:SetScript("OnEvent", function()
  if AbyssUIAddonSettings.FontsValue then
    AbyssUIAddonSettings.FontsValue = AbyssUIAddonSettings.FontsValue
    AbyssUI_CheckFonts()
  end
end)
----------------------------------------------------
local function AbyssUI_ApplyFonts(self)
  _G[self]:SetTextColor(45/255, 45/255, 45/255)
  _G[self]:SetFont(globalFont, 14, "NORMAL")
  _G[self]:SetShadowColor(45/255, 45/255, 45/255)
  _G[self]:SetShadowOffset(0.5, 0)
end
local function AbyssUI_ApplyFontsNoGlobal(self)
  self:SetTextColor(45/255, 45/255, 45/255)
  self:SetFont(globalFont, 14, "NORMAL")
  self:SetShadowColor(45/255, 45/255, 45/255)
  self:SetShadowOffset(0.5, 0)
end
----------------------------------------------------
-- Change yellow fonts text color
-- General
local f, _ = CreateFrame("frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event)
  f.yellow = {
  "InterfaceOptionsFrameOkayText",
  "InterfaceOptionsFrameCancelText",
  "InterfaceOptionsFrameDefaultsText",
  "InterfaceOptionsDisplayPanelResetTutorialsText",
  "CompactUnitFrameProfilesGeneralOptionsFrameResetPositionButtonText",
  "VideoOptionsFrameOkayText",
  "VideoOptionsFrameCancelText",
  "VideoOptionsFrameDefaultsText",
  "VideoOptionsFrameApplyText",
  "ScriptErrorsFrameText",
  "QuestFrameAcceptButtonText",
  "QuestFrameDeclineButtonText",
  "GossipFrameGreetingGoodbyeButtonText",
  "AddonListEnableAllButtonText",
  "AddonListDisableAllButtonText",
  "AddonListOkayButtonText",
  "AddonListCancelButtonText",
  "GameMenuButtonHelpText",
  "GameMenuButtonStoreText",
  "GameMenuButtonWhatsNewText",
  "GameMenuButtonOptionsText",
  "GameMenuButtonUIOptionsText",
  "GameMenuButtonKeybindingsText",
  "GameMenuButtonMacrosText",
  "GameMenuButtonAddonsText",
  "GameMenuButtonLogoutText",
  "GameMenuButtonQuitText",
  "GameMenuButtonContinueText",
  "OpenAllMailText",
  "SendMailMailButtonText",
  "SendMailCancelButtonText",
  "LFDQueueFrameFindGroupButtonText",
  "RaidFinderFrameFindRaidButtonText",
  "StaticPopup1Button1Text",
  "StaticPopup1Button2Text",
  "StaticPopup1Button3Text",
  "StaticPopup1Button4Text",
  "PVPReadyDialogEnterBattleButtonText",
  "PVPReadyDialogLeaveQueueButtonText",
  "LFGDungeonReadyDialogEnterDungeonButtonText",
  "LFGDungeonReadyDialogLeaveQueueButtonText",
  "FriendsFrameAddFriendButtonText",
  "FriendsFrameSendMessageButtonText",
  "FriendsFrameIgnorePlayerButtonText",
  "FriendsFrameUnsquelchButtonText",
  "FriendsFrameBattlenetFrameText",
  "RecruitAFriendFrameText",
  "WhoFrameWhoButtonText",
  "WhoFrameAddFriendButtonText",
  "WhoFrameGroupInviteButtonText",
  "RaidFrameConvertToRaidButtonText",
  "RaidFrameRaidInfoButtonText",
  "QuickJoinFrameText",
  "StackSplitFrameText",

  }
  if ( AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true and AbyssUIAddonSettings.FontsValue == true ) then
    for _, v in next, f.yellow do 
      AbyssUI_ApplyFonts(v)
    end
    for i, v in pairs ({
      LFGListFrame.CategorySelection.StartGroupButton.Text,
      LFGListFrame.CategorySelection.FindGroupButton.Text,
      LFGListFrame.EntryCreation.CancelButton.Text,
      LFGListFrame.EntryCreation.ListGroupButton.Text,
      ScriptErrorsFrame.Close.Text,
      RecruitAFriendFrame.RecruitmentButton.Text,
      FriendsFrameBattlenetFrame.BroadcastFrame.CancelButton.Text,
      CinematicFrameCloseDialogConfirmButton.Text,
      CinematicFrameCloseDialogResumeButton.Text,
      StackSplitFrame.CancelButton.Text,
      PVPMatchResults.buttonContainer.leaveButton.Text,
      QuestMapFrame.DetailsFrame.BackButton.Text,
      QuestMapFrame.DetailsFrame.AbandonButton.Text,
      QuestMapFrame.DetailsFrame.ShareButton.Text,
      QuestMapFrame.DetailsFrame.TrackButton.Text,

    }) do 
      AbyssUI_ApplyFontsNoGlobal(v)
    end
  end
end)
----------------------------------------------------
----------------------------------------------------
-- Buttons that need a load
-- KeyBinding
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
  if name == "Blizzard_BindingUI" then
    f.yellow = {
      "KeyBindingFrameText",
    }
    if ( AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true and AbyssUIAddonSettings.FontsValue == true ) then
      for _, v in next, f.yellow do 
        AbyssUI_ApplyFonts(v)
      end
      for i, v in pairs ({
        KeyBindingFrame.defaultsButton.Text,
        KeyBindingFrame.unbindButton.Text,
        KeyBindingFrame.okayButton.Text,
        KeyBindingFrame.cancelButton.Text,
      }) do 
        AbyssUI_ApplyFontsNoGlobal(v)
      end
    end
  end
end)
-- Macros
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
  if name == "Blizzard_MacroUI" then
    f.yellow = {
      "MacroDeleteButtonText",
      "MacroNewButtonText",
      "MacroExitButtonText",
      "MacroEditButtonText",
      "MacroSaveButtonText",
      "MacroCancelButtonText",
    }
    if ( AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true and AbyssUIAddonSettings.FontsValue == true ) then
      for _, v in next, f.yellow do 
        AbyssUI_ApplyFonts(v)
      end
    end
  end
end)
-- PVPUI
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
  if name == "Blizzard_PVPUI" then
    f.yellow = {
      "HonorFrameQueueButtonText",
      "ConquestJoinButtonText",
    }
    if ( AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true and AbyssUIAddonSettings.FontsValue == true ) then
      for _, v in next, f.yellow do 
        AbyssUI_ApplyFonts(v)
      end
    end
  end
end)
-- Wardrobe
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
  if name == "Blizzard_Collections" then
    f.yellow = {
      "PetJournalSummonButtonText",
      "PetJournalFindBattleText",
      "MountJournalMountButtonText",
    }
    if ( AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true and AbyssUIAddonSettings.FontsValue == true ) then
      for _, v in next, f.yellow do 
        AbyssUI_ApplyFonts(v)
      end
      for i, v in pairs ({
        WardrobeTransmogFrame.ApplyButton.Text,
        WardrobeOutfitDropDown.SaveButton.Text,
      }) do 
        AbyssUI_ApplyFontsNoGlobal(v)
      end
    end
  end
end)
-- Class Train
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
  if name == "Blizzard_TrainerUI" then
    f.yellow = {
      "ClassTrainerTrainButtonText",
    }
    if ( AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true and AbyssUIAddonSettings.FontsValue == true ) then
      for _, v in next, f.yellow do 
        AbyssUI_ApplyFonts(v)
      end
    end
  end
end)
-- Communities
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
  if name == "Blizzard_Communities" then
    f.yellow = {
      "ClubFinderGuildFinderFrameText",
      "ClubFinderCommunityAndGuildFinderFrameText",
    }
    if ( AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true and AbyssUIAddonSettings.FontsValue == true ) then
      for _, v in next, f.yellow do 
        AbyssUI_ApplyFonts(v)
      end
      for i, v in pairs ({
        CommunitiesFrame.CommunitiesControlFrame.GuildRecruitmentButton.Text,
        CommunitiesFrame.InviteButton.Text,
        CommunitiesFrame.GuildLogButton.Text,
        CommunitiesFrame.GuildMemberDetailFrame.RemoveButton.Text,
        CommunitiesFrame.GuildMemberDetailFrame.GroupInviteButton.Text,
      }) do 
        AbyssUI_ApplyFontsNoGlobal(v)
      end
    end
  end
end)
-- Talent
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
  if name == "Blizzard_TalentUI" then
    f.yellow = {
      "PlayerTalentFrameSpecializationLearnButtonText",
    }
    if ( AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true and AbyssUIAddonSettings.FontsValue == true ) then
      for _, v in next, f.yellow do 
        AbyssUI_ApplyFonts(v)
      end
    end
  end
end)
-- Calendar
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
  if name == "Blizzard_Calendar" then
    f.yellow = {
      "CalendarCreateEventInviteButtonText",
      "CalendarCreateEventMassInviteButtonText",
      "CalendarCreateEventCreateButtonText",
    }
    if ( AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true and AbyssUIAddonSettings.FontsValue == true ) then
      for _, v in next, f.yellow do 
        AbyssUI_ApplyFonts(v)
      end
    end
  end
end)
-- Inspect
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
  if name == "Blizzard_InspectUI" then
    f.yellow = {
      "InspectPaperDollFrameText",
      "DressUpFrameResetButtonText",
      "DressUpFrameCancelButtonText",
    }
    if ( AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true and AbyssUIAddonSettings.FontsValue == true ) then
      for _, v in next, f.yellow do 
        AbyssUI_ApplyFonts(v)
      end
      for i, v in pairs ({
        DressUpFrameOutfitDropDown.SaveButton.Text,
      }) do 
        AbyssUI_ApplyFontsNoGlobal(v)
      end
    end
  end
end)
-- Auction House
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
  if name == "Blizzard_AuctionHouseUI" then
    if ( AbyssUIAddonSettings.ExtraFunctionDisableFontWhiteText ~= true and AbyssUIAddonSettings.FontsValue == true ) then
      for i, v in pairs ({
        AuctionHouseFrame.SearchBar.SearchButton.Text,
        AuctionHouseFrame.ItemBuyFrame.BackButton.Text,
        AuctionHouseFrame.ItemBuyFrame.BidFrame.BidButton.Text,
        AuctionHouseFrame.ItemBuyFrame.BuyoutFrame.BuyoutButton.Text,
        AuctionHouseFrame.ItemSellFrame.QuantityInput.MaxButton.Text,
        AuctionHouseFrame.ItemSellFrame.PostButton.Text,
        AuctionHouseFrameAuctionsFrame.CancelAuctionButton.Text,
        AuctionHouseFrameAuctionsFrame.BidFrame.BidButton.Text,
        AuctionHouseFrameAuctionsFrame.BuyoutFrame.BuyoutButton.Text,
        AuctionHouseFrame.CommoditiesSellFrame.QuantityInput.MaxButton.Text,
        AuctionHouseFrame.CommoditiesSellFrame.PostButton.Text,
        AuctionHouseFrame.CommoditiesBuyFrame.BackButton.Text,
        AuctionHouseFrame.CommoditiesBuyFrame.BuyDisplay.BuyButton.Text,
      }) do 
        AbyssUI_ApplyFontsNoGlobal(v)
      end
    end
  end
end)  
--------------------------------------------------------------
-- End