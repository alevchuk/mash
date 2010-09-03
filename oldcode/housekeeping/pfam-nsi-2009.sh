#!/bin/sh
cd /home_girkelab/alevchuk/projects/5-clustalw-to-html/housekeeping
time hmmpfam --cpu 8 --acc -E 1e-4 /srv/projects/db/PFAM/Pfam_ls ../../4-update-families/newfam_2005_NSI.fasta | /home_girkelab/alevchuk/projects/1-arabiclust/scripts/filter-hmmpfam-output > newfam_2009_NSI.pfams
