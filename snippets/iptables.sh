# use netfilter-persistent
# saved to /etc/iptables/rules.v4

#iptable --list --table nat # use this to show the rules

iptables --table nat -A PREROUTING -p tcp -m tcp --dport 443 -j REDIRECT --to-ports 8081
iptables --table nat -A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080
apt install iptables-persistent

# iptables-persistent saves when it installs
# apparently if you want to do it after you can either edit the above file or use:
# netfilter-persistent save
