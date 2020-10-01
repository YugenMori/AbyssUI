-- testinf stuff
AbyssUI_SavedProfiles = LibStub("AceAddon-3.0"):NewAddon("AbyssUI")

local defaults = {
  profile = {
    optionA = true,
    optionB = false,
    suboptions = {
      subOptionA = false,
      subOptionB = true,
    },
  }
}

function AbyssUI_SavedProfiles:OnInitialize()
  self.db = LibStub("AceDB-3.0"):New("AbyssUI_SavedProfiles", defaults)
end



function AbyssUI_SavedProfiles:OnInitialize()
    -- Called when the addon is loaded
    LibStub("AceConfig-3.0"):RegisterOptionsTable("WelcomeHome", options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("WelcomeHome", "WelcomeHome")
    self:RegisterChatCommand("wh", "ChatCommand")
    self:RegisterChatCommand("welcomehome", "ChatCommand")	
    WelcomeHome.message = "Welcome Home!"
end
