<?php

$tpl = <<< EOTPL
; **************************************************************
; ****** DO NOT EDIT THIS FILE **** DO NOT EDIT THIS FILE ******
; ** There is no point in modifying the file wampmanager.ini ***
; * The wampmanager.ini file is completely rewritten each time *
; * Wampserver is launched and each time a Wampserver, Apache, *
; * PHP, MySQL or MariaDB option is modified.                  *
; **************************************************************
[Config]
;WAMPCONFIGSTART
ImageList=images_off.bmp
ServiceCheckInterval=1
ServiceGlyphRunning=13
ServiceGlyphPaused=14
ServiceGlyphStopped=15
TrayIconAllRunning=16
TrayIconSomeRunning=17
TrayIconNoneRunning=18
ID={$c_wampserverID}
AboutHeader=WAMPSERVER {$c_wampVersion} {$c_wampMode}
AboutVersion=Version {$c_wampVersion}
;WAMPCONFIGEND

[AboutText]
; **** Do not modify the next line ****
WampServer Version {$c_wampVersion} {$c_wampMode}
Created by Romain Bourdon - Upgrade to 2.5 by Herve Leclerc
Upgrade to 3 - Maintener by Dominique Ottello alias Otomatic
Multi styles for homepage by Jojaba
Installer by Inno Setup: https://www.jrsoftware.org/isinfo.php
Forum Wampserver: http://forum.wampserver.com/index.php
{$w_translated_by}
______________________ Versions used ______________________
Wampserver install version {$c_wampVersionInstall}
{$c_wampVersionUpdate}
Apache {$c_apacheVersion} Port {$c_UsedPort} - PHP {$c_phpVersion}
{$SupportMySQL}MySQL {$c_mysqlVersion} Port {$c_UsedMysqlPort}
{$SupportMariaDB}MariaDB {$c_mariadbVersion} Port {$c_UsedMariaPort}
PHP {$c_phpCliVersion} for CLI (Command-Line Interface)

[Services]
Name: {$c_apacheService}
{$SupportMySQL}Name: {$c_mysqlService}
{$SupportMariaDB}Name: {$c_mariadbService}

[Variables]
Type: prompt; Name: "ApachePort"; PromptCaption: "$w_portForApache"; PromptText: "$w_enterPort"; DefaultValue: "{$w_newPort}"
Type: prompt; Name: "AddListenApachePort"; PromptCaption: "$w_listenForApache"; PromptText: "$w_enterPort"; DefaultValue: "$w_addPort"
{$SupportMySQL}Type: prompt; Name: "MysqlPort"; PromptCaption: "$w_portForMysql"; PromptText: "$w_enterPort"; DefaultValue: "$w_newMysqlPort"
{$SupportMySQL}Type: prompt; Name: "MysqlUser"; PromptCaption: "MySQL user"; PromptText: "$w_MysqlMariaUser"; DefaultValue: "root"
{$SupportMariaDB}Type: prompt; Name: "MariaPort"; PromptCaption: "$w_portForMysql"; PromptText: "$w_enterPort"; DefaultValue: "$w_newMariaPort"
{$SupportMariaDB}Type: prompt; Name: "MariaUser"; PromptCaption: "MariaDB user"; PromptText: "$w_MysqlMariaUser"; DefaultValue: "root"
Type: prompt; Name: "Size"; PromptCaption: "$w_Size"; PromptText: "$w_EnterSize"; DefaultValue: "512M"
Type: prompt; Name: "Seconds"; PromptCaption: "$w_Time"; PromptText: "$w_EnterTime"; DefaultValue: "360"
Type: prompt; Name: "Integer"; PromptCaption: "$w_Integer"; PromptText: "$w_EnterInteger"; DefaultValue: "2500"

[Messages]
AllRunningHint={$w_allServicesRunning}
SomeRunningHint={$w_oneServiceRunning} - {$w_state_services}
NoneRunningHint={$w_allServicesStopped} - {$w_state_services}

;WAMPBIGMENUSTART

[StartupAction]
;WAMPSTARTUPACTIONSTART
Action: run; FileName: "$c_phpCli"; Parameters: "getStartDate.php"; WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; FileName: "$c_phpCli"; Parameters: "getInstalledBrowsers.php"; WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; FileName: "$c_phpExe"; Parameters: "refreshSymlink.php {$c_phpVersion}"; WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; FileName: "$c_phpCli"; Parameters: "refresh.php";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: resetservices
Action: readconfig
Action: service; Service: {$c_apacheService}; ServiceAction: startresume; Flags: ignoreerrors waituntilterminated
{$SupportMySQL}Action: service; Service: {$c_mysqlService}; ServiceAction: startresume; Flags: ignoreerrors waituntilterminated
{$SupportMariaDB}Action: service; Service: {$c_mariadbService}; ServiceAction: startresume; Flags: ignoreerrors waituntilterminated
{$RunAtStart}Action: run; FileName: "{$c_navigator}"; Parameters: "{$c_edge}http://localhost{$UrlPort}/"; ShowCmd: normal; Flags: ignoreerrors

;WAMPSTARTUPACTIONEND

