REM I started this back in my android days(which im still in??)
REM Now I'm too lazy too update since computer is stupid
REM naw
REM Don't count on regularly updates, at all.
@ECHO off

 :MENU
ECHO Welcome To covxx's Android Toolkit (that isn't and never will be done bc lazy srry)
ECHO ===================================================================================
ECHO Using this tool at your own risk
ECHO Any issues please report in the forum
ECHO Remember to give thanks if this helped
ECHO + + + + + + + + + + + + + + + + + + +
ECHO This is in kinda-active development 
ECHO Beta 3 12/2/14 
ECHO ====================================================================================
ECHO 1. ADB Commands
ECHO 2. Info
ECHO 3. Help
ECHO 4. Devices
ECHO 5. EXIT 
ECHO.
SET INPUT=
SET /P INPUT=SELECT NUMBER OF OPTION:  

IF /I '%INPUT%'=='1' GOTO ADB
IF /I '%INPUT%'=='2' GOTO INFO
IF /I '%INPUT%'=='3' GOTO HELP
IF /I '%INPUT%'=='4' GOTO DEVICE
IF /I '%INPUT%'=='5' GOTO TOOLS
IF /I '%INPUT%'=='6' GOTO QUIT

	:TOOLS
	REM HEY UPDATE FINALY AFTER 15+ DAYS GO COVXX!!!!!!!!!!!!!!!!!
	cls
	ECHO -----------------------------------
	ECHO +           Tool Menu             +
	ECHO -----------------------------------
	ECHO 1. Get Unlock thing for HTCDEV
	ECHO 2. Set SE to permissive  
	ECHO 5. Menu 
	ECHO.
	
SET INPUT=
SET /P INPUT=SELECT NUMBER OF OPTION:  
IF /I '%INPUT%'=='1' GOTO UNLOCKHTC
IF /I '%INPUT%'=='3' GOTO SETO0
IF /I '%INPUT%'=='5' GOTO MENU

:SETO0
REM Lets set se to permissive 
REM yay
print "you need root for this (use towel root) and busybox installed"
print " make sure ADB debugging is on too"
print "k lets get it"
adb
adb shell 
print "if there is any ever around here your device is recognized"
su
print "Check phone for super user pop up"
setenforce 0
print " k now go do your thing (you have 20 seconds)"
pause 20
GOTO MENU

:UNLOCKHTC
cls
@echo off
cd C:\Users\covxx_2\Desktop\adb_fastboot_drivers
print "now where the adb shit is"
print "make sure you're in fastboot mode"
pause 5
print "now getting unlock token"
fastboot oem get_identifier_token
ECHO I dont know if this works but copy and paste the thing above
pause 10
GOTO MENU

 :INFO
CLS
ECHO            Info
ECHO -----------------------------------
ECHO I started this project 
ECHO because I was tired of 
ECHO having to use different toolkits
ECHO for each device, Thus this was born
ECHO This will be re-written in C one day
ECHO when I get bored like now.
ECHO -----------------------------------
ECHO I'll add more here someday
ECHO Version: Beta 1 (this is probably outdated)
ECHO Press enter when ready to go back
PAUSE
GOTO MENU

 :HELP
REM ECHO For help with 
ECHO This isn't coded
ECHO Press enter when ready to go back
GOTO MENU
REM this isn't done and probably wont ever be 
 :DEVICE
 CLS
ECHO All device specific things
ECHO More will be added soon
ECHO ----------------------------
ECHO 1. Galaxy S4 VZW
ECHO 2. HTC DNA
ECHO 3. Firestick TV
ECHO 4. Nexus 4
ECHO ----------------------------
SET INPUT=
SET /P INPUT=SELECT NUMBER OF OPTION:  

IF /I '%INPUT%'=='1' GOTO GS4VZW
IF /I '%INPUT%'=='2' GOTO DNA
IF /I '%INPUT%'=='4' GOTO NEXUS4
IF /I '%INPUT%'=='3' GOTO firestick
IF /I '%INPUT%'=='5' GOTO x

	:firestick
	CLS 
	ECHO Wanna sideload some apks?
	ECHO I know you wanna :)
	ECHO --------------------------
