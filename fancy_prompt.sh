#!/bin/bash

# Original source borrowed from:
#   http://www.linuxselfhelp.com/howtos/Bash-Prompt/Bash-Prompt-HOWTO-12.html

#   termwide prompt
#      by Giles - created 2 November 98
#
#   The idea here is to have the upper line of this two line prompt 
#   always be the width of your term.  Do this by calculating the
#   width of the text elements, and putting in fill as appropriate
#   or left-truncating $PWD.
#

function prompt_command {

    TERMWIDTH=${COLUMNS}

#   Calculate the width of the prompt:

hostnam=$(echo -n $HOSTNAME | sed -e "s/[\.].*//")
#   "whoami" and "pwd" include a trailing newline
usernam=$(whoami)
let usersize=$(echo -n $usernam | wc -c | tr -d " ")
newPWD="${PWD}"
let pwdsize=$(echo -n ${newPWD} | wc -c | tr -d " ")
#   Add all the accessories below ...
let promptsize=$(echo -n "--(${usernam}@${hostnam})---(${PWD})--" \
                 | wc -c | tr -d " ")
let fillsize=${TERMWIDTH}-${promptsize}
fill=""
	#echo "DEBUG: fillsize=\"$fillsize\""
while [ "$fillsize" -gt "0" ] 
	do 
	fill="${fill}-"
	let fillsize=${fillsize}-1
	done
	#echo "DEBUG: hostnam=\"$hostnam\""
	#echo "DEBUG: usernam=\"$usernam\""
	#echo "DEBUG: usersize=\"$usersize\""
	#echo "DEBUG: newPWD=\"$newPWD\""
	#echo "DEBUG: pwdsize=\"$pwdsize\""
	#echo "DEBUG: promptsize=\"$promptsize\""
	#echo "DEBUG: fillsize=\"$fillsize\""
	#echo "DEBUG: fill=\"$fill\""

if [ "$fillsize" -lt "0" ]
	then
	let cut=3-${fillsize}
	newPWD="...$(echo -n $PWD | sed -e "s/\(^.\{$cut\}\)\(.*\)/\2/")"
	#echo "DEBUG: cut=\"$cut\""
	#echo "DEBUG: newPWD=\"$newPWD\""
fi
}

PROMPT_COMMAND=prompt_command

function fancy_prompt {

		local GRAY="\[\033[1;30m\]"
    local LIGHT_GRAY="\[\033[0;37m\]"
    local WHITE="\[\033[1;37m\]"
    local NO_COLOUR="\[\033[0m\]"

    local LIGHT_BLUE="\[\033[1;34m\]"
    local YELLOW="\[\033[1;33m\]"

    case $TERM in
        xterm*|rxvt*)
	        TITLEBAR='\[\033]0;\u@\h:\w\007\]'
					;;
				*)
					TITLEBAR=""
					;;
		esac

		PS1="$TITLEBAR\
$YELLOW-$LIGHT_BLUE-(\
$YELLOW\${newPWD}\
${LIGHT_BLUE})-${YELLOW}-\${fill}${LIGHT_BLUE}-(\
$YELLOW\${usernam}$LIGHT_BLUE@$YELLOW\${hostnam}\
$LIGHT_BLUE)-$YELLOW-\
\[\n\]\
$YELLOW-$LIGHT_BLUE-\
#\#\
$NO_COLOUR\$ " 
#$YELLOW-$LIGHT_BLUE-(\
#$YELLOW\$(date +%H%M)$LIGHT_BLUE:$YELLOW\$(date \"+%a,%d %b %y\")\
#$LIGHT_BLUE:$WHITE\$$LIGHT_BLUE)-\
#$YELLOW-\
#

		#PS2="$LIGHT_BLUE-$YELLOW-$YELLOW-$NO_COLOUR "
		PS2="$YELLOW>$NO_COLOUR "

}

