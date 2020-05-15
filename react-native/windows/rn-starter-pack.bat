@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

:MENU
ECHO.
ECHO ============================================================
ECHO Run This Only In Your RN Project Root Directory
ECHO ============================================================
ECHO.
ECHO 1 - Start ADB
ECHO 2 - Start Metro Server
ECHO 3 - Start Run Android
ECHO 4 - Start Android Debugger
ECHO 5 - Blank Command Prompt
ECHO 99 - Exit
ECHO.
SET /P "Menu=Enter Your Choice : "
IF %Menu%==1 GOTO ADB
IF %Menu%==2 GOTO METRO
IF %Menu%==3 GOTO ANDROID
IF %Menu%==4 GOTO DEBUGGER
IF %Menu%==5 GOTO BLANK
IF %Menu%==99 GOTO EXIT_FFS

:ADB
ECHO ==================== ADB ====================
SET "ip=192.168.31.19" 
SET "port=5555"
SET /p adb_server="Run ADB w/o Killing ? (y/n) : "
IF %adb_server%==y (
    ECHO Starting ADB Server...
    START CMD /k "adb tcpip %port% && adb connect %ip%"
) ELSE (
    IF %adb_server%==n (
        ECHO Killing ADB Server...
        START CMD /k "adb kill-server && adb tcpip %port% && adb connect %ip%"
    ) ELSE (
        ECHO Skipping ADB Server...
    )
    
)
GOTO MENU

:METRO
ECHO ==================== Metro Server ====================
SET /p metro_server="Start React Native Metro Server w/o Cache ? (y/n) : "
IF %metro_server%==y (
    ECHO Starting Metro Server...
    START CMD /k "react-native start"
) ELSE (
    IF %metro_server%==n (
        ECHO Resetting Cache...
        START CMD /k "react-native start --reset-cache"
    ) ELSE (
        ECHO Skipping Metro Server...
    )
    
)
GOTO MENU

:ANDROID
ECHO ==================== Run Android ====================
SET /p application="Start React Native Application w/o Gradle Clean ? (y/n) : "
IF %application%==y (
    ECHO Running Android...
    START CMD /k "react-native run-android"
) ELSE (
    IF %application%==n (
        ECHO Running Android...
        START CMD /k "cd android && gradlew clean && cd .. && react-native run-android"
    ) ELSE (
        ECHO Skipping RN Application...
    )
)
GOTO MENU

:DEBUGGER
ECHO ========== WARNING (Use Only If You Know What's This FFS) ==========
SET /p logger="Do You Want To Run Logger ? (y/n) : "
IF %logger%==n (
    ECHO Skipping Logger...
) ELSE (
    SET /p specStr="Scan Specific String ? (y/n) : "
    IF !specStr!==y (
        SET /p logger_string="Enter String ?  : "
        ECHO Starting Android Debug Logger On !logger_string! ...
        START CMD /k "adb logcat | findstr !logger_string!"
    ) ELSE (
        ECHO Starting Android Debug Logger...
        START CMD /k "adb logcat"
    )
)
GOTO MENU

:BLANK
START CMD.exe
GOTO MENU

:EXIT_FFS
PAUSE