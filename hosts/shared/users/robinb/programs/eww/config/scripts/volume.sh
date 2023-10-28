#!/run/current-system/sw/bin/bash
# https://stackoverflow.com/questions/77290990/swallow-input-from-a-monitoring-callback-while-processing-in-a-while-loop

DEVICE=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | head -n1 | cut -c4-5)

pw-mon -oa | while grep -q "id: $DEVICE"; do
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk "{ print \$2 * 100 }"
done
