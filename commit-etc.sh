#!/bin/sh
# check that rsync is installed
rsync --version || exit 1

if [ -f /proc/sys/kernel/hostname ]; then
	hostname=$(cat /proc/sys/kernel/hostname)
else
	hostname=$(hostname -s)
fi

dirs="/etc /usr/local/etc /root /usr/pkg/etc /opt/homebrew/etc"
cd $HOME/etc-$hostname || exit 1

echo "$(hostname) configuration synced via https://github.com/tstromberg/commit-etc" > README.md
uname -a > uname.txt

for dir in $dirs; do
	if [ ! -d "${dir}" ]; then
		continue
	fi
	if [ ! -r "${dir}" ]; then
		continue
	fi

	rsync -vaRm --delete-excluded $dir \
		--exclude .ssh/ \
		--exclude "*.cache" \
		--exclude "*.db" \
		--exclude "*.log" \
		--exclude "*.pem" \
		--exclude "*.pid" \
		--exclude "*.png" \
		--exclude "*.sample" \
		--exclude "*.seed" \
		--exclude "*.swp" \
		--exclude "*~" \
		--exclude "*cert*" \
		--exclude "*chatscript*" \
		--exclude "*key" \
		--exclude "*keys" \
		--exclude "*pgp*" \
		--exclude "*polkit*" \
		--exclude "*private*" \
		--exclude "*pwd*" \
		--exclude "*shadow*" \
		--exclude "*snmp*" \
		--exclude "*sudoers*" \
		--exclude "*users*" \
		--exclude "crypttab" \
		--exclude "gcp-cups*json" \
		--exclude "key.*" \
		--exclude acme/ \
		--exclude audisp-remote.conf \
		--exclude bluetooth/ \
		--exclude cups/ \
		--exclude crontab \
		--exclude doas.conf \
		--exclude devfs.rules \
		--exclude errors/ \
		--exclude fonts/ \
		--exclude gnupg/ \
		--exclude kernel.d/ \
		--exclude libaudit.conf \
		--exclude master.passwd \
		--exclude nsmb.conf \
		--exclude ntp/ \
		--exclude opieaccess \
		--exclude ppp/ \
		--exclude radiusd.conf \
		--exclude rc.d/ \
		--exclude securetty \
		--exclude security/ \
		--exclude snmpd.conf \
		--exclude ssl/ \
		--exclude ssmtp \
		--exclude syncthing \
		--exclude tcsd.conf \
		--exclude templates/ \
		--exclude useradd \
		--exclude wireguard/ \
		--exclude wpa_supplicant/ \
		--exclude xdg/ \
		--exclude zos-remote.conf \
		.
done

git add .
git commit -am "$(git status -s | xargs)"
git push
