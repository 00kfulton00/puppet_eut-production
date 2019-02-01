#This module uninstalls apps installed via Puppet. It removes the app from the "/Applications" folder as well as deleting the 
#database file
#Puppet uses to determine if the app is actually installed

class osx_remove_puppet_apps
{
      exec { 'osx_remove_chrome':
       provider => shell,
       command  => 'rm -rf /Applications/Google\ Chrome.app',
       user     => root,
       onlyif   => 'test -f /var/db/.puppet_pkgdmg_installed_google_chrome',
       }
            
            exec { 'osx_remove_chrome_puppetdbfile':
             provider => shell,
             command  => 'rm -rf /var/db/.puppet_pkgdmg_installed_google_chrome',
             user     => root,
             require  => Exec['osx_remove_chrome'],
             }
            
       
       exec { 'osx_remove_clickshare':
        provider => shell,
        command  => 'rm -rf /Applications/ClickShare\ Launcher.app',
        user     => root,
        onlyif   => 'test -f /var/db/.puppet_pkgdmg_installed_install_clickshare',
       }
       
            exec { 'osx_remove_clickshare_puppetdbfile':
             provider => shell,
             command  => 'rm -rf /var/db/.puppet_pkgdmg_installed_install_clickshare',
             user     => root,
             require  => Exec['osx_remove_clickshare'],
             }
       
       exec { 'osx_remove_firefox':
        provider => shell,
        command  => 'rm -rf /Applications/Firefox.app',
        user     => root,
        onlyif   => 'test -f /var/db/.puppet_pkgdmg_installed_firefox',
       }
             exec { 'osx_remove_firefox_puppetdbfile':
             provider => shell,
             command  => 'rm -rf /var/db/.puppet_pkgdmg_installed_firefox',
             user     => root,
             require  => Exec['osx_remove_firefox'],
             }
            
       
        exec { 'osx_remove_google_drive_file_stream':
        provider => shell,
        command  => 'rm -rf /Applications/Google\ Drive\ File\ Stream.app',
        user     => root,
        onlyif   => 'test -f /var/db/.puppet_pkgdmg_installed_google_drive_file_stream',
       }
             exec { 'osx_remove_google_drive_file_stream_puppetdbfile':
             provider => shell,
             command  => 'rm -rf /var/db/.puppet_pkgdmg_installed_google_drive_file_stream',
             user     => root,
             require  => Exec['osx_remove_google_drive_file_stream'],
             }
       
        exec { 'osx_remove_slack':
        provider => shell,
        command  => 'rm -rf /Applications/Slack.app',
        user     => root,
        onlyif   => 'test -f /var/db/.puppet_pkgdmg_installed_slack',
       }
             exec { 'osx_remove_slack_puppetdbfile':
             provider => shell,
             command  => 'rm -rf /var/db/.puppet_pkgdmg_installed_slack',
             user     => root,
             require  => Exec['osx_remove_slack'],
             }
       
        exec { 'osx_remove_starleaf':
        provider => shell,
        command  => 'rm -rf /Applications/Starleaf\ Breeze.app',
        user     => root,
        onlyif   => 'test -f /var/db/.puppet_pkgdmg_installed_starleaf',
       }
             exec { 'osx_remove_starleaf_puppetdbfile':
             provider => shell,
             command  => 'rm -rf /var/db/.puppet_pkgdmg_installed_starleaf',
             user     => root,
             require  => Exec['osx_remove_starleaf'],
             }
       
        exec { 'osx_remove_UNiDAYS_AUP':
        provider => shell,
        command  => 'rm -rf /Applications/UNiDAYS\ AUP.app',
        user     => root,
        onlyif   => 'test -f /var/db/.puppet_pkgdmg_installed_policybanner',
       }
             exec { 'osx_remove_UNiDAYS_AUP_puppetdbfile':
             provider => shell,
             command  => 'rm -rf /var/db/.puppet_pkgdmg_installed_policybanner',
             user     => root,
             require  => Exec['osx_remove_UNiDAYS_AUP'],
             }
       
       
       exec { 'osx_remove_UNiDAYS_Fonts':
        provider => shell,
        command  => 'rm -rf /Applications/UNiDAYS\ Fonts.app',
        user     => root,
        onlyif   => 'test -f /var/db/.puppet_pkgdmg_installed_unidays_fonts',
       }
             exec { 'osx_remove_UNiDAYS_Fonts_puppetdbfile':
             provider => shell,
             command  => 'rm -rf /var/db/.puppet_pkgdmg_installed_unidays_fonts',
             user     => root,
             require  => Exec['osx_remove_UNiDAYS_Fonts'],
             }
             
       exec { 'osx_remove_Sophos_Endpoint_puppetdbfile':
        provider => shell,
        command  => 'rm -rf /var/db/.puppet_pkgdmg_installed_sophos_endpoint',
        user     => root,
       }
       
}
