:user_configuration

:: Path to Flex SDK
if defined FLEX_SDK goto manual_flexsdk
:: Windows uses version-sort by default, instead of simple string comparison.
:: The result is that the highest version of the SDK installed will be last.
for /d %%D in ( "%LOCALAPPDATA%\FlashDevelop\Apps\flexairsdk\*" ) DO set FLEX_SDK=%%D

:manual_flexsdk
set AUTO_INSTALL_IOS=yes

:: Path to Android SDK
if defined ANDROID_SDK goto validation
set ANDROID_SDK=C:\Program Files (x86)\FlashDevelop\Tools\android


:validation
if not exist "%FLEX_SDK%\bin" goto flexsdk
if not exist "%ANDROID_SDK%\platform-tools" goto androidsdk
goto succeed

:flexsdk
echo.
echo ERROR: incorrect path to Flex SDK in 'bat\SetupSDK.bat'
echo.
echo Looking for: %FLEX_SDK%\bin
echo.
if %PAUSE_ERRORS%==1 pause
exit

:androidsdk
echo.
echo ERROR: incorrect path to Android SDK in 'bat\SetupSDK.bat'
echo.
echo Looking for: %ANDROID_SDK%\platform-tools
echo.
if %PAUSE_ERRORS%==1 pause
exit

:succeed
set PATH=%FLEX_SDK%\bin;%PATH%
set PATH=%PATH%;%ANDROID_SDK%\platform-tools

