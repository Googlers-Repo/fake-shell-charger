#!/system/bin/sh
until [ "$(getprop sys.boot_completed)" ]
do
	sleep 2
done
fake-charger
