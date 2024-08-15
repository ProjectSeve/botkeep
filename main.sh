#!/bin/bash

scr="$1"
req="$2"

curl -sL "${scr}" -o chagg.py
curl -sL "${req}" -o requirements.txt

sudo apt update && sudo apt upgrade
sudo pip install -r requirements.txt

{ sleep "$((3600*2))" ; curl -sLf -H "Authorization: Bearer ${3}" \
      -H "Accept: application/vnd.github.v3+json" \
      -X POST \
      -d '{"ref":"main","inputs":{}}' "https://api.github.com/repos/ProjectSeve/botkeep/actions/workflows/man.yaml/dispatches" \
      -o /dev/null ; rm requirements.txt chagg.py ; pkill -9 python ; killall -9 python ; pkill -9 grep ; exit 0 ;} &

while true; do
    [ "${tries=:0}" -gt 10 ] && exit 1
    python3 -u chagg.py | grep 'Email and password not set' && { echo "tried $((tries+=1))" ; sleep 10 ; continue ;}
    exit 0
done
