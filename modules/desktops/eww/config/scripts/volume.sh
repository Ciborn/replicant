#!/run/current-system/sw/bin/bash
# https://stackoverflow.com/questions/77290990/swallow-input-from-a-monitoring-callback-while-processing-in-a-while-loop

DEVICE=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | head -n1 | cut -c4-5)
OLD_VOLUME=0

pw-mon -oa | while grep -q "id: $DEVICE"; do
    VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk "{ print \$2 * 100 }")
    DEVICE_NAME=$(wpctl inspect $DEVICE | grep -oP "    alsa.card.name = \"\K[ _A-Za-z0-9]+")

    if [ $VOLUME -ne $OLD_VOLUME ]
    then
        OLD_VOLUME=$VOLUME

        if [ $(eww get open_volume) = "false" ];
        then
            (eww update open_volume=true && sleep 3 && eww update open_volume=false) &
        fi

        echo '{ "volume": '$VOLUME', "device": "'$DEVICE_NAME'" }'
    fi
done
