; Installer created by Yenairo
; Please contact me at pseudo#9875 if you have any issues
; --------------------------------------------------------
; I designed this installer to be as user friendly as possible for new players. I think it's a bit confusing 
; trying to find all the resources you need to get started, so I have collected them and turned them into 
; an all-in-one installer. 
;
; If I had to make any changes from here I would replace some folder strings with variables so it is easier to 
; increment the version codes of the individual parts. I imagine that's going to be a headache later.
;
; I am a complete amateur and this is my first attempt at writing anything that has this level of trust involved.
; If there is anything you would like to say about the usage of wildcards, shoot me a message.
; I recognize that it's a lazy option, and lazy options tend to be dangerous. I pray that's not the case, but 
; if someone provides me a script that automates these lines, I'll gladly swap it out for the sake of a much more 
; explicit installer, which I imagine would be safer.
;
; Cheers,
; Yenairo


[Setup]
SetupIconFile=rebornbush.ico
WizardImageFile=wizardleft200.bmp,wizardleft100.bmp
DisableWelcomePage=no
DisableDirPage=no
AppName=Graal Reborn
AppVersion=6.0.3.7
WizardStyle=classic
DefaultDirName={sd}\Games\Graal Reborn
DefaultGroupName=Graal Reborn
UninstallDisplayIcon={app}\GLauncher.exe

; for the Compiler apparently, do not touch? 
Compression=lzma2
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output


[Components]
Name: top; Description: "All"; Types: full;
Name: top\baseclient; Description: "6.0.3.7 Client & Launcher (lets you play the game)"; Types: full compact; 
Name: top\gonstruct; Description: "Gonstruct Editor (for editing levels and scripts)"; Types: full; 
Name: top\gserver; Description: "GServer Software (for hosting your own server)"; Types: full; Flags: checkablealone;
Name: top\gserver\rc3; Description: "Remote Control 3, a GUI for remote dev/admin access"; Types: full;


[Types]
Name: "compact"; Description: "Compact installation";
Name: "full"; Description: "Full installation";
Name: "custom"; Description: "Custom installation"; Flags: iscustom;


[Tasks]
Name: startmenu; Description: "Create shortcuts in the &Start Menu";
Name: desktop; Description: "Create a desktop shortcut"; Flags: unchecked;
Name: defaultsettings; Description: "Restore default game settings"; Flags: unchecked;


[Icons]
Name: "{group}\OpenGraal Launcher"; Filename:"{app}\Client\GLauncher.exe"; Components: top\baseclient; Tasks: startmenu
Name: "{group}\Gonstruct"; Filename:"{app}\Gonstruct\bin\Gonstruct.exe"; Components: top\gonstruct; Tasks: startmenu
Name: "{group}\RemoteControl3"; Filename:"{app}\RemoteControl3\RemoteControl3.exe"; Components: top\gserver\rc3; Tasks: startmenu

Name: "{userdesktop}\OpenGraal Launcher"; Filename:"{app}\Client\GLauncher.exe"; Components: top\baseclient; Tasks: desktop


[Messages]
UninstalledAll=%1 was successfully removed from your computer. %n%nSome folders and settings files may have been left behind for archival purposes, please manually discard as necessary. 
FinishedLabel=Setup has finished installing [name] on your computer. The application may be launched by selecting the installed shortcuts. %n%nDon't forget to create a new account via the link in the client folder if you don't have one already. Enjoy!

[Files]
; Base Installation files
;
; Source: "6.0.3.7\"; DestDir: "{app}\Client\";

Source: "6.0.3.7\ExeReplacer.exe"; DestDir: "{app}\Client\"; Components: top\baseclient;
Source: "6.0.3.7\game_config.txt"; DestDir: "{app}\Client\"; Tasks: defaultsettings;
Source: "6.0.3.7\GLauncher.dll"; DestDir: "{app}\Client\"; Components: top\baseclient; Flags: ignoreversion;
Source: "6.0.3.7\Glauncher.exe"; DestDir: "{app}\Client\"; Components: top\baseclient; Flags: ignoreversion;
Source: "6.0.3.7\OG_Graal.exe"; DestDir: "{app}\Client\"; Components: top\baseclient;
Source: "6.0.3.7\open sans.ttf"; DestDir: "{app}\Client\"; Components: top\baseclient;
Source: "6.0.3.7\tempsitc.ttf"; DestDir: "{app}\Client\"; Components: top\baseclient;
Source: "6.0.3.7\tempsitcbd.ttf"; DestDir: "{app}\Client\"; Components: top\baseclient;
; Account Creator link, for lost souls
Source: "6.0.3.7\Create an account.url"; DestDir: "{app}\Client\"; Components: top\baseclient;

