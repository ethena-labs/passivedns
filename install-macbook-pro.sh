# Tested on Macbook Pro 2023 running Sonoma 14.4.1
brew install automake autoconf ldns jansson openssl
export LDFLAGS="-L$(brew --prefix openssl)/lib $LDFLAGS"
export CPPFLAGS="-I$(brew --prefix openssl)/include $CPPFLAGS"
export LDFLAGS="-L$(brew --prefix ldns)/lib $LDFLAGS"
export CPPFLAGS="-I$(brew --prefix ldns)/include $CPPFLAGS"
autoreconf --install
./configure
make
# To install binary to /usr/local/bin/passivedns
# sudo make install
# Run in daemon mode:
# passivedns -i en7 -l /var/log/passivedns.log -D
# And test using something like curl www.example.com:
# tail -f /var/log/passivedns.log
# 1713291888.580818||10.16.34.183||10.16.32.2||IN||www.1234.com.||CNAME||redirect.telstra.net.||300||1
# 1713291888.580818||10.16.34.183||10.16.32.2||IN||redirect.telstra.net.||A||203.36.190.9||30||1
# 1713291898.171922||10.16.34.183||10.16.32.2||IN||www.example.com.||AAAA||2606:2800:220:1:248:1893:25c8:1946||300||1
# 1713291898.179097||10.16.34.183||10.16.32.2||IN||www.example.com.||A||93.184.216.34||300||1
