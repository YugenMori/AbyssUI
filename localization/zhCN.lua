local L = LibStub("AceLocale-3.0"):NewLocale("AbyssUI", "zhCN")
if not L then return end 
-- Simplified
--翻译：需要翻译
--例子
--L [“英文文本”] = “您的翻译”
--------------------------------------------------------------
-- Config
L["Info Panel"] = "联系信息"
L["Hide Elements"] = "隐藏元素"
L["Miscellaneous"] = "一些"
L["Themes"] = "主题"
L["Tweaks & Extra"] = "调整及其他"
L["Scale & Frame Size"] = "规模和大小" 
L["Thanks & Translations"] = "谢谢和翻译"
-- Daily Info
L["Thank you for choosing Abyss|cff0d75d4UI|r!"] = "感谢您的选择 Abyss|cff0d75d4UI|r!"
L["The improved World of Warcraft user interface."] = "改进的《魔兽世界》界面。"
L["|cfff2dc7fAbyssUI Daily Info|r"] = "|cfff2dc7fAbyssUI 每日资讯|r"
L["Not available right now!"] = "现在不可用！"
L["|cfff2dc7fTime since last login: |r"] = "|cfff2dc7f自上次登录以来的时间： |r"
L[" you were gone for |cffffcc00"] = " 你离开了 |cffffcc00"
L["Type |cffffcc00/abyssui|r for a list of commands"] = "输入 |cffffcc00/abyssui|r 用于命令列表"
L["Current Time"] = "当前时间"
L["Honor Level"] = "荣誉等级"
L["|cfff2dc7fWoW Version"] = "|cfff2dc7fWoW版本"
L["|cfff2dc7fAbyssUI Version"] = "|cfff2dc7fAbyssUI版本"
--
L["Thank you for using Abyss|cff0d75d4UI|r. If you enjoy this addon,"..
" consider sharing with your friends or even making a donation."..
"It helps a lot! This is a minimalist UI that makes changes directly to the WoW frames,"..
"using nearly the same amount of CPU/RAM as the Blizzard default UI.\n\n"..
"Options that have a different text color are based on your choice in the setup."..
" Those options are set by default if you choose recommended settings.\n"..
"Check the options by clicking in the (+) button on the left."] = "谢谢您的使用 Abyss|cff0d75d4UI|r。 如果您喜欢这个插件，"..
" 考虑与您的朋友分享，甚至进行捐赠。"..
" 这很有帮助！ 极简主义界面，可直接在哇帧中进行更改，"..
" 用很少 CPU/RAM 作为暴雪界面的标准。\n\n"..
"不同的颜色选项取决于您在设置中的选择。"..
" 如果您选择了推荐的选项，则默认设置这些选项。\n"..
"通过单击按钮检查选项 (+) 在左边。"
-- Config Options
L["- General"] = "- 一般"
L["- Frames"]	= "- 镜框"
L["Player Portrait"]	= "球员肖像"
L["- Portrait Art"]	= "- 肖像艺术"
L["Frame Colorization"] = "框架着色"
L["- Preset Colors"]	= "- 预定义的颜色"
L["- Choose a Color"]	= "- 选择一种颜色"
L["- UnitFrame Art"]	= "- UnitFrame艺术"
L["Setup"]	= "组态"
L["Clear Bars"]	= "清除酒吧"
L["DailyInfo"]	= "每日资讯"
L["Reload UI"]	= "重新加载UI"
L["Donate"]	= "捐献"
-- Config Info Panel
L["In this page you can find links to some other AddOns/Packs that make AbyssUI even better." ..
"These addons are verify to especially work with AbyssUI without any conflict or problem."..
"Click on the image so you can get the respective link. Don't forget to check then out!"] = "在此页面上，您可以找到其他链接的链接，这些链接使AbyssUI更加出色。"..
" 这些插件经过验证可与AbyssUI一起使用，而不会发生冲突或错误。"..
" 单击图像以获取其链接。 别忘了看看！"
-- Config Hide Elements
L["The symbol (*) in some options means that there is important information/instructions to be read. "..
"Options with a different color are recommended settings (based on your choice in the setup)."] = "符号 (*) 在某些选项中，这意味着您需要阅读重要信息。 "..
"建议使用不同的颜色选项（基于设置中的选择）。"
L["Hide MicroMenu"] = "隐藏微菜单"
L["Hide the ActionBar MicroMenu (Bags Bar)"] = "隐藏MicroMenu（袋子栏）"
L["Hide Gryphons"] = "隐藏新来的人"
L["Hide the ActionBar Gryphons"] = "隐藏技能栏上的格里芬艺术"
L["Hide Minimap"] = "隐藏小地图"
L["Hide the Game Minimap"] = "隐藏游戏小地图"
L["Hide Objective Tracker"] = "隐藏任务栏"
L["Hide the Objective Tracker (Quest Frame)"] = "隐藏任务栏（目标）"
L["Hide FPS/MS Frame"] = "隐藏框架 FPS/MS"
L["Hide the fps/ms frame (bottomleft)"] = "隐藏fps / ms的帧（左下）"
L["Hide YouDied/LevelUp Frame"] = "隐藏帧死亡/升级"
L["Hide the 'You Died' and 'Level Up' frame when you"..
" die/level in the game"] = "隐藏“已死”和“升级”帧"..
" 你在游戏中死亡/等级"
L["Hide Macro Labels"] = "隐藏标签宏"
L["Hide Macro Labels from Action Bar"] = "隐藏操作栏中的宏标签"
L["Hide Hotkeys Labels"] = "隐藏标签键"
L["Hide Hotkeys Labels from Action Bar"] = "在操作栏中隐藏关键标签"
L["Hide Stance Bar"] = "隐藏实例栏"
L["Hide the Stance Bar (Druid forms, Rogue stealth, etc)"] = "隐藏实例栏（德鲁伊形状，无赖潜行等等）"
L["Hide Chat Buttons"] = "隐藏聊天按钮" 
L["Hide the Chat buttons (voice, social, etc)"] = "隐藏聊天按钮（语音，社交等）"
L["Hide AFK Frame"] = "隐藏AFK帧"
L["Hide the AFKMode when you are AFK"] = "在AFK模式下隐藏框"
L["Hide Faction/PvP/Prestige icon"] = "隐藏派系/ PvP /声望图标"
L["Hide the player frame Faction/PvP/Prestige icon"] = "在播放器框架中隐藏阵营/ PvP /声望图标"
L["|cfff2dc7fHide UnitImproved Faction Icon|r"] = "|cfff2dc7fHide Faction UnitImproved图标|r"
L["Hide the Faction Icon (Ally/Horde) on players frames"] = "在玩家画面中隐藏阵营图标（Ally / Horde）"
L["Hide CastBar Timer"] = "隐藏CastBar计时器"
L["Hide the timer below CastBar"] = "隐藏投射栏计时器"
L["|cfff2dc7fHide GroupFrame|r"] = "|cfff2dc7f隐藏组框|r"
L["Hide the GroupFrame on the player portrait"] = "隐藏播放器框架中的组框架"
L["Hide Covenant Frame"] = "隐藏契约框架"
L["Hide the Covenant/Garrison minimap icon"] = "隐藏条约/驻军中的小地图图标"
L["Hide Minimap Zone Text"] = "隐藏小地图文字"
L["Hide zone text above minimap"] = "将当前位置文字隐藏在小地图上方"
L["Hide Castbar"] = "隐藏Castbar"
L["Completely hide the player's castbar"] = "完全隐藏玩家的施法栏"
-- Config Miscellaneous
L["Smooth Camera (50% Slower)"] = "平滑相机 (50% 慢)"
L["Smooth Camera (70% Slower)"] = "平滑相机 (70% 慢)"
L["Smooth Camera (90% Slower)"] = "平滑相机 (90% 慢)"
L["Makes the Camera turns in a more smooth way"] = "使相机转动更平稳"
L["|cfff2dc7fAuto Repair/Sell Gray Items|r"] = "|cfff2dc7f出售灰色和汽车维修|r"
L["When you open a Merchant shop, auto sell gray"..
" and repair items"] = "当您打开铁匠时，自动出售灰色物品并修理物品"
L["Auto Gamma"] = "自动伽玛"
L["Automatically change the gamma when is day to"..
" 1.2 (brighter) and to 1.0 (default) at night based on the local time"] = "在以下情况下自动更改伽玛"..
" 根据当地时间，白天为白天（晴天）为1.2（晴朗），晚上为1.0（默认）"
L["USA Date Format"] = "美国日期/时间格式"
L["Change the date format of the whole UI to"..
" the USA format"] = "将界面日期格式更改为美国格式"
L["RPG chat fonts"] = "聊天字体RPG"
L["Change the chat fonts to a RPG look-alike style"] = "将聊天源更改为RPG样式"
L["Auto Screenshot"] = "自动截图"
L["Automatically takes a screenshot when you level up"] = "每次升级时拍照"
L["Transparent Name BKGD"] = "透明背景（名称）"
L["Remove any color in the target name background"] = "删除目标名称中的所有背景色"
L["Default Class Background"] = "班级标准背景"
L["Remove the class color background behind"..
" the player names to default values (Transparent Name needs to be unchecked)"] = "去除背景色"..
" 播放器的名称（必须取消选中“透明背景”）"
L["Disable Nameplate Changes"] = "禁用铭牌更改"
L["This option will remove any change that was made to the nameplates (the bar above mobs and players)"] = "它将删除任何"..
" 对铭牌的更改（小怪和玩家上方的栏）"
L["Disable ChatBubble Changes"] = "禁用聊天气泡更改"
L["This option will remove any change that was made to the chatbubbles (the frame text above players)"] = "它将删除任何"..
"  更改聊天气泡（玩家上方的文本框）"
L["Disable Damage Font (*)"] = "禁用损坏源（*）" 
L["This option will remove any change to the damage font text."..
"\n*You need to restart the game so the font can be reloaded. You can change it to any font, "..
"go to Textures->font and replace the file keeping the same name"] = "它将删除对损坏源的任何更改"..
"\n *您需要重新启动游戏才能重新加载字体。 您也可以更改它 "..
"去 Textures->font 并更改名称相同的文件"
L["|cfff2dc7fDisable Portrait Text Spam|r"] = "|cfff2dc7f禁用文字垃圾邮件肖像|r"
L["Disable healing/damage spam over player"..
" and pet portraits"] = "对宠物和玩家肖像禁用修复/破坏垃圾邮件"
L["Disable New Minimap"] = "禁用新的小地图"
L["This option will get you back to the"..
" Blizzard default minimap style (round)."] = "小地图将返回暴雪模式（圆形）"
L["Disable Smoke Texture"] = "禁用烟雾纹理"
L["It will disable the 'smoke' texture around the portrait in "..
"the UnitFrameImproved version of it"] = "将禁用版本中肖像周围的“烟熏”纹理 "..
" UnitFrameImproved"
L["Disable Button Color Text"] = "禁用彩色文本按钮"
L["Change the button colors back to default yellow"] = "将按钮的颜色更改为黄色图案"
L["Disable New CastBar"] = "禁用 新CastBar"
L["Will disable the new castbar and return to Blizzard default texture"] = "将禁用新的castbar"..
" 并返回标准的暴雪纹理"
-- Config Tweaks & Extra
L["Disable Kill Announcer"] = "禁用 Kill Announcer"
L["Disable the Kill Announcer frame that show up when you kill someone"] = "杀死某人时禁用死亡帧"
L["Silence Kill Announcer"] = "静音 Kill Announcer"
L["Remove boss/kill sounds from the Kill Announcer frame"] = "消除上司/死亡的声音 Kill Announcer"
L["|cfff2dc7fTooltip on Cursor|r"] = "|cfff2dc7f提示工具提示|r"
L["Tooltips will appear close to the mouse cursor position"] = "工具提示将出现在鼠标指针附近"
L["|cfff2dc7fInspect Target (Shift + ')|r"] = "|cfff2dc7f检查目标（Shift + '）|r"
L["When you have a target or your mouse is over someone character,"..
" to inspect this player press the keys Shift + '"] = "当您有目标或鼠标悬停在某个字符上时，"..
" 检查玩家按下按键 Shift+'"
L["|cfff2dc7fConfirm Pop-Ups (Ctrl + ')|r"] = "|cfff2dc7f确认弹出窗口（Ctrl + '）|r"
L["When this is active you can confirm almost"..
" any pop-ups (release, quests, stacks, etc) pressing the keys Ctrl + '"] = "启用后，您几乎可以确认"..
" 按下所有弹出窗口（发布，任务，堆栈等） Ctrl + '"
L["First Person View"] = "第一人称视角"
L["Change the camera view to a 'First Person' experience"] = "将相机视图更改为第一人称"
L["ActionButton on KeyUp"] = "公布的主要行动"
L["With this option spells can be cast just when the"..
" keybind are released"] = "使用此选项，只有在释放钥匙时才能施放咒语"
L["Combat Cursor Mode"] = "战斗模式"
L["Makes the camera turns with your mouse when in"..
" combat (right-click to show cursor)"] = "在战斗中使用鼠标使相机转动（右键显示指针）"
L["Square Minimap"] = "广场迷你地图"
L["A modern minimap (neon class borders)"] = "现代小地图（霓虹灯边框和经典色彩）"
L["Keep UnitFrame Dark"] = "保持UnitFrame处于黑暗状态"
L["Even if you change theme, this will keep UnitFrame Dark"..
" (player frame, boss, etc)."] = "即使更改主题，此选项也会使UnitFrame保持黑暗"..
" （玩家框架，老板等）"
L["You can only select one style of UnitFrame color"] = "您只能为UnitFrame选择一种颜色样式"
L["Keep UnitFrame Blizzard Like"] = "保持UniFrame暴雪"
L["Even if you change theme, this will keep UnitFrame"..
" Blizzard like (player frame, boss, etc)."] = "即使更改主题，此选项也将保留经典的暴雪主题"..
" （玩家框架，老板等）"
L["|cfff2dc7fInstance Leave Frame|r"] = "|cfff2dc7f出口实例（框架）|r"
L["A dynamic frame that pop-up when you"..
" complete a LFG (dungeon, raid, etc)"] = "完成LFG（地牢，突袭等）时出现的框架"
L["Minimalist UI"] = "简约界面"
L["Hide some parts of the UI when you are out of combat ('ATL-CTRL-P' to show frames)"] = "隐藏界面的一部分"..
" 当你出战时（“ATL-CTRL-P” 以显示框架）"
L["Disable 'Dynamic Quest Tracker' at Miscellaneous tab first"] = "第一次禁用 “动态任务” 在“杂项”标签中"
L["Minimal ActionBar"] = "简约酒吧"
L["Minimalist actionbar, hide all the textures"] = "极简操作栏，隐藏所有纹理"
L["Dynamic Quest Tracker"] = "动态任务"
L["Hide the quest track when you"..
" are in combat or in a PVP instance"] = "在战斗或PvP实例中隐藏任务栏"
-- Config Scale & Frame Size
L["|cffb62a25This is a work in progress,".. 
" I'm still learning how it works, please report any bugs in our discord|r"] = "|cffb62a25正在开发中，"..
" 我仍在学习其工作原理，报告我们中的任何错误 discord|r"
-- Config Themes
L["Some of this options needs the AbyssUI_TexturePack."..
" You can find a download link in the addon page. You also can find the link in te 'Info Panel' section."] = "其中一些选项要求 AbyssUI_TexturePack。"..
" 您可以在插件页面上找到下载链接。 您也可以在“信息”部分中找到链接。"
L["|cfff2dc7fUnitFrame Improved|r"] = "|cfff2dc7f改进的UnitFrame|r"
L["This is a improved version of unitframes,"..
" it changes those frames to a more beautiful and complete version"] = "单元框架的改进版本，"..
" 将那些框架更改为更美丽，更完整的东西"
L["|cfff2dc7fElite Portrait|r"] = "|cfff2dc7f精英肖像|r"
L["Add a elite texture to the player portrait"] = "将精英纹理添加到播放器（龙）肖像"
L["You can only select one UnitFrame portrait art"] = "您一次只能选择一幅肖像画"
L["DeathKnight Alliance Portrait"] = "死亡骑士肖像（Ally）"
L["DeathKnight Horde Portrait"] = "死亡骑士肖像（部落）"
L["Add a sword texture to the player portrait"] = "向玩家的肖像添加dk武器纹理"
L["Demon Hunter Portrait"] = "恶魔猎人肖像"
L["Add a DH inspired texture to the player portrait"] = "为玩家的肖像添加dh纹理"
L["Artistic"] = "艺术的"
L["A artistic version of UnitPlayerFrame"] = "玩家的UnitFrame的艺术版本"
L["You need to uncheck any other portrait art to apply a new one"] = "您需要取消选择其他肖像艺术才能使用新的肖像艺术。"
L["Bright"]= "亮"
L["A bright version of UnitPlayerFrame"] = "播放器的UnitFrame的出色版本"
L["Classic"] = "古典"
L["A classic version of UnitPlayerFrame"] = "播放器的UnitFrame的经典版本"
L["Artistic(V2)"] = "艺术的(V2)"
L["Version two of artistic UnitPlayerFrame"] = "播放器的UnitFrame的另一个艺术版本"
L["Dark"] = "变暗"
L["Dark version of UnitPlayerFrame"] = "播放器的UnitFrame的深色版本"
L["DarkGray"] = "深灰色"
L["A dark gray version of UnitPlayerFrame"] = "播放器的UnitFrame的深灰色版本"
L["Dark(V2)"] = "变暗(V2)"
L["Version 2 of the dark UnitPlayerFrame"] = "播放器的UnitFrame的另一个深色版本"
L["GrayScale"] = "淡灰色"
L["A grayscale version of UnitPlayerFrame"] = "播放器的UnitFrame的灰色版本"
L["LightGray"] = "浅灰"
L["A light gray version of UnitPlayerFrame"] = "播放器的UnitFrame的浅灰色版本"
L["MediumGray"] = "中灰"
L["A medium gray version of UnitPlayerFrame"] = "播放器的UnitFrame的中灰色版本"
L["MinimalBlue"] = "极简蓝"
L["A blue version of UnitPlayerFrame"] = "播放器的UnitFrame的极简蓝色版本"
L["MinimalRed"] = "极简红色"
L["A red version of UnitPlayerFrame"] = "播放器的UnitFrame的极简红色版本"
L["Muted"] = "静音"
L["A muted version of UnitPlayerFrame"] = "播放器的UnitFrame的静音版本"
L["Psychedelic"] = "迷幻"
L["A psychedelic version of UnitPlayerFrame"] = "迷幻版的玩家的UnitFrame"
L["Retro"] = "复古风"
L["A retrowave version of UnitPlayerFrame"] = "播放器的UnitFrame的复古版本"
L["Vibrant"] = "充满活力"
L["A vibrant version of UnitPlayerFrame"] = "充满活力的播放器UnitFrame版本"
L["|cffc0c0c0Blizzard (Default)|r"] = "|cffc0c0c0暴雪（默认）|r"
L["Blizzard Silver Colorization for Frames"] = "暴风雪框架的银色"
L["You can only select one preset color, uncheck others"] = "您只能选择预定义的颜色，取消选择其他颜色"
L["|cff636363Blackout|r"] = "|cff636363朦胧|r"
L["A completely dark colorization"] = "完全深色"
L["|cffb62a25Blood|r"] = "|cffb62a25血液|r"
L["A dark red colorization"] = "深红色"
L["|cffecc13cGold|r"] = "|cffecc13c金色的|r"
L["A golden colorization"] = "金色"
L["|cffc41F3BDeath Knight|r"] = "|cffc41F3B死亡骑士|r"
L["|cffA330C9Demon Hunter|r"] = "|cffA330C9恶魔猎手|r"
L["|cffFF7D0ADruid|r"] = "|cffFF7D0A德鲁伊|r"
L["|cffABD473Hunter|r"] = "|cffABD473猎人|r"
L["|cff69CCF0Mage|r"] = "|cff69CCF0法师|r"
L["|cff00FF96Monk|r"] = "|cff00FF96僧|r"
L["|cffF58CBAPaladin|r"] = "|cffF58CBA圣骑士|r"
L["Priest (Shadow)"] = "牧师（阴影）"
L["|cffFFF569Rogue|r"] = "|cffFFF569流氓|r"
L["|cff0070DEShaman|r"] = "|cff0070DE萨满祭司|r"
L["|cff9482C9Warlock|r"] = "|cff9482C9巫师|r"
L["|cffC79C6EWarrior|r"] = "|cffC79C6E战士|r"
L["Apply the color you choose from the ColorPicker"] = "应用您在颜色选择器中选择的颜色"
L["You need to uncheck any preset color, to apply a color"] = "您需要取消选择任何预定义的颜色才能应用该颜色"
--------------------------------------------------------------
-- Frames
L["Move"]	= "继续"
L["Level: "] = "水平: "
L["Honor: "] 	= "荣誉: "
L["Item Level: "]	= "等级物品: "
L["Confirm"] = "确认"
L["Recommended"]	= "推荐的"
L["Modern"] = "现代"
L["Classic"] = "古典"
L["|cff8b0000YOU DIED|r"] = "|cff8b0000你死了|r"
L["Let's save the variables and prepare the interface for the first use.\n"
.."To do this, choose the option that best suits your taste.\n\n"
.."|cfff2dc7fClassic|r: interface model close to the original, with few modifications.\n\n"
.."|cfff2dc7fRecommended|r: a mix between the other options, with the best of the two.\n\n"
.."|cfff2dc7fModern|r: a modern interface model, with striking changes to the interface.\n\n"
.."You always can change options on the configuration panel.\nType '|cfff2dc7f/abyssui|r' on chat for more info."] = "我们走吧"
.." 保存变量并为第一次使用准备接口。\n"
.."为此，请选择最适合您的口味的选项之一。\n\n"
.."|cfff2dc7f古典|r: 接口模型接近原始模型，仅作了少量修改。\n\n"
.."|cfff2dc7f推荐的|r: 其他选项之间的混合，两者兼具。\n\n"
.."|cfff2dc7f现代|r: 现代的界面模型，界面发生了很大的变化。\n\n"
.."您可以随时在设置面板中更改选项。\n输入 '|cfff2dc7f/abyssui|r' 在聊天中了解更多信息。"
L["A reload is necessary so this configuration can be save!\n"..
"Click the |cffffcc00'confirm'|r button to Reload.\nYou still can make changes (do before you confirm)."] = "一种"
.." 要保存此配置，必须重新加载！\n"..
"点击按钮 |cffffcc00'确认'|r 重新加载。\n 您仍然可以进行更改（在提交之前进行更改）."
L["It will only hide Blizzard frames, addons have their"..
" own frames,\n a good addon probably has an option to hide while out of combat.\n"..
" I could have added the entire interface to be hidden,\n but that would prevent"..
" interaction with some frames (auction, loot, quest, etc)."] = "它只会隐藏暴雪帧，附加组件有"..
" 框架本身，\n 一个好的插件可能在战斗中可以隐藏。\n"..
" 我本可以添加整个界面来隐藏的，\n 但这会阻止"..
" 与某些框架（拍卖行，战利品，任务等）的互动。"
L["Wait!\nThis will clean all your skills/spells from Actions Bars."] = "等待！\n 这将从动作栏中清除所有咒语/异能。"
--------------------------------------------------------------
-- Extras
L["|cfff07100Repair cost paid by Guild: %.1fg|r"] = "|cfff07100公会支付的维修费用: %.1fg|r"
L["|cffead000Repair cost: %.1fg|r"] = "|cffead000维修价值: %.1fg|r"
L["Not enough gold for repair."] = "没有金要修复。"
L["This instance is completed! Want to leave?"..
" You can also teleport out/in or just close this frame"] = "实例已完成！ 你要离开吗"..
" 您也可以传送或仅关闭该框"
L["Teleport"] = "传送"
L["|cfff2dc7fAbyssUI Command List|r"] = "|cfff2dc7fAbyssUI 命令清单|r"
L["|cfff2dc7fType /abyssui |r|cffffcc00'command name'|r"] = "|cfff2dc7f输入 /abyssui |r|cffffcc00'命令名称'|r"
L["/abyssui |cffffcc00config|r ~configuration panel"] = "/abyssui |cffffcc00config|r ~配置面板"
L["/abyssui |cffffcc00setup|r ~show the setup frame"] = "/abyssui |cffffcc00setup|r ~显示设置屏幕"
L["/abyssui |cffffcc00reset|r ~reset UI frames to default positions"] = "/abyssui |cffffcc00reset|r ~重置框架位置"
L["/abyssui |cffffcc00daily|r ~daily info"] = "/abyssui |cffffcc00daily|r ~每日资讯"
L["/abyssui |cffffcc00reload|r ~reload the interface"] = "/abyssui |cffffcc00reload|r ~重新加载界面"
L["/abyssui |cffffcc00more|r ~for more commands"] = "/abyssui |cffffcc00more|r ~更多命令"
L["|cfff2dc7fToken Price: |r"] = "|cfff2dc7f代币价格: |r"
L["|cfff2dc7fToken Price:|r Not available right now!"] = "|cfff2dc7f代币价格:|r 无法使用！"
L["|cfff2dc7fDate:|r "] = "|cfff2dc7f日期:|r "
L["|cfff2dc7fHonor Level: |r|cffffcc00"] = "|cfff2dc7f荣誉等级: |r|cffffcc00"
L["|cfff2dc7fWoW Version: |r|cffffcc00"] = "|cfff2dc7f魔兽版本: |r|cffffcc00"
L["|cfff2dc7fAbyssUI Version: |r|cffffcc00"] = "|cfff2dc7fAbyssUI版本: |r|cffffcc00"
L["/abyssui |cffffcc00clc|r ~clear CombatLog entries"] = "/abyssui |cffffcc00clc|r ~清除战斗记录"
L["/abyssui |cffffcc00gm|r ~custumer support"] = "/abyssui |cffffcc00gm|r ~消费者支持"
L["/abyssui |cffffcc00rc|r ~ready check"] = "/abyssui |cffffcc00rc|r ~确认 '准备'"
L["/abyssui |cffffcc00cr|r ~check role poll"] = "/abyssui |cffffcc00cr|r ~确认功能"
L["/abyssui |cffffcc00unlock|r ~unlock some frames"] = "/abyssui |cffffcc00unlock|r ~解锁一些框架"
L["/abyssui |cffffcc00lock|r ~lock unlocked frames"] = "/abyssui |cffffcc00lock|r ~锁定未锁定的框架"
L["|cfff2dc7fConsider reload the UI to make sure frames are locked|r '|cffffcc00/reload|r'"] = "|cfff2dc7f考虑重新加载接口以确保框架被锁定|r '|cffffcc00/reload|r'"
L["|cff0d75d4Special Thanks|r"] = "|cff0d75d4谢谢|r"
L["|cff0d75d4Translators|r"] 		= "|cff0d75d4译者|r"
L["Default"] = "模式"
L["Need Translator"] = "需要翻译"
L["|cfff2dc7fFizzlemizz|r for helping me with programming questions."] = "|cfff2dc7fFizzlemizz|r 帮助我解决编程问题。"
L["|cfff2dc7fKawF|r for UnitFrame Improved, so I could create a really nice"..
" UnitFrame for AbyssUI."] = "|cfff2dc7fKawF|r 通过改进的UnitFrame，我可以从中得到启发"..
" 并为AbyssUI创建非常好的东西。"
L["|cfff2dc7fEnglish (United States): |r"] = "|cfff2dc7f英语（美国）: |r"
L["|cfff2dc7fSpanish (Mexico): |r"] = "|cfff2dc7f西班牙语（墨西哥）: |r"
L["|cfff2dc7fPortuguese: |r"] = "|cfff2dc7f葡萄牙语: |r"
L["|cfff2dc7fGerman: |r"] = "|cfff2dc7f德语: |r"
L["|cfff2dc7fEnglish (Great Britain): |r"] = "|cfff2dc7f英语（英国）: |r"
L["|cfff2dc7fSpanish (Spain): |r"] = "|cfff2dc7f西班牙语（西班牙）: |r"
L["|cfff2dc7fFrench: |r"] = "|cfff2dc7f法文: |r"
L["|cfff2dc7fItalian: |r"] = "|cfff2dc7f义大利文: |r"
L["|cfff2dc7fRussian: |r"] = "|cfff2dc7f俄语: |r"
L["|cfff2dc7fKorean: |r"] = "|cfff2dc7f韩语: |r"
L["|cfff2dc7fChinese (Traditional): |r"] = "|cfff2dc7f繁体中文）: |r"
L["|cfff2dc7fChinese (Simplified): |r"] = "|cfff2dc7f简体中文）: |r"
L["Feel free to help translate AbyssUI to your own language, if you want to help, go to AbyssUI Github page, "..
"there's a folder named 'localization', find the language you know better and help to improve it. Thank you soo much for this."] = "随时帮助将AbyssUI翻译成您的语言，如果您想提供帮助，请转到Github上的AbyssUI页面， "..
"寻找一个名为 'localization'，找到您最了解的语言，并帮助改进它。 非常感谢你做的这些。"
L["Chat Commands"] = "聊天命令"