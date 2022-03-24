#!/system/bin/sh

print() {
    ui_print $@
}

print_modname() {
    print "===================================="
    print "        Fake Shell Charger          "
    print "------------------------------------"
    print " Instructions:                      "
    print " - Open Terminal                    "
    print " - Type su & tap enter              "
    print " - Type fake-charger -h & tap enter "
    print "===================================="
}

makeExecutable() {
    chmod +x /system/bin/$@  
}

systemWrite() {
    if [ $1 = true ]; then
        mount -o rw,remount /    
    elif [ $1 = false ]; then
        mount -o ro,remount /
    else
        abort "System not writeable"
    fi
}

if [ -n "$MMM_EXT_SUPPORT" ]; then
    ui_print "#!useExt"
    mmm_exec() {
        ui_print "$(echo "#!$@")"
    }
else
    mmm_exec() { true; }
    abort "! This module need to be executed in Fox's Magisk Module Manager"
    exit 1
fi

print_modname

systemWrite true

makeExecutable fake-charger
makeExecutable setBattery
makeExecutable resetBattery
makeExecutable unplugBattery
makeExecutable notification

systemWrite false 