SET input=
SET /P INPUT=yes or no:
IF /I '%INPUT%'=='yes' GOTO APKSIDELOADFIRE
IF /I '%INPUT%'=='no' GOTO MENU

	:APKSIDELOADFIRE
	CLS
	ECHO ---------------------
	EHCO The APK has to be in this folder
	ECHO And named sideload.apk 
	ECHO (this is bash :( )
	ECHO ------------------------
	ECHO HIT a button when ready
	pause
	REM ADB connect IP ADDRESS ( need to figure out how to use variables here)
	
	
 :DNA
 ECHO Nothing here as of now
 ECHO To go back
 GOTO MENU
 PAUSE
 
 :GS4VZW

CLS
cd devices\GS4\rootmdk\
ECHO This will only work for Galaxy S4 on Verizon on VRUAMDK build
ECHO =============================================================
ECHO 1.Start root - after pre- release kernel is flashed-
ECHO 2.How to root
REM ECHO 3.
ECHO 4.Go back to main menu
ECHO.
SET INPUT=
SET /P INPUT=SELECT NUMBER OF OPTION:  

IF /I '%INPUT%'=='1' GOTO S4ROOTVZW
IF /I '%INPUT%'=='2' GOTO ROOTS4VZW
REM IF /I '%INPUT%'=='3' GOTO 
IF /I '%INPUT%'=='4' GOTO MENU
IF /I '%INPUT%'=='5' GOTO QUIT

 :S4ROOTVZW

CLS
ECHO =====================================
ECHO =Thanks to Dan Rosenberg (@djrbliss)=
ECHO =This motochopper -made by @djrbliss=
ECHO =This can break your phone,if you do not my fault=
ECHO =Or Dan=
ECHO =Or anyone other then you=
ECHO =Enjoy root though (~:=
ECHO =Press enter to root your phone...=
ECHO ===================================
PAUSE
ECHO.
adb kill-server
ECHO Waiting for device...
adb wait-for-device
ECHO Device found.
ECHO Pushing exploit...
adb push pwn /data/local/tmp/
adb shell chmod 755 /data/local/tmp/pwn
ECHO Pushing root tools...
adb push su /data/local/tmp/
adb push busybox /data/local/tmp/
adb install Superuser.apk
ECHO Rooting phone...
ad shell /data/local/tmp/pwn
ECHO Cleaning up...
adb shell rm /data/local/tmp/pwn
adb shell rm /data/local/tmp/su
adb shell rm /data/local/tmp/busybox
ECHO Exploit complete. Press enter to reboot
PAUSE
adb reboot
adb kill-server
ECHO now flash the stock kernel
ECHO opening odin..
ECHO .
tools\odin\odin3.exe
GOTO MENU

 :sideload
CLS
ECHO SIDELOAD
ECHO -------------------------------------------------------
ECHO Are you ready to side-load?
ECHO Remember to make sure the package name is 'update.zip'
ECHO and its in the root folder
ECHO When you're ready hit enter
ECHO. 
PAUSE
adb side-load toolkit\update.zip
GOTO MENU

:4p
 CLS
 ECHO This will change your install location to 
 ECHO your phone's memory. This is for Android devices
 ECHO on 4.0 and below. 
 ECHO --------------------------
 ECHO Your device must have adb debugging enabled
 ECHO press enter when ready
 PAUSE
 adb kill-server
 ECHO Waiting for device...
 adb wait-for-device
 ECHO Device found.
 ECHO Setting install to phone
 adb shell pm setInstallLocation 0
 ECHO Completed,
 PAUSE
 GOTO MENU 
 
 :4xp
 CLS
 ECHO This will change your install location to 
 ECHO your phone's memory. This is for Android devices
 ECHO on 4.0 and below. 
 ECHO --------------------------
 ECHO Your device must have adb debugging enabled
 ECHO press enter when ready
 PAUSE
 adb kill-server
 ECHO Waiting for device...
 adb wait-for-device
 ECHO Device found.
 ECHO Setting install to phone
adb shell pm set-install-location 0
 ECHO Completed,
 PAUSE
 GOTO MENU 
 
    :installphone
CLS
ECHO Change install location to SD
ECHO -------------------------------
ECHO If android 4.0 and below type 1
ECHO If android 4.x and above type 2
ECHO --------------------------------
ECHO.
SET INPUT=
SET /P INPUT=SELECT NUMBER OF OPTION:  
IF /I '%INPUT%'=='1' GOTO 4p
IF /I '%INPUT%'=='2' GOTO 4xp

 :ADB
CLS
ECHO ADB Commands
ECHO --------------
ECHO 1.Side load
ECHO 2.Change install location to SD
ECHO 3.Change install location to Phone
ECHO --------------
ECHO more will be added never
SET INPUT=
SET /P INPUT=SELECT NUMBER OF OPTION:  

IF /I '%INPUT%'=='1' GOTO sideload
IF /I '%INPUT%'=='2' GOTO installsd
IF /I '%INPUT%'=='3' GOTO installphone

 :4
 CLS
 ECHO This will change your install location to 
 ECHO your SD card. This is for Android devices
 ECHO on 4.0 and below. 
 ECHO --------------------------
 ECHO Your device must have adb debugging enabled
 ECHO press enter when ready
 PAUSE
 adb kill-server
 ECHO Waiting for device...
 adb wait-for-device
 ECHO Device found.
 ECHO Setting install to SD
 adb shell pm setInstallLocation 2
 ECHO Completed, you can now move all apps to your sd
 PAUSE
 GOTO MENU 
 
 :4x
 CLS
 ECHO This will change your install location to 
 ECHO your SD card. This is for Android devices
 ECHO on 4.0 and below. 
 ECHO --------------------------
 ECHO Your device must have adb debugging enabled
 ECHO press enter when ready
 PAUSE
 adb kill-server
 ECHO Waiting for device...
 adb wait-for-device
 ECHO Device found.
 ECHO Setting install to SD
adb shell pm set-install-location 2
 ECHO Completed, you can now move all apps to your sd
 PAUSE
 GOTO MENU 
 
    :installsd
CLS
ECHO Change install location to SD
ECHO -------------------------------
ECHO If android <4.0 type 1
ECHO If android 4.x> type 2
ECHO --------------------------------
ECHO
SET INPUT=
SET /P INPUT=SELECT NUMBER OF OPTION:  
IF /I '%INPUT%'=='1' GOTO 4
IF /I '%INPUT%'=='2' GOTO 4.x

	
    :DNA
CLS	
ECHO Nothing here yet..
ECHO Press enter to go back to main menu
PAUSE
GOTO MENU	

	:NEXUS4
CLS
ECHO How'd you get here?!
ECHO .
GOTO MENU 

	:rootvzws4
CLS
ECHO How to root your Verizon S4
ECHO --------------------------------------
ECHO Before proceeding with the tool you need to flash the pre-release kernel (devices\GS4\rootmdk\kernels)
ECHO Make sure your phone has ADB debugging on 
ECHO If this still cannot find your device
ECHO Install clockwork mod's universal ADB drivers
ECHO after root make sure to open super SU and check for binary/app updates
ECHO Once you verified that super SU is working ,using Odin flash the kernel
ECHO When ready press enter
PAUSE
GOTO S4ROOTVZW

