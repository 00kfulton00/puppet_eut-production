class slack {

package { 'unidays_slack':
    ensure   => installed,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget',
    install_options => ['-installArgs', '"', '/VERYSILENT', '/SP-', '"']    
    }
  }
