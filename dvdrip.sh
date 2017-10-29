#!/bin/bash
#This script will rip a DVD, convert it to an ISO image and place this in the ~/Videos/Movies directory.

echo "Hello, "$USER". This script will rip a DVD for you and place the ISO in your Movies folder."

echo -n "Enter the DVD title without any spaces and press [ENTER]: "

read title
echo "Your DVD is called "$title""

read -r -p "If this is your title, press y to continue [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]
then
	echo "Here we go then. Burning "$title".iso"
	dvdbackup -i /dev/sr0 -o ~/Videos/Movies -n $title -p -M
	genisoimage -dvd-video -o ~/Videos/Movies/"$title".iso ~/Videos/Movies/$title
	rm -rv ~/Videos/Movies/$title
else
	echo "Stopping burn because you did not press 'y' or 'yes'."
fi

echo "Finished burning "$title". You can find it in ~/Videos/Movies"
eject
