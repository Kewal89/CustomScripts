@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

:MENU
ECHO.
ECHO ============================================================
ECHO Run This Only In Your RN Project Root Directory
ECHO ============================================================
ECHO.
ECHO ========== GENERATE APK ==========
ECHO 1 - GENERATE DEBUG APK
ECHO 2 - GENERATE RELEASE APK
ECHO 3 - Exit
ECHO.
SET /P "Menu=Enter Your Choice : "
IF %Menu%==1 GOTO DEBUG
IF %Menu%==2 GOTO RELEASE
IF %Menu%==3 GOTO EXIT_FFS


:DEBUG
ECHO Generating Debug APK... 
CMD /k "react-native bundle --dev false --platform android --entry-file index.js --bundle-output ./android/app/src/main/assets/index.android.bundle --assets-dest ./android/app/src/main/res && cd android && gradlew assembleDebug"
ECHO ========== GENERATED DEBUG APK ==========
GOTO MENU

:RELEASE
ECHO Generating Release APK...
CMD /k "react-native bundle --dev false --platform android --entry-file index.js --bundle-output ./android/app/src/main/assets/index.android.bundle --assets-dest ./android/app/src/main/res && cd android && gradlew assembleRelease"
ECHO ========== GENERATED RELEASE APK ==========
GOTO MENU

:EXIT_FFS
ECHO Exiting
PAUSE

