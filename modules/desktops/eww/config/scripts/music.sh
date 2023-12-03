#!/run/current-system/sw/bin/bash
# https://github.com/end-4/dots-hyprland/blob/novelknock/.config/eww/scripts/music

TMP_FOLDER="/tmp/music_covers/"

mkdir -p $TMP_FOLDER

playerctl --player=spotify -F metadata -f '{{title}}\{{artist}}\{{artUrl}}\' 2>/dev/null | while IFS="$(echo '\\')" read -r title artist artUrl; do
    URL=$(playerctl --player=spotify metadata mpris:artUrl)
    ID=$(echo $URL | cut -d "/" -f 5)

    if [ ! -f $TMP_FOLDER$ID ]
    then
        wget -q $URL -O $TMP_FOLDER$ID
    fi

    TITLE=$(echo $title | sed 's/"/\\"/g')
    ARTIST=$(echo $artist | sed 's/"/\\"/g')

    echo '{ "title": "'$TITLE'", "artist": "'$ARTIST'", "cover": "'$TMP_FOLDER$ID'" }'
done
