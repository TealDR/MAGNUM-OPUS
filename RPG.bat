:start
@echo off
title Epic RPG Game (Patent Pending)
echo RULES
echo ----------------------
echo This game is property of ME
echo Please do not claim this as yours!
set /a money=0
set /a level=1
set /a xp=0
set /a xprequired=100
set /a maxhp=100
set /a hp=100
set /a location=tutorial
set /a 0=0

:settings1
Pause
cls
echo SETTINGS
echo ----------------------
echo Type 1 for Dark Mode
echo Type 2 for Light Mode
set /p Input=
if %input%==1 goto darkmode
if %input%==2 goto lightmode
goto settings1

:darkmode
COLOR 07
goto settings2
:lightmode
COLOR 70
goto settings2

:settings2
cls
echo SAVES
echo ----------------------
echo Type 1 to choose Save Slot 1
echo Type 2 to choose Save Slot 2
set /p input= 
if %input%==1 goto settings3
if %input%==2 goto settings3
:settings3
set /a save=%input%
goto settings4
cls
echo Is this a new save file?
set /p input=Y/N 
if %input%==Y goto save
if %input%==N goto load

:load
(
set /a money=
set /a level=
set /a xp=
set /a xprequired=
set /a maxhp=
set /a hp=
set /a location=
)<RPG%save%.dlb
goto %location%


:save
(
echo %money%
echo %level%
echo %xp%
echo %xprequired%
echo %maxhp%
echo %hp%
echo %location%
)>RPG%save%.dlb
goto %location%


:tutorial
Pause
cls
echo TUTORIAL
echo ----------------------
echo Welcome to the world of Ghantifell.
echo This tutorial will tell you how to operate the game.
Pause
cls
echo TUTORIAL
echo ----------------------
echo Below this text is the menu.
echo On the top, there is your Money and Level. Money can be used to purchase items. Money is obtained through battling. Your level quantifies your strength and HP.
echo On the left, it has the input required to do the action. On the right, there is the action
echo Input Battle to move onto the Battle menu.
echo Once you are in the battle menu, input the difficulty level as 1.
:menu
set /a location=menu
set /a maxhp=%level% * 50 + 50
if %xp% gtr %xprequired% goto levelup
if %xp%==%xprequired% goto levelup
echo Hp: %hp% / %maxhp%       Level: %level%       XP: %xp% / %xprequired%
echo Battle | Go into the battle menu
echo Rest   | Resting heals you to max HP.
echo Save   | Save current progress
set /p input= 
if %input%==Battle goto battle
if %input%==Rest set /a hp=%maxhp%
if %input%==Save goto save
goto menu

:levelup
set /a xp=%xp%-%xprequired%
set /a level=%level% + 1
set /a xprequired=%level% * 100
goto menu

:battle
set /p input=Input a difficulty level. 
set /a location=%input%
set /a enemyhp=%location% * 75
set /a enemymaxhp=%location% * 75
set /a attack=%level% * 5
set /a enemyattack=%location% * 5
:fight
echo    You                    Enemy
echo  %hp%/%maxhp%     %enemyhp% / %enemymaxhp%
echo     %attack%               %enemyattack%
echo.
echo Press any button to start fighting
pause

:attacking
if %hp% lss %0% goto lose
if %enemyhp% lss %0% goto win
timeout /nobreak >nul 1
set /a enemyhp=%enemyhp% - %attack%
set /a hp=%hp% - %enemyattack%
cls
echo    You                    Enemy
echo  %hp%/%maxhp%     %enemyhp% / %enemymaxhp%
echo     %attack%               %enemyattack%
goto attacking


:win
cls
echo YOU WIN!
set /a %xp%=%xp% + %location% * 25

:lose
cls
echo YOU LOSE!
goto menu
set /a hp=0
