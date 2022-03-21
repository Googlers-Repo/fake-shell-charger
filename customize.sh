#!/bin/sh

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

mount -o rw,remount /
chmod +x /system/bin/fake-charger
mount -o ro,remount /