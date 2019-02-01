  class profile::windows_security_baseline {
  
  local_security_policy { 'Maximum password age':
    ensure => present,
    policy_value => '80'
    }
}