Source: "6.0.3.7\levels\ganis\*"; DestDir: "{app}\Client\levels\ganis\"; Components: top\baseclient;
Source: "6.0.3.7\levels\heads\*"; DestDir: "{app}\Client\levels\heads\"; Components: top\baseclient;
Source: "6.0.3.7\levels\images\*"; DestDir: "{app}\Client\levels\images\"; Components: top\baseclient;
Source: "6.0.3.7\levels\images\gui2001\*"; DestDir: "{app}\Client\levels\images\gui2001\"; Components: top\baseclient;
Source: "6.0.3.7\levels\images\login\*"; DestDir: "{app}\Client\levels\images\login\"; Components: top\baseclient;
Source: "6.0.3.7\levels\tiles\*"; DestDir: "{app}\Client\levels\tiles\"; Components: top\baseclient;

Source: "6.0.3.7\levels3d\gui\*"; DestDir: "{app}\Client\levels3d\gui\"; Components: top\baseclient;

Source: "6.0.3.7\license\*"; DestDir: "{app}\Client\license\"; Components: top\baseclient;
Source: "6.0.3.7\maps\*"; DestDir: "{app}\Client\maps\"; Components: top\baseclient;
Source: "6.0.3.7\sounds\*"; DestDir: "{app}\Client\sounds\"; Components: top\baseclient;
Source: "6.0.3.7\translations\*"; DestDir: "{app}\Client\translations\"; Components: top\baseclient;

; Gonstruct Files
; Repo: https://github.com/fry/graal-gonstruct
; Source: "Gonstruct\"; DestDir: "{app}\Gonstruct\"; Components: top\gonstruct;

Source: "Gonstruct\changelog.txt"; DestDir: "{app}\Gonstruct\"; Components: top\gonstruct;
Source: "Gonstruct\readme.html"; DestDir: "{app}\Gonstruct\"; Components: top\gonstruct;

; Explictly calls out the .dlls
; This was how the .iss was made in the repo, so I just adapted it. 
Source: "Gonstruct\bin\iconv.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\intl.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\jpeg62.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libatk-1.0-0.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libatkmm-1.6-1.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libcairo-2.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libcairomm-1.0-1.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libgdk-win32-2.0-0.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libgdkmm-2.4-1.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libgdk_pixbuf-2.0-0.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libgio-2.0-0.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libglademm-2.4-1.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libglib-2.0-0.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libglibmm-2.4-1.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libgmodule-2.0-0.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libgobject-2.0-0.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libgthread-2.0-0.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libgtk-win32-2.0-0.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libgtkmm-2.4-1.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libpango-1.0-0.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libpangocairo-1.0-0.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libpangoft2-1.0-0.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libpangomm-1.4-1.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libpangowin32-1.0-0.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libpng12-0.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libsigc-2.0-0.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libtiff3.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libxml2.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\zlib1.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libgiomm-2.4-1.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libgtksourceview-2.0-0.dll"; DestDir: "{app}\Gonstruct\bin"; Components: top\gonstruct;
Source: "Gonstruct\bin\libgtkgl-2.0-1.dll"; DestDir:"{app}\Gonstruct\bin"; Components: top\gonstruct;

Source: "Gonstruct\bin\gonstruct.exe"; DestDir: "{app}\Gonstruct\bin"; Components: top\gonstruct;

Source: "Gonstruct\bin\gdk-pixbuf-query-loaders.exe"; DestDir: "{app}\Gonstruct\bin\"; Flags: deleteafterinstall; Components: top\gonstruct;
Source: "Gonstruct\bin\gtk-query-immodules-2.0.exe"; DestDir: "{app}\Gonstruct\bin\"; Flags: deleteafterinstall; Components: top\gonstruct;

Source: "Gonstruct\etc\gtk-2.0\gtkrc"; DestDir: "{app}\Gonstruct\etc\gtk-2.0\"; Components: top\gonstruct;

Source: "Gonstruct\lib\gtk-2.0\2.10.0\engines\*"; DestDir: "{app}\Gonstruct\lib\gtk-2.0\2.10.0\engines\"; Components: top\gonstruct;
Source: "Gonstruct\lib\gtk-2.0\2.10.0\loaders\*"; DestDir: "{app}\Gonstruct\lib\gtk-2.0\2.10.0\loaders\"; Components: top\gonstruct;