[Menu.Left.Settings]
;WAMPMENULEFTSETTINGSSTART
AutoHotkeys=0
AutoLineReduction=no
BarVisible=yes
BarCaptionAlignment=bottom
BarCaptionCaption=WAMPSERVER {$c_wampVersion}
BarCaptionDepth=1
BarCaptionDirection=downtoup
BarCaptionFont=Tahoma,13,clWhite,bold italic
BarCaptionHighlightColor=clNone
BarCaptionOffsetY=0
BarCaptionShadowColor=clNone
BarPictureHorzAlignment=center
BarPictureOffsetX=0
BarPictureOffsetY=0
BarPicturePicture=barimage.bmp
BarPictureTransparent=yes
BarPictureVertAlignment=bottom
BarBorder=clNone
BarGradientEnd=$00F2A626
BarGradientStart=$00C57F0B
BarGradientStyle=horizontal
BarSide=left
BarSpace=0
BarWidth=34
SeparatorsAlignment=center
SeparatorsFade=no
SeparatorsFadeColor=clBtnShadow
SeparatorsFlatLines=yes
SeparatorsFont=Arial,8,clWhite,bold
SeparatorsGradientEnd=$00C57F0B
SeparatorsGradientStart=$00F2A626
SeparatorsGradientStyle=horizontal
SeparatorsSeparatorStyle=caption
;WAMPMENULEFTSETTINGSEND

[Menu.Right.Settings]
;WAMPMENURIGHTSETTINGSSTART
AutoHotkeys=0
AutoLineReduction=no
BarVisible=no
SeparatorsAlignment=center
SeparatorsFade=yes
SeparatorsFadeColor=clBtnShadow
SeparatorsFlatLines=yes
SeparatorsGradientEnd=$00A0A0A0
SeparatorsGradientStart=$00808080
SeparatorsGradientStyle=horizontal
SeparatorsFont=Arial,8,clWhite,bold
SeparatorsSeparatorStyle=caption
;WAMPMENURIGHTSETTINGSEND

[Menu.Right]
;WAMPMENURIGHTSTART
Type: separator; Caption: "Wampserver - {$c_wampVersion} - {$c_wampMode}"
Type: item; Caption: "{$w_startedOn} {$WampStartOn}"; Action: none
Type: item; Caption: "{$w_about}"; Action: about; Glyph: 22
Type: submenu; Caption: "{$w_language}"; SubMenu: language; Glyph: 3
Type: submenu; Caption: "{$w_wampSettings}"; Submenu: submenu.settings; Glyph: 25
Type: submenu; Caption: "{$w_wampTools}"; SubMenu: submenu.tools; Glyph: 29
Type: submenu; Caption: "{$w_help}"; Submenu: submenu.help; Glyph: 31
Type: separator
Type: item; Caption: "{$w_refresh}"; Action: multi; Actions: wampreload; Glyph: 41
Type: item; Caption: "{$w_restartWamp}"; Action: multi; Actions: RestartWampserver; Glyph:42
Type: item; Caption: "{$w_exit}"; Action: multi; Actions: myexit; Glyph: 30
;WAMPMENURIGHTEND

[submenu.help]
Type: Separator; Caption: "{$w_help}"
Type: item; Caption: "{$w_helpForums}"; Action: run; FileName: "{$c_navigator}"; Parameters: "{$c_edge}http://forum.wampserver.com/list.php?{$forum}"; Glyph: 22
{$c_useFileExists}Type: item; Caption: "{$w_helpUse}"; Action: shellexecute; Filename: "%AeTrayMenuPath%\\{$c_useFile}"; ShowCmd: Normal; Glyph: 35
Type: item; Caption: "MariaDB - MySQL"; Action: run; Filename: "%Windows%\Notepad.exe"; Parameters: "%AeTrayMenuPath%\mariadb_mysql.txt"; ShowCmd: Normal; Glyph: 35
Type: submenu; Caption: "{$w_phpMyAdminHelp}"; Submenu: phpmyadmin-help; Glyph: 35
Type: submenu; Caption: "{$w_Refresh_Restart}"; Submenu: refresh-restart-help; Glyph: 35
Type: submenu; Caption: "{$w_addingVer}"; Submenu: AddingVersions; Glyph: 35
Type: item; Caption: "{$w_checkUpdates}"; Action: run; FileName: "$c_phpExe"; Parameters: "checkUpdates.php";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated; Glyph: 31
Type: separator; Caption: "{$w_FileRepository}"
Type: item; Caption: "{$w_goto} https://sourceforge.net/projects/wampserver/"; Action: run; FileName: "{$c_navigator}"; Parameters: "{$c_edge}https://sourceforge.net/projects/wampserver/files/WampServer%203/WampServer%203.0.0/"; Glyph: 5
Type: item; Caption: "{$w_goto} https://wampserver.aviatechno.net/"; Action: run; FileName: "{$c_navigator}"; Parameters: "{$c_edge}https://wampserver.aviatechno.net/?lang={$LinkLang}"; Glyph: 5

[wampreload]
;WAMPRELOADSTART
Action: run; FileName: "$c_phpCli";Parameters: "switchPhpVersion.php {$c_phpVersion}";WorkingDir: "{$c_installDir}/scripts"; ShowCmd: hidden; Flags: waituntilterminated
Action: multi; Actions: apache_restart_refresh; Flags:appendsection
;WAMPRELOADEND

[language]
;WAMPLANGUAGESTART
;WAMPLANGUAGEEND

[submenu.settings]
;WAMPSETTINGSSTART
;WAMPSETTINGSEND

