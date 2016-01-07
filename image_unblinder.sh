#!/bin/bash
# renames all random images to original names
# to be used to undo image_blinder.sh
# written by Peter Fonseca

# ui
tput setaf 2
echo "all images will return to their original"
echo "names, as they were before blinding"
echo "proceed?"

tput sgr0
read proceed

# set up arrays from legend.csv
# should be output from image_blinder.sh
# then rename from arrays, reading legend.txt
tput setaf 2
case "$proceed" in
[yY]|[yY][eE][sS])
   echo "getting names..."
   originalfn=( $(awk -F "," '{print $1}' legend.csv) )

   newfn=( $(awk -F "," '{print $2}' legend.csv) )

   echo "renaming..."
   count=0
   while read i; do 
      mv ${newfn[count]} ${originalfn[count]}
      let "count=count+1"

   done < legend.txt
   tput sgr0
   exit
   ;;
*)
   # abort if user not input yes
   echo "aborting script..."
   tput sgr0
   exit
   ;;
esac
tput sgr 0
exit
