@echo off
echo This script will now prepare the files for using SoundBox

if exist ..\SoundBox goto has_folder
echo Creating the folders...
mkdir ..\SoundBox
mkdir ..\SoundBox\sound
mkdir ..\SoundBox\img
echo You can now put your media files into the subfolders found at World of Warcraft\Interface\Addons\SoundBox
goto end_of_file

:has_folder
echo Creating the TOC...
echo ## Interface: 90002 > ..\SoundBox\SoundBox.toc
echo ## Title: SoundBox >> ..\SoundBox\SoundBox.toc
echo ## Notes: Play some sounds :v >> ..\SoundBox\SoundBox.toc
echo ## Author: Endouken >> ..\SoundBox\SoundBox.toc
echo ## Dependencies: SharedMedia >> ..\SoundBox\SoundBox.toc
echo main.lua >> ..\SoundBox\SoundBox.toc
echo SharedMedia.lua >> ..\SoundBox\SoundBox.toc
echo Creating the file...
echo local LSM = LibStub("LibSharedMedia-3.0") > ..\SoundBox\SoundBox.lua

echo    SOUND
echo.>> ..\SoundBox\SoundBox.lua
echo -- ----->> ..\SoundBox\SoundBox.lua
echo --   SOUND>> ..\SoundBox\SoundBox.lua
echo -- ----->> ..\SoundBox\SoundBox.lua
for %%F in (..\SoundBox\sound\*.*) do (
echo       %%~nF
echo LSM:Register("sound", "SoundBox:%%~nF", [[Interface\Addons\SoundBox\sound\%%~nxF]]^) >> ..\SoundBox\SoundBox.lua
)

echo    IMG
echo.>> ..\SoundBox\SoundBox.lua
echo -- ----->> ..\SoundBox\SoundBox.lua
echo --   IMG>> ..\SoundBox\SoundBox.lua
echo -- ----->> ..\SoundBox\SoundBox.lua
for %%F in (..\SoundBox\img\*.*) do (
echo       %%~nF
echo LSM:Register("statusbar", "SoundBox:%%~nF", [[Interface\Addons\SoundBox\img\%%~nxF]]^) >> ..\SoundBox\SoundBox.lua
)

:end_of_file
pause