[Menu.Left]
;WAMPMENULEFTSTART
Type: separator; Caption: "Wampserver - {$c_wampVersion} - {$c_wampMode}"
Type: separator; Caption: "Made in France by Dominique Ottello"
Type: item; Caption: "{$w_localhost}"; Action: run; FileName: "{$c_navigator}"; Parameters: "{$c_edge}http://localhost{$UrlPort}/"; Glyph: 27
;WAMPPHPMYADMIN
{$SupportDBMS}{$adminerMenu}Type: item; Caption: "Adminer {$Alias_Contents['adminer']['version']}{$Alias_Contents['adminer']['fcgiaff']}"; Action: run; FileName: "{$c_navigator}"; Parameters: "{$c_edge}http://localhost{$UrlPort}/adminer/"; Glyph: 40
;WAMPVHOSTSUBMENU
;WAMPALIASSUBMENU
{$ShowWWWdir}Type: item; Caption: "{$w_wwwDirectory}"; Action: shellexecute; FileName: "{$wwwDir}"; Glyph: 2
Type: submenu; Caption: "Apache		{$c_apacheVersion}"; SubMenu: apacheMenu; Glyph: 37
Type: submenu; Caption: "PHP		{$c_phpVersion}"; SubMenu: phpMenu; Glyph: 38
;WAMPDBMSMENU

Type: separator; Caption: "{$w_services}"
Type: item; Caption: "{$w_startServices}"; Action: multi; Actions: StartAll
Type: item; Caption: "{$w_stopServices}"; Action: multi; Actions: StopAll
Type: item; Caption: "{$w_restartServices}"; Action: multi; Actions: RestartAll
;WAMPLOCALTEST

;WAMPMENULEFTEND

[MultiplephpMyAdmin]
;WAMPMULTIPLEPHPMYADMINSTART

;WAMPMULTIPLEPHPMYADMINEND

[TextMenu]
;WAMPTEXTMENUSTART

[TextMenuColor]
;WAMPTEXTMENUCOLORSTART

[LeftSeparatorMenuColor]
;WAMPLEFTSEPARATORSTART

[RightSeparatorMenuColor]
;WAMPRIGHTSEPARATORSTART

[PromptCustom]
;WAMPPROMPTCUSTOMSTART

;WAMPITEMSTEXTSTART

[apacheMenu]
;WAMPAPACHEMENUSTART
Type: separator; Caption: "Apache {$c_apacheVersion}"
Type: submenu; Caption: "{$w_version}"; SubMenu: apacheVersion; Glyph: 3
Type: servicesubmenu; Caption: "{$w_service} '{$c_apacheService}'"; Service: {$c_apacheService}; SubMenu: apacheService
Type: submenu; Caption: "{$w_apacheSettings}"; SubMenu: apache_params; Glyph: 25
Type: submenu; Caption: "{$w_apacheModules}"; SubMenu: apache_mod; Glyph: 4
Type: submenu; Caption: "{$w_apacheTools}"; Submenu: ApacheTools; Glyph: 29
Type: submenu; Caption: "{$w_aliasDirectories}"; SubMenu: alias_dir; Glyph: 3
Type: separator; Caption: "{$w_helpFile}";
Type: item; Caption: "httpd.conf"; Glyph: 33; Action: run; FileName: "{$c_editor}"; parameters: "{$c_apacheConfFile}"
{$EditVhostConf}Type: item; Caption: "httpd-vhosts.conf"; Glyph: 33; Action: run; Filename: "{$c_editor}"; parameters: "{$c_apacheVhostConfFile}"
Type: item; Caption: "{$w_apacheErrorLog}		({$logFilesSize['apache_error.log']})"; Glyph: 33; Action: run; FileName: "{$c_logviewer}"; parameters: "{$c_installDir}/{$logDir}apache_error.log"
Type: item; Caption: "{$w_apacheAccessLog}	({$logFilesSize['access.log']})"; Glyph: 33; Action: run; FileName: "{$c_logviewer}"; parameters: "{$c_installDir}/{$logDir}access.log"
Type: item; Caption: "{$w_apacheDoc}"; Action: run; FileName: "{$c_navigator}"; Parameters: "{$c_edge}http://httpd.apache.org/docs/2.4/en/"; Glyph: 35
{$ApaTestPortUsed}Type: separator; Caption: "{$w_portUsed}{$c_UsedPort}"
{$ApaTestPortUsed}Type: item; Caption: "{$w_testPort80}"; Action: run; FileName: "$c_phpExe"; Parameters: "testPort.php 80 {$c_apacheService}";WorkingDir: "$c_installDir/scripts"; Flags: waituntilterminated; Glyph: 24
{$ApaTestPortUsed}Type: item; Caption: "{$w_AlternatePort}"; Action: multi; Actions: UseAlternatePort; Glyph: 24
{$ApaTestPortUsed}Type: item; Caption: "{$w_testPortUsed}{$c_UsedPort}"; Action: run; FileName: "$c_phpExe"; Parameters: "testPort.php {$c_UsedPort} {$c_apacheService}";WorkingDir: "$c_installDir/scripts"; Flags: waituntilterminated; Glyph: 24
;WAMPAPACHEMENUEND

[ApacheTools]
Type: item; Caption: "{$w_testConf}"; Action: run; FileName: "$c_phpExe"; Parameters: "msg.php apachesyntax"; WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated; Glyph: 24
Type: item; Caption: "{$w_vhostConfig}"; Action: run; FileName: "$c_phpExe"; Parameters: "msg.php vhostconfig";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated; Glyph: 24
Type: item; Caption: "{$w_apacheLoadedModules}"; Action: run; FileName: "$c_phpExe"; Parameters: "msg.php apachemodules";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated; Glyph: 24
Type: item; Caption: "{$w_apacheLoadedIncludes}"; Action: run; FileName: "$c_phpExe"; Parameters: "msg.php apacheincludes";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated; Glyph: 24
Type: item; Caption: "{$w_apacheDefineVariables}"; Action: run; FileName: "$c_phpExe"; Parameters: "msg.php apachedefine";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated; Glyph: 24

