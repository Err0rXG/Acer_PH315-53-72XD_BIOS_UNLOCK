@rem======================================================================
@rem
@rem  Confirmation.
@rem
@rem======================================================================
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

	echo          ----------------------------------
	echo.
	echo          Acer Predator PH315-53 BIOS Unlock
	echo.
	echo          ----------------------------------
	echo.
	echo	Continuing, you begin the process of BIOS modding.
	echo.
	pause

if exist MOD.bin ( del MOD.bin )
	
rem======================================================================
rem
rem  Reading.
rem
rem======================================================================
cls

	echo.
	echo.
	echo          ------------------------------------------
	echo.
	echo               FPTW64.exe -d ORIGINAL.bin -bios
	echo.
	echo          ------------------------------------------
	echo.
	echo.

CD /D "%~dp0"
FPTW64.exe -d ORIGINAL.bin -bios

	echo BIOS read operation was performed.
	echo.
	pause

rem======================================================================
rem
rem  Patching.
rem
rem======================================================================
cls

	echo.
	echo.
	echo          -----------------------------------------------
	echo.
	echo               UEFIPatch.exe ORIGINAL.bin -o MOD.bin
	echo.
	echo          -----------------------------------------------
	echo.
	echo.

@echo off
cd /d "%~dp0"
If not exist ORIGINAL.bin goto error
UEFIPatch.exe ORIGINAL.bin -o MOD.bin
If not exist MOD.bin goto error1
echo.
pause
goto end
:error
	echo		   "ORIGINAL.bin" is not found!!!
	echo MAKE SURE THE SCRIPT IS RUNNING ON THE CORRECT TARGET DEVICE
	echo.
	echo Error, closing in 5 seconds...

timeout 5 >nul
goto exit
:error
	echo		   "MOD.bin" cannot be produced!!!
	echo                YOUR BIOS WAS ALREADY PATCHED
	echo        OR THE SCRIPT IS RUNNING ON INCORRECT DEVICE
	echo.
	echo Error, closing in 5 seconds...

timeout 5 >nul
goto exit

:end
rem======================================================================
rem
rem  Writing.
rem
rem======================================================================
cls

	echo.
	echo.
	echo          -------------------------------------
	echo.
	echo               FPTW64.exe -f MOD.bin -bios
	echo.
	echo          -------------------------------------
	echo.
	echo.


@echo off
cd /d "%~dp0"
FPTW64.exe -f MOD.bin -bios
	
	echo.
	echo Press any key to exit.

pause>nul
:exit
exit