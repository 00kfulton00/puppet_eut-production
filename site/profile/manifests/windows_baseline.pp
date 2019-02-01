# Creates the windows_baseline profile
class profile::windows_baseline {

# Instructs the  profile to use chocolatey (a puppet module) 
include chocolatey

# Installs all the EUT apps using chocolatey
package { 'unidays_firefox':
    ensure   => installed,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget'
    }

package { 'unidays_googlechrome':
   ensure   => installed,
   provider => chocolatey,
   source   => 'http://34.242.172.216/NuGet/nuget'
   }

package { 'unidays_googledrivefilestream':
     ensure   => installed,
     provider => chocolatey,
     source   => 'http://34.242.172.216/NuGet/nuget'
     }
 
package { 'unidays_slack':
    ensure   => installed,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget'
    }

package { 'unidays_fonts':
    ensure   => installed,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget'
    } 

package { 'unidays_aup':
    ensure   => installed,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget'
    }
    
package { 'unidays_freshservice':
    ensure   => installed,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget'
    }

exec {'unidays_vpn':
      provider => powershell,
      path     => '$:path',
      command  => 'Add-VpnConnection -Name "UNiDAYS VPN Nottingham" -ServerAddress nottingham.syadinu.com -AllUserConnection -AuthenticationMethod Pap -DnsSuffix unidays.lan -L2tpPsk "ghLds*&^2348H" -RememberCredential -TunnelType L2tp -Force',
      }

#package { 'unidays_starleaf':
 #   ensure   => installed,
  #  provider => chocolatey,
   # source   => 'http://34.242.172.216/NuGet/nuget'
    #}

package { 'unidays_clickshare':
    ensure   => installed,
    provider => chocolatey,
    source   => 'http://34.242.172.216/NuGet/nuget' 
    }

#package { 'unidays_sophos':
 #   ensure   => installed,
  #  provider => chocolatey,
   # source   => 'http://34.242.172.216/NuGet/nuget'
    #}

#package { 'unidays_sophos_cloud_gateway':
 #   ensure   => installed,
  #  provider => chocolatey,
   # source   => 'http://34.242.172.216/NuGet/nuget'
    #} 
    
}
