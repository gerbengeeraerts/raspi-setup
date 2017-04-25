#! /bin/sh

black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

alias Reset="tput sgr0" #Reset text attributes to default without clearing screen.

# Color-echo.
# Argument $1 = message
# Argument $2 = Color
cecho() {
  echo "${2}${1}"
  Reset
  return
}

cecho "===================================================" $white
echo "Instaling git first…"
cecho "===================================================" $white
sudo apt-get install git > /dev/null 2>&1


echo ""
cecho "===================================================" $white
cecho "Install pip - Python package manager (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing pip3…" $yellow
    sudo apt-get install -y python3-pip > /dev/null 2>&1
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Install the standard webstack (y/n)" $blue
cecho "(apache2 / php5 / libapache2-mod-php5 / php5-mysql)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing apache, php and mysql packages…" $yellow
    sudo apt-get install -y apache2 php5 libapache2-mod-php5 php5-mysql mysql-server mysql-server-5.5> /dev/null 2>&1
  break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Install node & npm? (y/n)?" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
  echo ""
  cecho "Downloading latest package from node-arm…" $yellow
  wget -qq -P /tmp http://node-arm.herokuapp.com/node_latest_armhf.deb
  cecho "Unpacking and installing package…" $yellow
  sudo dpkg -i /tmp/node_latest_armhf.deb
  cecho "Checking if install worked. If no version number" $yellow
  cecho "is listed, install failed." $yellow
  node -v
  sleep 2s
  cecho "Installing npm completion for bash… (in .bash_profile)" $yellow
  break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Install common node modules? (y/n)?" $blue
cecho "This will take very long, continue?" $red
cecho "===================================================" $white
read -r response
case $response in
  [yY])
  echo ""
  cecho "Installing modules… Takes a while, don't shut down" $yellow
  sudo npm install -g gulp grunt  > /dev/null 2>&1
  break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Install htop for system monitoring? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
  echo ""
  sudo apt-get install -y htop > /dev/null 2>&1
  break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Update and upgrade rpi? (y/n)" $blue
cecho "Restart your rpi when done" $red
cecho "===================================================" $white
read -r response
case $response in
  [yY])
  echo ""
  cecho "Performing update… (takes a while)" $yellow
  sudo apt-get -y update > /dev/null 2>&1
  echo ""
  cecho "Performing upgrade… (takes a while)" $yellow
  sudo apt-get -y upgrade > /dev/null 2>&1
  break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Upgrade to newer kernel? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
  echo ""
  sudo rpi-update
  break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Original Setup repo by Thibmaek:" $blue
cecho "* http://blog.thibmaekelbergh.be" $green
echo ""
cecho "Special thanks to http://brandonb.io for his boostrapping script" $blue
cecho "Auto-reload the shell? (y/n)" $red
cecho "===================================================" $white
read -r response
case $response in
  *) ;;
esac
