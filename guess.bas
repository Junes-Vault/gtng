'Form created with the help of Freeform 3 v03-27-03
'Generated on Apr 18, 2009 at 11:27:15


[setup.main2.Window]

    '-----Begin code for #main2

    nomainwin
    WindowWidth = 500
    WindowHeight = 255
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)

    BackgroundColor$ = "darkred"
    ForegroundColor$ = "palegray"

    '-----Begin GUI objects code
    statictext #main2.answerTextN, "Enter Answer", 100,  77,  85,  25
    TextboxColor$ = "darkred"
    textbox #main2.answerInputN, 190,  72, 145,  25
    statictext #main2.pressGuessN, "Press Guess", 190, 127, 290,  20
    statictext #main2.pointsN, "Total Score X", 350,   7, 135,  20
    statictext #main2.guessaNumN, "Guess a number between X and X", 135,  42, 350,  20
    statictext #main2.GuessLeftN, "X Guess(es) Left", 115, 147, 185,  20
    statictext #main2.levelNN, "Level X", 115, 165, 185,  20
    statictext #main2.Hint, "",   5, 182, 480,  20
    button #main2.GuessN, "Guess",[guessNew], UL, 336, 72, 55, 25

    '-----End GUI objects code

    '-----Begin menu code

    menu #main2, "File",_
                 "&New Game..." , [newGame],_
                 "&Load Game...", [ldGame],_
                 "&Save Game...", [svGame]

    menu #main2, "Control",_
                 "G&ive Up", [gvupNew],_
                 "&Guess"  , [guessNew],|,_
                 "Settings", [setup.settings.Window]

    menu #main2, "Help",_
                 "Launch &Help", [lnchHelp]


    '-----End menu code
    [main2open]
    open "Guess That Number" for window_nf as #main2
    print #main2, "font ms_sans_serif 10"
    print #main2, "trapclose [quit.main2]"
    [startNew]
    print #main2.pressGuessN, "Press Guess"
    startNumber = 100
    endNumber = 200
    revealNumber$ = ""
    guessLeft = 15
    levelNumber = 1
    scoreNumber = 0
    quitstatus$ = "did not"
    guessMe = int(rnd(startNumber)*endNumber) + 1
    if guessMe < startNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
    if guessMe > endNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
    minus1 = int(rnd(15)*19) + 1
    minus2 = int(rnd(13)*18) + 1
    ldqw = 0
    cdqw = 0
    hdqw = 0
    f3qw = 0
    f1qw = 0
    foqw = 0
    u1 = 2
    u2 = 2
    u3 = 2
    SIMUconfig = 0
    wchangeGuessParam$ = "no"
    wrestoreLastGuess$ = "no"
    wupdateLevel$ = "no"
    qsqw = 0
    aiqw = 0
    aic = 0
    justOnceh = 0
    justOncel = 0
    justOnces = 0
    hints = 5
    newwinopen = 1
    guiStEnd$  = "Guess a Number between " ;startNumber ;" and " ;endNumber
    guirevNum$ = " " ;revealNumber$
    guiGueLef$ = "" ;guessLeft ;" Guess(es) Left"
    guiLev$ = "Level " ;levelNumber
    guiPoints$ = "Total Score " ;scoreNumber
    print #main2.guessaNumN, guiStEnd$
    print #main2.Hint, guirevNum$
    print #main2.GuessLeftN, guiGueLef$
    print #main2.levelNN, guiLev$
    print #main2.pointsN, guiPoints$


[main2.inputLoop]   'wait here for input event
    gosub [retSettings]
    if enableAutoLoad = 1 then gosub [autoload]
    wait

[updateSettings]
    open "settings.gnxz" for output as #99
    gameSaveLoc$ = file$
    gameSaveDef = f1qw
    gameLoadLoc$ = fileopen$
    gameLoadDef = foqw
    statsHTMLLoc$ = file3$
    statsHTMLDef = f3qw
    statsTXTLoc$ = file4$
    statsTXTDef = f4qw
    print #99, gameSaveLoc$
    print #99, gameSaveDef
    print #99, gameLoadLoc$
    print #99, gameLoadDef
    print #99, statsHTMLLoc$
    print #99, statsHTMLDef
    print #99, statsTXTLoc$
    print #99, statsTXTDef
    print #99, disableCheats
    print #99, disableCart
    print #99, enableAutoSave
    print #99, enableAutoLoad
    print #99, enableAutoStatGame
    print #99, enableAutoStatTXT
    print #99, enableAutoStatHTML
    print #99, skipStatsWindow
    close #99
    return

[retSettings]
    open "settings.gnxz" for input as #99
    line input #99, gameSaveLoc$
    line input #99, gameSaveDef
    line input #99, gameLoadLoc$ 
    line input #99, gameLoadDef
    line input #99, statsHTMLLoc$ 
    line input #99, statsHTMLDef
    line input #99, statsTXTLoc$
    line input #99, statsTXTDef
    line input #99, disableCheats
    line input #99, disableCart
    line input #99, enableAutoSave
    line input #99, enableAutoLoad
    line input #99, enableAutoStatGame
    line input #99, enableAutoStatTXT
    line input #99, enableAutoStatHTML
    line input #99, skipStatsWindow
    close #99
    file$ = gameSaveLoc$
    f1qw = gameSaveDef
    fileopen$ = gameLoadLoc$
    foqw = gameLoadDef
    file3$ = statsHTMLLoc$
    f3qw = statsHTMLDef
    file4$ = statsTXTLoc$
    f4qw = statsTXTDef
    if gameSaveDef = 1 then gosub [gamesvdef]
    if gameLoadDef = 1 then gosub [gamelddef]
    if gameHTMLDef = 1 then gosub [gamehtdef]
    if statsTXTDef  = 1 then gosub [gametxdef]
    return
    [gamesvdef]
    f1qwv$ = gameSaveLoc$
    return
    [gamelddef]
    foqwv$ = gameLoadLoc$
    return
    [gamehtdef]
    f3qwv$ = statsHTMLLoc$
    return
    [gametxdef]
    f3qwv$ = statsTXTLoc$
    return

    [encode]
    guiStEnd$  = "Guess a Number between " ;startNumber ;" and " ;endNumber
    guirevNum$ = "Hint: " ;revealNumber$
    guiGueLef$ = "" ;guessLeft ;" Guess(es) Left"
    guiLev$ = "Level " ;levelNumber
    guiPoints$ = "Total Score " ;scoreNumber
    print #main2.guessaNumN, guiStEnd$
    print #main2.Hint, guirevNum$
    print #main2.GuessLeftN, guiGueLef$
    print #main2.levelNN, guiLev$
    print #main2.pointsN, guiPoints$
    return



[newGame]   'Perform action for menu File, item New Game...

    goto [startNew]

    wait


[ldGame]   'Perform action for menu File, item Load Game...

    goto [loadgame]

    wait


[svGame]   'Perform action for menu File, item Save Game...

    goto [savegame]

    wait

'Form created with the help of Freeform 3 v03-27-03
'Generated on Apr 19, 2009 at 11:28:01


