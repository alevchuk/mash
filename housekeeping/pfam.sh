#!/bin/sh
cd /home_girkelab/alevchuk/projects/5-clustalw-to-html
time hmmpfam --cpu 8 --acc -E 1e-4 /srv/projects/db/PFAM/Pfam_ls housekeeping/test.fasta | /home_girkelab/alevchuk/projects/1-arabiclust/scripts/filter-hmmpfam-output > test.bigger.pfams
