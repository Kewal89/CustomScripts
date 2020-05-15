@ECHO OFF
ECHO ========== GENERATE APK ==========
set /p a="Debug (D) Or Release (R) APK ? : "
IF %a%==D (
    echo Generating Debug APK... 
    cmd /k "react-native bundle --dev false --platform android --entry-file index.js --bundle-output ./android/app/src/main/assets/index.android.bundle --assets-dest ./android/app/src/main/res && cd android && gradlew assembleDebug"
)  ELSE (
    IF %a%==R (
        echo Generating Release APK...
        cmd /k "react-native bundle --dev false --platform android --entry-file index.js --bundle-output ./android/app/src/main/assets/index.android.bundle --assets-dest ./android/app/src/main/res && cd android && gradlew assembleRelease"
    )   ELSE (
        echo Invalid Input... Exiting...
    )
)
ECHO ========== GENERATED APK ==========
PAUSE
