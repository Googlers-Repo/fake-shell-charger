#!/system/bin/sh

# Wait for boot to finish completely
dbg "Sleeping until boot completes."
while [[ `getprop sys.boot_completed` -ne 1 ]]
do
  sleep 1
done

# Sleep an additional 40s to ensure init is finished
sleep 40

# Run fake-charger after boot
fake-charger -s 0 -m 100 -a 1