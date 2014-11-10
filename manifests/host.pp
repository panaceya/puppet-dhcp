define dhcp::host (
    $ip,
    $mac,
    $comment='',
    $hostname=undef
  ) {

  $host = $name
  include dhcp::params

  $dhcp_dir = $dhcp::params::dhcp_dir
  $domain   = $dhcp::params::dnsdomain

  concat_fragment { "dhcp.hosts+10_${name}.hosts":
    content => template('dhcp/dhcpd.host.erb'),
  }

}
