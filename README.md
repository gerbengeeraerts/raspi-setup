#raspi-setup
> A boostrapping script for a simple raspi setup.

## Packages included
* Avahi & Netatalk
* Webstack: apache2, php5, mysql
* pip3

* Update & upgrade
* Basic dotfiles creation (see my raspi-dotfiles repo)

## Installing
Either copy this file over to your raspi or clone this repo.  
It's recommended to copy or clone it in the homedir `(cd ~)`  

Run `./install.sh`, if file is not executable, chmod it  
with ``chmod +x install.sh` and run again.

Let the script run and install dependencies & packages.  
Be sure to reboot afterwards for upgrade & update changes!

### Credits
Credit to Brandon Brown for his great bootstrapping script