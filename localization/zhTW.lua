local L = LibStub("AceLocale-3.0"):NewLocale("AbyssUI", "zhTW")
if not L then return end 
-- Traditional
-- 翻譯：需要翻譯
-- 例
-- L [“英文文本”] =“您的翻譯”
--------------------------------------------------------------
-- Config
L["Info Panel"] = "聯繫信息"
L["Hide Elements"] = "隱藏元素"
L["Miscellaneous"] = "一些"
L["Art & Themes"] = "藝術與主題"
L["Colorization"] = "彩色化"
L["Tweaks & Extra"] = "調整及其他"
L["Scale & Frame Size"] = "規模和大小" 
L["Thanks & Translations"] = "謝謝和翻譯"
-- Daily Info
L["Thank you for choosing Abyss|cff0d75d4UI|r!"] = "感謝您的選擇 Abyss|cff0d75d4UI|r!"
L["The improved World of Warcraft user interface."] = "改進的《魔獸世界》界面。"
L["|cfff2dc7fAbyssUI Daily Info|r"] = "|cfff2dc7fAbyssUI 每日資訊|r"
L["Not available right now!"] = "現在不可用！"
L["|cfff2dc7fTime since last login: |r"] = "|cfff2dc7f自上次登錄以來的時間： |r"
L[" you were gone for |cffffcc00"] = " 你離開了 |cffffcc00"
L["Type |cffffcc00/abyssui|r for a list of commands"] = "輸入 |cffffcc00/abyssui|r 用於命令列表"
L["Current Time"] = "當前時間"
L["Honor Level"] = "榮譽等級"
L["|cfff2dc7fWoW Version"] = "|cfff2dc7f魔獸版本"
L["|cfff2dc7fAbyssUI Version"] = "|cfff2dc7fAbyssUI版本"
--
L["Thank you for using Abyss|cff0d75d4UI|r. If you enjoy this addon,"..
" consider sharing with your friends or even making a donation."..
"It helps a lot! This is a minimalist UI that makes changes directly to the WoW frames,"..
"using nearly the same amount of CPU/RAM as the Blizzard default UI.\n\n"..
"Options that have a different text color are based on your choice in the setup."..
" Those options are set by default if you choose recommended settings.\n"..
"Check the options by clicking in the (+) button on the left."] = "謝謝您的使用 Abyss|cff0d75d4UI|r。 如果您喜歡這個插件，"..
" 考慮與您的朋友分享，甚至進行捐贈。"..
" 這很有幫助！ 極簡主義界面，可直接在哇幀中進行更改，"..
" 使用與標準暴雪接口一樣少的CPU / RAM。\n\n"..
"不同的顏色選項取決於您在設置中的選擇。"..
" 如果您選擇了推薦的選項，則默認設置這些選項。\n"..
"單擊左側的（+）按鈕檢查選項。"
-- Config Options
L["- General"] = "- 一般"
L["- Frames"]	= "- 鏡框"
L["Player Portrait"]	= "球員肖像"
L["- Portrait Art"]	= "- 肖像藝術"
L["Frame Colorization"] = "框架著色"
L["- Preset Colors"]	= "- 預定義的顏色"
L["- Choose a Color"]	= "- 選擇一種顏色"
L["- UnitFrame Art"]	= "- UnitFrame 藝術"
L["Setup"]	= "組態"
L["Clear Bars"]	= "清除酒吧"
L["DailyInfo"]	= "每日資訊"
L["Reload UI"]	= "重新加載UI"
L["Donate"]	= "捐獻"
L["Donators"]	= "捐助者"
-- Config Info Panel
L["In this page you can find links to some other AddOns/Packs that make AbyssUI even better." ..
"These addons are verify to especially work with AbyssUI without any conflict or problem."..
"Click on the image so you can get the respective link. Don't forget to check then out!"] = "在此頁面上，您可以找到其他使AbyssUI更好的Addons / Packages的鏈接。"..
" 這些插件經過驗證可與AbyssUI一起使用，而不會發生衝突或錯誤。"..
" 單擊圖像以獲取其鏈接。 別忘了看看！"
-- Config Hide Elements
L["The symbol (*) in some options means that there is important information/instructions to be read. "..
"Options with a different color are recommended settings (based on your choice in the setup)."] = "在某些選項中，符號（*）表示該符號具有重要的可讀信息。 "..
"建議使用不同的顏色選項（基於設置中的選擇）。"
L["Hide MicroMenu"] = "隱藏微菜單"
L["Hide the ActionBar MicroMenu (Bags Bar)"] = "隱藏MicroMenu（袋子欄）"
L["Hide Gryphons"] = "隱藏新來的人"
L["Hide the ActionBar Gryphons"] = "隱藏技能欄上的格里芬藝術"
L["Hide Minimap"] = "隱藏小地圖"
L["Hide the Game Minimap"] = "隱藏遊戲小地圖"
L["Hide Objective Tracker"] = "隱藏任務欄"
L["Hide the Objective Tracker (Quest Frame)"] = "隱藏任務欄（目標）"
L["Hide FPS/MS Frame"] = "隱藏幀FPS / MS"
L["Hide the fps/ms frame (bottomleft)"] = "隱藏fps / ms的幀（左下）"
L["Hide YouDied/LevelUp Frame"] = "隱藏幀死亡/升級"
L["Hide the 'You Died' and 'Level Up' frame when you"..
" die/level in the game"] = "隱藏“已死”和“升級”幀"..
" 你在遊戲中死亡/等級"
L["Hide Macro Labels"] = "隱藏標籤宏"
L["Hide Macro Labels from Action Bar"] = "隱藏操作欄中的宏標籤"
L["Hide Hotkeys Labels"] = "隱藏標籤鍵"
L["Hide Hotkeys Labels from Action Bar"] = "在操作欄中隱藏關鍵標籤"
L["Hide Stance Bar"] = "隱藏實例欄"
L["Hide the Stance Bar (Druid forms, Rogue stealth, etc)"] = "隱藏實例欄（德魯伊形狀，無賴潛行等等）"
L["Hide Chat Buttons"] = "隱藏聊天按鈕" 
L["Hide the Chat buttons (voice, social, etc)"] = "隱藏聊天按鈕（語音，社交等）"
L["Hide AFK Frame"] = "隱藏AFK幀"
L["Hide the AFKMode when you are AFK"] = "在AFK模式下隱藏框"
L["Hide Faction/PvP/Prestige icon"] = "隱藏派系/ PvP /聲望圖標"
L["Hide the player frame Faction/PvP/Prestige icon"] = "在播放器框架中隱藏陣營/ PvP /聲望圖標"
L["|cfff2dc7fHide UnitImproved Faction Icon|r"] = "|cfff2dc7fHide Faction UnitImproved圖標|r"
L["Hide the Faction Icon (Ally/Horde) on players frames"] = "在玩家畫面中隱藏陣營圖標（Ally / Horde）"
L["Hide CastBar Timer"] = "隱藏CastBar計時器"
L["Hide the timer below CastBar"] = "隱藏投射欄計時器"
L["|cfff2dc7fHide GroupFrame|r"] = "|cfff2dc7f隱藏組框|r"
L["Hide the GroupFrame on the player portrait"] = "隱藏播放器框架中的組框架"
L["Hide Covenant Frame"] = "隱藏契約框架"
L["Hide the Covenant/Garrison minimap icon"] = "隱藏條約/駐軍中的小地圖圖標"
L["Hide Minimap Zone Text"] = "隱藏小地圖文字"
L["Hide zone text above minimap"] = "將當前位置文字隱藏在小地圖上方"
L["Hide Castbar"] = "隱藏Castbar"
L["Completely hide the player's castbar"] = "完全隱藏玩家的施法欄"
-- Config Miscellaneous
L["Smooth Camera (50% Slower)"] = "平滑相機（慢速50％）"
L["Smooth Camera (70% Slower)"] = "平滑相機（減慢70％）"
L["Smooth Camera (90% Slower)"] = "平滑相機（慢速90％）"
L["Makes the Camera turns in a more smooth way"] = "使相機轉動更平穩"
L["|cfff2dc7fAuto Repair/Sell Gray Items|r"] = "|cfff2dc7f出售灰色和汽車維修|r"
L["When you open a Merchant shop, auto sell gray"..
" and repair items"] = "當您打開鐵匠時，自動出售灰色物品並修理物品"
L["Auto Gamma"] = "自動伽瑪"
L["Automatically change the gamma when is day to"..
" 1.2 (brighter) and to 1.0 (default) at night based on the local time"] = "在以下情況下自動更改伽瑪"..
" 根據當地時間，白天為白天（晴天）為1.2（晴朗），晚上為1.0（默認）"
L["Non-Military Date/Time"] = "美國日期/時間格式"
L["Change the date format of the whole UI to"..
" Non-Military format"] = "將界面日期格式更改為美國格式"
L["RPG chat fonts"] = "聊天字體RPG"
L["Change the chat fonts to a RPG look-alike style"] = "將聊天源更改為RPG樣式"
L["Auto Screenshot"] = "自動截圖"
L["Automatically takes a screenshot when you level up"] = "每次升級時拍照"
L["Transparent Name BKGD"] = "透明背景（名稱）"
L["Remove any color in the target name background"] = "刪除目標名稱中的所有背景色"
L["Default Class Background"] = "班級標準背景"
L["Remove the class color background behind"..
" the player names to default values (Transparent Name needs to be unchecked)"] = "去除背景色"..
" 播放器的名稱（必須取消選中“透明背景”）"
L["Disable Nameplate Changes"] = "禁用銘牌更改"
L["This option will remove any change that was made to the nameplates (the bar above mobs and players)"] = "它將刪除任何"..
" 對銘牌的更改（小怪和玩家上方的欄）"
L["Disable ChatBubble Changes"] = "禁用聊天氣泡更改"
L["This option will remove any change that was made to the chatbubbles (the frame text above players)"] = "它將刪除任何"..
" 更改聊天氣泡（玩家上方的文本框）"
L["Disable Damage Font (*)"] = "禁用損壞源（*）" 
L["This option will remove any change to the damage font text."..
"\n*You need to restart the game so the font can be reloaded. You can change it to any font, "..
"go to Textures->font and replace the file keeping the same name"] = "它將刪除對損壞源的任何更改"..
"\n *您需要重新啟動遊戲才能重新加載字體。 您也可以更改它 "..
"去 Textures->font 並更改名稱相同的文件"
L["|cfff2dc7fDisable Portrait Text Spam|r"] = "|cfff2dc7f禁用文字垃圾郵件肖像|r"
L["Disable healing/damage spam over player"..
" and pet portraits"] = "對寵物和玩家肖像禁用修復/破壞垃圾郵件"
L["Disable New Minimap"] = "禁用新的小地圖"
L["This option will get you back to the"..
" Blizzard default minimap style (round)."] = "小地圖將返回暴雪模式（圓形）"
L["Disable Smoke Texture"] = "禁用煙霧紋理"
L["It will disable the 'smoke' texture around the portrait in "..
"the UnitFrameImproved version of it"] = "將禁用版本中肖像周圍的“煙熏”紋理 "..
" UnitFrameImproved"
L["Disable Button Color Text"] = "禁用彩色文本按鈕"
L["Change the button colors back to default yellow"] = "將按鈕的顏色更改為黃色圖案"
L["Disable New CastBar"] = "禁用CastBar Nova"
L["Will disable the new castbar and return to Blizzard default texture"] = "將禁用新的castbar"..
" 並返回標準的暴雪紋理"
-- Config Tweaks & Extra
L["Disable Kill Announcer"] = "禁用殺死播音員"
L["Disable the Kill Announcer frame that show up when you kill someone"] = "殺死某人時禁用死亡幀"
L["Silence Kill Announcer"] = "沉默殺人播音員"
L["Remove boss/kill sounds from the Kill Announcer frame"] = "消除殺死播音員的上司/死亡聲音"
L["|cfff2dc7fTooltip on Cursor|r"] = "|cfff2dc7f提示工具提示|r"
L["Tooltips will appear close to the mouse cursor position"] = "工具提示將出現在鼠標指針附近"
L["|cfff2dc7fInspect Target (Shift + ')|r"] = "|cfff2dc7f檢查目標（Shift +'）|r"
L["When you have a target or your mouse is over someone character,"..
" to inspect this player press the keys Shift + '"] = "當您有目標或鼠標懸停在某個字符上時，"..
" 要檢查該玩家，請按Shift +'鍵"
L["|cfff2dc7fConfirm Pop-Ups (Ctrl + ')|r"] = "|cfff2dc7f確認彈出窗口（Ctrl +'）|r"
L["When this is active you can confirm almost"..
" any pop-ups (release, quests, stacks, etc) pressing the keys Ctrl + '"] = "啟用後，您幾乎可以確認"..
" 通過按Ctrl +'鍵可以彈出所有窗口（發布，任務，堆棧等）"
L["First Person View"] = "第一人稱視角"
L["Change the camera view to a 'First Person' experience"] = "將相機視圖更改為第一人稱"
L["ActionButton on KeyUp"] = "公佈的主要行動"
L["With this option spells can be cast just when the"..
" keybind are released"] = "使用此選項，只有在釋放鑰匙時才能施放咒語"
L["Combat Cursor Mode"] = "戰鬥模式"
L["Makes the camera turns with your mouse when in"..
" combat (right-click to show cursor)"] = "在戰鬥中使用鼠標使相機轉動（右鍵顯示指針）"
L["Square Minimap"] = "廣場迷你地圖"
L["A modern minimap (neon class borders)"] = "現代小地圖（霓虹燈邊框和經典色彩）"
L["Keep UnitFrame Dark"] = "保持UnitFrame處於黑暗狀態"
L["Even if you change theme, this will keep UnitFrame Dark"..
" (player frame, boss, etc)."] = "即使更改主題，此選項也會使UnitFrame保持黑暗"..
" （玩家框架，老闆等）"
L["You can only select one style of UnitFrame color"] = "您只能為UnitFrame選擇一種顏色樣式"
L["Keep UnitFrame Blizzard Like"] = "保持UniFrame暴雪"
L["Even if you change theme, this will keep UnitFrame"..
" Blizzard like (player frame, boss, etc)."] = "即使更改主題，此選項也將保留經典的暴雪主題"..
" （玩家框架，老闆等）"
L["|cfff2dc7fInstance Leave Frame|r"] = "|cfff2dc7f出口實例（框架）|r"
L["A dynamic frame that pop-up when you"..
" complete a LFG (dungeon, raid, etc)"] = "完成LFG（地牢，突襲等）時出現的框架"
L["Minimalist UI"] = "簡約界面"
L["Hide some parts of the UI when you are out of combat ('ATL-CTRL-P' to show frames)"] = "隱藏界面的一部分"..
" 當您不參加戰鬥時（“ ATL-CTRL-P”顯示幀）"
L["Disable 'Dynamic Quest Tracker' at Miscellaneous tab first"] = "首先在“雜項”標籤中禁用“動態任務”"
L["Minimal ActionBar"] = "簡約酒吧"
L["Minimalist actionbar, hide all the textures"] = "極簡操作欄，隱藏所有紋理"
L["Dynamic Quest Tracker"] = "動態任務"
L["Hide the quest track when you"..
" are in combat or in a PVP instance"] = "在戰鬥或PvP實例中隱藏任務欄"
-- Config Scale & Frame Size
L["|cffb62a25This is a work in progress,".. 
" I'm still learning how it works, please report any bugs in our discord|r"] = "|cffb62a25正在開發中，"..
"  我仍在學習它的工作原理，並報告我們的不和諧之處|r"
-- Config Themes
L["Some of this options needs the AbyssUI_TexturePack."..
" You can find a download link in the addon page. You also can find the link in te 'Info Panel' section."] = "其中一些選項需要AbyssUI_TexturePack。"..
" 您可以在插件頁面上找到下載鏈接。 您也可以在“信息”部分中找到鏈接。"
L["|cfff2dc7fUnitFrame Improved|r"] = "|cfff2dc7f改進的UnitFrame|r"
L["This is a improved version of unitframes,"..
" it changes those frames to a more beautiful and complete version"] = "單元框架的改進版本，"..
" 將那些框架更改為更美麗，更完整的東西"
L["|cfff2dc7fElite Portrait|r"] = "|cfff2dc7f精英肖像|r"
L["Add a elite texture to the player portrait"] = "將精英紋理添加到播放器（龍）肖像"
L["You can only select one UnitFrame portrait art"] = "您一次只能選擇一幅肖像畫"
L["DeathKnight Alliance Portrait"] = "死亡騎士肖像（聯盟）"
L["DeathKnight Horde Portrait"] = "死亡騎士肖像（部落）"
L["Add a sword texture to the player portrait"] = "向玩家的肖像添加dk武器紋理"
L["Demon Hunter Portrait"] = "惡魔獵人肖像"
L["Add a DH inspired texture to the player portrait"] = "為玩家的肖像添加dh紋理"
L["Artistic"] = "藝術的"
L["A artistic version of UnitPlayerFrame"] = "玩家的UnitFrame的藝術版本"
L["You need to uncheck any other portrait art to apply a new one"] = "您需要取消選擇其他肖像藝術才能使用新的肖像藝術。"
L["Bright"]= "亮"
L["A bright version of UnitPlayerFrame"] = "播放器的UnitFrame的出色版本"
L["Classic"] = "古典"
L["A classic version of UnitPlayerFrame"] = "播放器的UnitFrame的經典版本"
L["Artistic(V2)"] = "藝術的(V2)"
L["Version two of artistic UnitPlayerFrame"] = "播放器的UnitFrame的另一個藝術版本"
L["Dark"] = "變暗"
L["Dark version of UnitPlayerFrame"] = "播放器的UnitFrame的深色版本"
L["DarkGray"] = "深灰色"
L["A dark gray version of UnitPlayerFrame"] = "播放器的UnitFrame的深灰色版本"
L["Dark(V2)"] = "變暗(V2)"
L["Version 2 of the dark UnitPlayerFrame"] = "播放器的UnitFrame的另一個深色版本"
L["GrayScale"] = "淡灰色"
L["A grayscale version of UnitPlayerFrame"] = "播放器的UnitFrame的灰色版本"
L["LightGray"] = "淺灰"
L["A light gray version of UnitPlayerFrame"] = "播放器的UnitFrame的淺灰色版本"
L["MediumGray"] = "中灰"
L["A medium gray version of UnitPlayerFrame"] = "播放器的UnitFrame的中灰色版本"
L["MinimalBlue"] = "極簡藍"
L["A blue version of UnitPlayerFrame"] = "播放器的UnitFrame的極簡藍色版本"
L["MinimalRed"] = "極簡紅色"
L["A red version of UnitPlayerFrame"] = "播放器的UnitFrame的極簡紅色版本"
L["Muted"] = "靜音"
L["A muted version of UnitPlayerFrame"] = "播放器的UnitFrame的靜音版本"
L["Psychedelic"] = "迷幻"
L["A psychedelic version of UnitPlayerFrame"] = "迷幻版的玩家的UnitFrame"
L["Retro"] = "復古風"
L["A retrowave version of UnitPlayerFrame"] = "播放器的UnitFrame的複古版本"
L["Vibrant"] = "充滿活力"
L["A vibrant version of UnitPlayerFrame"] = "充滿活力的播放器UnitFrame版本"
L["|cffc0c0c0Blizzard (Default)|r"] = "|cffc0c0c0暴雪（默認）|r"
L["Blizzard Silver Colorization for Frames"] = "暴風雪框架的銀色"
L["You can only select one preset color, uncheck others"] = "您只能選擇預定義的顏色，取消選擇其他顏色"
L["|cff636363Blackout|r"] = "|cff636363朦朧|r"
L["A completely dark colorization"] = "完全深色"
L["|cffb62a25Blood|r"] = "|cffb62a25血液|r"
L["A dark red colorization"] = "深紅色"
L["|cffecc13cGold|r"] = "|cffecc13c金色的|r"
L["A golden colorization"] = "金色"
L["|cffc41F3BDeath Knight|r"] = "|cffc41F3B死亡騎士|r"
L["|cffA330C9Demon Hunter|r"] = "|cffA330C9惡魔獵手|r"
L["|cffFF7D0ADruid|r"] = "|cffFF7D0A德魯伊|r"
L["|cffABD473Hunter|r"] = "|cffABD473獵人|r"
L["|cff69CCF0Mage|r"] = "|cff69CCF0法師|r"
L["|cff00FF96Monk|r"] = "|cff00FF96僧|r"
L["|cffF58CBAPaladin|r"] = "|cffF58CBA聖騎士|r"
L["Priest (Shadow)"] = "牧師（陰影）"
L["|cffFFF569Rogue|r"] = "|cffFFF569流氓|r"
L["|cff0070DEShaman|r"] = "|cff0070DE薩滿祭司|r"
L["|cff9482C9Warlock|r"] = "|cff9482C9巫師|r"
L["|cffC79C6EWarrior|r"] = "|cffC79C6E戰士|r"
L["Apply the color you choose from the ColorPicker"] = "應用您在顏色選擇器中選擇的顏色"
L["You need to uncheck any preset color, to apply a color"] = "您需要取消選擇任何預定義的顏色才能應用該顏色"
--------------------------------------------------------------
-- Frames
L["Move"]	= "繼續"
L["Level: "] = "水平: "
L["Honor: "] 	= "榮譽: "
L["Item Level: "]	= "等級物品: "
L["Confirm"] = "確認"
L["Recommended"]	= "推薦的"
L["Modern"] = "現代"
L["Classic"] = "古典"
L["|cff8b0000YOU DIED|r"] = "|cff8b0000你死了|r"
L["Let's save the variables and prepare the interface for the first use.\n"
.."To do this, choose the option that best suits your taste.\n\n"
.."|cfff2dc7fClassic|r: interface model close to the original, with few modifications.\n\n"
.."|cfff2dc7fRecommended|r: a mix between the other options, with the best of the two.\n\n"
.."|cfff2dc7fModern|r: a modern interface model, with striking changes to the interface.\n\n"
.."You always can change options on the configuration panel.\nType '|cfff2dc7f/abyssui|r' on chat for more info."] = "我們走吧"
.." 保存變量並為第一次使用準備接口。\n"
.."為此，請選擇最適合您的口味的選項之一。\n\n"
.."|cfff2dc7f古典|r: 接口模型接近原始模型，僅作了少量修改。\n\n"
.."|cfff2dc7f推薦的|r: 其他選項之間的混合，兩者兼具。\n\n"
.."|cfff2dc7f現代|r: 現代的界面模型，界面發生了很大的變化。\n\n"
.."您可以隨時在設置面板中更改選項。\n輸入 '|cfff2dc7f/abyssui|r' 在聊天中了解更多信息。"
L["A reload is necessary so this configuration can be save!\n"..
"Click the |cffffcc00'confirm'|r button to Reload.\nYou still can make changes (do before you confirm)."] = "一種"
.." 要保存此配置，必須重新加載！\n"..
"點擊按鈕 |cffffcc00'確認'|r 重新加載。\n 您仍然可以進行更改（在提交之前進行更改）。"
L["It will only hide Blizzard frames, addons have their"..
" own frames,\n a good addon probably has an option to hide while out of combat.\n"..
" I could have added the entire interface to be hidden,\n but that would prevent"..
" interaction with some frames (auction, loot, quest, etc)."] = "它只會隱藏暴雪幀，附加組件有"..
" 框架本身，\n 一個好的插件可能在戰鬥中可以隱藏。\n"..
" 我本可以添加整個界面來隱藏的，\n 但這會阻止"..
" 與某些框架（拍賣行，戰利品，任務等）的互動。"
L["Wait!\nThis will clean all your skills/spells from Actions Bars."] = "等待！\n 這將從動作欄中清除所有咒語/異能。"
--------------------------------------------------------------
-- Extras
L["|cfff07100Repair cost paid by Guild: %.1fg|r"] = "|cfff07100公會支付的維修費用: %.1fg|r"
L["|cffead000Repair cost: %.1fg|r"] = "|cffead000維修價值: %.1fg|r"
L["Not enough gold for repair."] = "沒有金要修復。"
L["This instance is completed! Want to leave?\n"..
"You can also teleport out/in or just close this frame"] = "實例已完成！ 你要離開嗎\n"..
"您也可以傳送或僅關閉該框"
L["Teleport"] = "傳送"
L["|cfff2dc7fAbyssUI Command List|r"] = "|cfff2dc7fAbyssUI 命令清單|r"
L["|cfff2dc7fType /abyssui |r|cffffcc00'command name'|r"] = "|cfff2dc7f輸入 /abyssui |r|cffffcc00'命令名稱'|r"
L["/abyssui |cffffcc00config|r ~configuration panel"] = "/abyssui |cffffcc00config|r ~配置面板"
L["/abyssui |cffffcc00setup|r ~show the setup frame"] = "/abyssui |cffffcc00setup|r ~顯示設置屏幕"
L["/abyssui |cffffcc00reset|r ~reset UI frames to default positions"] = "/abyssui |cffffcc00reset|r ~重置框架位置"
L["/abyssui |cffffcc00daily|r ~daily info"] = "/abyssui |cffffcc00daily|r ~每日資訊"
L["/abyssui |cffffcc00reload|r ~reload the interface"] = "/abyssui |cffffcc00reload|r ~重新加載界面"
L["/abyssui |cffffcc00more|r ~for more commands"] = "/abyssui |cffffcc00more|r ~更多命令"
L["|cfff2dc7fToken Price: |r"] = "|cfff2dc7f代幣價格: |r"
L["|cfff2dc7fToken Price:|r Not available right now!"] = "|cfff2dc7f代幣價格:|r 無法使用！"
L["|cfff2dc7fDate:|r "] = "|cfff2dc7f日期:|r "
L["|cfff2dc7fHonor Level: |r|cffffcc00"] = "|cfff2dc7f榮譽等級: |r|cffffcc00"
L["|cfff2dc7fWoW Version: |r|cffffcc00"] = "|cfff2dc7f魔獸版本: |r|cffffcc00"
L["|cfff2dc7fAbyssUI Version: |r|cffffcc00"] = "|cfff2dc7fAbyssUI版本: |r|cffffcc00"
L["/abyssui |cffffcc00clc|r ~clear CombatLog entries"] = "/abyssui |cffffcc00clc|r ~清除戰鬥記錄"
L["/abyssui |cffffcc00gm|r ~custumer support"] = "/abyssui |cffffcc00gm|r ~消費者支持"
L["/abyssui |cffffcc00rc|r ~ready check"] = "/abyssui |cffffcc00rc|r ~確認 '準備'"
L["/abyssui |cffffcc00cr|r ~check role poll"] = "/abyssui |cffffcc00cr|r ~確認功能"
L["/abyssui |cffffcc00unlock|r ~unlock some frames"] = "/abyssui |cffffcc00unlock|r ~解鎖一些框架"
L["/abyssui |cffffcc00lock|r ~lock unlocked frames"] = "/abyssui |cffffcc00lock|r ~鎖定未鎖定的框架"
L["|cfff2dc7fConsider reload the UI to make sure frames are locked|r '|cffffcc00/reload|r'"] = "|cfff2dc7f考慮重新加載接口以確保框架被鎖定|r '|cffffcc00/reload|r'"
L["|cff0d75d4Special Thanks|r"] = "|cff0d75d4謝謝|r"
L["|cff0d75d4Translators|r"] 		= "|cff0d75d4譯者|r"
L["Default"] = "模式"
L["Need Translator"] = "需要翻譯"
L["|cfff2dc7fFizzlemizz|r for helping me with programming questions."] = "|cfff2dc7fFizzlemizz|r 幫助我解決編程問題。"
L["|cfff2dc7fKawF|r for UnitFrame Improved, so I could create a really nice"..
" UnitFrame for AbyssUI."] = "|cfff2dc7fKawF|r 通過改進的UnitFrame，我可以從中得到啟發"..
" 並為AbyssUI創建非常好的東西。"
L["|cfff2dc7fEnglish (United States): |r"] = "|cfff2dc7f英語（美國）: |r"
L["|cfff2dc7fSpanish (Mexico): |r"] = "|cfff2dc7f西班牙語（墨西哥）: |r"
L["|cfff2dc7fPortuguese: |r"] = "|cfff2dc7f葡萄牙語: |r"
L["|cfff2dc7fGerman: |r"] = "|cfff2dc7f德語: |r"
L["|cfff2dc7fEnglish (Great Britain): |r"] = "|cfff2dc7f英語（英國）: |r"
L["|cfff2dc7fSpanish (Spain): |r"] = "|cfff2dc7f西班牙語（西班牙）: |r"
L["|cfff2dc7fFrench: |r"] = "|cfff2dc7f法文: |r"
L["|cfff2dc7fItalian: |r"] = "|cfff2dc7f義大利文: |r"
L["|cfff2dc7fRussian: |r"] = "|cfff2dc7f俄語: |r"
L["|cfff2dc7fKorean: |r"] = "|cfff2dc7f韓語: |r"
L["|cfff2dc7fChinese (Traditional): |r"] = "|cfff2dc7f繁體中文）: |r"
L["|cfff2dc7fChinese (Simplified): |r"] = "|cfff2dc7f簡體中文）: |r"
L["Feel free to help translate AbyssUI to your own language, if you want to help, go to AbyssUI Github page, "..
"there's a folder named 'localization', find the language you know better and help to improve it. Thank you soo much for this."] = "隨時幫助將AbyssUI翻譯成您的語言，如果您想提供幫助，請轉到Github上的AbyssUI頁面， "..
"尋找一個名為 'localization'， 找到您最了解的語言，並幫助改進它。 非常感謝你做的這些。"
L["Chat Commands"] = "聊天命令"
L["Always Show Titles"] = "一律顯示標題"
L["Always show people titles on their names"] = "一律顯示人物名稱"
L["Green Health Bars"] = "綠色健康吧"
L["All unitframe health bars will be green (default)"] = "所有單位框架健康欄將為綠色（默認）"
L["Not available in this version of WoW!"] = "在此版本的《魔獸世界》中不可用！"
L["In this tab of the addon settings, you will find options directed to the version of WoW Classic."..
" Many of them are exclusive and can only be used in Burning Crusade and similar client versions."] = "在附加組件設置的此選項卡中，您將找到針對WoW Classic版本的選項。"..
" 它們中的許多是專有的，只能在Burning Crusade和類似的客戶端版本中使用。"
L["|cffb62a25In development, more features will be added soon, so be patient.|r"] = "在開發中，將很快添加更多功能，因此請耐心等待。"
L["Hide Helm"] = "隱藏頭盔"
L["Hide the player helm"] = "隱藏玩家頭盔"
L["Hide Cloak"] = "隱藏披風"
L["Hide the player cloak"] = "隱藏玩家披風"
L["Better World Map"] = "更好的世界地圖"
L["Makes the worldmap minimalist/clean"] = "使世界地圖極簡/乾淨"
L["World Map Fader"] = "世界地圖推子"
L["Makes the worldmap fade while you move"] = "在移動時使世界地圖褪色"
L["Default Nameplate Range"] = "默認銘牌範圍"
L["Disable the double range of"..
" nameplates to Blizzard default value"] = "禁用雙倍範圍銘牌為暴雪的默認值"
L["Monthly Donators:\n"] = "每月捐贈者：\n"
L["Top Donator:\n"] = "主要捐贈者：\n"
L["Patreon"] = "Patreon"
L["Thanks to everyone who helps maintain AbyssUI. You are the best!"] = "感謝幫助維護AbyssUI的所有人。您是最棒的！"
L["You are the best of the best! Thank you very much s2"] = "您是最好的！！非常感謝s2"
L["Flat HealthBars"] = "平面保健吧"
L["Make the health bar textures looks Flat"] = "使健康條紋理看起來平整"
L["Show Minimap Clock"] = "小地圖時鐘"
L["This will always show the minimap clock, instead of showing on hover"] = "這將始終顯示小地圖時鐘，而不是在懸停時顯示"
L["Buy me a coffee: |cffffcc00patreon.com/yugensan|r"] = "給我買咖啡：|cffffcc00patreon.com/yugensan|r"
L["|cfff2dc7fBuy me a coffee!|r"] = "|cfff2dc7f給我買杯咖啡！|r"
L["Class Color"] = "班級顏色"
L["Change icon border to a class colored theme"] = "將圖標邊框更改為類彩色主題"
L["You need to select just one of those options so they don't overlap"] = "您只需要選擇其中一個選項，這樣它們就不會重疊"
L["Crisp"] = "脆"
L["Change icon border to a crisp theme"] = "將圖標邊框更改為清晰的主題"
L["Original"] = "原來的"
L["Change icon border to a original theme"] = "將圖標邊框更改為原始主題"
L["Square"] = "正方形"
L["Change icon border to a square theme"] = "將圖標邊框更改為方形主題"
L["Thin"] = "瘦"
L["Change icon border to a thin theme"] = "將圖標邊框更改為較薄的主題"
L["Glass"] = "玻璃"
L["Change the icon to a glass theme"] = "將圖標更改為玻璃主題"
L["Default QuestFrame"] = "默認任務框架"
L["Disable QuestFrame border and text colorization to default from Blizzard"] = "禁用 QuestFrame 邊框和文本著色為暴雪的默認設置"
L["|cfff2dc7fLortUI|r for better icon borders and shadows."] = "|cfff2dc7fLortUI|r 以獲得更好的圖標邊框和陰影。"
L["|cff0d75d4Frequently Answered Questions|r"] = "|cff0d75d4常見問題解答|r"
L["Always check the FAQ before posting. Bug reports have more visibility on our discord channel."] = "在發布之前總是檢查常見問題。錯誤報告在我們的不和諧頻道上有更多的可見性。"
L["- How to change fonts or go back to Bliizard default?\n"..
"A: Go to AbyssUI folder -> textures -> font and change the fonts keeping their names (you need to restart the game)."] = "- 如何更改字體或返回暴雪默認設置？\n"..
"A：轉到 AbyssUI 文件夾 -> 紋理 -> 字體並更改字體並保留其名稱（您需要重新啟動遊戲）。"
L["- Do you plan to add save profiles to the UI?\n"..
"A: No, at least it's not on my plans right now. At this point, the interface have so many options and I have short time to work on it, so it's not planned."] = "- 您是否打算將保存配置文件添加到 UI？\n"..
"A：不，至少現在不在我的計劃中。在這一點上，界面有很多選擇，我的時間很短，所以沒有計劃。"
L["- Some texture are looking/acting weird or Texture/Image is not right or cropped?\n"..
"A: You are probably using a old version of AbyssUI, try a fresh installation, delete the old version and re-download it."] = "- 某些紋理看起來/表現得很奇怪，或者紋理/圖像不正確或被裁剪？\n"..
"A：您可能使用的是舊版本的AbyssUI，請嘗試全新安裝，刪除舊版本並重新下載。"
L["- How to make interface looks like in the video?\n"..
"A: The white buttons was another project that was discontinued due to the lack of time and the amount of work that was needed to make it work under different conditions. It may still work, but no support or upcoming updates are planned."] = "- 如何使界面看起來像視頻中的樣子？\n"..
"A：白色按鈕是另一個項目，由於缺乏時間和使其在不同條件下工作所需的大量工作而停止。它可能仍然有效，但沒有計劃支持或即將進行的更新。"
L["Show Helm"] = "顯示頭盔"
L["Always show helm"] = "始終顯示掌舵"
L["Show Cloak"] = "展示斗篷"
L["Always show cloak"] = "總是露出斗篷"
L["|cfff2dc7fMy Patreon, it's related to all my projects, so keep this in mind. You will be helping a lot of projects at once! Confirm to get the link|r"] = "|cfff2dc7f 我的 Patreon，它與我所有的項目有關，所以請記住這一點。您將同時幫助很多項目！確認獲取鏈接|r" 
L["|cfff2dc7fDonations will appear in the 'Donators' tab as a rank. Thank you very much, confirm to get the link|r"] = "|cfff2dc7f捐款 將作為排名出現在‘捐助者’標籤中。非常感謝，確認獲取鏈接|r"
L["Reverse HealthBar Fill"] = "反向健康欄填充"
L["All unitframe health bars will fill in reverse"] = "所有單位框架的生命值條將反向填充"
L["Hide MainActionBar"] = "隱藏主操作欄"
L["Hides the MainActionBar"] = "隱藏主操作欄"
L["|cfff2dc7fEnjoying AbyssUI? |rRecommend to a friend!"] = "|cfff2dc7f喜歡 AbyssUI 嗎？ |r推薦給朋友！"
L["Thank you for choosing Default|cff0d75d4UI|r!"] = "感謝您選擇 Default|cff0d75d4UI|r！"
L["Let's save the variables and prepare the interface for the first use.\n"
.."To do this, click on the screen or just reload the UI /reload."] = "讓我們保存變量並為首次使用準備界面。\n"
.."..為此，請單擊屏幕或重新加載 UI /reload。"
L["Disable Tooltip Health"] = "禁用工具提示健康欄"
L["Disable the tooltip healthBar from mouse hover functions"] = "通過鼠標懸停功能禁用工具提示健康欄"
L["Dragonflight UnitFrame"] = true
L["Supporters:"] = "支持者："
L["Auto Repair"] = "自動修理"
L["Auto Sell Gray Items"] = "自動出售灰色物品"
L["When you open a Merchant shop, auto sell gray"] = "當你開一家商店時，汽車會賣灰色"
L["When you open a Merchant shop auto repair items"] = "當你開一家汽車修理廠時"
L["Default Character NameText"] = "預設字元名稱文字"
L["Disable the character name colorization back to the default font color"] = "禁用角色名稱著色恢復為預設字體顏色"
L["AbyssUI Classic icon borders, a Blizzard Default enchanced theme"] = "AbyssUI 經典圖示邊框，暴雪預設增強主題"
L["Icons"] = "圖示"
L["- Icons"] = "- 圖示"
L["Shaman Pink"] = "薩滿粉紅"
L["Keep the color pink for Shaman health bars (portrait and tooltip)"] = "薩滿血條保持粉紅色（肖像和工具提示）"
L["Disable Guild Tooltip"] = "禁用公會工具提示"
L["Remove the guild name from tooltips"] = "從工具提示中刪除公會名稱"
L["Default Background"] = "預設背景"
L["Disable Square Minimap"] = "禁用方形小地圖"
L["Rare Portrait"] = "罕見的肖像"
L["Add a rare texture to the player portrait"] = "為玩家肖像添加罕見的紋理"
L["Remove the class color background behind"
.." the player names to default values (Transparent Name needs to be unchecked)"] = "去掉後面的類顏色背景"
.." 將玩家名稱設為預設值（透明名稱需要取消選取）"
L["This option will get you back to the"..
  " Blizzard default minimap style (round). *You need to restart the game so round textures can be re-loaded"] = "此選項將使您返回到"..
  "暴雪預設小地圖樣式（圓形）。*您需要重新啟動遊戲才能重新加載圓形紋理"