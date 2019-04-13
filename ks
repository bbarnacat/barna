#version=DEVEL
ignoredisk --only-use=sda
autopart --type=lvm
# Partition clearing information
clearpart --none --initlabel
# Use graphical install
graphical
# Keyboard layouts
keyboard --vckeymap=es --xlayouts='es'
# System language
lang es_ES.UTF-8

# Network information
network  --bootproto=dhcp --device=enp0s3 --ipv6=auto --activate
network  --hostname=localhost.localdomain
# Root password
rootpw --iscrypted $6$fzDW4yOF8g0fM32B$7SjbkZaPKbV.h1ogGTqXaLEQVJeM96wfnUH4AMHUUcnwNDiWDppvrqZn1gvQb44Lp2mVD27G75eO/ck2PUiMf/
# X Window System configuration information
xconfig  --startxonboot
# Run the Setup Agent on first boot
firstboot --enable
# System services
services --enabled="chronyd"
# System timezone
timezone Europe/Madrid --isUtc
user --groups=wheel --name=j --gecos="j"

%packages
@^workstation-product-environment

%end

%addon com_redhat_kdump --disable --reserve-mb='128'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end
