function puertosabiertos(){
        echo -e "\n[+] Analizando Puertos\n"
        if [ -z "$1" ]; then
                for port in $(cat /proc/net/tcp | awk '{print $2}' | grep -oP ":[A-Z,0-9,]{4}" | sed "s/://" | sort -u); do
                        echo -e "\t[*] Port $port -> $(echo "obase=10; ibase=16; $port" | bc)"
                done
        else
                for port in $(cat $1 | awk '{print $2}' | grep -oP ":[A-Z,0-9,]{4}" | sed "s/://" | sort -u); do
                        echo -e "\t[*] Port $port -> $(echo "obase=10; ibase=16; $port" | bc)"
                done
        fi
        echo -e "\n"
}
