This repo contains the code for blinding one's self to the identity of a set of mri files. Thes two scripts run in bash.

	> RVS_blinder.sh randomly shuffles numeric identifiers,
	renaming the mri files with the new random numbers. This
	also generates a legend (.csv) to reference back to when
	the researcher is ready to unblind and reveal the
	identities. This bash script takes .nii extension and
	.hdr/.img pairs. It is worth noting that, since each .hdr
	is associated with a correspoding .img, these two files
	will share the same root name (numeric identifiers are the
	same). All files must be in one directory and all
	relevant files in the working directory will be renamed.

	> RVS_unblinder.sh undoes the action of RVS_blinder.sh
	based on the legend.csv. This is not necessary for
	unblinding or anything other than protection (in case the
	researcher needs to name the files back or accidentally
	renames the wrong files).

-peter