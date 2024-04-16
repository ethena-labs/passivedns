# Install passivedns on Debian 12 (Bookworm).
sudo apt install git build-essential libldns-dev libpcap-dev automake autoconf
autoreconf --install
./configure
# This installs binary to /usr/local/bin/passivedns
make install
# To run in daemon mode:
# passivedns -i ens5 -l /var/log/passivedns.log -D
# And test using something like curl www.example.com:
# tail -f /var/log/passivedns.log
# 1713291888.580818||10.16.34.183||10.16.32.2||IN||www.1234.com.||CNAME||redirect.telstra.net.||300||1
# 1713291888.580818||10.16.34.183||10.16.32.2||IN||redirect.telstra.net.||A||203.36.190.9||30||1
# 1713291898.171922||10.16.34.183||10.16.32.2||IN||www.example.com.||AAAA||2606:2800:220:1:248:1893:25c8:1946||300||1
# 1713291898.179097||10.16.34.183||10.16.32.2||IN||www.example.com.||A||93.184.216.34||300||1
