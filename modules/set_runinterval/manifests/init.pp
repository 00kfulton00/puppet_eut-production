class set_runinterval 
{
    if $::kernel == 'windows'
    {
        ini_setting {'set_run_interval_4hrs':
                      ensure   => present,
                      path     => 'C:/ProgramData/PuppetLabs/puppet/etc/puppet.conf',
                      section  => 'main',
                      setting  => 'runinterval',
                      value    => '1800',
                      }
     }
     else
     {
          ini_setting {'set_run_interval_4hrs':
                        ensure   => present,
                        path     => '/etc/puppetlabs/puppet/puppet.conf',
                        section  => 'main',
                        setting  => 'runinterval',
                        value    => '1800',
                        }
      }
  }
     
