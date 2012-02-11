#!/usr/intel/bin/tcsh

set remotehost=`last -a ${USER} | grep "still logged in" | tail -1 | awk '{print $10}'`
echo found host ${remotehost}
setenv DISPLAY "${remotehost}:0"
