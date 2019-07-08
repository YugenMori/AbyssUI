--------------------------------------------------------------------------------
-- Author: Yugen
--
-- BFA Version
--
-- Hope you like my addOn ^^
--
-- Simple UI Movable for AbyssUI
--------------------------------------------------------------------------------

local MoveFramesPerSettings = {}

-- Frame Stuff
 local function AbyssUIMoveFrames_Function()
	for i , v in pairs ({ ObjectiveTrackerFrame,
		PlayerFrame, 
		MainMenuBar,
		}) do
		local f = v
		f:SetMovable(true)
		f:EnableMouse(true)
		f:SetClampedToScreen(true)
		f:RegisterForDrag("LeftButton")
		f:SetScript("OnDragStart", f.StartMoving)
		f:SetScript("OnDragStop", function(self)
		  self:StopMovingOrSizing()
		  settings.XPos = self:GetLeft()
		  settings.YPos = self:GetBottom()
		end)

		f:RegisterEvent("PLAYER_LOGIN")
		f:SetScript("OnEvent", function(self, event, ...)
			if event == "PLAYER_LOGIN" then
				MoveFramesPerSettings = MoveFramesPerSettings or {}
				settings = MoveFramesPerSettings
				if settings.XPos then
			 		f:ClearAllPoints()
			  		f:SetPoint("BOTTOMLEFT", settings.XPos, settings.YPos)
				end
			end
		end)
		-- Highlight
		f:SetPoint("CENTER")
		local tex = f:CreateTexture("ARTWORK")
		tex:SetAllPoints()
		tex:SetTexture(1.0, 0.5, 0); tex:SetAlpha(0.5)
	end
end

-- Slash Commands
-- Handler
local function AbyssUIMoveFrames_Slashhandler()
	print("|cffa5f6f3AbyssUI Command List|r")
	print("|cffa5f6f3Type /abyssui |r|cffffcc00'command name'|r")
	print("/abyssui |cffffcc00config|r ~configuration panel")
	print("/abyssui |cffffcc00unlock|r ~unlock UI frames for better customization")
	print("/abyssui |cffffcc00lock|r ~lock UI frames that was changed")
end
-- Function
local function AbyssUIMoveFrames_Slash(msg)
	if ( msg ~= "" ) then
		if ( msg == "config" ) then
			InterfaceOptionsFrame_Show()
			InterfaceOptionsFrame_OpenToCategory(AbyssUI_Config)
			InterfaceOptionsFrame_OpenToCategory(AbyssUI_Config)
		elseif (msg == "unlock") then
			AbyssUIMoveFrames_Function()
		elseif (msg == "lock") then
			ReloadUI()
		else
			return nil
		end
	else 
		return AbyssUIMoveFrames_Slashhandler()
	end
end

-- Slash
SLASH_ABUI1 = '/abyssui'
function SlashCmdList.ABUI(msg, editbox)
	AbyssUIMoveFrames_Slash(msg)
end
--End