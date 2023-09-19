# This is what I've found to work for me.
Change things to match your setup.

I call filebot.sh and jellyfin.sh via cron.

Right now I have filebot.sh run at 2am to allow it plenty of time to finish before jellyfin.sh is called at 8am.


Current setup:
- Jellyfin (docker)
- Jellyseer (docker)
- rclone_pd (native install)
- plex_db (docker)
