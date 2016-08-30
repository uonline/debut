@echo off & setlocal enabledelayedexpansion
cd /D %~dp0
cd ..
echo -- DO NOT EDIT^^!> deps.lua
echo -- This file was generated automatically>> deps.lua
echo -- using tools/gendeps.bat.>> deps.lua
echo.>> deps.lua

for /R engine %%x in (*.lua) do (
	set p=%%~dpnxx
	set p=!p:%cd%\=!
	set p=!p:\=/!
	echo dofile '!p!'>> deps.lua
)
echo.>> deps.lua
for /R src %%x in (*.lua) do (
	set p=%%~dpnxx
	set p=!p:%cd%\=!
	set p=!p:\=/!
	echo dofile '!p!'>> deps.lua
)