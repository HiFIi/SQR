#!/bin/bash
# To run this, simply cd to your ROM folder and run: 
# . build/SimplestChangelog.sh
# :)

date=$(date +"%m-%d-%Y")
TextFile=build/ROMChangelogs/$date/ROM-Changelog-$date.txt

mkdir -p build/ROMChangelogs/

mkdir -p build/ROMChangelogs/$date

# chmod 777 -R build/ROMChangelogs #
# Optional ^^^^

repo forall -pc git log --reverse --no-merges --since=1.day.ago > $TextFile
