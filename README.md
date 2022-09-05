# Fake Shell Charger

This is not a real charger, here can you troll your friends

## Usage

```sh
fake-charger -s 0.3 -m 101 -a 1
```

Usage

```sh
Usage: fake-charger -s 0.3 -m 101 -a 1
        -s, --speed                      Changes the charge speed (default: 0.3)
        -m, --maxcharge                  Changes the maximal charge value (default: 100)
        -r, --resetBatteryState          Reset the battery state
        -a, --maxadd                     Changes the maximal adding value (default:1)
        -h. --help                       Prints the help
Others:
        setBattery    <value>            Set an custom value for the battery
        resetBattery  [-f]               Resets the battery state to the default
        unplugBattery [-f]               Unplugs the battery from the REAL charge
```

### Custom Vaule

```sh
setBattery 2000
```

### Unplug Battery

{{warn-alert=Warning}This can be buggy, avoid using this.}

```sh
unplugBattery
```

### Reset Battery state

```sh
resetBattery
```
