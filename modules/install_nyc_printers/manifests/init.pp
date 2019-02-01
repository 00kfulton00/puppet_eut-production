class install_nyc_printers
{
    #if $::printer_check == 'False'
    
            #This conditional statement determines if the machine is Windows - if the machine is Windows the following code will run.
            #if $::kernel == 'windows' (This line was removed due to applying the printers to all "windows" machines, we only want desktops. Thus filtering on the fact of os release "10")
            if $facts['os']['release']['full'] == '10'
            {  
               scheduled_task { 'create_ny_printers_task':
                                ensure      => present,
                                enabled     => true,
                                command     => "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe",
                                arguments   => '-command &{printui /ga /n\\\us-nyc-dc1.unidays.lan\us-nyc-mfd1}',
                                trigger     => [{
                                   schedule   => once,
                                   start_time => '00:00',
                                   start_date => '2018-10-15',
                                   }],
                             }

                        exec { 'run_ny_printers_task':
                                command  => 'schtasks.exe /run /tn "create_ny_printers_task"',
                                provider => powershell
                                }
            }

            #The else condition runs when the machines is not Windows (by default Mac OS or Darwin to be specific)
            elsif $::kernel == 'Darwin'
            {
                #Downloads and installs the print driver
                package { konica_minolta_driver:
                         ensure   => installed,
                         provider => pkgdmg,
                         source   => "https://s3-eu-west-1.amazonaws.com/unidays-builds/Mac/PrintDrivers/Konica+Minolta/konica_minolta_c3351_driver_11_1_1.pkg"
                        }

                #Executes the command to actually install the  printer
                exec { 'osx_printers':
                        provider => shell,
                        command  => '/usr/sbin/lpadmin -p "KonicaMinoltaBizhubC3351" -E -v lpd://us-nyc-dc1.unidays.lan/us-nyc-mfd1 -P "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC3351.gz" -D "US-NYC-MFD1" -o printer-is-shared=false',
                        user     => root,
                        require  => Package['konica_minolta_driver'],
                    }
            }
}

