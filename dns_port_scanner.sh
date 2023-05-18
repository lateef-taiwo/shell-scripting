for i in `seq 1 100`; do echo $i; done

nmap -v -sV -p- -Pn -n --disable-arp-ping --source-port 53 10.129.179.224

nc -nv -p 53 10.129.180.59 50000

#HTB Machines to brush my Nmap
#Machines

#Nest E
#Player H
#Vault M
#Blue E
