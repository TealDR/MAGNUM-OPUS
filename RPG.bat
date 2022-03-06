:start
@echo off
title Epic RPG Game (Patent Pending)
echo RULES
echo ----------------------
echo This game is property of ME
echo Please do not claim this as yours!

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
goto settings2

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
if %input%==1 goto load1
if %input%==2 goto load2

:load1
(
set /a money=
set /a level=
)<RPG1.dlb
set /a Save=1

:load2
(
set /a money=
set /a level=
)<RPG2.dlb
set /a Save=2

:save
if %save%=1 goto save1
if %save%=2 goto save2

:save1

:save2
