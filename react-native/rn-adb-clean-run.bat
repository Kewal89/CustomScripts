@ECHO OFF
ECHO ========================================================
set /p a="Run Android Along With ADB (y/n) ? : "
ECHO ========================================================
set "ip=<add-ip-here-192.168.x.x>"
set "port=<add-port-here-default-5555>"
IF %a%==y (
	SET /p "b=Clean Gradle And Run Android (y/n) ? : "
	IF %b%==y (
		ECHO Cleaning Gradle... 
		CMD /k "cd android && gradlew clean && cd .. && adb kill-server && adb tcpip %port% && adb connect %ip% && echo. Running Android... && react-native run-android"
	) ELSE (
		ECHO Running Android Without Cleaning Gradle... 
		CMD /k "adb kill-server && adb tcpip %port% && adb connect %ip% && react-native run-android"
		) 
) ELSE (
	ECHO Starting ADB Server Without Running Android... 
	CMD /k "adb kill-server && adb tcpip %port% && adb connect %ip%"
	)

ECHO Finished
ECHO ========================================================
PAUSE