Source: "Gonstruct\share\gtksourceview-2.0\language-specs\*"; DestDir: "{app}\Gonstruct\share\gtksourceview-2.0\language-specs\"; Components: top\gonstruct;
Source: "Gonstruct\share\gtksourceview-2.0\styles\*"; DestDir: "{app}\Gonstruct\share\gtksourceview-2.0\styles\"; Components: top\gonstruct;

; GServer Files
; Repo: https://github.com/xtjoeytx/GServer-v2
; Source: "gs2emu-3.0.5-beta\"; DestDir: "{app}\gs2emu"; Components: top\gserver

Source: "gs2emu-3.0.5-beta\changelog.txt"; DestDir: "{app}\GServer-gs2emu\"; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\GS2Emu.exe"; DestDir: "{app}\GServer-gs2emu\"; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\icudtl.dat"; DestDir: "{app}\GServer-gs2emu\"; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\icui18n.dll"; DestDir: "{app}\GServer-gs2emu\"; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\icuuc.dll"; DestDir: "{app}\GServer-gs2emu\"; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\readme.txt"; DestDir: "{app}\GServer-gs2emu\"; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers.txt"; DestDir: "{app}\GServer-gs2emu\"; Components: top\gserver; Flags: onlyifdoesntexist;
Source: "gs2emu-3.0.5-beta\v8.dll"; DestDir: "{app}\GServer-gs2emu\"; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\v8_libbase.dll"; DestDir: "{app}\GServer-gs2emu\"; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\v8_libplatform.dll"; DestDir: "{app}\GServer-gs2emu\"; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\zlib.dll"; DestDir: "{app}\GServer-gs2emu\"; Components: top\gserver;

Source: "gs2emu-3.0.5-beta\docs\npcserver.txt"; DestDir: "{app}\GServer-gs2emu\docs\"; Components: top\gserver;

; Generate files for the default server
; I guess this could mess people up if they're building their server out of the default folder
; but really now, who would be silly enough to do that? If you raised your hand, please move your server. It's just good hygiene. 
Source: "gs2emu-3.0.5-beta\servers\default\accounts\defaultaccount.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\accounts\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\accounts\YOURACCOUNT.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\accounts\"; Flags: onlyifdoesntexist; Components: top\gserver;

Source: "gs2emu-3.0.5-beta\servers\default\config\adminconfig.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\config\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\config\allowedversions.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\config\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\config\foldersconfig.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\config\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\config\ipbans.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\config\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\config\rchelp.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\config\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\config\rcmessage.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\config\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\config\rules.example.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\config\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\config\rules.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\config\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\config\servermessage.html"; DestDir: "{app}\GServer-gs2emu\servers\default\config\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\config\serveroptions.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\config\"; Flags: onlyifdoesntexist; Components: top\gserver;

Source: "gs2emu-3.0.5-beta\servers\default\documents\docu_wordfilter.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\documents\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\documents\rules.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\documents\"; Flags: onlyifdoesntexist; Components: top\gserver;

Source: "gs2emu-3.0.5-beta\servers\default\execscripts\readme.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\execscripts\"; Flags: onlyifdoesntexist; Components: top\gserver;

Source: "gs2emu-3.0.5-beta\servers\default\guilds\guildExample.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\guilds\"; Flags: onlyifdoesntexist; Components: top\gserver;

Source: "gs2emu-3.0.5-beta\servers\default\logs\npclog.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\logs\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\logs\rclog.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\logs\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\logs\scriptlog.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\logs\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\logs\serverlog.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\logs\"; Flags: onlyifdoesntexist; Components: top\gserver;

Source: "gs2emu-3.0.5-beta\servers\default\npcs\npcControl-NPC.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\npcs\"; Flags: onlyifdoesntexist; Components: top\gserver;

Source: "gs2emu-3.0.5-beta\servers\default\translations\deutsch.po"; DestDir: "{app}\GServer-gs2emu\servers\default\translations\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\translations\english.po"; DestDir: "{app}\GServer-gs2emu\servers\default\translations\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\translations\italiano.po"; DestDir: "{app}\GServer-gs2emu\servers\default\translations\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\translations\nederlands.po"; DestDir: "{app}\GServer-gs2emu\servers\default\translations\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\translations\norsk.po"; DestDir: "{app}\GServer-gs2emu\servers\default\translations\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\translations\svenska.po"; DestDir: "{app}\GServer-gs2emu\servers\default\translations\"; Flags: onlyifdoesntexist; Components: top\gserver;

