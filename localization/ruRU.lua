local L = LibStub("AceLocale-3.0"):NewLocale("AbyssUI", "ruRU")
if not L then return end 
-- Переводчик: Нужен переводчик
-- Пример
-- L ["Английский текст"] - "Ваш перевод"
--------------------------------------------------------------
-- Config
L["Info Panel"] = "Информация"
L["Hide Elements"] = "Скрыть элементы"
L["Miscellaneous"] = "Несколько"
L["Art & Themes"] = "Искусство и темы"
L["Colorization"] = "Раскрашивание"
L["Tweaks & Extra"] = "Корректировки и дополнительные услуги"
L["Scale & Frame Size"] = "Масштаб и размеры" 
L["Thanks & Translations"] = "Спасибо и переводы"
-- Daily Info
L["Thank you for choosing Abyss|cff0d75d4UI|r!"] = "Благодарим Вас за выбор Abyss|cff0d75d4UI|r!"
L["The improved World of Warcraft user interface."] = "Улучшенный интерфейс World of Warcraft."
L["|cfff2dc7fAbyssUI Daily Info|r"] = "|cfff2dc7fAbyssUI Ежедневная информация|r"
L["Not available right now!"] = "Не доступен сейчас!"
L["|cfff2dc7fTime since last login: |r"] = "|cfff2dc7fВремя с момента последнего входа: |r"
L[" you were gone for |cffffcc00"] = " Вы вышли на |cffffcc00"
L["Type |cffffcc00/abyssui|r for a list of commands"] = "Тип |cffffcc00/abyssui|r для командного списка"
L["Current Time"] = "Текущее время"
L["Honor Level"] = "Уровень чести"
L["|cfff2dc7fWoW Version"] = "|cfff2dc7fВерсия WoW"
L["|cfff2dc7fAbyssUI Version"] = "|cfff2dc7fВерсия AbyssUI"
--
L["Thank you for using Abyss|cff0d75d4UI|r. If you enjoy this addon,"..
" consider sharing with your friends or even making a donation."..
"It helps a lot! This is a minimalist UI that makes changes directly to the WoW frames,"..
"using nearly the same amount of CPU/RAM as the Blizzard default UI.\n\n"..
"Options that have a different text color are based on your choice in the setup."..
" Those options are set by default if you choose recommended settings.\n"..
"Check the options by clicking in the (+) button on the left."] = "Благодарим Вас за использование Abyss|cff0d75d4UI|r. Если вам понравилось это addon,"..
" рассмотреть вопрос о совместном использовании с друзьями или даже сделать пожертвование."..
" Это очень помогает! Минималистский интерфейс, который вносит изменения непосредственно в рамки wow,"..
" используя мало CPU/RAM а также стандартный интерфейс Blizzard.\n\n"..
"Варианты с различными цветами основаны на вашем выборе в настройке."..
" Эти параметры устанавливаются по умолчанию, если вы выбрали рекомендуемые варианты.\n"..
"Проверьте варианты, нажав на (+) слева."
-- Config Options
L["- General"] = "- Общее"
L["- Frames"]	= "- Кадров"
L["Player Portrait"]	= "Портрет игрока"
L["- Portrait Art"]	= "- Портретное искусство"
L["Frame Colorization"] = "Окраска рамы"
L["- Preset Colors"]	= "- Предустановленные цвета"
L["- Choose a Color"]	= "- Выберите цвет"
L["- UnitFrame Art"]	= "- UnitFrame Искусство"
L["Setup"]	= "Конфигурации"
L["Clear Bars"]	= "Очистить бары"
L["DailyInfo"]	= "Ежедневная информация"
L["Reload UI"]	= "Перезагрузка UI"
L["Donate"]	= "Пожертвования"
L["Donators"]	= "Доноры"
-- Config Info Panel
L["In this page you can find links to some other AddOns/Packs that make AbyssUI even better." ..
"These addons are verify to especially work with AbyssUI without any conflict or problem."..
"Click on the image so you can get the respective link. Don't forget to check then out!"] = "На этой странице вы можете найти ссылки на другие Аддоны / Пакеты, которые делают AbyssUI еще лучше."..
" Эти аддоны сканируются для работы с AbyssUI без конфликтов или ошибок."..
" Нажмите на изображение, чтобы получить ссылку с него. Не забудьте взглянуть!"
-- Config Hide Elements
L["The symbol (*) in some options means that there is important information/instructions to be read. "..
"Options with a different color are recommended settings (based on your choice in the setup)."] = "Символ (*) в некоторых вариантах означает, что у вас есть важная информация для чтения. "..
"Варианты с другим цветом рекомендуется настройки (на основе вашего выбора в установке)."
L["Hide MicroMenu"] = "Скрыть MicroMenu"
L["Hide the ActionBar MicroMenu (Bags Bar)"] = "Скрывает MicroMenu (Purse Бар)"
L["Hide Gryphons"] = "Скрыть Гриффины"
L["Hide the ActionBar Gryphons"] = "Скрывает искусство грифонов от мастерства бар"
L["Hide Minimap"] = "Скрыть мини-карту"
L["Hide the Game Minimap"] = "Скрывает мини-карту игры"
L["Hide Objective Tracker"] = "Скрыть Квест Бар"
L["Hide the Objective Tracker (Quest Frame)"] = "Скрывает бары миссии (цели)"
L["Hide FPS/MS Frame"] = "Скрыть рамку FPS/MS"
L["Hide the fps/ms frame (bottomleft)"] = "Скрывает fps/ms кадр (внизу слева)"
L["Hide YouDied/LevelUp Frame"] = "Скрыть кадр Yмер / LevelUp"
L["Hide the 'You Died' and 'Level Up' frame when you"..
" die/level in the game"] = "Скрывает кадр 'Died' и 'LevelUp', когда"..
" Вы умираете / уровень в игре"
L["Hide Macro Labels"] = "Скрыть Макро этикетки"
L["Hide Macro Labels from Action Bar"] = "Скрывает метку макросов в баре действий"
L["Hide Hotkeys Labels"] = "Скрыть этикетки ключей"
L["Hide Hotkeys Labels from Action Bar"] = "Скрывает кнопки этикетки в панели действий"
L["Hide Stance Bar"] = "Скрыть Instance Бар"
L["Hide the Stance Bar (Druid forms, Rogue stealth, etc)"] = "Скрывает бар экземпляра (друид формы, изгоев стелс и т.д.)"
L["Hide Chat Buttons"] = "Скрыть кнопки чата" 
L["Hide the Chat buttons (voice, social, etc)"] = "Скрывает кнопки чата (голос, социальные и т.д.)"
L["Hide AFK Frame"] = "Скрыть FRAME AFK"
L["Hide the AFKMode when you are AFK"] = "Скрывает кадр в режиме AFK"
L["Hide Faction/PvP/Prestige icon"] = "Скрыть фракцию/JvJ/Prestige значок"
L["Hide the player frame Faction/PvP/Prestige icon"] = "Скрывает значок Faction/JvJ/Prestige из кадра игрока"
L["|cfff2dc7fHide UnitImproved Faction Icon|r"] = "|cfff2dc7fСкрыть значок фракции UnitImproved|r"
L["Hide the Faction Icon (Ally/Horde) on players frames"] = "Скрывает значок фракции (Ally/Horde) из кадров игрока"
L["Hide CastBar Timer"] = "Скрыть таймер CastBar"
L["Hide the timer below CastBar"] = "Скрывает литые бар таймер"
L["|cfff2dc7fHide GroupFrame|r"] = "|cfff2dc7fСкрыть групповой кадр|r"
L["Hide the GroupFrame on the player portrait"] = "Скрывает групповой кадр из кадра игрока"
L["Hide Covenant Frame"] = "Скрыть ковенант кадр"
L["Hide the Covenant/Garrison minimap icon"] = "Скрывает пакт / trim значок minimap"
L["Hide Minimap Zone Text"] = "Скрыть текст Minimap"
L["Hide zone text above minimap"] = "Скрывает текст из текущего местоположения над мини-картой"
L["Hide Castbar"] = "Скрыть Castbar"
L["Completely hide the player's castbar"] = "Полностью скрывает литые панели игрока"
-- Config Miscellaneous
L["Smooth Camera (50% Slower)"] = "Мягкая камера (50% Медленно)"
L["Smooth Camera (70% Slower)"] = "Мягкая камера (70% Медленно)"
L["Smooth Camera (90% Slower)"] = "Мягкая камера (90% Медленно)"
L["Makes the Camera turns in a more smooth way"] = "Делает камеру мягче"
L["|cfff2dc7fAuto Repair/Sell Gray Items|r"] = "|cfff2dc7fПродажа серый и авто ремонт|r"
L["When you open a Merchant shop, auto sell gray"..
" and repair items"] = "Когда вы открываете кузнеца, вы продаете серые предметы и автоматически открываете элементы"
L["Auto Gamma"] = "Автоматическая гамма"
L["Automatically change the gamma when is day to"..
" 1.2 (brighter) and to 1.0 (default) at night based on the local time"] = "Изменяет гамма автоматически, когда"..
" день для 1.2 (конечно) и для 1.0 (по умолчанию), когда это ночь, в зависимости от местного времени"
L["Non-Military Date/Time"] = "США Дата / Время Формат"
L["Change the date format of the whole UI to"..
" Non-Military format"] = "Изменяет формат даты интерфейса на формат США"
L["RPG chat fonts"] = "Источник чата RPG"
L["Change the chat fonts to a RPG look-alike style"] = "Изменяет шрифт чата на стиль RPG"
L["Auto Screenshot"] = "Автоматический скриншот"
L["Automatically takes a screenshot when you level up"] = "Смойте каждый раз, когда вы получаете уровень"
L["Transparent Name BKGD"] = "Прозрачный фон (имя)"
L["Remove any color in the target name background"] = "Удаляет любой цвет фона в целевом имени"
L["Default Class Background"] = "Фон стандартного класса"
L["Remove the class color background behind"..
" the player names to default values (Transparent Name needs to be unchecked)"] = "Удаляет цвет фонового класса"..
" имени игрока (Прозрачный фон должен быть очищен)"
L["Disable Nameplate Changes"] = "Отключает изменения Nameplates"
L["This option will remove any change that was made to the nameplates (the bar above mobs and players)"] = "Он будет удалять любые"..
" изменения, внеслиые в nameplates (запретить мобов и игроков)"
L["Disable ChatBubble Changes"] = "Отключает изменения пузыря Chat"
L["This option will remove any change that was made to the chatbubbles (the frame text above players)"] = "Он будет удалять любые"..
" изменения, сделанные в чат пузыри (текстовая рамка над игроками)"
L["Disable Damage Font (*)"] = "Выключите повреждение источника (*)" 
L["This option will remove any change to the damage font text."..
"\n*You need to restart the game so the font can be reloaded. You can change it to any font, "..
"go to Textures->font and replace the file keeping the same name"] = "Устранит любые изменения в источнике повреждения"..
"\n *Вам нужно повторно начать игру для источника, который будет перезагружен. Вы также можете изменить его, "..
"Перейти к Textures->font и изменить файл, сохраняя то же имя"
L["|cfff2dc7fDisable Portrait Text Spam|r"] = "|cfff2dc7fВыключить текст Spam Картину|r"
L["Disable healing/damage spam over player"..
" and pet portraits"] = "Отключает исцеление / повреждение спама на домашних животных и портрет игрока"
L["Disable New Minimap"] = "Отключает новую мини-карту"
L["This option will get you back to the"..
" Blizzard default minimap style (round)."] = "Мини-карта вернется в Blizzard (Круглый)"
L["Disable Smoke Texture"] = "Отключает текстуру дыма"
L["It will disable the 'smoke' texture around the portrait in "..
"the UnitFrameImproved version of it"] = "Отключит текстуру 'дыма' вокруг фотографий в версии "..
" UnitFrameImproved"
L["Disable Button Color Text"] = "Выключите кнопки цветного текста"
L["Change the button colors back to default yellow"] = "Изменяет цвет кнопок на желтый"
L["Disable New CastBar"] = "Отключить CastBar Новые функции"
L["Will disable the new castbar and return to Blizzard default texture"] = "Отключит новую литой панели"..
" и вернуться к текстуре по умолчанию Blizzard"
-- Config Tweaks & Extra
L["Disable Kill Announcer"] = "Отключить Kill Announcer"
L["Disable the Kill Announcer frame that show up when you kill someone"] = "Отключает рамку смерти, когда вы убиваете кого-то"
L["Silence Kill Announcer"] = "Тишина Kill Announcer"
L["Remove boss/kill sounds from the Kill Announcer frame"] = "Удаляет звуки босса/смерти из Kill Announcer"
L["|cfff2dc7fTooltip on Cursor|r"] = "|cfff2dc7fTooltip на указателе|r"
L["Tooltips will appear close to the mouse cursor position"] = "Toolips появится рядом с указателем мыши"
L["|cfff2dc7fInspect Target (Shift + ')|r"] = "|cfff2dc7fПроверка целевого показателя (Shift + ')|r"
L["When you have a target or your mouse is over someone character,"..
" to inspect this player press the keys Shift + '"] = "Если у вас есть цель или мышь над символом,"..
" для проверки этого игрока нажмите клавиши Shift+'"
L["|cfff2dc7fConfirm Pop-Ups (Ctrl + ')|r"] = "|cfff2dc7fПодтвердить Pop-Ups (Ctrl + ')|r"
L["When this is active you can confirm almost"..
" any pop-ups (release, quests, stacks, etc) pressing the keys Ctrl + '"] = "При активном использовании можно подтвердить, что почти"..
" Все pop-ups (выпуск, миссии, стеки и т.д.), нажав клавиши Ctrl + '"
L["First Person View"] = "Представление от первого лица"
L["Change the camera view to a 'First Person' experience"] = "Изменяет представление камеры от первого лица"
L["ActionButton on KeyUp"] = "Действия Ключевые освобождены"
L["With this option spells can be cast just when the"..
" keybind are released"] = "С помощью этой опции заклинания могут быть кастрированы только при освобождении ключа"
L["Combat Cursor Mode"] = "Режим боя"
L["Makes the camera turns with your mouse when in"..
" combat (right-click to show cursor)"] = "Делает камеру свою очередь, с мышью, когда в бою (правая кнопка показывает указатель)"
L["Square Minimap"] = "Квадратная мини-карта"
L["A modern minimap (neon class borders)"] = "Современная мини-карта (неоновые края с классом цвета)"
L["Keep UnitFrame Dark"] = "Держите UnitFrame Темный"
L["Even if you change theme, this will keep UnitFrame Dark"..
" (player frame, boss, etc)."] = "Даже изменяя thetheme, эта опция будет держать UnitFrame темно"..
" (рамка игрока, боссы и т.д.)"
L["You can only select one style of UnitFrame color"] = "Вы можете просто выбрать стиль цвета для UnitFrame"
L["Keep UnitFrame Blizzard Like"] = "Храните UniFrame Blizzard"
L["Even if you change theme, this will keep UnitFrame"..
" Blizzard like (player frame, boss, etc)."] = "Даже если вы измените тему, этот вариант будет держать классическую тему Blizzard"..
" (рамка игрока, боссы и т.д.)"
L["|cfff2dc7fInstance Leave Frame|r"] = "|cfff2dc7fЭкземпляры выхода (Frame)|r"
L["A dynamic frame that pop-up when you"..
" complete a LFG (dungeon, raid, etc)"] = "Кадр, который появляется при выполнения LFG (подземелье, рейд и т.д.)"
L["Minimalist UI"] = "Минималистский интерфейс"
L["Hide some parts of the UI when you are out of combat ('ATL-CTRL-P' to show frames)"] = "Скрывает часть интерфейса"..
" когда вы вышли из боя ('ATL-CTRL-P' чтобы показать кадры)"
L["Disable 'Dynamic Quest Tracker' at Miscellaneous tab first"] = "Первое выключение 'Динамические миссии' в разной вкладке"
L["Minimal ActionBar"] = "Минималистский бар"
L["Minimalist actionbar, hide all the textures"] = "Минималистский экшн-бар, скрывает все текстуры"
L["Dynamic Quest Tracker"] = "Динамические миссии"
L["Hide the quest track when you"..
" are in combat or in a PVP instance"] = "Скрывает бар квестов, когда вы находитесь в бою или в экземпляре PvP"
-- Config Scale & Frame Size
L["|cffb62a25This is a work in progress,".. 
" I'm still learning how it works, please report any bugs in our discord|r"] = "|cffb62a25В разработке,"..
" Я все еще учусь, как это работает, сообщить о любой ошибке в нашей discord|r"
-- Config Themes
L["Some of this options needs the AbyssUI_TexturePack."..
" You can find a download link in the addon page. You also can find the link in te 'Info Panel' section."] = "Некоторые из этих вариантов нуждаются в AbyssUI_TexturePack."..
" Вы можете найти ссылку на загрузку на странице аддон. Вы также можете найти ссылку в 'Информация'."
L["|cfff2dc7fUnitFrame Improved|r"] = "|cfff2dc7fUnitFrame Улучшение|r"
L["This is a improved version of unitframes,"..
" it changes those frames to a more beautiful and complete version"] = "Улучшенная версия unitframe,"..
" изменяет эти кадры на что-то более красивое и полное"
L["|cfff2dc7fElite Portrait|r"] = "|cfff2dc7fЭлитный портрет|r"
L["Add a elite texture to the player portrait"] = "Добавляет элитную текстуру в портрет игрока (дракон)"
L["You can only select one UnitFrame portrait art"] = "Вы можете выбрать только один портрет искусства в то время,"
L["DeathKnight Alliance Portrait"] = "Портрет Рыцаря Смерти (Ally)"
L["DeathKnight Horde Portrait"] = "Портрет Рыцаря Смерти (Horde)"
L["Add a sword texture to the player portrait"] = "Добавляет текстуру оружия dk к портрету игрока"
L["Demon Hunter Portrait"] = "Портрет охотника на демонов"
L["Add a DH inspired texture to the player portrait"] = "Добавляет текстуру dh к портрету игрока"
L["Artistic"] = "Художественный"
L["A artistic version of UnitPlayerFrame"] = "Художественная версия UnitFrame игрока"
L["You need to uncheck any other portrait art to apply a new one"] = "Вам нужно, чтобы остановить любой другой портретного искусства, чтобы использовать новые"
L["Bright"]= "Яркий"
L["A bright version of UnitPlayerFrame"] = "Блестящая версия UnitFrame игрока"
L["Classic"] = "Классической"
L["A classic version of UnitPlayerFrame"] = "Классическая версия UnitFrame игрока"
L["Artistic(V2)"] = "Художественный(V2)"
L["Version two of artistic UnitPlayerFrame"] = "Другая художественная версия UnitFrame игрока"
L["Dark"] = "Темно"
L["Dark version of UnitPlayerFrame"] = "Темная версия UnitFrame игрока"
L["DarkGray"] = "Темно-серый"
L["A dark gray version of UnitPlayerFrame"] = "Темно-серая версия UnitFrame игрока"
L["Dark(V2)"] = "Темно(V2)"
L["Version 2 of the dark UnitPlayerFrame"] = "Другая темная версия UnitFrame игрока"
L["GrayScale"] = "Серый"
L["A grayscale version of UnitPlayerFrame"] = "Сероватый вариант UnitFrame игрока"
L["LightGray"] = "Светло-серый"
L["A light gray version of UnitPlayerFrame"] = "Светло-серая версия UnitFrame игрока"
L["MediumGray"] = "Средний серый"
L["A medium gray version of UnitPlayerFrame"] = "Средняя серая версия UnitFrame игрока"
L["MinimalBlue"] = "Минималистский синий"
L["A blue version of UnitPlayerFrame"] = "Минималистская синяя версия UnitFrame игрока"
L["MinimalRed"] = "Минималистский красный"
L["A red version of UnitPlayerFrame"] = "Минималистская красная версия UnitFrame игрока"
L["Muted"] = "Замолчать"
L["A muted version of UnitPlayerFrame"] = "Приглушенная версия UnitFrame игрока"
L["Psychedelic"] = "Психоделические"
L["A psychedelic version of UnitPlayerFrame"] = "Психоделическая версия UnitFrame игрока"
L["Retro"] = "Ретро"
L["A retrowave version of UnitPlayerFrame"] = "Ретро-версия UnitFrame игрока"
L["Vibrant"] = "Яркие"
L["A vibrant version of UnitPlayerFrame"] = "Яркая версия UnitFrame игрока"
L["|cffc0c0c0Blizzard (Default)|r"] = "|cffc0c0c0Blizzard (По умолчанию)|r"
L["Blizzard Silver Colorization for Frames"] = "Серебряная окраска Blizzard для кадров"
L["You can only select one preset color, uncheck others"] = "Вы можете выбрать только заданный цвет, не остановить другие"
L["|cff636363Blackout|r"] = "|cff636363Неясным|r"
L["A completely dark colorization"] = "Полностью темная окраска"
L["|cffb62a25Blood|r"] = "|cffb62a25Крови|r"
L["A dark red colorization"] = "Темно-красная окраска"
L["|cffecc13cGold|r"] = "|cffecc13cЗолотой|r"
L["A golden colorization"] = "Золотая окраска"
L["|cffc41F3BDeath Knight|r"] = "|cffc41F3BРыцарь смерти|r"
L["|cffA330C9Demon Hunter|r"] = "|cffA330C9Охотник на демонов|r"
L["|cffFF7D0ADruid|r"] = "|cffFF7D0AДруид|r"
L["|cffABD473Hunter|r"] = "|cffABD473Охотник|r"
L["|cff69CCF0Mage|r"] = "|cff69CCF0Мастер|r"
L["|cff00FF96Monk|r"] = "|cff00FF96Монах|r"
L["|cffF58CBAPaladin|r"] = "|cffF58CBAПаладин|r"
L["Priest (Shadow)"] = "Священник (Тени)"
L["|cffFFF569Rogue|r"] = "|cffFFF569Изгоев|r"
L["|cff0070DEShaman|r"] = "|cff0070DEШаман|r"
L["|cff9482C9Warlock|r"] = "|cff9482C9Ведьма|r"
L["|cffC79C6EWarrior|r"] = "|cffC79C6EВоин|r"
L["Apply the color you choose from the ColorPicker"] = "Применить цвет, который вы выбрали в сборщике цветов"
L["You need to uncheck any preset color, to apply a color"] = "Вам нужно, чтобы остановить любой заданный цвет, чтобы применить этот цвет"
--------------------------------------------------------------
-- Frames
L["Move"]	= "Переместить"
L["Level: "] = "Уровень: "
L["Honor: "] 	= "Честь: "
L["Item Level: "]	= "Элементы уровня: "
L["Confirm"] = "Подтвердить"
L["Recommended"]	= "Рекомендуется"
L["Modern"] = "Современные"
L["Classic"] = "Классической"
L["|cff8b0000YOU DIED|r"] = "|cff8b0000Ты труп|r"
L["Let's save the variables and prepare the interface for the first use.\n"
.."To do this, choose the option that best suits your taste.\n\n"
.."|cfff2dc7fClassic|r: interface model close to the original, with few modifications.\n\n"
.."|cfff2dc7fRecommended|r: a mix between the other options, with the best of the two.\n\n"
.."|cfff2dc7fModern|r: a modern interface model, with striking changes to the interface.\n\n"
.."You always can change options on the configuration panel.\nType '|cfff2dc7f/abyssui|r' on chat for more info."] = "Поехали"
.." сохранить переменные и подготовить интерфейс для первого использования.\n"
.."Для этого выберите один из вариантов, который лучше всего соответствует вашему вкусу.\n\n"
.."|cfff2dc7fКлассической|r: модель интерфейса, близкая к оригиналу, с несколькими изменениями.\n\n"
.."|cfff2dc7fРекомендуется|r: смесь других вариантов, с лучшими из обоих.\n\n"
.."|cfff2dc7fСовременные|r: современная модель интерфейса, со значительными изменениями в интерфейсе.\n\n"
.."Вы можете изменить параметры в любое время в панели настроек.\nТип '|cfff2dc7f/abyssui|r' в чате для получения дополнительной информации."
L["A reload is necessary so this configuration can be save!\n"..
"Click the |cffffcc00'confirm'|r button to Reload.\nYou still can make changes (do before you confirm)."] = "A"
.." перезагрузка необходима для того, чтобы сохранить эту настройку!\n"..
"Нажмите на кнопку |cffffcc00'Подтвердить'|r для подзарядки.\n Вы все еще можете внести изменения (сделать до подтверждения)."
L["It will only hide Blizzard frames, addons have their"..
" own frames,\n a good addon probably has an option to hide while out of combat.\n"..
" I could have added the entire interface to be hidden,\n but that would prevent"..
" interaction with some frames (auction, loot, quest, etc)."] = "Вы будете только скрывать кадры из Blizzard, аддоны имеют"..
" сами кадры,\n хороший аддон, вероятно, имеет возможность спрятаться в то время как в бою.\n"..
" Мог бы добавить весь интерфейс, чтобы скрыть,\n но это предотвратило бы"..
" взаимодействие с некоторыми кадрами (аукционный дом, добыча, миссии и т.д.)."
L["Wait!\nThis will clean all your skills/spells from Actions Bars."] = "Подожди!\n Это позволит очистить все заклинания / способности от действия бар."
--------------------------------------------------------------
-- Extras
L["|cfff07100Repair cost paid by Guild: %.1fg|r"] = "|cfff07100Ремонт, оплаченный Гильдией: %.1fg|r"
L["|cffead000Repair cost: %.1fg|r"] = "|cffead000Значение ремонта: %.1fg|r"
L["Not enough gold for repair."] = "Нет золота для ремонта."
L["This instance is completed! Want to leave?\n"..
"You can also teleport out/in or just close this frame"] = "Экземпляр завершен! Ты хочешь уйти?\n"..
"Вы также можете телепортироваться или просто закрыть этот кадр"
L["Teleport"] = "Телепорт"
L["|cfff2dc7fAbyssUI Command List|r"] = "|cfff2dc7fAbyssUI Список команд|r"
L["|cfff2dc7fType /abyssui |r|cffffcc00'command name'|r"] = "|cfff2dc7fТип /abyssui |r|cffffcc00'название команды'|r"
L["/abyssui |cffffcc00config|r ~configuration panel"] = "/abyssui |cffffcc00config|r ~панель конфигурации"
L["/abyssui |cffffcc00setup|r ~show the setup frame"] = "/abyssui |cffffcc00setup|r ~показать экран настройки"
L["/abyssui |cffffcc00reset|r ~reset UI frames to default positions"] = "/abyssui |cffffcc00reset|r ~сбросить положение кадров"
L["/abyssui |cffffcc00daily|r ~daily info"] = "/abyssui |cffffcc00daily|r ~ежедневная информация"
L["/abyssui |cffffcc00reload|r ~reload the interface"] = "/abyssui |cffffcc00reload|r ~перезагрузка интерфейса"
L["/abyssui |cffffcc00more|r ~for more commands"] = "/abyssui |cffffcc00more|r ~для получения дополнительных команд"
L["|cfff2dc7fToken Price: |r"] = "|cfff2dc7fЦена токена: |r"
L["|cfff2dc7fToken Price:|r Not available right now!"] = "|cfff2dc7fЦена токена:|r Недоступен!"
L["|cfff2dc7fDate:|r "] = "|cfff2dc7fДата:|r "
L["|cfff2dc7fHonor Level: |r|cffffcc00"] = "|cfff2dc7fУровень чести: |r|cffffcc00"
L["|cfff2dc7fWoW Version: |r|cffffcc00"] = "|cfff2dc7fВерсия WoW: |r|cffffcc00"
L["|cfff2dc7fAbyssUI Version: |r|cffffcc00"] = "|cfff2dc7fВерсия AbyssUI: |r|cffffcc00"
L["/abyssui |cffffcc00clc|r ~clear CombatLog entries"] = "/abyssui |cffffcc00clc|r ~очистить боевой журнал"
L["/abyssui |cffffcc00gm|r ~custumer support"] = "/abyssui |cffffcc00gm|r ~поддержка потребителей"
L["/abyssui |cffffcc00rc|r ~ready check"] = "/abyssui |cffffcc00rc|r ~Подтвердить 'Готов'"
L["/abyssui |cffffcc00cr|r ~check role poll"] = "/abyssui |cffffcc00cr|r ~подтвердить функцию"
L["/abyssui |cffffcc00unlock|r ~unlock some frames"] = "/abyssui |cffffcc00unlock|r ~разблокировать некоторые кадры"
L["/abyssui |cffffcc00lock|r ~lock unlocked frames"] = "/abyssui |cffffcc00lock|r ~блокировка разблокированных кадров"
L["|cfff2dc7fConsider reload the UI to make sure frames are locked|r '|cffffcc00/reload|r'"] = "|cfff2dc7fРассмотрите возможность перезагрузки интерфейса, чтобы убедиться, что кадры заблокированы|r '|cffffcc00/reload|r'"
L["|cff0d75d4Special Thanks|r"] = "|cff0d75d4Спасибо|r"
L["|cff0d75d4Translators|r"] 		= "|cff0d75d4Переводчиков|r"
L["Default"] = "По умолчанию"
L["Need Translator"] = "Нужен переводчик"
L["|cfff2dc7fFizzlemizz|r for helping me with programming questions."] = "|cfff2dc7fFizzlemizz|r за помощь мне в программировании вопросы."
L["|cfff2dc7fKawF|r for UnitFrame Improved, so I could create a really nice"..
" UnitFrame for AbyssUI."] = "|cfff2dc7fKawF|r улучшенным UnitFrame, где я был в состоянии черпать вдохновение"..
" и создать что-то очень хорошее для AbyssUI."
L["|cfff2dc7fEnglish (United States): |r"] = "|cfff2dc7fАнглийский (Соединенные Штаты Америки): |r"
L["|cfff2dc7fSpanish (Mexico): |r"] = "|cfff2dc7fИспанский (Мексика): |r"
L["|cfff2dc7fPortuguese: |r"] = "|cfff2dc7fпортугальский: |r"
L["|cfff2dc7fGerman: |r"] = "|cfff2dc7fнемецкий: |r"
L["|cfff2dc7fEnglish (Great Britain): |r"] = "|cfff2dc7fАнглийский (Великобритания): |r"
L["|cfff2dc7fSpanish (Spain): |r"] = "|cfff2dc7fИспанский (Испания): |r"
L["|cfff2dc7fFrench: |r"] = "|cfff2dc7fфранцузский: |r"
L["|cfff2dc7fItalian: |r"] = "|cfff2dc7fитальянский: |r"
L["|cfff2dc7fRussian: |r"] = "|cfff2dc7fрусский: |r"
L["|cfff2dc7fKorean: |r"] = "|cfff2dc7fкорейский: |r"
L["|cfff2dc7fChinese (Traditional): |r"] = "|cfff2dc7fКитайский (традиционный): |r"
L["|cfff2dc7fChinese (Simplified): |r"] = "|cfff2dc7fКитайский (упрощенный): |r"
L["Feel free to help translate AbyssUI to your own language, if you want to help, go to AbyssUI Github page, "..
"there's a folder named 'localization', find the language you know better and help to improve it. Thank you soo much for this."] = "Не стесняйтесь помочь перевести AbyssUI на ваш язык, если вы хотите помочь, перейдите на страницу AbyssUI на Github, "..
"поиск папки под названием 'localization', найти язык, который вы знаете лучше всего, и помочь улучшить его. Большое вам спасибо за это."
L["Chat Commands"] = "Команды чата"
L["Always Show Titles"] = "Всегда показывать заголовки"
L["Always show people titles on their names"] = "Всегда показывать названия людей в их именах"
L["Green Health Bars"] = "Зеленые полоски здоровья"
L["All unitframe health bars will be green (default)"] = "Все полоски здоровья корпуса юнита будут зелеными (по умолчанию)"
L["Not available in this version of WoW!"] = "Недоступно в этой версии WoW!"
L["In this tab of the addon settings, you will find options directed to the version of WoW Classic."..
" Many of them are exclusive and can only be used in Burning Crusade and similar client versions."] = "На этой вкладке настроек аддона вы найдете параметры, относящиеся к версии WoW Classic."..
" Многие из них являются эксклюзивными и могут использоваться только в Burning Crusade и подобных клиентских версиях."
L["|cffb62a25In development, more features will be added soon, so be patient.|r"] = "В разработке скоро будут добавлены новые функции, так что наберитесь терпения."
L["Hide Helm"] = "Скрыть шлем"
L["Hide the player helm"] = "Скрыть штурвал игрока"
L["Hide Cloak"] = "Плащ из шкуры"
L["Hide the player cloak"] = "Скрыть плащ игрока"
L["Better World Map"] = "Лучшая карта мира"
L["Makes the worldmap minimalist/clean"] = "Делает карту мира минималистичной / чистой"
L["World Map Fader"] = "Фейдер карты мира"
L["Makes the worldmap fade while you move"] = "Заставляет карту мира исчезать при движении"
L["Default Nameplate Range"] = "Диапазон паспортной таблички по умолчанию"
L["Disable the double range of"..
" nameplates to Blizzard default value"] = "Отключить двойной диапазон"..
" таблички со значением по умолчанию для Blizzard" 
L["Monthly Donators:\n"] = "Ежемесячные жертвователи:\n"
L["Top Donator:\n"] = "Лучший жертвователь:\n"
L["Patreon"] = "Patreon"
L["Thanks to everyone who helps maintain AbyssUI. You are the best!"] = "Спасибо всем, кто помогает поддерживать AbyssUI. Вы лучшие!"
L["You are the best of the best! Thank you very much s2"] = "Ты лучший из лучших! Большое спасибо s2"
L["Flat HealthBars"] = "Плоские HealthBars"
L["Make the health bar textures looks Flat"] = "Сделайте текстуры индикатора здоровья плоскими"
L["Show Minimap Clock"] = "Часы на миникарте"
L["This will always show the minimap clock, instead of showing on hover"] = "Это всегда будет показывать часы на миникарте, а не при наведении курсора"
L["Buy me a coffee: |cffffcc00patreon.com/yugensan|r"] = "Купи мне кофе: |cffffcc00patreon.com/yugensan|r"
L["|cfff2dc7fBuy me a coffee!|r"] = "|cfff2dc7fКупи мне кофе!|r"
L["Class Color"] = "Цвет класса"
L["Change icon border to a class colored theme"] = "Измените границу значка на цветную тему класса"
L["You need to select just one of those options so they don't overlap"] = "Вам нужно выбрать только один из этих вариантов, чтобы они не пересекались"
L["Crisp"] = "Хрустящий"
L["Change icon border to a crisp theme"] = "Измените границу значка на четкую тему"
L["Original"] = "Оригинал"
L["Change icon border to a original theme"] = "Изменить рамку значка на исходную тему"
L["Square"] = "Квадратный"
L["Change icon border to a square theme"] = "Измените границу значка на квадратную тему"
L["Thin"] = "Тонкий"
L["Change icon border to a thin theme"] = "Измените границу значка на тонкую тему"
L["Glass"] = "Стекло"
L["Change the icon to a glass theme"] = "Измените значок на стеклянную тему"
L["Default QuestFrame"] = "QuestFrame по умолчанию"
L["Disable QuestFrame border and text colorization to default from Blizzard"] = "Отключить границу QuestFrame и раскраску текста по умолчанию от Blizzard"
L["|cfff2dc7fLortUI|r for better icon borders and shadows."] = "|cfff2dc7fLortUI|r для улучшения границ и теней значков."
L["|cff0d75d4Frequently Answered Questions|r"] = "|cff0d75d4Часто ответы на вопросы|r"
L["Always check the FAQ before posting. Bug reports have more visibility on our discord channel."] = "Всегда проверяйте FAQ перед публикацией. Сообщения об ошибках более заметны на нашем канале Discord."
L["- How to change fonts or go back to Bliizard default?\n"..
"A: Go to AbyssUI folder -> textures -> font and change the fonts keeping their names (you need to restart the game)."] = "- Как изменить шрифты или вернуться к настройкам Blizzard по умолчанию?\n"..
"О: Перейдите в папку AbyssUI -> текстуры -> шрифт и измените шрифты, сохранив их имена (вам нужно перезапустить игру)."
L["- Do you plan to add save profiles to the UI?\n"..
"A: No, at least it's not on my plans right now. At this point, the interface have so many options and I have short time to work on it, so it's not planned."] = "- Планируете ли вы добавить профили сохранения в пользовательский интерфейс?\n"..
"О: Нет, по крайней мере, сейчас это не входит в мои планы. На данный момент у интерфейса так много опций, и у меня мало времени, чтобы поработать над ним, поэтому это не планируется."
L["- Some texture are looking/acting weird or Texture/Image is not right or cropped?\n"..
"A: You are probably using a old version of AbyssUI, try a fresh installation, delete the old version and re-download it."] = "- Некоторые текстуры выглядят/действуют странно или Текстура/изображение неправильное или обрезано?\n" ..
"О: Вы, вероятно, используете старую версию AbyssUI, попробуйте новую установку, удалите старую версию и повторно загрузите ее."
L["- How to make interface looks like in the video?\n"..
"A: The white buttons was another project that was discontinued due to the lack of time and the amount of work that was needed to make it work under different conditions. It may still work, but no support or upcoming updates are planned."] = "- Как сделать так, чтобы интерфейс выглядел как на видео?\n"..
"О: Белые кнопки - это еще один проект, который был прекращен из-за нехватки времени и объема работы, необходимой для того, чтобы заставить его работать в других условиях. Он все еще может работать, но никакой поддержки или предстоящих обновлений не планируется."
L["Show Helm"] = "Показать Шлем"
L["Always show helm"] = "Всегда показывать штурвал"
L["Show Cloak"] = "Показать плащ"
L["Always show cloak"] = "Всегда показывать плащ"
L["|cfff2dc7fMy Patreon, it's related to all my projects, so keep this in mind. You will be helping a lot of projects at once! Confirm to get the link|r"] = "|cfff2dc7fмой Patreon, он связан со всеми моими проектами, так что имейте это в виду. Вы будете помогать многим проектам одновременно! Подтвердите получение ссылки|r" 
L["|cfff2dc7fDonations will appear in the 'Donators' tab as a rank. Thank you very much, confirm to get the link|r"] = "|cfff2dc7fПожертвования будут отображаться на вкладке 'Доноры'в качестве рейтинга. Большое спасибо, подтвердите получение ссылки|r"
L["Dragonflight UnitFrame"] = true
L["Reverse HealthBar Fill"] = "Обратное заполнение полосы здоровья"
L["All unitframe health bars will fill in reverse"] = "Все полосы здоровья юнитфреймов будут заполняться в обратном порядке"
L["Hide MainActionBar"] = "Скрыть основную панель действий"
L["Hides the MainActionBar"] = "Скрывает основную панель действий"
L["|cfff2dc7fEnjoying AbyssUI? |rRecommend to a friend!"] = "|cfff2dc7fВам нравится AbyssUI? |rРекомендовать другу!"