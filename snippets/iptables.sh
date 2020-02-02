# use netfilter-persistent
# saved to /etc/iptables/rules.v4

#iptable --list --table nat # use this to show the rules

iptables --table nat -A PREROUTING -p tcp -m tcp --dport 443 -j REDIRECT --to-ports 8081
iptables --table nat -A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080
apt install iptables-persistent

# iptables-persistent saves when it installs
# apparently if you want to do it after you can either edit the above file or use:
# netfilter-persistent save

# see keep for transmission notes

# for restricting transmission to only going through the vpn

#this one should open for the web interface but it does all of them
#sudo iptables -A OUTPUT -d 192.168.0.0/24 -p tcp --sport 9091 -m owner --gid-owner debian-transmission -o enp1s0 -j ACCEPT
sudo iptables -A OUTPUT -m owner --gid-owner debian-transmission \! -o tun0 -j REJECT

#this currently doesn't work, transmission can still get out
#next I'll try what's in this answer:
#	https://askubuntu.com/a/462736
