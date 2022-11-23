function openports () {
	tput setaf 2
	echo "
________                      __________              __          
\_____  \  _____   ____   ____\______   \____________/  |_  ______
 /   |   \/____ \_/ __ \ /    \|     ___/  _ \_  __ \   __\/  ___/
/    |    \  |_> >  ___/|   |  \    |  (  <_> )  | \/|  |  \___ \ 	Made by WhiteXnd
\_______  /   __/ \___  >___|  /____|   \____/|__|   |__| /____  >
        \/|__|        \/     \/                                \/ 
"
	if [ -z "$1" ]
	then
		for port in $(cat /proc/net/tcp | awk '{print $2}' | grep -oP ":[A-Z,0-9,]{4}" | sed "s/://" | sort -u)
		do
			echo -e "\t$(tput setaf 148)[*] $(tput setaf 7) Port $port -> $(echo "obase=10; ibase=16; $port" | bc)"
		done
	else
		for port in $(cat $1 | awk '{print $2}' | grep -oP ":[A-Z,0-9,]{4}" | sed "s/://" | sort -u)
		do
			echo -e "\t$(tput setaf 148)[*] $(tput setaf 7) Port $port -> $(echo "obase=10; ibase=16; $port" | bc)"
		done
	fi
	echo -e "\n"
}
