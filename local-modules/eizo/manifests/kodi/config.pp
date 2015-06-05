class eizo::kodi::config inherits eizo::kodi {

  # Setup a crontab for Artwork Downloader
  cron { kodi-artwork-downloader:
    command => '/usr/bin/kodi-send --action="RunScript(script.artwork.downloader,silent=true)"',
    user => 'xbmc',
    hour => 3,
    minute => 4,
    day => '*/3'
  }

}
