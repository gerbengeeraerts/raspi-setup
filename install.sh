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

echo ""
cecho "===================================================" $white
cecho "Create a log for commands executed in this setup? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    cecho "Logging setup to rpi_bslog.txt in ~/" $yellow
    touch ~/rpi_bslog.txt # log
    sleep 1s
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Disable login message on SSH connection? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    cecho "Creating .hushlogin in ~/" $yellow
    echo "touch ~/.hushlogin" > ~/rpi_bslog.txt # log
    touch ~/.hushlogin
    sleep 1s
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
    echo "touch ~/.bash_aliases" >> ~/rpi_bslog.txt # log
    touch ~/.bash_aliases

    echo ""
    cecho "Writing sudo apt-get alias to file..." $yellow
    echo "alias apt-get=\"sudo apt-get\"" > ~/.bash_aliases
    sleep 1s
    cecho "Writing al alias for editing aliasfile to file..." $yellow
    echo "alias al=\"nano ~/.bash_aliases\"" >> ~/.bash_aliases
    sleep 1s
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
    echo "sudo apt-get install avahi-daemon" >> ~/rpi_bslog.txt #log
    sudo apt-get install avahi-daemon
    sleep 2s
    echo "sudo apt-get install netatalk" >> ~/rpi_bslog.txt #log
    sudo apt-get install netatalk
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
    echo "sudo apt-get install python3-pip" >> ~/rpi_bslog.txt #log
    sudo apt-get install python3-pip
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
    echo ""
    cecho "Installing all packages..." $yellow
    echo "apt-get install ${packages[@]}" >> ~/rpi_bslog.txt #log
    sudo apt-get install ${packages[@]}
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
  echo "wget -P /tmp http://node-arm.herokuapp.com/node_latest_armhf.deb" >> ~/rpi_bslog.txt #log
  wget -P /tmp http://node-arm.herokuapp.com/node_latest_armhf.deb
  cecho "Unpacking and installing package…" $yellow
  echo "sudo dpkg -i tmp/node_latest_armhf.deb" >> ~/rpi_bslog.txt #log
  sudo dpkg -i tmp/node_latest_armhf.deb
  cecho "Checking if install worked. If no version number" $yellow
  cecho "is listed, install failed."
  echo "node -v" >> ~/rpi_bslog.txt #log
  node -v
  sleep 2s
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
  node_modules=(
    bower
    gulp
    grunt
  )
  echo ""
  cecho "Installing modules… Takes a while, don't shut down" $yellow
  echo "sudo npm install -g ${node_modules[@]}" >> ~/rpi_bslog.txt #log
  sudo npm install -g ${node_modules[@]}
  break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Update and upgrade rpi? (y/n)" $blue
cecho "This will overwrite custom kernel" $red
cecho "Restart your rpi when done" $red
cecho "===================================================" $white
read -r response
case $response in
  [yY])
  echo ""
  cecho "Performing update..." $yellow
  echo "sudo apt-get update" >> ~/rpi_bslog.txt #log
  sudo apt-get update
  sleep 1s
  echo ""
  cecho "Performing upgrade..." $yellow
  echo "sudo apt-get upgrade" >> ~/rpi_bslog.txt #log
  sudo apt-get upgrade
  break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Read more about this setup on my blog:" $blue
cecho "http://blog.thibmaekelbergh.be" $green
echo ""
cecho "Search for topics related to Raspberry Pi or:" $blue
cecho "* http://blog.thibmaekelbergh.be/supercharging-the-raspberry-pi-for-terminal" $green
cecho "* http://blog.thibmaekelbergh.be/i-got-a-raspberry-pi-heres-how-i-configured-it" $green
cecho "* https://github.com/thibmaek/raspi-dotfiles" $green
echo ""
cecho "Special thanks to http://brandonb.io for his boostrapping script" $blue
cecho "Auto-reload the shell? (y/n)" $red
cecho "===================================================" $white
read -r response
case $response in
  [yY])
  exec $SHELL -l
  *) break;;
