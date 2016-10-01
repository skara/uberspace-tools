#!/bin/sh

# Install mu-tools

# get current dir
this="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

## Logrotate
mkdir ~/.logs
cp $this/etc/mu-logrotate.conf ~/etc/
sed -i -e "s|^HOME|$HOME|" ~/etc/mu-logrotate.conf

## Installing Services
test -d ~/service || uberspace-setup-svscan

## Letsencrypt
mkdir ~/.logs/letsencrypt/
uberspace-letsencrypt
cp $this/bin/mu-letsencrypt ~/bin/
chmod +x ~/bin/mu-letsencrypt
echo "Installing Letsencrypt service..."
svc="mu-svc-letsencrypt"
test -d ~/etc/$svc && rm -rf ~/etc/$svc
runwhen-conf ~/etc/$svc ~/bin/mu-letsencrypt > /dev/null
sed -i -e "s/^RUNWHEN=.*/RUNWHEN=\",d=\/2,H=`echo $((RANDOM % 4))`,M=`echo $((RANDOM % 60))`\"/" ~/etc/$svc/run
ln -sf ~/etc/$svc ~/service


## Mail stuff
# install DSPAM
echo "Installing DSPAM service..."
test -d ~/etc/dspam-learn && rm -rf ~/etc/dspam-learn
runwhen-conf ~/etc/dspam-learn $this/dspam-learn > /dev/null
sed -i -e "s/^RUNWHEN=.*/RUNWHEN=\",M=`awk 'BEGIN { srand(); printf("%d\n",rand()*60) }'`\"/" ~/etc/$svc/run
ln -sf ~/etc/$svc ~/service

# install DSPAM cleanup service
echo "Installing DSPAM cleanup service..."
svc="dspam_clean_hashdb"
test -d ~/etc/$svc && rm -rf ~/etc/$svc
runwhen-conf ~/etc/$svc "/usr/local/bin/dspam_clean_hashdb" > /dev/null
sed -i -e "s/^RUNWHEN=.*/RUNWHEN=\",H=`awk 'BEGIN { srand(); printf("%d\n",rand()*24) }'`\"/" ~/etc/$svc/run
ln -sf ~/etc/$svc ~/service

# install mailfilter file
echo "Installing mailfilter file to ~/.mailfilter..."
cp $this/tpl/mu-mailfilter.tpl ~/.mailfilter
chmod 600 ~/.mailfilter

# install mailfilter into qmail-default
echo "Activating maildrop for all users..."
echo -n "|maildrop" > ~/.qmail-default

## misc
cp $this/bin/mu-quota ~/bin/
chmod +x ~/bin/mu-quota


echo "Installing logscanner service..."
cp $this/bin/mu-logscanner ~/bin/
chmod +x mu-logscanner
svc="mu-svc-logscanner"
test -d ~/etc/$svc && rm -rf ~/etc/$svc
runwhen-conf ~/etc/$svc ~/bin/mu-logscanner -s > /dev/null
sed -i -e "s/^RUNWHEN=.*/RUNWHEN=\",H=`awk 'BEGIN { srand(); printf("%d\n",rand()*24) }'`\"/" ~/etc/$svc/run
ln -sf ~/etc/$svc ~/service
