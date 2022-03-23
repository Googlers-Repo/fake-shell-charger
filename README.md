# Fake Shell Charger

This is not a real charger, here can you troll your friends

## Usage

```sh
fake-charger -s 0.3 -m 101 -a 1
```

- `-s` Changes the charge speed (default: 0.3)
- `-a` Changes the maximal adding value (default:1)
- `-r` Reset the battery state
- `-h` Help
- `-m` Changes the maximal charge value (default: 100)

### Custom Vaule

```sh
setBattery 2000
```

### Unplug Battery

> This can be buggy, avoid using this.

```sh
unplugBattery
```

### Reset Battery state

```sh
resetBattery
```
