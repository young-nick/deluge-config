#!/bin/bash
TORRENT_ID=$1
TORRENT_NAME=$2
TORRENT_PATH=$3

FILEBOT_LOG=/var/log/filebot.log
#My Variables:
NOW=$(date)
CHECK=$(hostname)
TORRENT_LABEL=$(/var/lib/deluge/.config/deluge/get_torrent_label.py $TORRENT_ID)

echo Starting filebot run for $TORRENT_NAME at $NOW >> $FILEBOT_LOG
sudo -u nick /usr/bin/filebot -script fn:amc --output "/data/Downloads/manual" --log-file amc.log --action copy --conflict override -non-strict --def music=n artwork=y xbmc=localhost pushover=KMBwGp7dAqJ2BFqaj7XwfMxBKzXv48 "movieFormat=/data/Movies/{n} ({y})/{n}.{y}" "seriesFormat=/data/TV/{n}/Season{s.pad(2)}/{n}.{s00e00}.{t}" --def clean=y --def xbmc=localhost --def artwork=y "ut_dir=$TORRENT_PATH/$TORRENT_NAME" "ut_label=$TORRENT_LABEL" "ut_kind=multi" "ut_title=$TORRENT_NAME" >>  $FILEBOT_LOG