[setup.settings.Window]

    '-----Begin code for #settings

    nomainwin
    WindowWidth = 620
    WindowHeight = 445
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)

    BackgroundColor$ = "palegray"
    ForegroundColor$ = "black"

    '-----Begin GUI objects code

    groupbox #settings.groupbox29, "Stats Options", 220, 237, 190, 165
    groupbox #settings.groupbox21, "Extras Options",  15, 237, 190,  70
    groupbox #settings.groupbox2, "Saving Your Stats",  15,  12, 590,  95
    groupbox #settings.groupbox11, "Saving Your Game",  15, 122, 590, 100
    groupbox #settings.groupbox30, "Game Save Options",  15, 317, 190,  85
    statictext #settings.statictext1, "Last Web Page Save Path",  25,  37, 158,  20
    statictext #settings.statictext3, "Last Text Save Path",  25,  67, 158,  20
    TextboxColor$ = "palegray"
    textbox #settings.HTMLsavePath, 205,  32, 200,  25
    textbox #settings.txtSvePth, 205,  62, 200,  25
    button #settings.htmlpathbr,"Browse...",[htmlpthbr], UL, 415,  32,  65,  20
    button #settings.brtxtsveptha,"Browse...",[brtxtsvepth], UL, 415,  62,  65,  20
    checkbox #settings.htmlpthdefa, "Make Default", [htmlpthdefSet], [htmlpthdefReset], 485,  32, 104,  25
    checkbox #settings.textsvepthdefa, "Make Default", [textsvepthdefSet], [textsvepthdefReset], 485,  62, 104,  25
    statictext #settings.statictext11, "Last Game Save Path",  30, 152, 158,  20
    textbox #settings.gmesvpath, 200, 147, 200,  25
    button #settings.brogmesavpath,"Browse...",[brgmesavpath], UL, 415, 147,  65,  20
    checkbox #settings.gmsvpthdef, "Make Default", [gmsvpthdefSet], [gmsvpthdefReset], 485, 147, 104,  25
    statictext #settings.statictext15, "Last Game Load Path",  30, 182, 158,  20
    textbox #settings.gmeloadpth, 200, 177, 200,  25
    button #settings.brogmeload,"Browse...",[brgmeload], UL, 415, 177,  65,  20
    checkbox #settings.gmldepthdef, "Make Default", [gmldepthdefSet], [gmldepthdefReset], 485, 177, 104,  25
    checkbox #settings.dascheats, "Disable Cheats", [dascheatsSet], [dascheatsReset],  30, 257, 117,  25
    checkbox #settings.discart, "Disable Game Cartridge", [discartSet], [discartReset],  30, 282, 170,  25
    checkbox #settings.autosave, "Enable Auto Save", [autosaveSet], [autosaveReset],  25, 337, 133,  25
    checkbox #settings.autoload, "Auto Load Last Save", [autoloadSet], [autoloadReset],  25, 367, 149,  25
    button #settings.savesett,"Save",[saveset], UL, 520, 382,  80,  25
    checkbox #settings.webautosave, "Auto Save Stats - Web", [webautosaveSet], [webautosaveReset], 230, 307, 159,  25
    checkbox #settings.txtautosave, "Auto Save Stats - Text", [txtautosaveSet], [txtautosaveReset], 230, 282, 156,  25
    checkbox #settings.gmeautosave, "Auto Save Stats - Game", [gmeautosaveSet], [gmeautosaveReset], 230, 257, 167,  25
    checkbox #settings.skipstatswin, "Skip Stats Window", [skipstatswinSet], [skipstatswinReset], 230, 332, 136,  25
    button #settings.cancell,"Cancel",[cancel], UL, 435, 382,  80,  25

    '-----End GUI objects code

    open "Settings" for dialog_nf_modal as #settings
    print #settings, "font ms_sans_serif 10"
    print #settings, "trapclose [quit.settings]"


[settings.inputLoop]   'wait here for input event
gosub [retSettings]
print #settings.HTMLsavePath, statsHTMLLoc$
print #settings.txtSvePth, statsTXTLoc$
print #settings.gmeloadpth, gameLoadLoc$
print #settings.gmesvpath, gameSaveLoc$
if statsTXTDef = 1 then print #settings.textsvepthdefa, "set" else print #settings.textsvepthdefa, "reset"
if gameSaveDef = 1 then print #settings.gmsvpthdef, "set" else print #settings.gmsvpthdef, "reset"
if gameLoadDef = 1 then print #settings.gmldepthdef, "set" else print #settings.gmldepthdef, "reset"
if disableCart = 1 then print #settings.discart, "set" else print #settings.discart, "reset"
if disableCheats = 1 then print #settings.dascheats, "set" else print #settings.dascheats, "reset"
if enableAutoSave = 1 then print #settings.autosave, "set" else print #settings.autosave, "reset"
if enableAutoLoad = 1 then print #settings.autoload, "set" else print #settings.autoload, "reset"
if enableAutoStatHTML = 1 then print #settings.webautosave, "set" else print #settings.webautosave, "reset"
if enableAutoStatTXT = 1 then print #settings.gmeautosave, "set" else print #settings.gmeautosave, "reset"
if enableAutoStatGame = 1 then print #settings.gmldepthdef, "set" else print #settings.gmldepthdef, "reset"
if skipStatsWindow = 1 then print #settings.skipstatswin, "set" else print #settings.skipstatswin, "reset"
if statsHTMLDef = 1 then print #settings.htmlpthdefa, "set" else print #settings.htmlpthdefa, "reset"
if enableAutoStatTXT = 1 then print #settings.txtautosave, "set" else print #settings.txtautosave, "reset"
    wait


[checkbox27Set]   'Perform action for the groupbox named 'groupbox30'


    'Insert your own code here

    wait



[checkbox27Reset]   'Perform action for the groupbox named 'groupbox30'

    'Insert your own code here

    wait



[checkbox9Set]   'Perform action for the textbox named 'HTMLsavePath'


    'Insert your own code here

    wait



[checkbox9Reset]   'Perform action for the textbox named 'HTMLsavePath'

    'Insert your own code here

    wait



[htmlpthbr]   'Perform action for the button named 'htmlpathbr'

    filedialog "Save", "*.html", cusHTMLpth$
    if cusHTMLpth$ = "" then wait
    if right$(cusHTMLpth$, 5) = ".html" then goto [99as]
    cusHTMLpth$ = cusHTMLpth$ ;".html"
    [99as]
    print #settings.HTMLsavePath, cusHTMLpth$
    statsHTMLLoc$ = cusHTMLpth$
    wait


[brtxtsvepth]   'Perform action for the button named 'brtxtsveptha'

    filedialog "Save", "*.txt", cusTXTpth$
    if cusTXTpth$ = "" then wait
    if right$(cusTXTpth$, 4) = ".txt" then goto [99avc]
    cusTXTpth$ = cusTXTpth$ ;".txt"
    [99avc]
    print #settings.txtSvePth, cusTXTpth$
    cusTXTpth$ = statsTXTLoc$
    wait

[htmlpthdefSet]   'Perform action for the checkbox named 'htmlpthdefa'

    statsHTMLDef = 1


    wait



[htmlpthdefReset]   'Perform action for the checkbox named 'htmlpthdefa'

    statsHTMLDef = 0

    wait

[textsvepthdefSet]   'Perform action for the checkbox named 'textsvepthdefa'


    statsTXTDef = 1

    wait



[textsvepthdefReset]   'Perform action for the checkbox named 'textsvepthdefa'

    statsTXTDef = 0

    wait



[brgmesavpath]   'Perform action for the button named 'brogmesavpath'

    filedialog "Save", "*.gtng", cusgmsvpth$
    if cusgmsvpth$ = "" then wait
    if right$(cusgmsvpth$, 5) = ".gtng" then goto [99avcd]
    cusgmsvpth$ = cusgmsvpth$ ;".gtng"
    [99avcd]
    print #settings.gmesvpath, cusgmsvpth$
    cusgmsvpth$ = gameSaveLoc$
    wait

[gmsvpthdefSet]   'Perform action for the checkbox named 'gmsvpthdef'


    gameSaveDef = 1

    wait



[gmsvpthdefReset]   'Perform action for the checkbox named 'gmsvpthdef'

    gameSaveDef = 0

    wait



[brgmeload]   'Perform action for the button named 'brogmeload'

    filedialog "Save", "*.gtng", cusgmldpth$
    if cusgmldpth$ = "" then wait
    if right$(cusgmldpth$, 5) = ".gtng" then goto [99avcf]
    cusgmldpth$ = cusgmldpth$ ;".gtng"
    [99avcf]
    print #settings.gmeloadpth, cusgmldpth$
    cusgmldpth$ = gameLoadLoc$
    wait

[gmldepthdefSet]   'Perform action for the checkbox named 'gmldepthdef'


    gameLoadDef = 1

    wait



[gmldepthdefReset]   'Perform action for the checkbox named 'gmldepthdef'

    gameLoadDef = 0

    wait

[dascheatsSet]   'Perform action for the checkbox named 'dascheats'


    disableCheats = 1

    wait



[dascheatsReset]   'Perform action for the checkbox named 'dascheats'

    disableCheats = 0

    wait

[discartSet]   'Perform action for the checkbox named 'discart'


    disableCart = 1

    wait



[discartReset]   'Perform action for the checkbox named 'discart'

    disableCart = 0

    wait

[autosaveSet]   'Perform action for the checkbox named 'autosave'


    enableAutoSave = 1

    wait



[autosaveReset]   'Perform action for the checkbox named 'autosave'

    enableAutoSave = 0

    wait

[autoloadSet]   'Perform action for the checkbox named 'autoload'


    enableAutoLoad = 1

    wait



[autoloadReset]   'Perform action for the checkbox named 'autoload'

    enableAutoLoad = 0

    wait


