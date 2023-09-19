#!/bin/bash

if /path/to/anchor/file      # only update jellyfin library if anchor file is present on debrid mount

then

  # Update Jellyfin
  curl -X POST "http://192.168.1.14:8096/emby/Library/Refresh?api_key=jellyfin-api-key" -d ""     # change ip/port and api key
  echo "$(date) Jellyfin is updating" >> /path/to/filebot.log

fi
