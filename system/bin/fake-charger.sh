#!/system/bin/sh

helpFunction()
{
   printf "\nUsage: $0 --speed 0.3 --max 101 --steps 1\n\n"
   printf "\t--speed  \tchanges the charge speed (default: 0.3)\n"
   printf "\t--max    \tchanges the maximal charge value (default: 100)\n"
   printf "\t--reset  \tresets the battery state\n"
   printf "\t--unplug \tunplugs the battery from the REAL charge\n"
   printf "\t--set    \tsets custom battery value\n"
   printf "\t--steps  \tChanges the maximal adding value (default: 1)\n"
   printf "\t--help   \tprints this message\n"
   exit 1 # Exit script after printing help
}

if [ $# -eq 0 ]; then
    helpFunction
fi

while [ "${1:-}" != "" ];
do
   case "$1" in
      "--speed")
        SPEED="${2:=0.3}"
        ;;
      "--max")
        MAX="${2:=100}"
        ;;
      "--steps")
        STEPS="${2:=1}"
        ;;
      "--help")
        helpFunction
        ;;
      "--reset")
        cmd battery reset
        exit 0
        ;;
      "--set")
        RE='^[0-9]+$'
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

INDEX=1
while [ $INDEX -le $MAX ]
do
    cmd battery set level $INDEX
    printf "\e[92mBattery level\e[0m \e[94m=>\e[94m \e[93m$INDEX\e[0m\n"
    sleep $SPEED
    INDEX=$(($INDEX+$STEPS))
done

printf "Battery state will be rested in \e[7m2 sec.\e[0m\n"
sleep 2
cmd battery reset
