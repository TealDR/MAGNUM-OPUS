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
Pause
cls
echo SAVES
echo ----------------------
echo Type 1 to choose Save Slot 1
echo Type 2 to choose Save Slot 2
set /p input=
if %input%==1 set /a save=1
if %input%==2 set /a save=2
goto load

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
goto menu


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

:menu
echo Hp: %hp% / %maxhp%       Level: %level%       XP: %xp% / %xprequired%
echo Battle | Go into the battle menu
echo Rest   | Resting heals you to max HP.
echo Save   | Save current progress
set /p input= 
if %input%==Battle goto battle
if %input%==Rest set /a hp=%maxhp%
if %input%==Save goto save
goto menu