Source: "gs2emu-3.0.5-beta\servers\default\weapons\weapon-gr_movement.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\weapons\"; Flags: onlyifdoesntexist; Components: top\gserver;

Source: "gs2emu-3.0.5-beta\servers\default\world\onlinestartlocal.nw"; DestDir: "{app}\GServer-gs2emu\servers\default\world\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\world\readme.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\world\"; Flags: onlyifdoesntexist; Components: top\gserver;

Source: "gs2emu-3.0.5-beta\servers\default\bootstrap.js"; DestDir: "{app}\GServer-gs2emu\servers\default\"; Flags: onlyifdoesntexist; Components: top\gserver;
Source: "gs2emu-3.0.5-beta\servers\default\serverflags.txt"; DestDir: "{app}\GServer-gs2emu\servers\default\"; Flags: onlyifdoesntexist; Components: top\gserver;

; Remote Control 3, an application that lets you interact with your server remotely
; Repo: ???
; Source: "rc3\"; DestDir: "{app}\RemoteControl3"; Components: top\gserver\rc3

Source: "rc3\*"; DestDir: "{app}\RemoteControl3\"; Components: top\gserver\rc3


[Dirs]
; create blank directories for the GServer software to see
Name: "{app}\GServer-gs2emu\servers\default\scripts\"

Name: "{app}\GServer-gs2emu\servers\default\world\bodies\"
Name: "{app}\GServer-gs2emu\servers\default\world\ganis\"
Name: "{app}\GServer-gs2emu\servers\default\world\global\"
Name: "{app}\GServer-gs2emu\servers\default\world\global\bodies\"
Name: "{app}\GServer-gs2emu\servers\default\world\global\heads\"
Name: "{app}\GServer-gs2emu\servers\default\world\global\shields\"
Name: "{app}\GServer-gs2emu\servers\default\world\global\swords\"
Name: "{app}\GServer-gs2emu\servers\default\world\hats\"
Name: "{app}\GServer-gs2emu\servers\default\world\heads\"
Name: "{app}\GServer-gs2emu\servers\default\world\images\"
Name: "{app}\GServer-gs2emu\servers\default\world\levels\"
Name: "{app}\GServer-gs2emu\servers\default\world\shields\"
Name: "{app}\GServer-gs2emu\servers\default\world\swords\"


[Run]
 ; If we have an installer, we might as well not be using a bat for this. This is what the original installer for Gonstruct was using:
 ; https://github.com/fry/graal-gonstruct/blob/master/win/querymodules.bat 

 ; Instead we will run the two exes that generate configuration files for handling file extensions in Gonstruct and drop them in the ..\etc\gtk-2.0\ folder
 ; This is the documentation for the modules 
 ; https://linux.die.net/man/1/gdk-pixbuf-query-loaders
 ; https://linux.die.net/man/1/gtk-query-immodules-2.0

Filename: "{cmd}"; Parameters: "/c """"{app}\Gonstruct\bin\gdk-pixbuf-query-loaders.exe"" > ""{app}\Gonstruct\etc\gtk-2.0\gdk-pixbuf.loaders"""""; \
 Flags: runhidden; \
 StatusMsg: "Querying modules...";  
Filename: "{cmd}"; Parameters: "/c """"{app}\Gonstruct\bin\gtk-query-immodules-2.0.exe"" > ""{app}\Gonstruct\etc\gtk-2.0\gtk.immodules"""""; \
 Flags: runhidden; \
 StatusMsg: "Querying modules..."; 

FileName: "{app}\Client\GLauncher.exe"; Description: "Run the OpenGraal launcher"; Components: top\baseclient; Flags: postinstall nowait;
FileName: "{app}\Client\Create an account.url"; Description: "Open the URL for creating an account"; Components: top\baseclient; Flags: postinstall nowait shellexec unchecked;

[UninstallDelete]
Type: files; Name: "{app}\Gonstruct\etc\gtk-2.0\gdk-pixbuf.loaders"
Type: files; Name: "{app}\Gonstruct\etc\gtk-2.0\gtk.immodules"
Type: filesandordirs; Name: "{app}\Gonstruct"
Type: dirifempty; Name: "{app}"
