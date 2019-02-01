class windows_remove_puppet_apps {

include chocolatey

package { 'unidays_firefox':
    ensure   => absent,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget'
    }

package { 'unidays_googlechrome':
   ensure   => absent,
   provider => chocolatey,
   source   => 'http://34.242.172.216/NuGet/nuget'
   }

package { 'unidays_googledrivefilestream':
     ensure   => absent,
     provider => chocolatey,
     source   => 'http://34.242.172.216/NuGet/nuget'
     }
 
package { 'unidays_slack':
    ensure   => absent,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget'
    }

package { 'unidays_fonts':
    ensure   => absent,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget'
    } 

package { 'unidays_aup':
    ensure   => absent,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget'
    }
    
package { 'unidays_freshservice':
    ensure   => absent,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget'
    }

package { 'unidays_vpn_nottingham':
    ensure   => absent,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget'
    }

package { 'unidays_starleaf':
    ensure   => absent,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget'
    }

package { 'unidays_clickshare':
    ensure   => absent,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget' 
    }

package { 'unidays_sophos':
    ensure   => absent,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget'
    }

package { 'unidays_sophos_cloud_gateway':
    ensure   => absent,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget'
    } 

package { 'unidays_teamviewer':
     ensure   => absent,
     provider => chocolatey,
     source   => 'http://34.242.172.216/NuGet/nuget'
     }
}
