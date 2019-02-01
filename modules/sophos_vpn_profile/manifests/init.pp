class sophos_vpn_profile {

     if $::sophos_vpn_profile == '0' {
        exec {'set_vpn_nameserver':
        provider  => shell,
        command   => 'networksetup -setsearchdomains "VPN Nottingham" unidays.lan',
        user      => root,
        }  
        
        exec {'set_vpn_dns':
        provider   => shell,
        command    => 'networksetup -setdnsservers "VPN Nottingham" 10.20.0.11 10.20.0.18',
        user       => root,	
        } 
        
        
      }
     
     
     
    
}



