# Creates the osx_base role and includes the profiles required for a base OSX laptop.
class role::osx_base
{
    include profile::osx_baseline
    include profile::osx_mobile_account
    #include profile::osx_vpn
    #include profile::osx_domjoin
}
