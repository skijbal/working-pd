# This is what I've found to work for me.
Change things to match your setup.

I call filebot.sh and jellyfin.sh via cron.

Right now I have filebot.sh run at 2am to allow it plenty of time to finish before jellyfin.sh is called at 8am.


Current setup:
- Jellyfin (docker)
- Jellyseer (docker)
- rclone_rd beta (native install)
- plex_db (docker)
- Ubuntu Desktop 22.04

In the debrid.service file you'll notice that I have a long directory cache time.  This will allow me to navigate the folder structure more easily without the delay.  It's realy not a big deal for me since I only update Jellyfin once per day and the cache is refreshed before that.  This also allows Jellyfin to scan quickly.

My workflow:
- Request content from Jellyseer
- plex_db downloads/adds the files to my realdebrid account
- at 2am the cache is refreshed and filebot is called to sort / anything requested after 2am will be refreshed and porcessed on the next run
- at 8am jellyfin is updated via a curl command
