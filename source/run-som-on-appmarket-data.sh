#!/bin/bash
#
# Driver script that assumes matlab is installed and callable from command line
# Plotting usually displays figures on screen so without X11 support, plotting
# may fail, miserably.
#
# Som_toolbox should also be installed. You can find more information on Som_Toolbox
# at:
# http://www.cis.hut.fi/somtoolbox/
#
# oneliner.m is my hack for running a function from command line. Should probably find
# a more elegant way to do this.
#
echo "[INFO] Converting the data into SOM Toolbox format."
./to-somtoobox-format.py --cols=121,122 < ../data/android-app.data > ../data/training.data
command -v matlab -nodesktop -r oneliner >/dev/null 2>&1 || { echo >&2 "[ERROR] Matlab does not seem to be installed. This script assumes matlab is in execution path.  Aborting."; exit 1; }
echo "[INFO] Training SOM and plotting..."
matlab -nodesktop -r oneliner
echo "[INFO] Done!"
