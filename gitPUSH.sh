#!/bin/bash
#set -e
##################################################################################################################
# Author 	: 	braj wave
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# Below command will backup everything inside the project folder
git add --all .

# Give a comment to the commit if you want
echo "####################################"
echo "update with current time and date"
echo "####################################"

dt=$(date '+%d/%m/%Y %H:%M:%S');

# Committing to the local repository with a message containing the time details and commit text

git commit -m "braj commit on $dt"

# Push the local files to github

git push -u origin default


echo "################################################################"
echo "###################    Git Push Done      ######################"
echo "################################################################"
