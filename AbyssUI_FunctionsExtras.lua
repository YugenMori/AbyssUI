-- Author: Yugen
--
-- Shadowlands
--
-- Extra functions for AbyssUI
--------------------------------------------------------------------------------
-- Fade UI
local FadeUIFirstHide = CreateFrame("CheckButton", "$parentFadeUIFirstHide", UIParent, "ChatConfigCheckButtonTemplate")
FadeUIFirstHide:RegisterEvent("PLAYER_ENTERING_WORLD")
local _G = _G
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
-- ActionBar
--[[
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
		for id = 13, 24 do
			local b = CreateFrame("CheckButton", "ExtraBarButton"..( id - 12), UIParent, "ActionBarButtonTemplate")
		      --MultiBarBottomRightButton
			b:SetSize(40*UIParent:GetScale(), 40*UIParent:GetScale())
			b:SetAttribute("action", id)
			b:SetID(id)
			b:SetPoint("CENTER", _G["MultiBarBottomRightButton"..( id - 12)], "CENTER", -543, 90)
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
--]]
----------------------------------------------
-- NamePlate Style 
-- Thanks to SDPhantom for the mostly part of this
----------------------------------------------
--  Nametag font size
local function SetFont(obj, optSize)
	if ( AbyssUIAddonSettings.ExtraFunctionNameplateChanges ~= true ) then
	    local fontName = obj:GetFont()
	    obj:SetFont(fontName, optSize, "THINOUTLINE")

	    SetFont(SystemFont_LargeNamePlate, 8)
		SetFont(SystemFont_NamePlate, 8)
		SetFont(SystemFont_LargeNamePlateFixed, 8)
		SetFont(SystemFont_NamePlateFixed, 8)
		 
		--  Disable nametag colors
		DefaultCompactNamePlateFriendlyFrameOptions.colorNameBySelection = false
		DefaultCompactNamePlateEnemyFrameOptions.colorNameBySelection = false
		DefaultCompactNamePlatePlayerFrameOptions.colorNameBySelection = false
	else
		return nil
	end
