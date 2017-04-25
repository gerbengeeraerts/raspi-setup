# raspi-setup
> A bootstrapping script for a simple raspi setup.

## Packages included
* Webstack: apache2, php5, mysql
* pip3
* Compiled version of node & npm
* Common node modules

## Installing
Either copy this file over to your raspi or clone this repo.  
It's recommended to copy or clone it in the homedir `cd ~`  

Run `sudo ./install.sh`, if file is not executable, chmod it  
with `chmod +x install.sh` and run again.

Let the script run and install dependencies & packages.  
Be sure to reboot afterwards for upgrade & update changes!

> Check the develop branch for a more modular plug'n play approach.
