
class remove_meraki
{
  
    exec {'remove_meraki_profiles':
      provider => shell,
      command  => 'profiles -D -f',
      user     =>  root,
      }
      
    exec {'remove_meraki_appfolder':
      provider  => shell,
      command   => 'rm -rf /Library/Application Support/Meraki/',
      user      => root,
      }
      
    exec {'unload_meraki_plist':
      provider  => shell,
      command   => 'launchctl unload /Library/LaunchDaemons/com.meraki.agentd.plist',
      user      => root,
      }
      
    exec { 'remove_meraki_plist':
      provider => shell,
      command  => 'rm -rf /Library/LaunchDaemons/com.meraki.agentd.plist',
      user     => root,
      require  => Exec['unload_meraki_plist'],
      }
      
      


}
