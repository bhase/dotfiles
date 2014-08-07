
PID=$SSH_AGENT_PID
SOCK=$SSH_AUTH_SOCK
DATAFILE=~/.ssh/agent_data

check_ssh_agent ()
{
	pid=$1
	sock=$2
	SSH_AGENT_PID=$pid SSH_AUTH_SOCK=$sock ssh-add -l > /dev/null 2>&1
	if [[ "$?" -eq "2" ]] ; then
		return 0;
	else
		return 1;
	fi
}

start_agent()
{
	eval $(ssh-agent -s)
	if [[ "$?" -ne "0" ]] ; then
		echo "start of ssh-agent failed!"
	else
		echo $SSH_AGENT_PID > $DATAFILE
		echo $SSH_AUTH_SOCK >> $DATAFILE
	fi
}

check_ssh_agent $PID $SOCK
if [[ "$?" == "0" ]] ; then
	if [[ -r $DATAFILE ]] ; then
		exec 6< $DATAFILE
		read PID <&6
		read SOCK <&6
		check_ssh_agent $PID $SOCK
		if [[ "$?" == "0" ]] ; then
			start_agent
		else
			export SSH_AGENT_PID=$PID
			export SSH_AUTH_SOCK=$SOCK
		fi
	else
		start_agent
	fi
fi
