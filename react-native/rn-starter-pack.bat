@ECHO OFF
ECHO ==================== ADB ====================
SET "ip=<add-ip-here>" 
SET "port=<add-port-here>"
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

ECHO ==================== Metro Server ====================
SET /p metro_server="Start React Native Metro Server w/o Cache ? (y/n) : "
IF %metro_server%==y (
    ECHO Starting Metro Server...
    START CMD /k "react-native START"
) ELSE (
    IF %metro_server%==n (
        ECHO Resetting Cache...
        START CMD /k "react-native start --reset-cache"
    ) ELSE (
        ECHO Skipping Metro Server...
    )
    
)
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

REM ECHO ========== WARNING (Use Only If You Know What's This FFS) ==========
REM SET /p logger="Do You Want To Run Logger ? (y/n) : "
REM IF %logger%==y (
REM     SET /p specStr="Scan Specific String ? (y/n) : "
REM     IF "%spec%"=="" (
REM         SET /p logger_string="Enter String ?  : "
REM         ECHO Starting Android Debug Logger On %logger_string% ...
REM         START CMD /k "adb logcat | findstr %logger_string%"
REM     ) ELSE (
REM         ECHO Starting Android Debug Logger...
REM         START CMD /k "adb logcat"
REM     )
REM ) ELSE (
REM     ECHO Skipping Logger... 
REM )
PAUSE
