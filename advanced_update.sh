#!/bin/bash

#Update -- Debian/Ubuntu Update Tool (Version 1.0)
#Advanced Script to fully update system: "update" Adding the option "--clean" will
#remove orphaned packages and auto-clean the apt cache
#By Abdul www.savvytech.com (GNU/General Public License versio 2.0)

#set BASH to quit script and exit if it encounters any error(s):

set -e 
# Functions:

update() {
echo "Starting full system update..."
sudo apt-get update
sudp apt-get dist-upgrade -yy

}

clean() {
echo "Cleaning up..."
sudo apt-get autoremove -yy
sudo apt-get autoclean

}

leave() {
echo "..............."
echo "- Update Complete! -"
echo "..............."
exit

}

update-help() {


cat << _EOF_

Update is a tool that automates the update procedure for Debian and Ubuntu based Linux Systems.

Commands:

   update = full system upgrade

   Running "update" with no options will update the apt cache and then perform a full distribution update automatically.

   update --clean = full system update with cleanup.

  Adding the "__clean" option will invoke the apt commands to search for and
  remove locally cached packages that are no longer in the repositories and 
  remove orphaned packages that are no longer needed by programs.

  update --help = shows this help page

By Abdul www.savvytech.com (GNU/General Public License version 2.0)

_EOF_

#Execution

#Lets do this

	
}
