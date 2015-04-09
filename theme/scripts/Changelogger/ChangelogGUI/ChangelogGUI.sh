#!/bin/bash
# To run this, simply cd to your ROM folder and run:
# . build/ChangelogGUI.sh
# :)

# Variables (in case I need 'em)
TodaysDate=$(date +"%m-%d-%Y")
ChangelogFile=Changelogs/$date/SQR-Changelog-$date.txt
Changelogger=repo forall -pc git log --reverse --no-merges --since=$NumberOf.days.ago > $ChangelogFile

# Functions, yay!

noMoreBoringStuff ()
{
    echo " "
    echo "Good news! We'll never have to do this again. :)"
    echo "(Unless you delete the folder...)"
    
    clear
}

changelogFolder ()
{
    # clear
    
    if [ ! -d Changelogs ]
    then sleep 1.5
    echo "First time?"
    sleep 1.5
    # echo " "
    # echo " "
    echo " "
    echo "Creating Changelog folder..."
    sleep 2
    mkdir Changelogs
    sleep 2
    echo " "
    echo "Done!"
    sleep 1.3
    echo " "
    
    # Let the user know what's going on
    echo "Adding Read and Write permissions to the folder..."
    sleep 1.6
    chmod 777 -R Changelogs
    echo "Done!"
    echo "Moving on..."
    sleep 1.5
    
    # Now that all the boring setup stuff is done, let's let the user know.
    noMoreBoringStuff
    
    else echo "Found the Changelog folder!"
    sleep 1.5
    echo " "
    echo "Moving on..."
    sleep 1.5
    
    fi
}

chmodFolder ()
{
    echo " "
    # echo " "
    echo "Would you like to chmod 777 -R your Changelog folder now?"
    echo "(Please enter yes, no, or help, followed by the ENTER key)"
    echo " "
    echo "Response:"
    
    read YesOrNo
    
    if [ $YesOrNo == "yes" ]
    echo " "
    then echo "Nice! Doing that for you..."
    sleep 1.6
    chmod 777 -R Changelogs
    echo "Done!"
    echo "Moving on..."
    sleep 1.5
    
    elif [ $YesOrNo == "no" ]
    then echo "Okay then."
    echo "Continuing..."
    sleep 2
    
    elif [ $YesOrNo == "help" ]
    then echo "HELPING"
    
    else
    echo "WTF?"
    fi
}

gitChangelog ()
{
    echo "############################################################"
    echo "#                                                          #"
    echo "#                                                          #"
    echo "#                      Date Chooser                        #"
    echo "#                                                          #"
    echo "#                                                          #"
    echo "############################################################"
    echo " "
    echo "How many days back would you like to go?"
    echo "(enter the word 'today' if you'd like to pull the changes from today only)"
    echo " "
    echo "** Friendly tip! **"
    echo "It's recommended to repo sync prior to pulling any changelogs"
    echo " "
    echo "Amount of days"
    echo "--------------"
    # echo " "
    # echo " "
    
    read NumberOf
    
    if [ $NumberOf = $NumberOf ]
    then echo " "
    echo "Creating directory for todays date..."
    sleep 2
    mkdir Changelogs/$(date +"%m-%d-%Y")
    
    echo " "
    echo "Entering the directory for $TodaysDate"
    sleep 1.5
    
    cd Changelogs/$(date +"%m-%d-%Y")
    
    echo " "
    echo "Pulling the changelog from $NumberOf days ago"
    
    repo forall -pc git log --reverse --no-merges --since=$NumberOf.days.ago > ROM-Changelog-$(date +"%m-%d-%Y").txt
    echo " "
    echo "Done!"
    sleep 2
    
    cd ..
    cd ..
    
    echo " "
    echo "Settings some permissions..."
    sleep 1.5
    
    chmod 777 -R Changelogs
    echo "Done!"
    cd ..
    #cd Changelogs &&
    # mkdir $Date
    # cd Changelogs
    # cd $Date
    echo " "
    # echo "Done!"
    sleep 2.4
    
    echo " "
    echo "Go ahead and head on over to your Changelogs/$TodaysDate folder to find the changelog."
    sleep 3
    echo " "
    
    echo "Exiting..."
    sleep 2
    
    elif [ $NumberOf = "today" ]
    then echo " "
    echo "Creating directory for todays date..."
    sleep 2
    mkdir Changelogs/$(date +"%m-%d-%Y")
    
    echo " "
    echo "Entering the directory for $TodaysDate"
    sleep 1.5
    
    cd Changelogs/$(date +"%m-%d-%Y")
    
    echo " "
    echo "Pulling the changelog from 1 day ago"
    
    repo forall -pc git log --reverse --no-merges --since=1.day.ago > ROM-Changelog-$(date +"%m-%d-%Y").txt
    echo " "
    echo "Done!"
    sleep 2
    
    cd ..
    cd ..
    
    echo "Settings some permissions..."
    sleep 1.5
    
    chmod 777 -R Changelogs
    cd ..
    #cd Changelogs &&
    # mkdir $Date
    # cd Changelogs
    # cd $Date
    echo " "
    echo "Done!"
    sleep 1.5
    
    echo " "
    echo "Go ahead and head on over to your Changelogs/$TodaysDate folder to find the changelog."
    sleep 1.5
    echo " "
    
    echo "Exiting..."
    fi
    
}
clear

cd build
# echo " "
# echo " "

echo "############################################################"
echo "#                                                          #"
echo "#                                                          #"
echo "#                      Changelogger                        #"
echo "#                                                          #"
echo "#                     Version 0.0.2b                       #"
echo "#                                                          #"
echo "#                                                          #"
echo "############################################################"
sleep 2
# echo " "
# echo " "
# echo " "
echo " "

# Create the Changelog folder if we can't find it
changelogFolder

# Ask if they want to chmod the folder
# EDIT: August 16th, 2014:
# Meh. I think we should just chmod it for ease of purpose.
# I left the function in just in case. It still has some bugs to fix

# chmodFolder
# ^^^ That's the function that prompts the response

# Time to get to the good stuff
gitChangelog
