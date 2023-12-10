#!/bin/bash

# Add or remove the APKs
AppsToRemove=("com.android.camera" 
 "com.android.chrome" 
 "com.android.deskclock" 
 "com.android.egg"
 "com.android.hotwordenrollment.okgoogle"
 "com.android.nfc"
 "com.android.soundrecorder"
 "com.android.statementservice"
 "com.android.thememanager"
 "com.facebook.appmanager"
 "com.facebook.services"
 "com.facebook.system"
 "com.google.android.apps.googleassistant"
 "com.google.android.apps.maps"
 "com.google.android.apps.messaging"
 "com.google.android.apps.subscriptions.red"
 "com.google.android.calendar"
 "com.google.android.contacts"
 "com.google.android.dialer"
 "com.google.android.feedback"
 "com.google.android.gm"
 "com.google.android.gms.location.history"
 "com.google.android.googlequicksearchbox"
 "com.google.android.inputmethod.latin"
 "com.google.android.marvin.talkback"
 "com.google.android.printservice.recommendation"
 "com.google.android.projection.gearhead"
 "com.google.android.tts"
 "com.google.android.youtube"
 "com.mi.android.globalFileexplorer"
 "com.mipay.wallet.in"
 "com.miui.analytics"
 "com.miui.audiomonitor"
 "com.miui.bugreport"
 "com.miui.calculator"
 "com.miui.cloudbackup"
 "com.miui.cloudservice"
 "com.miui.cloudservice.sysbase"
 "com.miui.compass"
 "com.miui.extraphoto"
 "com.miui.global.packageinstaller"
 "com.miui.hybrid"
 "com.miui.hybrid.accessory"
 "com.miui.micloudsync"
 "com.miui.miservice"
 "com.miui.misound"
 "com.miui.msa.global"
 "com.miui.notes"
 "com.miui.phrase"
 "com.miui.player"
 "com.miui.screenrecorder"
 "com.miui.systemui.carriers.overlay"
 "com.miui.touchassistant"
 "com.miui.videoplayer"
 "com.miui.weather2"
 "com.miui.wmsvc"
 "com.miui.yellowpage"
 "com.tencent.soter.soterserver"
 "com.xiaomi.glgm"
 "com.xiaomi.mipicks"
 "com.xiaomi.payment"
 "com.xiaomi.xmsfkeeper"
 "com.android.bluetoothmidiservice"
)

if [ $USER == "root" ]; then 
    if command -v adb &> /dev/null; then
        echo "[+] Debloating, do you have 5 seconds to cancel this action"
        sleep 5 
        clear

        for app in "${AppsToRemove[@]}"; do 
            echo "[-] Removing app: $app"
            adb shell pm uninstall --user 0 $app 

        done 

    else
        if [ "$(cat /etc/os-release | grep "ID_LIKE" | cut -d "=" -f2)" == "ubuntu" ]; then
            echo "[+] Do you want to install ADB using apt? [Y/N]"
            read action

            if [ $action == "Y" ]; then
                apt install adb -y
            else
                echo "[+] Please install ADB to use this script."
            fi

        fi

    fi

else 
    echo "[-] Please execute this script using root user"

fi  