[saveset]   'Perform action for the button named 'savesett'

    print #settings.HTMLsavePath, "!contents? statsHTMLLoc$"
    print #settings.txtSvePth, "!contents? statsTXTLoc$"
    print #settings.gmeloadpth, "!contents? gameLoadLoc$"
    print #settings.gmesvpath, "!contents? gameSaveLoc$"
    gosub [updateSettings]
    gosub [retSettings]
    goto [quit.settings]

    wait

[webautosaveSet]   'Perform action for the checkbox named 'webautosave'


    enableAutoStatHTML = 1

    wait



[webautosaveReset]   'Perform action for the checkbox named 'webautosave'

    enableAutoStatHTML = 0

    wait

[txtautosaveSet]   'Perform action for the checkbox named 'txtautosave'


    enableAutoStatTXT = 1

    wait



[txtautosaveReset]   'Perform action for the checkbox named 'txtautosave'

    enableAutoStatTXT = 0

    wait

[gmeautosaveSet]   'Perform action for the checkbox named 'gmeautosave'


    enableAutoStatGame = 1

    wait



[gmeautosaveReset]   'Perform action for the checkbox named 'gmeautosave'

    enableAutoStatGame = 0

    wait

[skipstatswinSet]   'Perform action for the checkbox named 'skipstatswin'


    skipStatsWindow = 1

    wait



[skipstatswinReset]   'Perform action for the checkbox named 'skipstatswin'

    skipStatsWindow = 0

    wait


[cancel]   'Perform action for the button named 'cancell'

    gosub [retSettings]

[quit.settings] 'End the program
    close #settings
    wait

[gvupNew]   'Perform action for menu Control, item Give Up

    goto [button15Click]

    wait


[guessNew]   'Perform action for menu Control, item Guess

    goto [button11Click]

    wait

[lnchHelp]   'Perform action for menu Help, item Launch Help

'Form created with the help of Freeform 3 v03-27-03
'Generated on Apr 18, 2009 at 22:56:03


[setup.helpNew.Window]

    '-----Begin code for #helpNew

    nomainwin
    WindowWidth = 580
    WindowHeight = 330
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)

    BackgroundColor$ = "darkred"
    ForegroundColor$ = "palegray"

    '-----Begin GUI objects code

    statictext #helpNew.statictext2, "Guess That Number Version 2", 190,  12, 179,  20
    statictext #helpNew.statictext3, "Guess That Number does come with a manual found on your desktop or start menu",  50,  27, 488,  20
    statictext #helpNew.statictext4, "File > New Game",  15,  67, 102,  20
    statictext #helpNew.statictext5, "Load A New Game", 170,  67, 125,  20
    statictext #helpNew.statictext6, "File > Open Game",  15,  87, 115,  20
    statictext #helpNew.statictext7, "Open A Game", 170,  87, 113,  20
    statictext #helpNew.statictext8, "File > Save Game",  15, 107, 115,  20
    statictext #helpNew.statictext9, "Save A Game", 170, 107, 113,  20
    statictext #helpNew.statictext12, "Control > Giveup",  15, 162, 115,  20
    statictext #helpNew.statictext13, "Quit Current Game", 170, 162, 120,  20
    statictext #helpNew.statictext14, "Help > Launch Help",  15, 192, 125,  20
    statictext #helpNew.statictext15, "Launch this Window", 170, 192, 130,  20
    statictext #helpNew.statictext16, "Each Level Fewer Guesses and greater number range",  15, 232, 335,  20
    statictext #helpNew.statictext17, "Once Guesses are gone Game Over",  15, 252, 218,  20
    statictext #helpNew.statictext18, "Score will likely be in negative",  15, 272, 178,  20
    statictext #helpNew.statictext19, "", 370,  67,  38,  20
    statictext #helpNew.statictext20, "Name:",  15,  47,  40,  20
    statictext #helpNew.statictext21, "Description:", 170,  47,  85,  20
    statictext #helpNew.statictext22, "", 365,  47,  85,  20
    statictext #helpNew.statictext22, "", 370,  87,  38,  20
    statictext #helpNew.statictext23, "", 370, 107,  38,  20
    statictext #helpNew.statictext24, "", 370, 142,  38,  20
    statictext #helpNew.statictext25, "", 370, 162,  38,  20
    statictext #helpNew.statictext26, "", 370, 192,  38,  20

    '-----End GUI objects code

    open "Help V2" for dialog_nf_modal as #helpNew
    print #helpNew, "font ms_sans_serif 10"
    print #helpNew, "trapclose [quit.helpNew]"


[helpNew.inputLoop]   'wait here for input event
    wait


[quit.helpNew] 'End the program
    close #helpNew

    wait

    [classmode]
    newwinopen = 0
    close #main2
    goto [setup.main.Window]
    wait

[quit.main2] 'End the program
    close #main2
    end

[setup.main.Window]

    '-----Begin code for #main

    nomainwin
    WindowWidth = 500
    WindowHeight = 255
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)


    '-----Begin GUI objects code

    statictext #main.guesstn, "Guess a number between",   0,  37, 152,  20
    statictext #main.startNumber, "X", 165,  37,  60,  20
    statictext #main.standen, "and", 230,  37,  23,  20
    statictext #main.endNumber, "X", 270,  37,  60,  20
    statictext #main.answerText, "Enter Answer", 100,  77,  80,  25
    TextboxColor$ = "white"
    textbox #main.answerInput, 190,  72, 100,  25
    button #main.guess,"Guess",[button11Click], UL, 310,  72,  85,  25
    statictext #main.pressGuess, "Press Guess", 195, 137,  300,  20
    statictext #main.guessLeftText, "Guess(es) Left", 135, 157,  90,  20
    statictext #main.levelText, "Level", 115, 177,  43,  20
    button #main.giveUp,"Give Up",[button15Click], UL, 395,  72,  85,  25
    statictext #main.answerRevelText, "", 200, 202,  44,  20
    statictext #main.answerRevealNumber, "", 265, 202,   50,  20
    statictext #main.guessLeftNumber, "0", 115, 157,   20,  20
    statictext #main.levelNumber, "0", 155, 177,   20,  20
    statictext #main.statictext20, "Points", 355,   2,  70,  20
    statictext #main.scoreNum, "0", 440,   2,   35,  20
    button #main.SaveGame,"Save Game",[savegame], UL, 395,  102,  85,  25
    button #main.LoadGame,"Load Game",[loadgame], UL, 310,  102,  85,  25
    button #main.Helpingame,"Help",[popuphelp], UL, 395,  47,  85,  25

    '-----End GUI objects code
[start]
    open "Guess That Number" for window_nf as #main
    print #main, "font ms_sans_serif 10"
    print #main, "trapclose [quit.main]"
    startNumber = 100
    endNumber = 200
    revealNumber$ = ""
    guessLeft = 15
    levelNumber = 1
    scoreNumber = 0
    quitstatus$ = "did not"
    guessMe = int(rnd(startNumber)*endNumber) + 1
    if guessMe < startNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
    if guessMe > endNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
    minus1 = int(rnd(15)*19) + 1
    minus2 = int(rnd(13)*18) + 1
    ldqw = 0
    cdqw = 0
    hdqw = 0
    f3qw = 0
    f1qw = 0
    foqw = 0
    u1 = 2
    u2 = 2
    u3 = 2
    SIMUconfig = 0
    wchangeGuessParam$ = "no"
    wrestoreLastGuess$ = "no"
    wupdateLevel$ = "no"
    qsqw = 0
    aiqw = 0
    aic = 0
    justOnceh = 0
    justOncel = 0
    justOnces = 0
    print #main.startNumber, startNumber
    print #main.endNumber, endNumber
    print #main.answerRevealNumber, revealNumber$
    print #main.guessLeftNumber, guessLeft
    print #main.levelNumber, levelNumber
    print #main.scoreNum, scoreNumber


[main.inputLoop]   'wait here for input event
wait

    [newmode]
    newwinopen = 1
    close #main
    goto [main2open]
    wait

