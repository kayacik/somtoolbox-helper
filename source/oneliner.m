if exist('som_read_data') == 0
	disp('[ERROR] SOM Toolbox does not appear to be installed. Make sure you can run som_demo1. You can download SOM Toolbox from http://www.cis.hut.fi/somtoolbox/.')
	exit(1)
end

run_umat_pca_on_data('../data/training.data', '../plots/')
exit(1)
