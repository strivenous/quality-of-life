@echo off
set true=1==1
set false=1==0 
:: %true% and %false% for variables

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

ascii=pathhere.txt rem ascii banner (optional) path
mesg=pathhere.txt  rem message text file path
:: @TODO or optionally download from pastebin 

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


if defined PROGRAMFILES(X86) (
	arch=64 bits


	) else (

	arch=32 bits

	)
	:: @TODO revamp this to PROCESSOR_ARCHITECTURE

cls
ping google.com -n 1 -w 1000
if errorlevel 1 (
	set networkonline=%false%
	) else (

	set networkonline=%true%

	) if networkonline=%true% (

	set networkonline=ONLINE 

	) if networkonline=%false% (

	set networkonline=OFFLINE

	)
:: checks network connectivity via ping and errorlevel
:: sets variable for ping
:: @TODO add colors
cls
::::

for /f tokens^=^3 %%i in ('Reg Query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ReleaseId')do echo/%%i && set windowsbuild=%%i
:: for number in registry command set to variable %windowsbuild%
cls 

::::
for /F "tokens=3" %%a IN ('reg query "HKCU\Control Panel\Desktop" /v PreferredUILanguages ^| find "PreferredUILanguages"')do echo/%%a set UILanguage=%%a
cls
:: find current display UI language, there is a difference between local user machine, system and user or bcd

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: @TODO could make this into a function later for expansion
type %ascii%
echo,
echo,
echo Network Connectivity: %networkonline% - Architecture: %arch% - System Display Language: %UILanguage%
echo %TIME% %DATE%
start cmd.exe /k "netsh interface show interface"
type %mesg%
pause
:: the end










