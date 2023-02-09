#!/system/bin/sh

helpFunction() {
   printf "Usage: $0 [options]\n\n"
   printf "   --speed    changes the charge speed (default: 0.3)\n"
   printf "   --max      changes the maximal charge value (default: 100)\n"
   printf "   --reset    resets the battery state\n"
   printf "   --unplug   unplugs the battery from the REAL charge\n"
   printf "   --set      sets custom battery value\n"
   printf "   --steps    changes the maximal adding value (default: 1)\n"
   printf "   --stdout   prints every battery level into the stdout\n"
   printf "   --help     prints this message\n"
   exit 1 # Exit script after printing help
}

# Trap exit, to reset the state directly
onExit() {
  export CANCEL_FAKE_CHARGE="true"
}

trap onExit INT

if [ $# -eq 0 ]; then
    helpFunction
fi

main() {
  while [ "${1:-}" != "" ]; do
    case "$1" in
        "--speed")
          local SPEED="${2:=0.3}"
          ;;
        "--max")
          local MAX="${2:=100}"
          ;;
        "--steps")
          local STEPS="${2:=1}"
          ;;
        "--help")
          helpFunction
          ;;
        "--stdout")
          local SHOW_TERM_STDOUT="true"
          ;;
        "--reset")
          cmd battery reset
          exit 0
          ;;
        "--set")
          local RE='^[0-9]+$'
          # if ! [[ $2 = $RE ]] ; then
          #   printf "\e[31mNot a \e[1mnumber\e[0m\e[31m!\e[0m\n" >&2; exit 1
          # fi
          cmd battery set level $2
          printf "Battery has been charged to \e[4m\e[35m$2\e[0m\n"
          exit 0
          ;; 
        "--unplug")
          cmd battery unplug
          exit 0
          ;;
    esac
    shift
  done

  local INDEX=1
  while [ $INDEX -le $MAX ]; do
      cmd battery set level $INDEX
      if [ ! -z $SHOW_TERM_STDOUT ]; then
        printf "\e[92mBattery level\e[0m \e[94m=>\e[94m \e[93m$INDEX\e[0m\n"
      fi
      sleep $SPEED
      INDEX=$(($INDEX+$STEPS))
      if [[ ! -z $CANCEL_FAKE_CHARGE ]]; then
        break
      fi
  done

  printf "Battery state will be rested in \e[7m2 sec.\e[0m\n"
  sleep 2
  cmd battery reset "$@"
  exit 0
}

main "$@"

unset CANCEL_FAKE_CHARGE