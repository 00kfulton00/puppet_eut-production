class domjoin
{
    $userName     = hiera ("domjoin_username")
    $userPassword = hiera ("domjoin_password")
    
  exec {'domjoin_osx':
      provider => shell,
      command  => 'dsconfigad -force -add unidays.lan -username $userName -password $userPassword -computer $hostName -packetencrypt require -packetsign require -passinterval 0 ' ,
      user     => root,
      }
}
      
