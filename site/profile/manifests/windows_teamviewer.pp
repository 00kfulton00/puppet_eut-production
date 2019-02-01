class profile::windows_teamviewer {

# Download and installs the package from AWS
      package { 'unidays_teamviewer':
              ensure   => installed,
              provider => chocolatey,
              source   => 'http://34.242.172.216/NuGet/nuget'
              }
         
# Downloads the assignment file to the tmp directory created above
       download_file {"Download TeamviewerAssignment" :
                        url                   => 'https://s3-eu-west-1.amazonaws.com/unidays-builds/Win/TeamViewer/TeamViewer_Assignment.exe',
                        destination_directory => 'C:\tmp'
                        }
        
# The exec provide runs Powershell code that runs the assignment exe. The require section requires the TeamViewer package to be installed before executing
# The unless clause tests for the eistence of the TeamViewer reg key. This block of code does not run if the reg key is present
        exec { 'unidays_teamviewer_assignment':
            provider =>  powershell,
            path     => '$:path', 
            command  => 'C:\tmp\TeamViewer_Assignment.exe -apitoken 2769214-L4X2iGhB8g8kgbPoTMyr -datafile ${ProgramFiles}\TeamViewer\AssignmentData.json -devicealias "${COMPUTERNAME}" -allowEasyAccess=false -wait=10',
            require  => Package['unidays_teamviewer'],
            unless   => '$reg_entry = Test-Path "HKLM:\SOFTWARE\WOW6432Node\TeamViewer";
                         If ($reg_entry -eq "True") { Exit 0 } else { Exit 1 }',
            }
}
