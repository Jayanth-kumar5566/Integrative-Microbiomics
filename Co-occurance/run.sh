#!/bin/bash

cd Bray-Curtis/
Rscript bray-curtis.R
python gmail.py
cd ..
cd GBLM/
Rscript GBLM.R
python gmail.py
cd ..
cd MI/
Rscript MI.R
cd ../Pearsons
Rscript pearsons.R; python gmail.py
cd ../Spearman
Rscript spearman.R; python gmail.py
cd ..

echo "All done"