[button11Click]   'Perform action for the statictext named 'guesstn'
    if enableAutoSave = 1 then gosub [autosave]
    if SIMUconfig = 1 and disableCart = 0 then goto [SIMUconfigon] else SIMUconfig = 0
    [pleasecontinue]
    if aiqw = 1 then goto [aiqwg]
    if newwinopen = 1 then gosub [gettxt]
    if newwinopen = 1 then goto [nnhgfd1]
    [gettxt]
    print #main2.answerInputN, "!contents? answerInput$"
    return
    print #main.answerInput, "!contents? answerInput$"
    [nnhgfd1]
    goto [aiqwpass]
    [aiqwg]
    answerInput$ = aiqwv$
    [aiqwpass]
    if newwinopen = 1 then gosub [encode]
    if newwinopen = 1 then goto [nnhgfd2]
    print #main.guessLeftNumber, guessLeft
    [nnhgfd2]
    if guessLeft = 0 then goto [endofgame]
    if answerInput$ = "I am a cheater" and disableCheats = 0 then goto [cheatmenu]
    if answerInput$ = "Help" and disableCheats = 0 then goto [popuphelp]
    if answerInput$ = "help" and disableCheats = 0 then goto [popuphelp]
    if answerInput$ = "save" and disableCheats = 0 then goto [savegame]
    if answerInput$ = "load" and disableCheats = 0 then goto [loadgame]
    if answerInput$ = "config on" and disableCart = 0 then goto [SIMUconfigon]
    if answerInput$ = "config off" and disableCart = 0 then goto [SIMUconfigoff]
    if answerInput$ = "make me right" and disableCheats = 0 then aic = 1
    if answerInput$ = "make me normal" and disableCheats = 0 then aic = 0
    if answerInput$ = "switch mode" and disableCheats = 0 then goto [newmode]
    guessLeft = guessLeft -1
    if guessLeft = 0 then goto [endofgame]
    if aic = 1 then goto [guesscorrect]
    if val(answerInput$) < guessMe then goto [guesshigher]
    if val(answerInput$) > guessMe then goto [guesslower]
    if val(answerInput$) = guessMe then goto [guesscorrect]
    wait


[SIMUconfigon]
SIMUconfig = 1
answerInput$ = ""
if firstrun = 1 then goto [simuCONFIGf]
if firstrun = 2 then goto [scfinal]
if firstrun = 3 then goto [scfinal2]
filedialog "Save DATA Link","*.gtds", gtds$
if gtds$="" then goto [pleasecontinue]
filedialog "Open DATA Link","*.gtdo", gtdo$
if gtdo$="" then goto [pleasecontinue]
open gtds$ for output as #4
print #4, "1"
print #4, "1"
close #4
open gtdo$ for output as #5
print #5, ""
print #5, ""
close #5
firstrun = 1
[simuCONFIGf]
open gtdo$ for input as #5
line input #5, gcn$
line input #5, gcd$
close #5
gcne$ = gcn$
gcde$ = gcd$
if gcn$ = "" then gcntrue = 0 else gcntrue = 1
if gcd$ = "" then gcdtrue = 0 else gcdtrue = 1
if gcntrue = 1 then goto [scname]
goto [pleasecontinue]
[scname]
if gcdtrue = 1 then goto [scdesc]
confirm "An external program wants to load a cartridge and has not provided a description, Do you accept?" ;gamecart$
if gamecart$ = "yes" then goto [scfinal] else [scdeny]
[scdesc]
confirm "An external program wants to load a cartridge, Do you accept?" ;gamecart$
if gamecart$ = "yes" then goto [scfinal] else [scdeny]
[scdeny]
open gtds$ for output as #4
print #4, "0"
print #4, "0"
close #4
open gtdo$ for output as #5
print #5, ""
print #5, ""
close #5
SIMUconfig = 0
firstrun = 0
goto [pleasecontinue]
[scfinal]
firstrun = 2
gcnp$ = gcn$
gcdp$ = gcd$
gcn$ = gcne$
gcd$ = gcde$
open gtds$ for output as #4
print #4, "2"
print #4, "2"
print #4, startNumber
print #4, endNumber
print #4, revealNumber$
print #4, guessLeft
print #4, levelNumber
print #4, scoreNumber
print #4, quitstatus$
print #4, guessMe
print #4, minus1
print #4, minus2
print #4, ldqw
print #4, cdqw
print #4, hdqw
print #4, f3qw
print #4, f1qw
print #4, foqw
print #4, u1
print #4, u2
print #4, u3
print #4, wchangeGuessParam$
print #4, wrestoreLastGuess$
print #4, wupdateLevel$
print #4, qsqw
print #4, aiqw
print #4, aic
print #4, justOnceh
print #4, justOncel
print #4, justOnces
print #4, answerInput$
print #4, higherdiff
print #4, scoreNumber
print #4, lowerdiff
print #4, correctdiff
print #4, ldqwv
print #4, cdqwv
print #4, hdqwv
print #4, f3qwv$
print #4, f1qwv$
print #4, foqwv$
print #4, qsqwv$
close #4
open gtdo$ for output as #5
print #5, "0"
print #5, gcn$
print #5, gcd$
print #5, startNumber
print #5, endNumber
print #5, revealNumber$
print #5, guessLeft
print #5, levelNumber
print #5, scoreNumber
print #5, quitstatus$
print #5, guessMe
print #5, minus1
print #5, minus2
print #5, ldqw
print #5, cdqw
print #5, hdqw
print #5, f3qw
print #5, f1qw
print #5, foqw
print #5, u1
print #5, u2
print #5, u3
print #5, wchangeGuessParam$
print #5, wrestoreLastGuess$
print #5, wupdateLevel$
print #5, qsqw
print #5, aiqw
print #5, aic
print #5, justOnceh
print #5, justOncel
print #5, justOnces
print #5, answerInput$
print #5, higherdiff
print #5, scoreNumber
print #5, lowerdiff
print #5, correctdiff
print #5, ldqwv
print #5, cdqwv
print #5, hdqwv
print #5, f3qwv$
print #5, f1qwv$
print #5, foqwv$
print #5, qsqwv$
close #5
[scfinal2]
firstrun = 3
open gtdo$ for input as #5
line input #5, getpush
close #5
if getpush = 1 then goto [retrieve]
if getpush = 2 then goto [send]
if getpush = 3 then goto [SIMUconfigoff]
goto [pleasecontinue]
[retrieve]
getpush = 0
open gtds$ for output as #5
print #5, "0"
print #5, "2"
print #5, "2"
print #5, startNumber
print #5, endNumber
print #5, revealNumber$
print #5, guessLeft
print #5, levelNumber
print #5, scoreNumber
print #5, quitstatus$
print #5, guessMe
print #5, minus1
print #5, minus2
print #5, ldqw
print #5, cdqw
print #5, hdqw
print #5, f3qw
print #5, f1qw
print #5, foqw
print #5, u1
print #5, u2
print #5, u3
print #5, wchangeGuessParam$
print #5, wrestoreLastGuess$
print #5, wupdateLevel$
print #5, qsqw
print #5, aiqw
print #5, aic
print #5, justOnceh
print #5, justOncel
print #5, justOnces
print #5, answerInput$
print #5, higherdiff
print #5, scoreNumber
print #5, lowerdiff
print #5, correctdiff
print #5, ldqwv
print #5, cdqwv
print #5, hdqwv
print #5, f3qwv$
print #5, f1qwv$
print #5, foqwv$
print #5, qsqwv$
close #5
wait
[send]
open gtdo$ for input as #5
line input #5, getpush
line input #5, gcn$
line input #5, gcd$
line input #5, startNumber
line input #5, endNumber
line input #5, revealNumber$
line input #5, guessLeft
line input #5, levelNumber
line input #5, scoreNumber
line input #5, quitstatus$
line input #5, guessMe
line input #5, minus1
line input #5, minus2
line input #5, ldqw
line input #5, cdqw
line input #5, hdqw
line input #5, f3qw
line input #5, f1qw
line input #5, foqw
line input #5, u1
line input #5, u2
line input #5, u3
line input #5, wchangeGuessParam$
line input #5, wrestoreLastGuess$
line input #5, wupdateLevel$
line input #5, qsqw
line input #5, aiqw
line input #5, aic
line input #5, justOnceh
line input #5, justOncel
line input #5, justOnces
line input #5, answerInput$
line input #5, higherdiff
line input #5, scoreNumber
line input #5, lowerdiff
line input #5, correctdiff
line input #5, ldqwv
line input #5, cdqwv
line input #5, hdqwv
line input #5, f3qwv$
line input #5, f1qwv$
line input #5, foqwv$
line input #5, qsqwv$
close #5
    if newwinopen = 1 then gosub [encode]
    if newwinopen = 1 then goto [nnhgfd3]
    print #main.startNumber, startNumber
    print #main.endNumber, endNumber
    print #main.answerRevealNumber, revealNumber$
    print #main.guessLeftNumber, guessLeft
    print #main.levelNumber, levelNumber
    print #main.scoreNum, scoreNumber
    [nnhgfd3]