[apacheVersion]
;WAMPAPACHEVERSIONSTART
;WAMPAPACHEVERSIONEND

[apache_params]
Type: separator; Caption: "{$w_apacheSettings} {$c_apacheVersion}"
Type: Separator; Caption: "{$w_settings['ApacheWampParams']}"
Type: submenu; Caption: "{$w_settings['ApacheWampParams']}"; Submenu: ApacheWampParams; Glyph: 9
;WAMPAPACHECOMPARE
;WAMPAPACHERESTORE
Type: separator; Caption: "{$w_phpparam_info}"
;WAMPAPACHEPARAMSSTART
;WAMPAPACHEPARAMSEND

;WAMPAPACHEITEMCOMPARE
;WAMPAPACHEITEMMENUS

;WAMPAPACHEITEMRESTORE
;WAMPAPACHEMENUSRESTORE

[phpMenu]
;WAMPPHPMENUSTART
Type: separator; Caption: "PHP {$c_phpVersion} [Apache module]"
Type: submenu; Caption: "{$w_version}"; SubMenu: phpVersion; Glyph: 3
Type: submenu; Caption: "{$w_phpSettings}"; SubMenu: php_params_{$c_phpVersion}; Glyph: 25
Type: submenu; Caption: "{$w_phpExtensions}"; SubMenu: php_ext_{$c_phpVersion}; Glyph: 4
Type: item; Caption: "php.ini [apache module]"; Glyph: 33; Action: run; FileName: "{$c_editor}"; parameters: "{$c_phpConfFile}"
Type: item; Caption: "{$w_PHPloadedExt}"; Action: run; FileName: "$c_phpExe"; Parameters: "msg.php phploadedextensions";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated; Glyph: 24
Type: item; Caption: "{$w_PHPversionsUse}"; Action: run; FileName: "$c_phpExe"; Parameters: "msg.php phpversionsusage";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated; Glyph: 24
{$NoPhpFCGI}Type: separator; Caption: "PHP [FCGI - CLI] - {$w_All_Versions}"
{$NoPhpFCGI}Type: submenu; Caption: "{$w_phpSettings} [FCGI - CLI]"; Submenu: phpparamsFCGICLI; Glyph: 4
{$NoPhpFCGI}Type: submenu; Caption: "{$w_phpExtensions} [FCGI - CLI]"; Submenu: phpextFCGICLI; Glyph: 4
Type: submenu; Caption: "php.ini [FCGI - CLI]"; Submenu: phpiniFCGICLI; Glyph: 33
Type: separator; Caption: "{$w_helpFile}";
Type: item; Caption: "{$w_phpLog}	({$logFilesSize['php_error.log']})"; Glyph: 33; Action: run; FileName: "{$c_logviewer}"; parameters: "{$c_installDir}/{$logDir}php_error.log"
Type: item; Caption: "{$w_changelog}"; Glyph: 33; Action: run; FileName: "{$c_editor}"; parameters: "{$c_phBinDir}/news.txt"
Type: item; Caption: "{$w_phpDoc}"; Action: run; FileName: "{$c_navigator}"; Parameters: "{$c_edge}http://www.php.net/manual/en/"; Glyph: 35
;WAMPPHPMENUEND

[phpparamsFCGICLI]
;WAMPPHPPARAMSALLSTART
;WAMPPHPPARAMSALLEND

[phpextFCGICLI]
;WAMPPHPEXTALLSTART
;WAMPPHPEXTALLEND

[phpVersion]
;WAMPPHPVERSIONSTART
;WAMPPHPVERSIONEND

[mysqlMenu]
;WAMPMYSQLMENUSTART
;WAMPMYSQLMENUEND

[mysqlVersion]
;WAMPMYSQLVERSIONSTART
;WAMPMYSQLVERSIONEND

[mariadbMenu]
;WAMPMARIADBMENUSTART
;WAMPMARIADBMENUEND

[mariadbVersion]
;WAMPMARIADBVERSIONSTART
;WAMPMARIADBVERSIONEND

[mysql_params]
Type: separator; Caption: "{$w_mysqlSettings}"
;WAMPMYSQL_PARAMSSTART
;WAMPMYSQL_PARAMSEND

[mariadb_params]
Type: separator; Caption: "{$w_mariaSettings}"
;WAMPMARIADB_PARAMSSTART
;WAMPMARIADB_PARAMSEND

[alias_dir]
;WAMPALIAS_DIRSTART
Type: separator; Caption: "{$w_aliasDirectories}"
Type: item; Caption: "{$w_addAlias}"; Action: multi; Actions: add_alias; Glyph: 34
Type: separator
;WAMPADDALIAS
;WAMPALIAS_DIREND

;WAMPPHP_PARAMSSTART
;WAMPPHP_PARAMSEND

;WAMPPHP_EXTSTART
;WAMPPHP_EXTEND


[add_alias]
;WAMPADD_ALIASSTART
Action: run; FileName: "$c_phpExe"; Parameters: "addAlias.php";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
{$Apache_Restart}
Action: run; FileName: "$c_phpCli"; Parameters: "refresh.php";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: readconfig
;WAMPADD_ALIASEND


[DoubleClickAction]
Action: about;

