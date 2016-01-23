class eizo::kodi::config inherits eizo::kodi {

  # Setup a crontab for Artwork Downloader
  cron { kodi-artwork-downloader:
    command => '/usr/bin/kodi-send --action="RunScript(script.artwork.downloader,silent=true)"',
    user => 'xbmc',
    hour => 3,
    minute => 4,
    monthday => '*/3'
  }

  # And regular cleanup of video library
  cron { kodi-clean-library:
    command => '/usr/bin/kodi-send --action="CleanLibrary(video,silent=true)"',
    user => 'xbmc',
    hour => 3,
    minute => 45
  }

  # Install our own advanced settings
  file { "${home}/userdata/advancedsettings.xml":
    source => "puppet:///modules/eizo/kodi/advancedsettings.xml"
  }

}
