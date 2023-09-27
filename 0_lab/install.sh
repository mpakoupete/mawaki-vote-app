#!/bin/bash

sudo cat << _EOF > /etc/vbox/networks.conf
# potential network issue resolution
* 0.0.0.0/0 ::/0
_EOF

vagrant up