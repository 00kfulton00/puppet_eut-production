class profile::osx_domjoin{

   #$userName     = hiera('userName')
    #$userPassword = hiera('userPassword')
    
  exec {'domjoin_osx':
      provider => shell,
      command  => 'dsconfigad -force -add unidays.lan -username $userName -password $userPassword -computer "abctest" -packetencrypt require -packetsign require -passinterval 0' ,
      user     => root,
      }
}
