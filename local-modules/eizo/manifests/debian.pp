class eizo::debian(
  $packages = []) {

  class { "apt":
    purge => {
      "sources.list"   => true,
      "sources.list.d" => true,
      "preferences.d"  => true
    }
  }

  package { $packages: ensure => installed }

  package { "apt-transport-https": ensure => installed }
  package { "aptitude": ensure => installed } ->
  file { "/etc/apt/apt.conf.d/25aptitude":
    source => "puppet:///modules/eizo/debian/apt/25aptitude"
  }

  file { "/etc/apt/apt.conf.d/02periodic":
    source => "puppet:///modules/eizo/debian/apt/02periodic"
  }
  file { "/etc/apt/apt.conf.d/10disable-pdiff":
    source => "puppet:///modules/eizo/debian/apt/10disable-pdiff"
  }
  file { "/etc/apt/apt.conf.d/99translations":
    source => "puppet:///modules/eizo/debian/apt/99translations"
  }

  apt::source { "stretch":
    location          => 'http://httpredir.debian.org/debian/',
    release           => 'stretch',
    repos             => 'main contrib non-free',
    required_packages => 'debian-keyring debian-archive-keyring',
  }
  apt::source { "stretch-security":
    location => 'http://security.debian.org/',
    release  => 'stretch/updates',
    repos    => 'main contrib non-free',
  }
  apt::source { "stretch-backports":
    location          => 'http://http.debian.net/debian/',
    release           => 'stretch-backports',
    repos             => 'main contrib non-free',
    required_packages => 'debian-keyring debian-archive-keyring',
  }

}
