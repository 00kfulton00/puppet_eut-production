#Creates the osx_mobile_account profile
class profile::osx_mobile_account{

    #Configures the mobile account for AD user login
    exec {'set_mobile_account_options':
      provider => shell,
      command  => 'dsconfigad -mobile enable -mobileconfirm disable -localhome enable -useuncpath disable',
      user     => root,
     }
     
     #Configures access for Domain Admins and Enterprise Admins - enables it for all domains
     exec {'add_admin_groups':
       provider => shell,
       command  => 'dsconfigad -groups "Domain Admins,Enterprise Admins" -alldomains enable',
       user     => root,
      }
     
     #Changes the logon window to username and password - instead of selecting username
     exec {'set_logon_window':
        provider => shell,
        command  => 'defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME 1',
        user     => root,
       }
}
