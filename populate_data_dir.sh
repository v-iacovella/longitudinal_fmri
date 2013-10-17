#!/bin/bash

for p in $(ls)
do

	for ses in ses1 ses2
	do
		mkdir $p/$ses
		rm $p/$ses/* -v
		ln -sv /home/vittorio/Projects/longFmri/Basso-Miceli-Aphasia/data/$p/$ses/*.nii.gz ./$p/$ses/

	done

done