getpush = 0
if gcnp$ = gcn$ then goto [pleasecontinue] else confirm "Game Cartridge identification has suddenely changed, Do you still want to use it?" ;gamecartv$
if gamecartv$ = "yes" then goto [pleasecontinue] else [SIMUconfigoff]
if gcdp$ = gcd$ then goto [pleasecontinue] else confirm "Game Cartridge identification has suddenely changed, Do you still want to use it?" ;gamecartv$
if gamecartv$ = "yes" then goto [pleasecontinue] else [SIMUconfigoff]
goto [pleasecontinue]
[SIMUconfigoff]
SIMUconfig = 0
answerInput$ = ""
firstrun = 0
open gtds$ for output as #4
print #4, "0"
print #4, "0"
close #4
open gtdo$ for output as #5
print #5, ""
print #5, ""
close #5
goto [pleasecontinue]
[guesshigher]
higherdiff = val(answerInput$) - guessMe
if hdqw = 1 then higherdiff = hdqwv
scoreNumber = higherdiff + scoreNumber
    if newwinopen = 1 then gosub [hitxt]
    if newwinopen = 1 then goto [nnhgfd4]
    [hitxt]
    print #main2.pressGuessN, "Guess Higher"
    gosub [encode]
    return
print #main.scoreNum, scoreNumber
print #main.pressGuess, "Guess Higher"
[nnhgfd4]
wait

[guesslower]
lowerdiff = guessMe - val(answerInput$)
if ldqw = 1 then lowerdiff = ldqwv
scoreNumber = lowerdiff + scoreNumber
    if newwinopen = 1 then gosub [lotxt]
    if newwinopen = 1 then goto [nnhgfd5]
    [lotxt]
    print #main2.pressGuessN, "Guess Lower"
    gosub [encode]
    return
print #main.scoreNum, scoreNumber
print #main.pressGuess, "Guess Lower"
[nnhgfd5]
wait

[guesscorrect]
correctdiff = val(answerInput$) + guessMe
if cdqw = 1 then correctdiff = cdqwv
scoreNumber = correctdiff + scoreNumber
    if newwinopen = 1 then gosub [cotxt]
    if newwinopen = 1 then goto [nnhgfd6]
    [cotxt]
    print #main2.pressGuessN, "Correct Next Level"
    gosub [encode]
    return
print #main.scoreNum, scoreNumber
print #main.pressGuess, "Correct Next Level"
[nnhgfd6]
endNumber = endNumber + 300
levelNumber = levelNumber + 1
if levelNumber = 2 then guessLeft = guessLeft + 10
if levelNumber = 3 then guessLeft = guessLeft + 6
if levelNumber = 4 then guessLeft = guessLeft + 5
if levelNumber = 5 then guessLeft = guessLeft + 4
if levelNumber >= 6 then guessLeft = guessLeft + 3
[rnd48398]
guessMe = int(rnd(startNumber)*endNumber) + 1
[rnd48395]
if guessMe < startNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
if guessMe < startNumber then goto [rnd44395]
[rnd48387]
if guessMe > endNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
if guessMe > endNumber then goto [rnd44387]
[rnd48562]
    if newwinopen = 1 then gosub [encode]
    if newwinopen = 1 then goto [nnhgfd7]
print #main.levelNumber, levelNumber
print #main.endNumber, endNumber
print #main.guessLeftNumber, guessLeft
[nnhgfd7]
wait

[button15Click]   'Perform action for the statictext named 'pressGuess'
    if qsqw = 1 then goto [qsqwg]
    quitstatus$ = "did"
    goto [endofgame]
    [qsqwg]
    quitstatus$ = qsqwv$
    goto [endofgame]
'Form created with the help of Freeform 3 v03-27-03
'Generated on Apr 18, 2009 at 15:54:35


[setup.cheatNew.Window]

    '-----Begin code for #cheatNew

    nomainwin
    WindowWidth = 270
    WindowHeight = 170
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)

    BackgroundColor$ = "darkred"
    ForegroundColor$ = "palegray"

    '-----Begin GUI objects code

    statictext #cheatNew.statictext1, "Cheat Menu", 125,   7,  71,  20
    statictext #cheatNew.statictext2, "Set Guess Number",   5,  37, 113,  20
    statictext #cheatNew.statictext3, "Set Guess Left",  30,  62,  86,  20
    statictext #cheatNew.statictext4, "Set Score",  55,  87,  59,  20
    TextboxColor$ = "darkred"
    textbox #cheatNew.textbox5, 125,  32, 125,  25
    textbox #cheatNew.textbox6, 125,  57, 125,  25
    textbox #cheatNew.textbox7, 125,  82, 125,  25
    button #cheatNew.button8,"Close",[cheatclose], UL,  95, 112,  65,  25

    '-----End GUI objects code

    open "Cheat Menu" for window_nf as #cheatNew
    print #cheatNew, "font ms_sans_serif 10"
    print #cheatNew, "trapclose [quit.cheatNew]"
    print #cheatNew.textbox5, guessMe
    print #cheatNew.textbox6, guessLeft
    print #cheatNew.textbox7, scoreNumber

[cheatNew.inputLoop]   'wait here for input event
    wait



[cheatclose]   'Perform action for the button named 'button8'

    print #cheatNew.textbox5, "!contents? guessMe"
    print #cheatNew.textbox6, "!contents? guessLeft"
    print #cheatNew.textbox7, "!contents? scoreNumber"
    gosub [encode]
    close #cheatNew
    wait

[quit.cheatNew] 'End the program
    close #cheatNew
    wait

[cheatmenu]
if newwinopen = 1 then goto [setup.cheatNew.Window]
'Form created with the help of Freeform 3 v03-27-03
'Generated on Mar 10, 2009 at 17:51:07


[setup.cheat.Window]

    '-----Begin code for #cheat

    nomainwin
    WindowWidth = 330
    WindowHeight = 160
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)


    '-----Begin GUI objects code

    statictext #cheat.statictext1, "Cheat Master",  95,  -8,  79,  20
    statictext #cheat.statictext4, "Set guess number",   0,  37, 108,  20
    statictext #cheat.statictext5, "Set guesses left",   0,  57,  97,  20
    statictext #cheat.statictext6, "Set score",   0,  77,  59,  20
    TextboxColor$ = "white"
    textbox #cheat.cheatGuessNum, 125,  32, 170,  25
    textbox #cheat.cheatGuessLeft, 125,  52, 170,  25
    textbox #cheat.cheatScore, 125,  72, 170,  25
    button #cheat.button10,"Close",[button10Click], UL, 110, 102,  70,  25

    '-----End GUI objects code

    open "Cheat" for dialog_popup as #cheat
    print #cheat, "font ms_sans_serif 10"
    print #cheat, "trapclose [quit.cheat]"
    print #cheat.cheatGuessNum, guessMe
    print #cheat.cheatGuessLeft, guessLeft
    print #cheat.cheatScore, scoreNumber


[cheat.inputLoop]   'wait here for input event
    wait



[button15Click2]   'Perform action for the statictext named 'statictext5'

    'Insert your own code here

    wait


[button10Click]   'Perform action for the button named 'button10'

    'Insert your own code here
    print #cheat.cheatGuessNum, "!contents? guessMe"
    print #cheat.cheatGuessLeft, "!contents? guessLeft"
    print #cheat.cheatScore, "!contents? scoreNumber"
    if newwinopen = 1 then gosub [encode]
    if newwinopen = 1 then goto [nnhgfd8]
    print #main.guessLeftNumber, guessLeft
    print #main.scoreNum, scoreNumber
    [nnhgfd8]
    close #cheat
    wait

[quit.cheat] 'End the program
    close #cheat
    wait
'Form created with the help of Freeform 3 v03-27-03
'Generated on Apr 18, 2009 at 15:24:03


