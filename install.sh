#! /bin/sh

black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'


alias Reset="tput sgr0"      #  Reset text attributes to normal
#+ without clearing screen.

# Color-echo.
# Argument $1 = message
# Argument $2 = Color
cecho() {
  echo "${2}${1}"
  Reset # Reset to normal.
  return
}

echo ""
cecho "===================================================" $white
cecho "Disable login message on SSH connection? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    cecho "Creating .hushlogin in ~/" $yellow
    touch ~/hushlogin
    sleep 2s
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Create an aliases file? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    cecho "Creating .bash_aliases in ~/" $yellow
    touch ~/.bash_aliases

    echo ""
    cecho "Writing sudo apt-get alias to file..." $yellow
    echo "alias apt-get=\"sudo apt-get\"" > ~/.bash_aliases
    sleep 2s
    cecho "Writing al alias for editing aliasfile to file..." $yellow
    echo "alias al=\"sudo nano ~/.bash_aliases\"" >> ~/.bash_aliases
    sleep 2s
    echo ""
    cecho "Reloading the shell to apply changes" $yellow
    exec $SHELL -l
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Install netatalk and avahi? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing avahi" $yellow
    apt-get install avahi-daemon
    sleep 2s
    apt-get install netatalk
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Install pip - Python package manager (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing pip3..." $yellow
    apt-get install python3-pip
    sleep 2s
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Install the standard webstack (y/n)" $blue
cecho "(apache2 / php5 / libapache2-mod-php5 / mysql)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    packages=(
      apache2
      php5
      libapache2-mod-php5
      mysql
    )
    cecho "Insalling all packages..." $yellow
    apt-get install ${packages[@]}
    sleep 2s
  break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Update and upgrade rpi? (y/n)" $blue
cecho "Restart your rpi when done" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
  echo ""
  cecho "Performing update..." $yellow
  apt-get update
  sleep 2s
  echo ""
  cecho "Performing upgrade..." $yellow
  apt-get upgrade
  break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Read more about this setup on my blog:" $green
cecho "http://blog.thibmaekelbergh.be" $green
echo ""
cecho "Search for topics related to Raspberry Pi or:" $green
cecho "* http://blog.thibmaekelbergh.be/supercharging-the-raspberry-pi-for-terminal" $green
cecho "* http://blog.thibmaekelbergh.be/i-got-a-raspberry-pi-heres-how-i-configured-it" $green
cecho "* https://github.com/thibmaek/raspi-dotfiles" $green
echo ""
cecho "Special thanks to http://brandonb.io for his boostrapping script" $green
cecho "===================================================" $white
