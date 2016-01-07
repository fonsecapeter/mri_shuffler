#!/bin/bash
# renames all images in a random order
# outputs legend.txt and legend.csv for unblinding
# DO NOT READ legend* UNTIL YOU UNBLIND
# written by Peter Fonseca


# ui
tput setaf 2
echo "all *.nii, *.hdr, & *.img files will be randomized"
tput setaf 2
echo "would you like to proceed?"
tput sgr0
read proceed

tput setaf 2
case "$proceed" in



[yY]|[yY][eE][sS])
   # if use input some kind of yes
   # generate text file with file names
   # of all images
   echo "locating images..."
   ls *.nii *.hdr *.img > file_names.txt

   # generate array with random values for every
   # image file in ./
   echo "randomizing..."
   numdraw=$(wc -l < file_names.txt)
   entries=($(shuf -i 0-$numdraw -n $numdraw))

   # rename all image files in ./ from shuffled array
   echo "renaming..."
   count=0
   while read i; do
      let "count=count+1" 
  	  if [[ "$i" = *.img ]]; then
 	       mv $i ${entries[$count-2]}.img
               echo "$i is now ${entries[$count-2]}.img"  >> ./legend.txt
               echo "$i,${entries[$count-2]}.img"  >> ./legend.csv
	  fi
	  if [[ "$i" = *.hdr ]]; then
	       mv $i ${entries[$count-1]}.hdr
               echo "$i is now ${entries[$count-1]}.hdr"  >> ./legend.txt
               echo "$i,${entries[$count-1]}.hdr"  >> ./legend.csv
	  fi
          if [[ "$i" = *.nii ]]; then
               mv $i ${entries[$count-1]}.nii
               echo "$i is now ${entries[$count-1]}.nii"  >> ./legend.txt
               echo "$i,${entries[$count-1]}.nii"  >> ./legend.csv
          fi
   done < file_names.txt


   rm file_names.txt   # remove for clarity

   # ui
   echo "complete"
   echo "please read legend.sh and legend.csv"
   tput setaf 6
   echo "ONLY WHEN YOU WANT TO UNBLIND YOUR FILES"
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

