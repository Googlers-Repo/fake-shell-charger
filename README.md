# Fake Shell Charger

This is not a real charger, here can you troll your friends

## Usage

```sh
fake-charger --speed 0.3 --max 101 --steps 1
```

Usage

```
Usage: system/bin/fake-charger.sh [options]

   --speed    changes the charge speed (default: 0.3)
   --max      changes the maximal charge value (default: 100)
   --reset    resets the battery state
   --unplug   unplugs the battery from the REAL charge
   --set      sets custom battery value
   --steps    changes the maximal adding value (default: 1)
   --stdout   prints every battery level into the stdout
   --help     prints this message
```

### Custom Vaule

```sh
fake-charger --set 2000
```

### Unplug Battery

> Warning!
> This can be buggy, avoid using this.

```sh
fake-charger --unplug
```

### Reset Battery state

```sh
fake-charger --reset
```