end
--  Move nametag
hooksecurefunc("DefaultCompactNamePlateFrameAnchorInternal", function(frame)
	if ( not frame:IsForbidden() and AbyssUIAddonSettings.ExtraFunctionNameplateChanges ~= true ) then
		frame.name:ClearAllPoints() --  Clear nametag anchors
		PixelUtil.SetPoint(frame.name, "BOTTOM", frame.healthBar, "TOP", 0, 4)--    Set new anchor
	end
end)
--  Remove realm names
hooksecurefunc("CompactUnitFrame_UpdateName", function(frame)
	if ( not frame:IsForbidden() and AbyssUIAddonSettings.ExtraFunctionNameplateChanges ~= true ) then
	    if ShouldShowName(frame) then
	        frame.name:SetVertexColor(1,1,1) -- Fixes tapped mobs permanently setting the nametag gray
	        frame.name:SetText(GetUnitName(frame.unit))
	    end
	end
end)
----------------------------------------------
-- Nameplate Health Text
local NamePlateHealthText = {}
hooksecurefunc(NamePlateDriverFrame, "OnNamePlateCreated", function(self, base)--  Hook Nameplate creation
    if ( unit ~= "player" and AbyssUIAddonSettings.ExtraFunctionNameplateChanges ~= true ) then
	    local unitframe = base.UnitFrame
	    local health = unitframe.healthBar:CreateFontString(nil, "OVERLAY")
	    health:SetFont("Fonts\\FRIZQT__.TTF", 8)
	    health:SetPoint("CENTER")
	    health:SetTextColor(1, 1, 1)
		health:SetShadowColor(0, 0, 0)
		health:SetShadowOffset(1, -1)
	    NamePlateHealthText[unitframe] = health
    else
    	return nil
    end
end)
hooksecurefunc("CompactUnitFrame_UpdateHealth", function(self)-- This is a shared function with other UnitFrames
    if ( NamePlateHealthText[self] and AbyssUIAddonSettings.ExtraFunctionNameplateChanges ~= true ) then 
        NamePlateHealthText[self]:SetText(UnitHealth(self.displayedUnit))
    end
end)
-- Nameplate colorization
hooksecurefunc("CompactUnitFrame_UpdateHealth", function(frame)
	if ( not frame:IsForbidden() and AbyssUIAddonSettings.ExtraFunctionNameplateChanges ~= true ) then
		local unitTarget = UnitIsPlayer("target")
		local reaction = UnitReaction("player", "target") or 4
		local _, class = UnitClass('player')
	 	local color = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
	    if frame.optionTable.colorNameBySelection and not frame:IsForbidden() then
	        local healthPercentage = ceil((UnitHealth(frame.displayedUnit) / UnitHealthMax(frame.displayedUnit) * 100))
	        if ( unitTarget ~= true and reaction < 5 ) then
		        if C_NamePlate.GetNamePlateForUnit(frame.unit) == C_NamePlate.GetNamePlateForUnit("target") then
		            if healthPercentage == 100 then
		                frame.healthBar:SetStatusBarColor(1, 0, 0)
		            elseif healthPercentage < 75 and healthPercentage >= 50 then
		            	frame.healthBar:SetStatusBarColor(1, 0.64, 0)
		            elseif healthPercentage < 50 and healthPercentage >= 20 then
		            	frame.healthBar:SetStatusBarColor(1, 1, 0)
		            elseif healthPercentage < 21 then
		                frame.healthBar:SetStatusBarColor(128/255, 128/255, 128/255)
		            end
		        end
		    end
		    local unitPlayer = UnitIsPlayer("player")
		    if ( unitPlayer == true ) then
		        if C_NamePlate.GetNamePlateForUnit(frame.unit) == C_NamePlate.GetNamePlateForUnit("player") then
		            if healthPercentage == 100 then
		            	frame.healthBar:SetStatusBarColor(color.r, color.g, color.b)
		            elseif healthPercentage < 100 and healthPercentage > 21 then
		            	frame.healthBar:SetStatusBarColor(color.r, color.g, color.b)
		            elseif healthPercentage < 21 then
		                frame.healthBar:SetStatusBarColor(128/255, 128/255, 128/255)
		            end
		        end
		    end
	    end
	else 
		return nil
	end
end)
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
-- Square Minimap
-- Thanks to Dawn for this amazing minimap code (I almost didn't change a thing)
local SquareMinimap_ = CreateFrame("CheckButton", "$parentSquareMinimap_", UIParent, "ChatConfigCheckButtonTemplate")
SquareMinimap_:RegisterEvent("PLAYER_ENTERING_WORLD")
SquareMinimap_:SetScript("OnEvent", function(self, event, ...)
	if ( event == "PLAYER_ENTERING_WORLD" ) then
		-- minimap default position - you can move it ingame by holding down ALT!
		if ( AbyssUIAddonSettings.DisableSquareMinimap ~= true ) then
			local position = "TOPRIGHT"     	
			local position_x = -20          		
			local position_y = -2        		

			-- achievement/quest tracker position
			local moveWatchFrame = true			-- enable/disable positioning, set to false if you are using a different addon to move it
			local qparent = UIParent         
			local qanchor = "TOPRIGHT"  	 
			local qposition_x = -60           
			local qposition_y = -260         
			local qheight = 400             

			local useInfoPanel = true		-- enable disable fps/latency and clock
			local showclock = false			-- ONLY show clock - makes sense to set useInfoPanel to false if you only want to show the clock ^^
			local AddonNumb = 30			-- maximum number of addons shown in tooltip (will always show set number of top memory usage addons)

			local mediaFolder = "Interface\\AddOns\\AbyssUI\\Textures\\minimap\\"	-- don't touch this ...
			local texture = "Interface\\Buttons\\WHITE8x8"
			--local backdrop = {bgFile = texture, edgeFile = texture, edgeSize = 1, insets = { left = -1, right = -1, top = -1, bottom = -1}}
			local backdrop = {edgeFile = texture, edgeSize = 1}
				
			local mailicon = mediaFolder.."mail"
			local font = mediaFolder.."big_noodle_titling.ttf"
			local fontSize = 12
			local fontFlag = "THINOUTLINE"			-- "THINOUTLINE", "OUTLINE MONOCHROME", "OUTLINE" or nil (no outline)

			local backdropcolor = {0/255, 0/255, 0/255}			-- backdrop color	
			local brdcolor = {0/255, 0/255, 0/255}				-- backdrop border color
			local infocolor = {41/255, 41/255, 41/255}			-- info panel color
			local IpanelBGalpha = 0.5							-- info panel background alpha

			local classColoredBorder = false					-- color border by class
			local scale = 1

			local enableCombatFade = true						-- enable/disable fade out in combat
			local inCombatAlpha = 0.3							-- in combat alpha
			local outCombatAlpha = 1.0							-- ooc alpha

			-----------
			-- style --
			-----------
			local _, class = UnitClass('player')
			local color = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]			

			Minimap:SetSize(172*scale, 172*scale)
			Minimap:SetMaskTexture(mediaFolder.."rectangle")
			Minimap:SetHitRectInsets(0, 0, 24*scale, 24*scale)
			Minimap:ClearAllPoints()
			Minimap:SetPoint(position, UIParent, position_x, position_y)
			Minimap:SetScale(scale)
			Minimap:SetFrameLevel(8)

			BorderFrame = CreateFrame("Frame", nil, UIParent)
			BorderFrame:SetPoint("TOPLEFT", Minimap, "TOPLEFT", -1, -(21*scale))
			BorderFrame:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 1, (21*scale))	
			BorderFrame:SetBackdrop(backdrop)
			if not classColoredBorder then
				BorderFrame:SetBackdropBorderColor(unpack(brdcolor))
			else
				BorderFrame:SetBackdropBorderColor(color.r, color.g, color.b)
			end	
			BorderFrame:SetBackdropColor(unpack(backdropcolor))
			BorderFrame:SetFrameLevel(6)		

			------------------------
			-- fps latency memory --
			------------------------
			if useInfoPanel then	

			local FLMframe = CreateFrame("Button", "FLMframe", UIParent)
			FLMframe:SetPoint("TOP", Minimap, "BOTTOM", 0, 20*scale)
			FLMframe:SetSize((Minimap:GetWidth()+2)*scale, fontSize+6)
			FLMframe:SetFrameLevel(4)
			FLMframe:SetBackdrop(backdrop)
			if not classColoredBorder then
				FLMframe:SetBackdropBorderColor(unpack(brdcolor))
			else
				FLMframe:SetBackdropBorderColor(color.r, color.g, color.b)
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
			--text:SetShadowOffset(1, -1)
			text:SetTextColor(color.r, color.g, color.b)
				
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
			        
			    GameTooltip:AddLine(date("%A, %d %B, %Y"), 1, 1, 1)
			    GameTooltip:AddDoubleLine("Framerate:", format("%.1f fps", GetFramerate()), color.r, color.g, color.b, fpscolor.r, fpscolor.g, fpscolor.b)
			    GameTooltip:AddDoubleLine("Latency:", format("%d ms", select(3, GetNetStats())), color.r, color.g, color.b, latencycolor.r, latencycolor.g, latencycolor.b)
			    GameTooltip:AddDoubleLine("System Uptime:", TimeFormat(GetTime()), color.r, color.g, color.b, 1, 1, 1)
			 	GameTooltip:AddDoubleLine(". . . . . . . . . . .", ". . . . . . . . . . .", 1, 1, 1, 1, 1, 1)
				
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
			    GameTooltip:AddDoubleLine(". . . . . . . . . . .", ". . . . . . . . . . .", 1, 1, 1, 1, 1, 1)
			    GameTooltip:AddDoubleLine("Total", MemFormat(total), color.r, color.g, color.b, cr, cg, cb)
			    GameTooltip:AddDoubleLine("..with Blizzard", MemFormat(collectgarbage("count")), color.r, color.g, color.b, cr, cg, cb)
			    GameTooltip:Show()
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
			        DEFAULT_CHAT_FRAME:AddMessage("Memory cleaned: |cff00FF00"..MemFormat(memBefore - memAfter))
			    end
			end)
				
			end
				
			---------------------
			-- hide some stuff --
			---------------------
			MinimapBackdrop:Hide()
			MinimapBorder:Hide()
			MinimapBorderTop:Hide()
			MinimapZoomIn:Hide()
			MinimapZoomOut:Hide()
			--MiniMapVoiceChatFrame:Hide()
			GameTimeFrame:Hide()
			MinimapZoneTextButton:Hide()
			MiniMapTracking:Hide()
			MiniMapMailBorder:Hide()
			MinimapNorthTag:SetAlpha(0)
			MiniMapInstanceDifficulty:SetAlpha(0)
			GuildInstanceDifficulty:SetAlpha(0)

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

			MiniMapMailFrame:ClearAllPoints()
			MiniMapMailFrame:SetPoint("TOPRIGHT", Minimap, 4, -20)
			MiniMapMailIcon:SetTexture(mailicon)

			MiniMapWorldMapButton:Hide()
			MiniMapInstanceDifficulty:ClearAllPoints()
			MiniMapInstanceDifficulty:SetParent(Minimap)
			MiniMapInstanceDifficulty:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, -22)
			DropDownList1:SetClampedToScreen(true)

			MiniMapMailFrame:SetFrameLevel(10)
			MiniMapInstanceDifficulty:SetFrameLevel(10)

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
			Minimap:SetMovable(true)
			Minimap:SetUserPlaced(true)
			Minimap:SetScript("OnMouseDown", function()
			    if (IsAltKeyDown()) then
			        Minimap:ClearAllPoints()
			        Minimap:StartMoving()
			    end
			end)

			Minimap:SetScript('OnMouseUp', function(self, button)
			Minimap:StopMovingOrSizing()
			    if (button == 'RightButton') then
			        ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, self, - (Minimap:GetWidth() * 0.7), -3)
			    elseif (button == 'MiddleButton') then
			        ToggleCalendar()
			    else
			        Minimap_OnClick(self)
			    end
			end)

			function GetMinimapShape() return 'SQUARE' end

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
			return nil
		end
	end
end)
--End