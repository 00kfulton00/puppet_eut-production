# Creates the osx_baseline profile. The profile installs various apps approved by EUT
class profile::osx_baseline {

package { google_chrome:
    ensure   => installed,
    provider => appdmg,
    source   => "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
    }
    
package { install_clickshare:
     ensure   => installed,
     provider => pkgdmg,
     source   => "https://s3-eu-west-1.amazonaws.com/unidays-builds/Mac/Clickshare/ClickShare.dmg"
    }

package { firefox:
    ensure   => installed,
    provider => appdmg,
    source   => "https://download-installer.cdn.mozilla.net/pub/firefox/releases/61.0.1/mac/en-US/Firefox%2061.0.1.dmg" 
    }  

package { google_drive_file_stream:
    ensure   => installed,
    provider => pkgdmg,
    source   => "https://dl.google.com/drive-file-stream/googledrivefilestream.dmg"
    }

package { policybanner:
    ensure   => installed,
    provider => pkgdmg,
    source   => "https://s3-eu-west-1.amazonaws.com/unidays-builds/Mac/Policy/PolicyBanner.dmg"
    }

package { slack:
    ensure   => installed,
    provider => pkgdmg,
    source   => "https://downloads.slack-edge.com/mac_releases/Slack-3.2.0.dmg"
    }

package { sophos_endpoint:
    ensure   => installed,
    provider => pkgdmg,
    source   => "https://s3-eu-west-1.amazonaws.com/unidays-builds/Mac/Sophos/Sophos+Endpoint.dmg"
    }

package { starleaf:
    ensure   => installed,
    provider => pkgdmg,
    source   => "https://downloads.starleaf.com/app/StarLeaf-Installer-Mac-OS.pkg"
    }

package { teamviewer:
    ensure   => installed,
    provider => pkgdmg,
    source   => "https://s3-eu-west-1.amazonaws.com/unidays-builds/Mac/TeamViewer/TeamViewer.dmg"
    }

package { unidays_fonts:
    ensure   => installed,
    provider => pkgdmg,
    source   => "https://s3-eu-west-1.amazonaws.com/unidays-builds/Mac/Fonts/UNiDAYS+Fonts.dmg"
    }
    
package { office_365:
    ensure   => installed,
    provider => pkgdmg,
    source   => "https://officecdn-microsoft-com.akamaized.net/pr/C1297A47-86C4-4C1F-97FA-950631F94777/OfficeMac/Microsoft_Office_2016_16.15.18070902_Installer.pkg"
    }
    
 package { sophos_web_gateway:
    ensure   => installed,
    provider => pkgdmg,
    source   => "https://s3-eu-west-1.amazonaws.com/unidays-builds/Mac/Sophos/Cloud+Web+Gateway+Installer.dmg"
    }
}

