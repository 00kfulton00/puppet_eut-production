class osx_updates
{
    # Turn off automatic updates
    
    exec {'disable_automatic_updates':
      provider => shell,
      command  => 'softwareupdate --schedule off',
      user     => root,
      }
      
     exec
      
      

  
}
