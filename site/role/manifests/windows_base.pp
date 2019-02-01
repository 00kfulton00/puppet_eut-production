# Creates the windows_base role and includes the profiles required for a base Windows laptop
class role::windows_base 
 {
    include profile::windows_baseline
    include profile::windows_teamviewer
 }
