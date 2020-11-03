local L = LibStub("AceLocale-3.0"):NewLocale("AbyssUI", "ptBR")

-- Chat commands
L["abyssui"] = true
L["ab"] = true

L["Welcome Home!"] = "Bem Vindo" 

L["Message"] = "Mensagem"
L["The message to be displayed when you get home."] = "A mensagem que será mostrada quando entra."
L["<Your message>"] = "Sua mensagem"

L["Show in Chat"] = "Mostrar no chat"
L["Toggles the display of the message in the chat window."] = "Mostra na janela de chat a mensagem"

L["Show on Screen"] = "Mostrar na tela"
L["Toggles the display of the message on the screen."] = "Mostra na tela a mensagem"

-- Config
L["Info Panel"] 				= "Informações"
L["Hide Elements"] 			= "Esconder Elementos"
L["Miscellaneous"] 			= "Diversos"
L["Themes"] 						= "Temas"
L["Tweaks & Extra"] 		= "Ajustes e extras"
L["Scale & Frame Size"] = "Escala e Tamanhos"
-- 
L["Thank you for using Abyss|cff0d75d4UI|r.\nIf you enjoy this addon,"..
" consider sharing with your friends\n or even making a donation."..
" It helps a lot!\nThis is a minimalist UI that makes changes directly to the WoW frames,\n"..
"using nearly the same amount of CPU/RAM as the Blizzard default UI.\n\n"..
"Options that have a different text color are based on your choice in the setup."..
"\nThose options are set by default if you choose recommended settings.\n"..
"Check the options by clicking in the (+) button on the left."] = "Obrigado por usar Abyss|cff0d75d4UI|r.\n Se você gostou desse addon,"..
" considere compartilhar com seus amigos\n ou até mesmo fazer uma doação."..
" Isso ajuda muito!\nEste é uma interface minimalista que faz mudanças diretamente nos frames do wow,\n"..
"usando pouco uso de CPU/RAM quanto o padrão da interface da Blizzard.\n\n"..
"Opções com cores diferentes são baseadas na suas escolhas no setup."..
"\nEssas opções são setadas por padrão se você escolheu as opções recomendads.\n"..
"Confira as opções clicando no botão (+) na esquerda."
--
L["|cff0d75d4Special Thanks|r"] = "|cff0d75d4Agradecimentos|r"
L["|cfff2dc7fFizzlemizz|r for helping me with programming questions."] = "|cfff2dc7fFizzlemizz|r por me ajudar na com dúvidas de programação."
L["|cfff2dc7fKawF|r for UnitFrame Improved, so I could create a really nice"..
" UnitFrame for AbyssUI."] = "|cfff2dc7fKawF|r pela UnitFrame melhorada, onde eu pude me inspirar"..
" e criar algo muito bom para a AbyssUI."
-- Config Options
L["- General"] 					= "- Geral"
L["- Frames"]						= "- Frames"
L["Player Portrait"]		= "Retrato do Jogador"
L["- Portrait Art"]			= "- Arte do Retrato"
L["Frame Colorization"] = "Colorização de Frame"
L["- Preset Colors"]		= "- Cores Preset"
L["- Choose a Color"]		= "- Escolha uma Cor"
L["- UnitFrame Art"]		= "- Arte da UnitFrame"
L["Setup"]							= "Configuração"
L["Clear Bars"]					= "Limpar Barras"
L["DailyInfo"]					= "Info Diária"
L["Reload UI"]					= "Recarregar IU"
L["Donate"]							= "Doações"
-- Config Info Panel
L["In this page you can find links to some other AddOns/Packs that make AbyssUI even better.\n" ..
"These addons are verify to especially work with AbyssUI without any conflict or problem.\n"..
"Click on the image so you can get the respective link. Don't forget to check then out!"] = "Nessa página você pode encontrar links para outros Addons/Pacotes que fazem AbyssUI ainda melhor.\n"..
"Esses addons são verificados para funcionar com a AbyssUI sem conflitos ou erros.\n"..
"Clique na imagem para obter o link do mesmo. Não esqueça de dar uma olhada!"
-- Config Hide Elements
L["The symbol (*) in some options means that there is important information/instructions \nto be read. "..
"Options with a different color are recommended settings\n(based on your choice in the setup)."] = "O símbolo (*) em algumas opções significa que tem informação importante\npara ser lida. "..
"Opções com uma cor diferente são configurações recomendadas\n(com base na sua escolha no setup)."
L["Hide MicroMenu"] = "Esconder o MicroMenu"
L["Hide the ActionBar MicroMenu (Bags Bar)"] = "Esconde o MicroMenu (Barra de bolsas)"
L["Hide Gryphons"] = "Esconder Grifos"
L["Hide the ActionBar Gryphons"] = "Esconde a art dos grifos da barra de habilidades"
L["Hide Minimap"] = "Esconder Minimapa"
L["Hide the Game Minimap"] = "Esconde o minimapa do jogo"
L["Hide Objective Tracker"] = "Esconder Barra de Missões"
L["Hide the Objective Tracker (Quest Frame)"] = "Esconde as barras de missões (objetivos)"
L["Hide FPS/MS Frame"] = "Esconder Frame QPS/MS"
L["Hide the fps/ms frame (bottomleft)"] = "Esconde o frame de fps/ms (esquerda inferior)"
L["Hide YouDied/LevelUp Frame"] = "Esconder Frame Morreu/LevelUp"
L["Hide the 'You Died' and 'Level Up' frame when you"..
" die/level in the game"] = "Esconde o frame 'Morreu' e 'LevelUp' quando"..
" você morre/upa no jogo"
L["Hide Macro Labels"] = "Esconder Etiquetas Macro"
L["Hide Macro Labels from Action Bar"] = "Esconde a etiqueta das macros na barra de ações"
L["Hide Hotkeys Labels"] = "Esconder Etiquetas Teclas"
L["Hide Hotkeys Labels from Action Bar"] = "Esconde as etiquetas das teclas na barra de ações"
L["Hide Stance Bar"] = "Esconder Barra de Instâncias"
L["Hide the Stance Bar (Druid forms, Rogue stealth, etc)"] = "Esconde a barra de instâncias (formas do druida, furtivo do ladino, etc)"
L["Hide Chat Buttons"] = "Esconder Botões Chat" 
L["Hide the Chat buttons (voice, social, etc)"] = "Esconde os botões do chat (voz, social, etc)"
L["Hide AFK Frame"] = "Esconder Frame LDT"
L["Hide the AFKMode when you are AFK"] = "Esconde a tela no modo LDT(AFK)"
L["Hide Faction/PvP/Prestige icon"] = "Esconder ícone de Facção/JvJ/Prestígio"
L["Hide the player frame Faction/PvP/Prestige icon"] = "Esconde o ícone de Facção/JvJ/Prestígio do frame do jogador"
L["|cfff2dc7fHide UnitImproved Faction Icon|r"] = "|cfff2dc7fEsconder ícone de Facção UnitImproved|r"
L["Hide the Faction Icon (Ally/Horde) on players frames"] = "Esconde o ícone de Facção (Ally/Horda) dos frames de jogadores"
L["Hide CastBar Timer"] = "Esconder Temporizador CastBar"
L["Hide the timer below CastBar"] = "Esconde o temporizador da barra de cast"
L["|cfff2dc7fHide GroupFrame|r"] = "|cfff2dc7fEsconder Frame de Grupo|r"
L["Hide the GroupFrame on the player portrait"] = "Esconde o frame de grupo do frame de jogador"
L["Hide Covenant Frame"] = "Esconder Frame do Pacto"
L["Hide the Covenant/Garrison minimap icon"] = "Esconde o ícone do minimapa do pacto/guarnição"
L["Hide Minimap Zone Text"] = "Esconder Texto Minimapa"
L["Hide zone text above minimap"] = "Esconde o texto de local atual acima do minimapa"
-- Config Miscellaneous




-- Daily Info
L["|cfff2dc7f~ AbyssUI Daily Info ~|r"] = "|cfff2dc7f~ AbyssUI Info Diária ~|r"
L["Not available right now!"]						= "Não disponível agora!"