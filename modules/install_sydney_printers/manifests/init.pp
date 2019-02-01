class install_sydney_printers
{

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

       elsif $::kernel == 'Darwin'
       {
          #Downloads and installs the print driver
          package { konica_minolta_driver:
                   ensure   => installed,
                   provider => pkgdmg,
                   source   => "https://s3-eu-west-1.amazonaws.com/unidays-builds/Mac/PrintDrivers/Konica+Minolta/konica_minolta_c3351_driver_11_1_1.pkg"
                   }

          exec { 'osx_printers':
                  provider => shell,
                  command  => '/usr/sbin/lpadmin -p "AU-SYD-MFD1" -E -v lpd://10.26.0.58 -P "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC3351.gz" -D "AU-SYD-MFD1" -o printer-is-shared=false',
                  user     => root,
                  require  => Package['konica_minolta_driver'],
               }
        }
}
