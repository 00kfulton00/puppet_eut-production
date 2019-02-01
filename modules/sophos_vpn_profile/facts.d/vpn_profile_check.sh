#!/bin/bash

if sudo profiles show | grep "Corporate Device Policy Default + Root CA"
then
   sophos_VPN_profile=0
else
   sophos_VPN_profile=1
fi
echo sophos_VPN_profile=$sophos_VPN_profile
