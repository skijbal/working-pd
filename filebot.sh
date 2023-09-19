#!/bin/bash
# I'm sure things can be cleaned up, but this works for me.
# I use filebot to sort files into seperate folders by symlinking.
# You will need to have mediainfo installed your machine for the {vf} portion to work.
# This as the resolution to the file name.
# I call the amc.groovy script from a local file.  It can be downloaded https://github.com/filebot/scripts/tree/master.
# Make sure to adjust paths, ips and ports to match your setup.


if ls /path/to/anchor/file       # used to only run if debrid mount is active

then

  # Forget Cache
  cd /path/to/rclone/binary &&        # change path to rclone binary
  ./rclone-linux rc vfs/forget --url 192.168.1.14:5573 &&           # change ip/port to match what is listed in debrid.service
  echo "$(date) Cache was forgotten" >> /path/to/log/filebot.log        # change log path

  # Sleep
  echo "$(date) Sleeping for 20 seconds" >> /path/to/log/filebot.log        # change log path
  sleep 20s &&

  # Refresh Cache
  cd /path/to/rclone/binary &&        # change path to rclone binary
  ./rclone-linux rc vfs/refresh --url 192.168.1.14:5573 _async=true recursive=true &&        # change ip/port to match what is listed in debrid.service
  echo "$(date) Cache was refreshed" >> /path/to/log/filebot.log        # change log path

  # Sleep
  echo "$(date) Sleeping for 20 minutes" >> /path/to/log/filebot.log        # change log path
  sleep 1200s &&       # used to allow cache to refresh

  # Filebot AMC
  echo "$(date) Sorting was started" >> /path/to/log/filebot.log        # change log path
  filebot -script /path/to/local/amc.groovy "/path/to/debrid/mount" --output "/path/to/symlink/folder" --def movieFormat="/path/to/symlink/folder/movies/{ ~plex } - {vf}" seriesFormat="/path/to/symlink/folder/tv/{ ~plex } - {vf}" animeFormat="/path/to/symlink/folder/anime/{ ~plex } - {vf}" --def skipExtract=y --def movieDB=TheMovieDB seriesDB=TheMovieDB::TV --conflict auto --action SYMLINK -non-strict --log-file /path/to/amc.log --def excludeList=/path/to/amc.txt -no-xattr
  echo "$(date) Filebot operations have completed" >> /path/to/log/filebot.log        # change log path

fi
