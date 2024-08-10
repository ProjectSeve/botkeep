#!/bin/bash

scr="$1"
req="$2"

curl -sL "${scr}" -o chagg.py
curl -sL "${req}" -o requirements.txt

sudo apt update && sudo apt upgrade
pip install -r requirements.txt

{ sleep 3600 ; curl -sLf -H "Authorization: Bearer ${3}" \
      -H "Accept: application/vnd.github.v3+json" \
      -X POST \
      -d '{"ref":"master","inputs":{}}' "https://api.github.com/repos/ProjectSeve/botkeep/actions/workflows/man.yaml/dispatches" \
      -o /dev/null ; pkill -9 python ; rm requirements.txt chagg.py } &

while true; do
   python chagg.py | grep 'Email and password not set' && { echo "tried $((tries+=1))" ; continue }
   exit 0
done
   