[setup.endgameN.Window]

    '-----Begin code for #endgameN

    nomainwin
    WindowWidth = 385
    WindowHeight = 145
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)

    BackgroundColor$ = "darkred"
    ForegroundColor$ = "palegray"

    '-----Begin GUI objects code

    statictext #endgameN.statictext1, "You scored X points",  10,  12, 260,  20
    statictext #endgameN.statictext2, "and up to Level X",  40,  27, 230,  20
    statictext #endgameN.statictext3, "You X Quit",  10,  47, 260,  20
    statictext #endgameN.statictext4, "Alway's try to get the highest score and level without quitting",   5,  77, 349,  20

    '-----End GUI objects code

    '-----Begin menu code

    menu #endgameN, "Save Options",_
                    "Web Page" , [webpg],_
                    "Text File", [txtFle],|,_
                    "Game Save", [gmSve]


    '-----End menu code

    open "End Of Game" for window_nf as #endgameN
    print #endgameN, "font ms_sans_serif 10"
    print #endgameN, "trapclose [quit.endgameN]"


[endgameN.inputLoop]   'wait here for input event
    gosub [distxt]
    convscoreNumber$ = "You Scored " ;scoreNumber ;" points"
    convlevelNumber$ = "and up to level " ;levelNumber
    convquitstatus$ = "You " ;quitstatus$ ;" Quit"
    print #endgameN.statictext1, convscoreNumber$
    print #endgameN.statictext2, convlevelNumber$
    print #endgameN.statictext3, convquitstatus$
    if enableAutoStatGame = 1 then gosub [autosave]
    if enableAutoStatTXT = 1 then gosub [autosavetxt]
    if enableAutoStatHTML = 1 then gosub [autosavehtml]
    if skipStatsWindow = 1 then goto [quit.endgameN]
    wait



[webpg]   'Perform action for menu Save Options, item Web Page

    goto [savetoHTML]

    wait


[txtFle]   'Perform action for menu Save Options, item Text File

    goto [savetxtN]

    wait


[gmSve]   'Perform action for menu Save Options, item Game Save

    goto [savegame]

    wait

[quit.endgameN] 'End the program
    close #endgameN
    gosub [entxt]
    gosub [endgmenewsub]
    wait

[endofgame]
if newwinopen = 1 then goto [setup.endgameN.Window]
'Form created with the help of Freeform 3 v03-27-03
'Generated on Mar 10, 2009 at 23:18:57


[setup.endofgamew.Window]

    '-----Begin code for #endofgamew

    nomainwin
    WindowWidth = 385
    WindowHeight = 130

    BackgroundColor$ = "black"
    ForegroundColor$ = "red"

    '-----Begin GUI objects code

    statictext #endofgamew.statictext1, "You scored",  20,  12,  69,  20
    statictext #endofgamew.statictext2, "pts", 170,  12,  18,  20
    statictext #endofgamew.statictext3, "0", 105,  12,  65,  20
    statictext #endofgamew.statictext4, "Got up to level",  20,  32,  85,  20
    statictext #endofgamew.statictext5, "0", 120,  32,  75,  20
    statictext #endofgamew.statictext6, "You",  20,  52,  24,  20
    statictext #endofgamew.statictext7, "X",  50,  52,  40,  20
    statictext #endofgamew.statictext8, "quit", 100,  52,  21,  20
    statictext #endofgamew.statictext9, "Alway's try to get the highest score and level without quitting",  20,  77, 349,  20
    button #endofgamew.saveHTML,"Save to Web Page",[savetoHTML], UL, 220,  12,  150,  20
    '-----End GUI objects code

    open "End of Game Stats" for window as #endofgamew
    print #endofgamew, "font ms_sans_serif 10"
    print #endofgamew, "trapclose [quit.endofgamew]"
    print #endofgamew.statictext3, scoreNumber
    print #endofgamew.statictext5, levelNumber
    print #endofgamew.statictext7, quitstatus$


[endofgamew.inputLoop]   'wait here for input event
    if newwinopen = 1 then gosub [distxt]
    if newwinopen = 1 then goto [nnhgfd10]
    [distxt]
    print #main2.answerInputN, "!disable"
    print #main2.answerInputN, "Close Stats Pg"
    return
#main.answerInput "!disable"
#main.guess "!disable"
#main.giveUp "!disable"
#main.SaveGame,"!disable"
#main.LoadGame,"!disable"
#main.Helpingame,"!disable"
print #main.answerInput, "Close Stats Pg"
[nnhgfd10]
wait

[savetoHTML]
if f3qw = 1 then goto [f3qwg]
filedialog "Save ",statsHTMLLoc$, file3$
if file3$="" then wait
if right$(file3$, 5) = ".html" then goto [proc9034u]
file3$ = file3$ ;".html"
[proc9034u]
goto [file3p]
[f3qwg]
if justOnceh = 1 then f3qw = 0
if justOnceh = 1 then justOnceh = 0
file3$ = statsHTMLLoc$
[file3p]
open file3$ for output as #2
print #2, "<HTML>"
print #2, "<title>Guess that number results</title>"
print #2, "<head><hr></head>"
print #2, "<body>"
print #2, "<h3>Guess that number game results</h3>"
print #2, "<br>"
print #2, "You scored a total of: <b>";
print #2, scoreNumber;
print #2, " Points</b>"
print #2, "<br>"
print #2, "You gained up to level: <b>";
print #2, levelNumber;
print #2, "</b>"
print #2, "<br>"
print #2, "";
print #2, "<b>You ";
print #2, quitstatus$;
print #2, " quit</b>"
print #2, "<h3>Alway's try to get the highest score and level without quitting</h3>"
print #2, "</body>"
print #2, "</html>"
close #2
gosub [updateSettings]
wait

[autosavehtml]
open "Auto Save\Stats\Auto Webpage Results.html" for output as #2
print #2, "<HTML>"
print #2, "<title>Guess that number results</title>"
print #2, "<head><hr></head>"
print #2, "<body>"
print #2, "<h3>Guess that number game results</h3>"
print #2, "<br>"
print #2, "You scored a total of: <b>";
print #2, scoreNumber;
print #2, " Points</b>"
print #2, "<br>"
print #2, "You gained up to level: <b>";
print #2, levelNumber;
print #2, "</b>"
print #2, "<br>"
print #2, "";
print #2, "<b>You ";
print #2, quitstatus$;
print #2, " quit</b>"
print #2, "<h3>Alway's try to get the highest score and level without quitting</h3>"
print #2, "</body>"
print #2, "</html>"
close #2
return

[savetxtN]
if f4qw = 1 then goto [f4qwg]
filedialog "Save ",statsTXTLoc$, file4$
if file4$="" then wait
if right$(file4$, 4) = ".txt" then goto [proc9834u]
file4$ = file4$ ;".txt"
[proc9834u]
goto [file49p]
[f4qwg]
file4$ = statsTXTLoc$
[file49p]
open file4$ for output as #2
print #2, "Guess that number game results"
print #2, ""
print #2, "You scored a total of: ";
print #2, scoreNumber;
print #2, " Points"
print #2, ""
print #2, "You gained up to level: ";
print #2, levelNumber;
print #2, ""
print #2, "You ";
print #2, quitstatus$;
print #2, " quit"
print #2, "Alway's try to get the highest score and level without quitting"
close #2
gosub [updateSettings]
wait

[autosavetxt]
open "Auto Save\Stats\Auto Text Results.html" for output as #2
print #2, "Guess that number game results"
print #2, ""
print #2, "You scored a total of: ";
print #2, scoreNumber;
print #2, " Points"
print #2, ""
print #2, "You gained up to level: ";
print #2, levelNumber;
print #2, ""
print #2, "You ";
print #2, quitstatus$;
print #2, " quit"
print #2, "Alway's try to get the highest score and level without quitting"
close #2
return

[quit.endofgamew] 'End the program
    if newwinopen = 1 then gosub [entxt]
    if newwinopen = 1 then goto [nnhgfd11]
    [entxt]
    print #main2.answerInputN, "!enable"
    print #main2.answerInputN, ""
    return
#main.answerInput "!enable"
#main.guess "!enable"
#main.giveUp "!enable"
#main.SaveGame,"!enable"
#main.LoadGame,"!enable"
#main.Helpingame,"!enable"
print #main.answerInput, ""
[endgmenewsub]
[nnhgfd11]
    startNumber = 100
    endNumber = 200
    revealNumber$ = ""
    guessLeft = 15
    levelNumber = 1
    scoreNumber = 0
    quitstatus$ = "did not"
