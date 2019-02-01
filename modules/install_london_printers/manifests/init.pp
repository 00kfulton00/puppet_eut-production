class install_london_printers
{
    #This conditional statement determines if the machine is Windows - if the machine is Windows the following code will run.
    if $::kernel == 'windows'
    { 
               scheduled_task { 'create_london_printers_task':
                        ensure      => present,
                        enabled     => true,
                        command     => "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe",
                        arguments   => '-command &{printui /ga /n\\\uk-nott-prn1.unidays.lan\uk-lon-mfd1;
                                                   printui /ga /n\\\uk-nott-prn1.unidays.lan\uk-lon-mfd2;
                                                   printui /ga /n\\\uk-nott-prn1.unidays.lan\uk-lon-mfd3}',
                        trigger     => [{
                           schedule   => once,
                           start_time => '00:00',
                           start_date => '2018-10-15',
                           }],
                     }
                
                exec { 'run_london_printers_task':
                        command  => 'schtasks.exe /run /tn "create_london_printers_task"',
                        provider => powershell
                        }
       }
    
    else
    {
        #Downloads and installs the print driver
         package { konica_minolta_driver:
                 ensure => installed,
                 provider => pkgdmg,
                 source => "https://s3-eu-west-1.amazonaws.com/unidays-builds/Mac/PrintDrivers/Konica+Minolta/konica_minolta_c258_driver_11_1_1.pkg"
                 }
        
      
         #Executes the command to actually install the  printer
          exec { 'osx_printers_uk-lon-mfd1':
                provider => shell,
                command  => '/usr/sbin/lpadmin -p "UK-LON-MFD1-KonicaMinoltaC258" -E -v lpd://10.24.0.81 -P "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC258.gz" -D "UK-LON-MFD1" -o printer-is-shared=false',
                user     => root,
                require  => Package['konica_minolta_driver'],
                }
                
          exec { 'osx_printers_uk-lon-mfd2':
                provider => shell,
                command  => '/usr/sbin/lpadmin -p "UK-LON-MFD2-KonicaMinoltaC258" -E -v lpd://10.24.0.82 -P "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC258.gz" -D "UK-LON-MFD2" -o printer-is-shared=false',
                user     => root,
                require  => Package['konica_minolta_driver'],
                }
          
          exec { 'osx_printers_uk-lon-mfd3':
                provider => shell,
                command  => '/usr/sbin/lpadmin -p "UK-LON-MFD3-KonicaMinoltaC258" -E -v lpd://10.24.0.83 -P "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC258.gz" -D "UK-LON-MFD3" -o printer-is-shared=false',
                user     => root,
                require  => Package['konica_minolta_driver'],
                }
    }
}
