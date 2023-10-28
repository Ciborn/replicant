#!/run/current-system/sw/bin/bash
# https://github.com/end-4/dots-hyprland/blob/novelknock/.config/eww/scripts/music

TMP_FOLDER="/tmp/music_covers/"

mkdir -p $TMP_FOLDER

playerctl -F metadata -f '{{title}}\{{artist}}\{{artUrl}}\' 2>/dev/null | while IFS="$(echo '\\')" read -r title artist artUrl; do
    URL=$(playerctl --player=spotify metadata mpris:artUrl)
    ID=$(echo $URL | cut -d "/" -f 5)

    if [ ! -f $TMP_FOLDER$ID ]
    then
        wget -q $URL -O $TMP_FOLDER$ID
    fi

    echo '{ "title": "'$title'", "artist": "'$artist'", "cover": "'$TMP_FOLDER$ID'" }'
done