[rnd42398]
guessMe = int(rnd(startNumber)*endNumber) + 1
[rnd42395]
if guessMe < startNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
if guessMe < startNumber then goto [rnd42395]
[rnd42387]
if guessMe > endNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
if guessMe > endNumber then goto [rnd42387]
[rnd42562]
    minus1 = int(rnd(15)*19) + 1
    minus2 = int(rnd(13)*18) + 1
    if newwinopen = 1 then gosub [encode]
    if newwinopen = 1 then goto [nnhgfd12b]
    print #main.startNumber, startNumber
    print #main.endNumber, endNumber
    print #main.answerRevealNumber, revealNumber$
    print #main.guessLeftNumber, guessLeft
    print #main.levelNumber, levelNumber
    print #main.scoreNum, scoreNumber
[nnhgfd12b]
if newwinopen = 0 then goto [nhfdmkzs1]
return
[nhfdmkzs1]
close #endofgamew
wait

[popuphelp]
'Form created with the help of Freeform 3 v03-27-03
'Generated on Mar 11, 2009 at 01:57:21


[setup.help.Window]

    '-----Begin code for #help

    nomainwin
    WindowWidth = 640
    WindowHeight = 480
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)


    '-----Begin GUI objects code

    graphicbox #help.graphicbox1,  0, 0, 640, 480

    '-----End GUI objects code

    open "Help" for graphics_nsb_nf as #help
    print #help.graphicbox1, "down; fill white; flush"
    print #help, "down;fill buttonface; flush"
    print #help, "color black; backcolor buttonface"
    print #help, "font ms_sans_serif 10"
    print #help, "trapclose [quit.help]"
    LOADBMP "help-instructions", "help-instructions.bmp"
    print #help.graphicbox1, "fill 192 192 192"
    print #help.graphicbox1, "drawbmp help-instructions  0, 0, 640, 480"
    print #help.graphicbox1, "getbmp help-instructions.bmp  0, 0, 640, 480"
    print #help.graphicbox1, "flush"

[help.inputLoop]   'wait here for input event
    if newwinopen = 1 then gosub [distxt]
    if newwinopen = 1 then goto [nnhgfd12]
#main.answerInput "!disable"
#main.guess "!disable"
#main.giveUp "!disable"
#main.SaveGame,"!disable"
#main.LoadGame,"!disable"
#main.Helpingame,"!disable"
[nnhgfd12]
wait

[quit.help] 'End the program
    if newwinopen = 1 then gosub [entxt]
    if newwinopen = 1 then goto [nnhgfd13]
#main.answerInput "!enable"
#main.guess "!enable"
#main.giveUp "!enable"
#main.SaveGame,"!enable"
#main.LoadGame,"!enable"
#main.Helpingame,"!enable"
[nnhgfd13]
    close #help
    wait

[savegame]
if f1qw = 1 then goto [f1qwg]
filedialog "Save ",gameSaveLoc$, file$
if file$="" then wait
if right$(file$, 5) = ".gtng" then goto [proc334u]
file$ = file$ ;".gtng"
[proc334u]
goto [file1p]
[f1qwg]
if justOnces = 1 then f1qw = 0
if justOnces = 1 then justOnces = 0
file$ = f1qwv$
[file1p]
open file$ for output as #1

print #1, "do not add or subtract lines, file is line sensitive - only change the settings if desired not the comments"
print #1, ""
print #1, "Your last start number"
print #1, startNumber
print #1, ""
print #1, "Your last end number"
print #1, endNumber
print #1, ""
print #1, "Currently not being used, full text, number symbol at bottom"
print #1, revealNumber$
print #1, ""
print #1, "The number of guesses left"
print #1, guessLeft
print #1, ""
print #1, "Your level number"
print #1, levelNumber
print #1, ""
print #1, "Your score so far"
print #1, scoreNumber
print #1, ""
print #1, "Whether you quit or not, can be full alphabet, numbers, symbols, etc..."
print #1, "Usually -did not- if you ran out of guesses or -did- if you gave up"
print #1, "If you press give up your answer will be changed to -did- anyways"
print #1, quitstatus$
print #1, ""
print #1, "The number your guessing for"
print #1, guessMe
print #1, ""
print #1, "Currently not being used"
print #1, minus1
print #1, minus2
print #1, ""
print #1, "Your last entry that will not be restored on saved game open"
print #1, answerInput$
print #1, ""
print #1, "These are working temporary numbers that help determine the score"
print #1, "Changing them is really pointless as they change everytime you guess"
print #1, "when guesses too low"
print #1, higherdiff
print #1, ""
print #1, "when guessed too high"
print #1, lowerdiff
print #1, ""
print #1, "when guessed correctly"
print #1, correctdiff
print #1, ""
print #1, "Additional Optional Configuration's for people viewing game file in text editor"
print #1, ""
print #1, "If you changed the start and-or end number, do you want to"
print #1, "refresh the random guess number to update within your paremeters"
print #1, "yes or no --- all lowercase"
print #1, wchangeGuessParam$
print #1, ""
print #1, "Do you want to restore the last entry such as the guess you last typed which will be -save-"
print #1, "unless you changed it - yes or no --- all lowercase"
print #1, wrestoreLastGuess$
print #1, ""
print #1, "If you changed the level then do you want to refresh all the other numbers to"
print #1, "bring the game up to that level - may overwrite any other changes you made above"
print #1, "yes or no --- all lowercase"
print #1, wupdateLevel$
gameSaveLoc$ = file$
close #1
gosub [updateSettings]
wait

[autosave]
open "Auto Save\Game\Auto Game Save.gtng" for output as #887
print #887, "do not add or subtract lines, file is line sensitive - only change the settings if desired not the comments"
print #887, ""
print #887, "Your last start number"
print #887, startNumber
print #887, ""
print #887, "Your last end number"
print #887, endNumber
print #887, ""
print #887, "Currently not being used, full text, number symbol at bottom"
print #887, revealNumber$
print #887, ""
print #887, "The number of guesses left"
print #887, guessLeft
print #887, ""
print #887, "Your level number"
print #887, levelNumber
print #887, ""
print #887, "Your score so far"
print #887, scoreNumber
print #887, ""
print #887, "Whether you quit or not, can be full alphabet, numbers, symbols, etc..."
print #887, "Usually -did not- if you ran out of guesses or -did- if you gave up"
print #887, "If you press give up your answer will be changed to -did- anyways"
print #887, quitstatus$
print #887, ""
print #887, "The number your guessing for"
print #887, guessMe
print #887, ""
print #887, "Currently not being used"
print #887, minus1
print #887, minus2
print #887, ""
print #887, "Your last entry that will not be restored on saved game open"
print #887, answerInput$
print #887, ""
print #887, "These are working temporary numbers that help determine the score"
print #887, "Changing them is really pointless as they change everytime you guess"
print #887, "when guesses too low"
print #887, higherdiff
print #887, ""
print #887, "when guessed too high"
print #887, lowerdiff
print #887, ""
print #887, "when guessed correctly"
print #887, correctdiff
print #887, ""
print #887, "Additional Optional Configuration's for people viewing game file in text editor"
print #887, ""
print #887, "If you changed the start and-or end number, do you want to"
print #887, "refresh the random guess number to update within your paremeters"
print #887, "yes or no --- all lowercase"
print #887, wchangeGuessParam$
print #887, ""
print #887, "Do you want to restore the last entry such as the guess you last typed which will be -save-"
print #887, "unless you changed it - yes or no --- all lowercase"
print #887, "yes"
print #887, ""
print #887, "If you changed the level then do you want to refresh all the other numbers to"
print #887, "bring the game up to that level - may overwrite any other changes you made above"
print #887, "yes or no --- all lowercase"
print #887, wupdateLevel$
close #887
return

[loadgame]
if foqw = 1 then goto [foqwg]
filedialog "Open ",gameLoadLoc$, fileopen$
if fileopen$="" then wait
goto [fileop]
[foqwg]
if justOncel = 1 then foqw = 0
if justOncel = 1 then justOncel = 0
fileopen$ = foqwv$
[fileop]
open fileopen$ for input as #1

LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, startNumber
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, endNumber
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, revealNumber$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, guessLeft
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, levelNumber
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, scoreNumber
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, quitstatus$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, guessMe
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, minus1
LINE INPUT #1, minus2
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, answerInput2$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, higherdiff
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, lowerdiff
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, correctdiff
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, changeGuessParam$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, restoreLastGuess$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, updateLevel$
if u1 = 0 then changeGuessParam$ = "no"
if u1 = 1 then changeGuessParam$ = "yes"
if u2 = 0 then restoreLastGuess$ = "no"
if u2 = 1 then restoreLastGuess$ = "yes"
if u3 = 0 then updateLevel$ = "no"
if u3 = 1 then updateLevel$ = "yes"
if changeGuessParam$ = "yes" then goto[changeGuessParam]
[pt2rest]
if restoreLastGuess$ = "yes" then goto[restoreLastGuess]
[pt3uplev]
if updateLevel$ = "yes" then goto[updateLevel]
[pt4finish]
close1 = 1
    if newwinopen = 1 then gosub [encode]
    if newwinopen = 1 then goto [nnhgfd15]
