#/bin/bash

Help()
{
   # Display Help
   echo "This script will reload the static landing based on"
   echo "latest content inside src/ directory."
   echo
   echo "Usage:"
   echo "  reload.sh"
   echo "Options:"
   echo "  -h     Display this!"
   echo
}

# Get the options
while getopts ":h" option; do
   case $option in
        h) # display Help
            Help
            exit;;
        \?) # incorrect option
           echo "Error: Invalid option"
           echo "Run: reload.sh -h to see the options"
           exit;;
   esac
done

docker compose down builder && docker compose build builder && docker compose up builder
