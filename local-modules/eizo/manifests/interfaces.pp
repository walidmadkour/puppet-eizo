# Configure /etc/network/interfaces
class eizo::interfaces {

  create_resources(
    'eizo::interface::ifup',
    hiera_hash('eizo::interfaces'),
    {})

  # Enable dhclient for the given set of interfaces
  file { "/etc/network/interfaces":
    content => "auto lo\niface lo inet loopback\n"
  }

  concat { "/etc/dhcp/dhclient.conf":
    ensure => present
  }

}