print #main.startNumber, startNumber
print #main.endNumber, endNumber
print #main.answerRevealNumber, revealNumber$
print #main.guessLeftNumber, guessLeft
print #main.levelNumber, levelNumber
print #main.scoreNum, scoreNumber
[nnhgfd15]
close #1
gosub [updateSettings]
wait
[changeGuessParam]
guessMe = int(rnd(startNumber)*endNumber) + 1
if guessMe < startNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
if guessMe > endNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
goto [pt2rest]

[restoreLastGuess]
    if newwinopen = 1 then gosub [resttxt]
    if newwinopen = 1 then goto [nnhgfd16]
    [resttxt]
    print #main2.answerInputN, answerInput2$
    return
print #main.answerInput, answerInput2$
[nnhgfd16]
goto [pt3uplev]

[updateLevel]
    if newwinopen = 1 then gosub [uplvltxt]
    if newwinopen = 1 then goto [nnhgfd17]
    [uplvltxt]
    print #main2.pressGuessN, "Correct Next Level"
    gosub [encode]
    return
print #main.scoreNum, scoreNumber
print #main.pressGuess, "Correct Next Level"
[nnhgfd17]
endNumber = endNumber + 300
levelNumber = levelNumber + 0
if levelNumber = 2 then guessLeft = guessLeft + 10
if levelNumber = 3 then guessLeft = guessLeft + 6
if levelNumber = 4 then guessLeft = guessLeft + 5
if levelNumber = 5 then guessLeft = guessLeft + 4
if levelNumber >= 6 then guessLeft = guessLeft + 3
[rnd44398]
guessMe = int(rnd(startNumber)*endNumber) + 1
[rnd44395]
if guessMe < startNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
if guessMe < startNumber then goto [rnd44395]
[rnd44387]
if guessMe > endNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
if guessMe > endNumber then goto [rnd44387]
[rnd44562]
    if newwinopen = 1 then gosub [encode]
    if newwinopen = 1 then goto [nnhgfd19]
print #main.levelNumber, levelNumber
print #main.endNumber, endNumber
print #main.guessLeftNumber, guessLeft
[nnhgfd19]
goto [pt4finish]

[autoload]
open "Auto Save\Game\Auto Game Save.gtng" for input as #1

LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, startNumber
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, endNumber
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, revealNumber$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, guessLeft
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, levelNumber
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, scoreNumber
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, quitstatus$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, guessMe
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, minus1
LINE INPUT #1, minus2
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, answerInput2$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, higherdiff
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, lowerdiff
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, correctdiff
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, changeGuessParam$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, restoreLastGuess$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, empty$
LINE INPUT #1, updateLevel$
if u1 = 0 then changeGuessParam$ = "no"
if u1 = 1 then changeGuessParam$ = "yes"
if u2 = 0 then restoreLastGuess$ = "no"
if u2 = 1 then restoreLastGuess$ = "yes"
if u3 = 0 then updateLevel$ = "no"
if u3 = 1 then updateLevel$ = "yes"
if changeGuessParam$ = "yes" then goto[changeGuessParambb]
[pt2restbb]
if restoreLastGuess$ = "yes" then goto[restoreLastGuessbb]
[pt3uplevbb]
if updateLevel$ = "yes" then goto[updateLevelbb]
[pt4finishbb]
close1 = 1
    if newwinopen = 1 then gosub [encode]
    if newwinopen = 1 then goto [nnhgfd15bb]
print #main.startNumber, startNumber
print #main.endNumber, endNumber
print #main.answerRevealNumber, revealNumber$
print #main.guessLeftNumber, guessLeft
print #main.levelNumber, levelNumber
print #main.scoreNum, scoreNumber
[nnhgfd15bb]
close #1
return
[changeGuessParambb]
guessMe = int(rnd(startNumber)*endNumber) + 1
if guessMe < startNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
if guessMe > endNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
goto [pt2restbb]

[restoreLastGuessbb]
    if newwinopen = 1 then gosub [resttxtbb]
    if newwinopen = 1 then goto [nnhgfd16bb]
    [resttxtbb]
    print #main2.answerInputN, answerInput2$
    return
print #main.answerInput, answerInput2$
[nnhgfd16bb]
goto [pt3uplevbb]

[updateLevelbb]
    if newwinopen = 1 then gosub [uplvltxtbb]
    if newwinopen = 1 then goto [nnhgfd17bb]
    [uplvltxtbb]
    print #main2.pressGuessN, "Correct Next Level"
    gosub [encode]
    return
print #main.scoreNum, scoreNumber
print #main.pressGuess, "Correct Next Level"
[nnhgfd17bb]
endNumber = endNumber + 300
levelNumber = levelNumber + 0
if levelNumber = 2 then guessLeft = guessLeft + 10
if levelNumber = 3 then guessLeft = guessLeft + 6
if levelNumber = 4 then guessLeft = guessLeft + 5
if levelNumber = 5 then guessLeft = guessLeft + 4
if levelNumber >= 6 then guessLeft = guessLeft + 3
[rnd44398bb]
guessMe = int(rnd(startNumber)*endNumber) + 1
[rnd44395bb]
if guessMe < startNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
if guessMe < startNumber then goto [rnd44395bb]
[rnd44387bb]
if guessMe > endNumber then guessMe = int(rnd(startNumber)*endNumber) + 1
if guessMe > endNumber then goto [rnd44387bb]
[rnd44562bb]
    if newwinopen = 1 then gosub [encode]
    if newwinopen = 1 then goto [nnhgfd19bb]
print #main.levelNumber, levelNumber
print #main.endNumber, endNumber
print #main.guessLeftNumber, guessLeft
[nnhgfd19bb]
goto [pt4finishbb]

[VARMASTER]
'Form created with the help of Freeform 3 v03-27-03
'Generated on Apr 03, 2009 at 17:16:49


[setup.varmast.Window]

    '-----Begin code for #varmast

    nomainwin
    WindowWidth = 605
    WindowHeight = 165


    '-----Begin GUI objects code

    ComboboxColor$ = "white"
    combobox #varmast.variableLST2, varlst$(, [variableLSTDoubleClick],   75,  17, 200, 100
    statictext #varmast.statictext2, "Variable",  15,  22,  51,  20
    TextboxColor$ = "white"
    textbox #varmast.varvalue,  75,  52, 505,  25
    statictext #varmast.statictext4, "Value",  30,  57,  35,  20
    button #varmast.varapply,"Apply",[varappl], UL, 160, 107,  65,  25
    button #varmast.varretr,"Retrieve",[varret], UL,  75, 107,  80,  25
    textbox #varmast.vadesc,  75,  82, 505,  25
    statictext #varmast.statictext8, "Description",   0,  87,  68,  20
    button #varmast.varsaveal,"Save All",[varsavea], UL, 410, 107,  80,  25
    button #varmast.varretal,"Retrieve All",[varreta], UL, 495, 107,  85,  25
    button #varmast.varappla,"Apply All",[varappa], UL, 280, 107,  80,  25

    '-----End GUI objects code

    open "Variable Master" for window_nf as #varmast
    print #varmast, "font ms_sans_serif 10"
    print #varmast, "trapclose [quit.varmast]"


[varmast.inputLoop]   'wait here for input event
    wait



[variableLSTDoubleClick]   'Perform action for the combobox named 'variableLST2'



    wait


[varappl]   'Perform action for the button named 'varapply'

    'Insert your own code here

    wait


[varret]   'Perform action for the button named 'varretr'

    'Insert your own code here

    wait


[varsavea]   'Perform action for the button named 'varsaveal'

    'Insert your own code here

    wait


[varreta]   'Perform action for the button named 'varretal'

    'Insert your own code here

    wait


[varappa]   'Perform action for the button named 'varappla'

    'Insert your own code here

    wait

[quit.varmast] 'End the program
    close #varmast
    wait

[quit.main] 'End the program
    close #main
    if chatwindowopen = 1 then goto [closechatwin] else goto [close]
    [closechatwin]
    close #chatwin
    chatwindowopen = 0
    [close]
    end


