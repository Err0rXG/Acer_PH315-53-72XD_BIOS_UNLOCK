@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo Requesting administrative privileges...
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject("Shell.Application") > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"

	echo          ------------------------------------------------------
	echo.
	echo               FPRR Disabler for Insyde BIOS w/ Intel ME 14
	echo.
	echo          ------------------------------------------------------
	echo.
	pause
@rem======================================================================
@rem
@rem  Start
@rem
@rem======================================================================
if exist vars_temp.txt ( del vars_temp.txt )
if exist varsNEW.txt ( del varsNEW.txt )
cls
@echo off
WDFInst.exe
H2OUVE-W-CONSOLEx64.exe -gv vars.txt -n PchSetup
if not exist "vars.txt" (
	echo. & echo FAIL!!! Wrong device. & echo Exiting...
	timeout 5 >nul
	exit
)
echo Applying changes...
echo.
powershell -Command "(gc vars.txt) -replace '00000010: (.{20}) 01 (.*)', '00000010: $1 00 $2' | Out-File vars_temp.txt -Encoding ASCII"
powershell -Command "(gc vars_temp.txt) -replace '000006D0: (.{38}) 01 (.*)', '000006D0: $1 00 $2' | Out-File varsNEW.txt -Encoding ASCII"
H2OUVE-W-CONSOLEx64.exe -sv varsNEW.txt
timeout 3 >nul
cls
echo Cleaning up...
if exist vars_temp.txt ( del vars_temp.txt )
if exist varsNEW.txt ( del varsNEW.txt )
timeout 3 >nul
cls
echo Done!
echo You may reboot this computer and proceed to flashing a BIOS mod. Closing automaticly in 10 seconds...
timeout 10 >nul
exit