[apacheService]
;WAMPAPACHESERVICESTART
Type: separator; Caption: "{$w_apache}"
Type: item; Caption: "{$w_startResume}"; Action: service; Service: {$c_apacheService}; ServiceAction: startresume; Flags: ignoreerrors waituntilterminated; Glyph: 9
Type: item; Caption: "{$w_stopService}"; Action: service; Service: {$c_apacheService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated; Glyph: 11
Type: item; Caption: "{$w_restartService}"; Action: service; Service: {$c_apacheService}; ServiceAction: restart; Flags: ignoreerrors waituntilterminated; Glyph: 12
Type: separator
Type: item; Caption: "{$w_installService}"; Action: multi; Actions: ApacheServiceInstall; Glyph: 8
Type: item; Caption: "{$w_removeService}"; Action: multi; Actions: ApacheServiceRemove; Glyph: 26
{$Apache_Graceful}Type: Separator; Caption: "Graceful Restart"
{$Apache_Graceful}Type: item; Caption: "Graceful Restart"; {$Apache_Restart}; Glyph: 41
;WAMPAPACHESERVICEEND


;WAMPMYSQLSERVICESTART
;WAMPMYSQLSERVICEEND

;WAMPMARIADBSERVICESTART
;WAMPMARIADBSERVICEEND

[StartAll]
;WAMPSTARTALLSTART
Action: service; Service: {$c_apacheService}; ServiceAction: startresume; Flags: ignoreerrors waituntilterminated
{$SupportMySQL}Action: service; Service: {$c_mysqlService}; ServiceAction: startresume; Flags: ignoreerrors waituntilterminated
{$SupportMariaDB}Action: service; Service: {$c_mariadbService}; ServiceAction: startresume; Flags: ignoreerrors waituntilterminated
;WAMPSTARTALLEND

[StopAll]
;WAMPSTOPALLSTART
Action: service; Service: {$c_apacheService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
{$SupportMySQL}Action: service; Service: {$c_mysqlService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
{$SupportMariaDB}Action: service; Service: {$c_mariadbService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
;WAMPSTOPALLEND

[RestartAll]
;WAMPRESTARTALLSTART
Action: service; Service: {$c_apacheService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
{$SupportMySQL}Action: service; Service: {$c_mysqlService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
{$SupportMariaDB}Action: service; Service: {$c_mariadbService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
Action: service; Service: {$c_apacheService}; ServiceAction: startresume; Flags: ignoreerrors waituntilterminated
{$SupportMySQL}Action: service; Service: {$c_mysqlService}; ServiceAction: startresume; Flags: ignoreerrors waituntilterminated
{$SupportMariaDB}Action: service; Service: {$c_mariadbService}; ServiceAction: startresume; Flags: ignoreerrors waituntilterminated
;WAMPRESTARTALLEND

[RestartWampserver]
;WAMPRESTARTWAMPSERVERSTART
Action: service; Service: {$c_apacheService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
{$SupportMySQL}Action: service; Service: {$c_mysqlService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
{$SupportMariaDB}Action: service; Service: {$c_mariadbService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
Action: run; Filename: "ipconfig"; Parameters: "/flushdns"; ShowCmd: hidden; Flags: waituntilterminated
Action: run; FileName: "$c_phpExe"; parameters: "msg.php refreshLogs alllogs automatic";WorkingDir: "$c_installDir/scripts"; Flags: waituntilterminated
Action: run; Filename: "restart_wampserver.bat"; ShowCmd: hidden

[myexit]
;WAMPMYEXITSTART
Action: service; Service: {$c_apacheService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
{$SupportMySQL}Action: service; Service: {$c_mysqlService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
{$SupportMariaDB}Action: service; Service: {$c_mariadbService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
Action: exit
;WAMPMYEXITEND

[apache_mod]
;WAMPAPACHE_MODSTART
;WAMPAPACHE_MODEND

[ApacheServiceInstall]
;WAMPAPACHESERVICEINSTALLSTART
Action: run; FileName: "$c_phpExe"; Parameters: "testPortForInstall.php";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; FileName: "{$c_apacheExe}"; Parameters: "{$c_apacheServiceInstallParams}"; ShowCmd: hidden; Flags: waituntilterminated
Action: run; Filename: "sc"; Parameters: "config {$c_apacheService} start= demand"; ShowCmd: hidden; Flags: waituntilterminated
Action: resetservices
Action: readconfig
;WAMPAPACHESERVICEINSTALLEND

[ApacheServiceRemove]
;WAMPAPACHESERVICEREMOVESTART
Action: closeservices;  Flags: ignoreerrors
Action: service; Service: {$c_apacheService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
Action: run; FileName: "{$c_apacheExe}"; Parameters: "{$c_apacheServiceRemoveParams}"; ShowCmd: hidden; Flags: waituntilterminated
Action: resetservices
Action: readconfig
;WAMPAPACHESERVICEREMOVEEND

[UseAlternatePort]
;WAMPALTERNATEPORTSTART
Action: run; FileName: "$c_phpExe"; Parameters: "switchWampPort.php %ApachePort%";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: multi; Actions: apache_restart_refresh; Flags:appendsection
;WAMPALTERNATEPORTEND

[AddListenPort]
;WAMPADDLISTENPORTSTART
Action: run; FileName: "$c_phpExe"; Parameters: "ListenPortApache.php add %AddListenApachePort%";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: multi; Actions: apache_restart_refresh; Flags:appendsection
;WAMPADDLISTENPORTEND

[DeleteListenPort]
;WAMPDELETELISTENPORTSTART
;WAMPDELETELISTENPORTEND

;WAMPALTERNATEMYSQLPORTSTART
;WAMPALTERNATEMYSQLPORTEND

;WAMPALTERNATEMARIAPORTSTART
;WAMPALTERNATEMARIAPORTEND

;WAMPSWITCHMARIAMYSQLSTART
;WAMPSWITCHMARIAMYSQLEND

;WAMPSWITCHMYSQLMARIASTART
;WAMPSWITCHMYSQLMARIAEND

;WAMPMYSQLSERVICEINSTALLSTART
;WAMPMYSQLSERVICEINSTALLEND

;WAMPMYSQLSERVICEREMOVESTART
;WAMPMYSQLSERVICEREMOVEEND

;WAMPMARIADBSERVICEINSTALLSTART
;WAMPMARIADBSERVICEINSTALLEND

;WAMPMARIADBSERVICEREMOVESTART
;WAMPMARIADBSERVICEREMOVEEND

[submenu.tools]
;WAMPTOOLSSTART
Type: Separator; Caption: "{$w_wampTools}"
Type: item; Caption: "{$w_restartDNS}"; Action: multi; Actions: DnscacheServiceRestart; Glyph: 24
Type: item; Caption: "{$w_testServices}"; Action: run; FileName: "$c_phpExe"; Parameters: "msg.php stateservices";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated; Glyph: 24
Type: item; Caption: "{$w_dnsorder}"; Action: run; FileName: "$c_phpExe"; Parameters: "msg.php dnsorder";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated; Glyph: 24
Type: item; Caption: "{$w_compilerVersions}"; Action: run; FileName: "$c_phpExe"; Parameters: "msg.php compilerversions %AeTrayVersionBuild% %AeTrayOldModeBuild%";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated; Glyph: 24
Type: item; Caption: "{$w_verifySymlink}"; Action: run; Filename: "$c_phpExe"; Parameters: "refreshSymlink.php {$c_phpVersion} verifytool"; WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated; Glyph: 24
Type: item; Caption: "{$w_testAliasDir}"; Action: run; Filename: "$c_phpExe"; Parameters: "verifyAlias.php"; WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated; Glyph: 24
Type: item; Caption: "{$w_verifyxDebugdll}"; Action: run; FileName: "$c_phpExe"; Parameters: "msg.php checkXdebug";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated; Glyph: 24
Type: Item; Caption: "{$w_showExcludedPorts}"; Action: run; FileName: "$c_phpExe"; Parameters: "msg.php excludedportrange";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated; Glyph: 24
Type: submenu; Caption: "{$w_apacheTools}"; Submenu: ApacheTools; Glyph: 37
Type: separator; Caption: "{$w_portUsed}{$c_UsedPort}"
{$TplListenPorts}Type: separator; Caption: "Listen ports: {$ListenPorts}"
Type: item; Caption: "{$w_AddListenPort}"; Action: multi; Actions: AddListenPort; Glyph: 24
{$TplListenPorts}Type: submenu; Caption: "{$w_deleteListenPort}"; Submenu: DeleteListenPort; Glyph: 26
Type: item; Caption: "{$w_testPort80}"; Action: run; FileName: "$c_phpExe"; Parameters: "testPort.php 80 {$c_apacheService}";WorkingDir: "$c_installDir/scripts"; Flags: waituntilterminated; Glyph: 24
Type: item; Caption: "{$w_AlternatePort}"; Action: multi; Actions: UseAlternatePort; Glyph: 24
{$ApaTestPortUsed}Type: item; Caption: "{$w_testPortUsed}{$c_UsedPort}"; Action: run; FileName: "$c_phpExe"; Parameters: "testPort.php {$c_UsedPort} {$c_apacheService}";WorkingDir: "$c_installDir/scripts"; Flags: waituntilterminated; Glyph: 24
{$SupportMysqlAndMariaDB}Type: separator; Caption: "{$w_defaultDBMS} {$DefaultDBMS}"
{$SupportMysqlAndMariaDB}{$MariadbDefault}Type: item; Caption: "{$w_invertDefault}MariaDB <-> MySQL"; Action: multi; Actions: SwitchMariaToMysql; Glyph: 24
{$SupportMysqlAndMariaDB}{$MysqlDefault}Type: item; Caption: "{$w_invertDefault}MySQL <-> MariaDB"; Action: multi; Actions: SwitchMysqlToMaria; Glyph: 24
;WAMPMYSQLMARIADBTOOLSORDER
;WAMPPHPCLIMENUSTART
Type: separator; Caption: "Apache - PHP - MySQL - MariaDB"
Type: submenu; Caption: "{$w_deleteVer}"; Submenu: DeleteOldVersions; Glyph: 26
Type: submenu; Caption: "{$w_addingVer}"; Submenu: AddingVersions; Glyph: 35
Type: separator; Caption: "{$w_misc}"
Type: submenu; Caption: "{$w_cmdWindows}"; Submenu: CommandWindows; Glyph: 24
Type: submenu; Caption: "{$w_emptyLogs}"; Submenu: CleanLogFiles; Glyph: 24
Type: item; Caption: "{$w_reinstallServices}"; Action: multi; Actions: StopRemoveInstallStartAll; Glyph: 24
Type: Separator;
Type: item; Caption: "{$w_dowampReport}"; Action: multi; Actions: WampReport; Glyph: 24
;WAMPREPORTCONFFILE
;WAMPTOOLSEND

[CleanLogFiles]
Type: item; Caption: "{$w_emptyPHPlog}"; Action: run; FileName: "$c_phpExe"; parameters: "msg.php refreshLogs {$c_installDir}/{$logDir}php_error.log";WorkingDir: "$c_installDir/scripts"; Flags: waituntilterminated; Glyph: 32
Type: item; Caption: "{$w_emptyApaErrLog}"; Action: run; FileName: "$c_phpExe"; parameters: "msg.php refreshLogs {$c_installDir}/{$logDir}apache_error.log";WorkingDir: "$c_installDir/scripts"; Flags: waituntilterminated; Glyph: 32
Type: item; Caption: "{$w_emptyApaAccLog}"; Action: run; FileName: "$c_phpExe"; parameters: "msg.php refreshLogs {$c_installDir}/{$logDir}access.log";WorkingDir: "$c_installDir/scripts"; Flags: waituntilterminated; Glyph: 32
{$SupportMySQL}Type: item; Caption: "{$w_emptyMySQLog}"; Action: run; FileName: "$c_phpExe"; parameters: "msg.php refreshLogs {$c_installDir}/{$logDir}mysql.log";WorkingDir: "$c_installDir/scripts"; Flags: waituntilterminated; Glyph: 32
{$SupportMariaDB}Type: item; Caption: "{$w_emptyMariaLog}"; Action: run; FileName: "$c_phpExe"; parameters: "msg.php refreshLogs {$c_installDir}/{$logDir}mariadb.log";WorkingDir: "$c_installDir/scripts"; Flags: waituntilterminated; Glyph: 32
;WAMPCLEANLOGFILES
Type: item; Caption: "{$w_emptyAllLog}"; Action: multi; Actions: CleanAllLogFiles; Glyph: 24

[CleanAllLogFiles]
Action: run; FileName: "$c_phpExe"; parameters: "msg.php refreshLogs alllogs";WorkingDir: "$c_installDir/scripts"; Flags: waituntilterminated
Action: run; FileName: "$c_phpCli"; Parameters: "refresh.php doreport";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: readconfig

[CommandWindows]
Type: item; Caption: "{$w_apacheCommand}"; Action: run; FileName: "%Cmd%"; WorkingDir: "{$c_apacheBinDir}"; Flags: ignoreerrors; Glyph: 0
Type: item; Caption: "{$w_phpCommand}"; Action: run; FileName: "%Cmd%"; WorkingDir: "{$c_phBinDir}"; Flags: ignoreerrors; Glyph: 0
{$SupportMySQL}Type: item; Caption: "{$w_mysqlCommand}"; Action: run; FileName: "%Cmd%"; WorkingDir: "{$c_mysqlBinDir}"; Flags: ignoreerrors; Glyph: 0
{$SupportMariaDB}Type: item; Caption: "{$w_mariadbCommand}"; Action: run; FileName: "%Cmd%"; WorkingDir: "{$c_mariadbBinDir}"; Flags: ignoreerrors; Glyph: 0
Type: Separator;
Type: item; Caption: "{$w_services_msc}"; Action: controlpanelservices; Glyph: 25

[WampReport]
Action: run; FileName: "$c_phpExe"; Parameters: "msg.php stateservices doreport";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; FileName: "$c_phpExe"; Parameters: "msg.php dnsorder doreport";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; FileName: "$c_phpExe"; Parameters: "msg.php compilerversions %AeTrayVersionBuild% %AeTrayOldModeBuild% doreport";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; FileName: "$c_phpExe"; Parameters: "msg.php apachemodules doreport";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; FileName: "$c_phpExe"; Parameters: "msg.php apacheincludes doreport";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; FileName: "$c_phpExe"; Parameters: "msg.php apachedefine doreport";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; FileName: "$c_phpExe"; Parameters: "msg.php vhostconfig doreport";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; FileName: "$c_phpExe"; Parameters: "msg.php phploadedextensions doreport";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; FileName: "$c_phpExe"; Parameters: "msg.php phpversionsusage doreport";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; FileName: "$c_phpExe"; Parameters: "msg.php excludedportrange doreport";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; Filename: "$c_phpExe"; Parameters: "refreshSymlink.php {$c_phpVersion} verifytool doreport"; WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; FileName: "$c_phpExe"; Parameters: "testPort.php 80 {$c_apacheService} doreport";WorkingDir: "$c_installDir/scripts"; Flags: waituntilterminated
{$SupportMySQL}Action: run; FileName: "$c_phpExe"; Parameters: "testPort.php {$c_mysqlPortUsed} {$c_mysqlService} doreport";WorkingDir: "$c_installDir/scripts"; Flags: waituntilterminated
{$SupportMariaDB}Action: run; FileName: "$c_phpExe"; Parameters: "testPort.php {$c_mariadbPortUsed} {$c_mariadbService} doreport";WorkingDir: "$c_installDir/scripts"; Flags: waituntilterminated
Action: run; FileName: "$c_phpCli"; Parameters: "refresh.php doreport";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: readconfig

;WAMPMYSQLUSECONSOLEPROMPTSTART
;WAMPMYSQLUSECONSOLEPROMPTEND

;WAMPMARIADBUSECONSOLEPROMPTSTART
;WAMPMARIADBUSECONSOLEPROMPTEND

;WAMPPHPCLIVERSIONSSTART
;WAMPPHPCLIVERSIONEND

[DnscacheServiceRestart]
;WAMPDNSCACHESERVICESTART
Action: run; Filename: "ipconfig"; Parameters: "/flushdns"; ShowCmd: hidden; Flags: waituntilterminated
Action: multi; Actions: apache_restart_refresh; Flags:appendsection
;WAMPDNSCACHESERVICEEND

[DeleteOldVersions]
;WAMPDELETEOLDVERSIONSSTART
;WAMPDELETEOLDVERSIONSEND

[StopRemoveInstallStartAll]
;Apache service stop and remove
Action: closeservices; Flags: ignoreerrors
Action: service; Service: {$c_apacheService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
Action: run; Filename: "CMD"; Parameters: "/D /C sc stop {$c_apacheService}"; ShowCmd: hidden; Flags: waituntilterminated
Action: run; Filename: "CMD"; Parameters: "/D /C sc delete {$c_apacheService}"; ShowCmd: hidden; Flags: waituntilterminated
Action: run; Filename: "taskkill"; Parameters: "/FI ""IMAGENAME eq httpd.exe"" /T /F"; ShowCmd: hidden; Flags: waituntilterminated
;MySQL service stop and remove
{$SupportMySQL}Action: closeservices; Flags: ignoreerrors
{$SupportMySQL}Action: service; Service: {$c_mysqlService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
{$SupportMySQL}{$mysqlMysqlService}Action: run; FileName: "{$c_mysqlExe}"; Parameters: "{$c_mysqlServiceRemoveParams}"; ShowCmd: hidden; Flags: waituntilterminated
{$SupportMySQL}{$mysqlCmdScService}Action: run; FileName: "sc"; Parameters: "delete {$c_mysqlService}"; ShowCmd: hidden; Flags: waituntilterminated
{$SupportMySQL}Action: resetservices
;MariaDB service stop and remove
{$SupportMariaDB}Action: closeservices; Flags: ignoreerrors
{$SupportMariaDB}Action: service; Service: {$c_mariadbService}; ServiceAction: stop; Flags: ignoreerrors waituntilterminated
{$SupportMariaDB}{$mariaMysqlService}Action: run; FileName: "{$c_mariadbExe}"; Parameters: "{$c_mariadbServiceRemoveParams}"; ShowCmd: hidden; Flags: waituntilterminated
{$SupportMariaDB}{$mariaCmdScService}Action: run; FileName: "sc"; Parameters: "delete {$c_mariadbService}"; ShowCmd: hidden; Flags: waituntilterminated
{$SupportMariaDB}Action: resetservices
;Apache service install
Action: closeservices; Flags: ignoreerrors
Action: run; FileName: "$c_phpExe"; Parameters: "testPortForInstall.php reinstall";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: run; FileName: "{$c_apacheExe}"; Parameters: "{$c_apacheServiceInstallParams}"; ShowCmd: hidden; Flags: waituntilterminated
Action: run; Filename: "sc"; Parameters: "config {$c_apacheService} start= demand"; ShowCmd: hidden; Flags: waituntilterminated
;MySQL service install
{$SupportMySQL}{$mysqlMysqlService}Action: run; FileName: "{$c_mysqlExe}"; Parameters: "{$c_mysqlServiceInstallParams}"; ShowCmd: hidden; Flags: ignoreerrors waituntilterminated
{$SupportMySQL}{$mysqlCmdScService}Action: run; FileName: "sc"; Parameters: "create {$c_mysqlService} binpath=""{$c_mysqlExeAnti} --defaults-file={$c_mysqlConfFileAnti} {$c_mysqlService}"""; ShowCmd: hidden; Flags: ignoreerrors waituntilterminated
{$SupportMySQL}Action: resetservices
;MariaDB service install
{$SupportMariaDB}{$mariaMysqlService}Action: run; FileName: "{$c_mariadbExe}"; Parameters: "{$c_mariadbServiceInstallParams}"; ShowCmd: hidden; Flags: ignoreerrors waituntilterminated
{$SupportMariaDB}{$mariaCmdScService}Action: run; FileName: "sc"; Parameters: "create {$c_mariadbService} binpath=""{$c_mariadbExeAnti} --defaults-file={$c_mariadbConfFileAnti} {$c_mariadbService}"""; ShowCmd: hidden; Flags: ignoreerrors waituntilterminated
{$SupportMariaDB}Action: resetservices
;Apache service start
Action: service; Service: {$c_apacheService}; ServiceAction: startresume; Flags: ignoreerrors waituntilterminated;
;MySQL service start
{$SupportMySQL}Action: service; Service: {$c_mysqlService}; ServiceAction: startresume; Flags: ignoreerrors waituntilterminated;
;MariaDB service start
{$SupportMariaDB}Action: service; Service: {$c_mariadbService}; ServiceAction: startresume; Flags: ignoreerrors waituntilterminated;
Action: resetservices
Action: RestartReadConfig

;WAMPCOMMONAPPENDACTIONS
[apache_restart_refresh]
{$Apache_Restart}
Action: multi; Actions: refresh_readconfig; Flags:appendsection

[apache_stop_start_refresh]
Action: Service; Service: {$c_apacheService}; ServiceAction: restart; Flags: ignoreerrors waituntilterminated
Action: multi; Actions: refresh_readconfig; Flags:appendsection

{$GotoMySQLRestart}
{$GotoMariaDBRestart}

[refresh_readconfig]
Action: run; FileName: "$c_phpCli";Parameters: "refresh.php";WorkingDir: "{$c_installDir}/scripts"; Flags: waituntilterminated
Action: RestartReadConfig

[Timer]
NumberStart={$wamp_Ini['NumberStart']}
CountStart={$wamp_Ini['CountStart']}

[ScreenWaitMessage]
TitleApplication=Wampserver {$c_wampMode}
ServicesStatus1={$w_startOfServices}
ServicesStatus2={$w_servicesStarted}
WaitMessage1={$w_bepatient}
WaitMessage2={$w_ready}
WaitMessage3={$w_warning}
LongProcessing=1
LongProcessingScreen=1
WaitRestartReadConfig={$w_waitConfig}

EOTPL;

?>
