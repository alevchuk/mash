#!/bin/sh
cd /home_girkelab/alevchuk/projects/5-clustalw-to-html
time hmmpfam --cpu 8 --acc -E 1e-4 /srv/projects/db/PFAM/Pfam_ls ../4-update-families/oldfam_2005_FE/multialign/ONE-FAMILY.fasta | /home_girkelab/alevchuk/projects/1-arabiclust/scripts/filter-hmmpfam-output > oldfam_2005_FE.pfams
