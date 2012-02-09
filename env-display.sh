# USAGE: source <this file>

remotehost=`last -a $USER | grep "still logged in" | tail -1 | awk '{print $10}'`
export DISPLAY=$remotehost:0
