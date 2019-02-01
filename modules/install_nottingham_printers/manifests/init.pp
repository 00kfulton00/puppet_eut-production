class install_nottingham_printers
{
    #This conditional statement determines if the machine is Windows - if the machine is Windows the following code will run.
    if $::kernel == 'windows'
    {
        scheduled_task { 'create_nottingham_printers_task':
                        ensure      => present,
                        enabled     => true,
                        command     => "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe",
                        arguments   => '-command &{printui /ga /n\\\uk-nott-prn1.unidays.lan\UK-NOTT-MFDGF;
                                                   printui /ga /n\\\uk-nott-prn1.unidays.lan\UK-NOTT-MFDL1;
                                                   printui /ga /n\\\uk-nott-prn1.unidays.lan\UK-NOTT-MFDL2;
                                                   printui /ga /n\\\uk-nott-prn1.unidays.lan\UK-NOTT-MFDL3;
                                                   printui /ga /n\\\uk-nott-prn1.unidays.lan\UK-NOTT-MFDL4;
                                                   printui /ga /n\\\uk-nott-prn1.unidays.lan\UK-NOTT-MFDLG}',
                        trigger     => [{
                           schedule   => once,
                           start_time => '00:00',
                           start_date => '2018-10-15',
                           }],
                     }
                
                exec { 'run_nottingham_printers_task':
                        command  => 'schtasks.exe /run /tn "create_nottingham_printers_task"',
                        provider => powershell
                      }
   }
    
    #The else condition runs when the machines is not Windows (by default Mac OS or Darwin to be specific)
    else
    {
        #Downloads and installs the print driver
        package { konica_minolta_driver:
                 ensure => installed,
                 provider => pkgdmg,
                 source => "https://s3-eu-west-1.amazonaws.com/unidays-builds/Mac/PrintDrivers/Konica+Minolta/konica_minolta_c258_driver_11_1_1.pkg"
                 }
        
        package { konica_minolta_driver_c3110:
                 ensure => installed,
                 provider => pkgdmg,
                 source => "https://s3-eu-west-1.amazonaws.com/unidays-builds/Mac/PrintDrivers/Konica+Minolta/konica_minolta_c3110_driver_1_4_0.pkg"
                 }
        
        #Executes the command to actually install the  printer
        exec { 'osx_printers_uk-nott-mfdgf':
                provider => shell,
                command  => '/usr/sbin/lpadmin -p "UK-NOTT-MFDGF-KonicaMinoltaC258" -E -v lpd://10.20.1.79 -P "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC258.gz" -D "UK-NOTT-MFDGF" -o printer-is-shared=false',
                user     => root,
                require  => Package['konica_minolta_driver'],
                }
            
         exec { 'osx_printers_uk-nott-mfdl1':
                provider => shell,
                command  => '/usr/sbin/lpadmin -p "UK-NOTT-MFDL1-KonicaMinoltaC3110" -E -v lpd://10.20.1.80 -P "/Library/Printers/PPDs/Contents/Resources/KONICA MINOLTA C3110.gz" -D "UK-NOTT-MFDL1" -o printer-is-shared=false',
                user     => root,
                require  => Package['konica_minolta_driver_c3110'],
                }
                
         exec { 'osx_printers_uk-nott-mfdl2':
                provider => shell,
                command  => '/usr/sbin/lpadmin -p "UK-NOTT-MFDL2-KonicaMinoltaC258" -E -v lpd://10.20.1.81 -P "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC258.gz" -D "UK-NOTT-MFDL2" -o printer-is-shared=false',
                user     => root,
                require  => Package['konica_minolta_driver'],
               }
            
         exec { 'osx_printers_uk-nott-mfdl3':
                provider => shell,
                command  => '/usr/sbin/lpadmin -p "UK-NOTT-MFDL3-KonicaMinoltaC3110" -E -v lpd://10.20.1.82 -P "/Library/Printers/PPDs/Contents/Resources/KONICA MINOLTA C3110.gz" -D "UK-NOTT-MFDL3" -o printer-is-shared=false',
                user     => root,
                require  => Package['konica_minolta_driver_c3110'],
               }
               
          exec { 'osx_printers_uk-nott-mfdl4':
                provider => shell,
                command  => '/usr/sbin/lpadmin -p "UK-NOTT-MFDL4-KonicaMinoltaC258" -E -v lpd://10.20.1.83 -P "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC258.gz" -D "UK-NOTT-MDL4" -o printer-is-shared=false',
                user     => root,
                require  => Package['konica_minolta_driver'],
            }     
            
          exec { 'osx_printers_uk-nott-mfdlg':
                provider => shell,
                command  => '/usr/sbin/lpadmin -p "UK-NOTT-MFDLG-KonicaMinoltaC3110" -E -v lpd://10.20.1.78 -P "/Library/Printers/PPDs/Contents/Resources/KONICA MINOLTA C3110.gz" -D "UK-NOTT-MFDLG" -o printer-is-shared=false',
                user     => root,
                require  => Package['konica_minolta_driver_c3110'],
           }
    }
}
