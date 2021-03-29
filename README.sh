# Installation instructions 


# Step 1: [CRUCIAL] Verify matlab version with which binaries were compiled. e.g. Matlab Runtime 9.6 == 2019a, 9.7 == 2019b, etc. 

# Step 2: Make sure that `wget` in the Dockerfile grabs CORRECT Matlab Runtime version from here: https://www.mathworks.com/products/compiler/matlab-runtime.html

# Step 3: Make sure that LD_LIBRARY_PATH in Dockerfile correct subdirectory inside /opt/mcr/ (e.g. v97 for Runtime 9.7 and v96 for Runtime 9.6, etc)

# Step 4: Clean docker  
sudo docker images 
sudo docker system prune 

# Step 5: Build 
cd ~/w/code/dce/feb2021-docker-image/dce_docker/matlab/matlab-mcr-from-flywheel/2019a_serge/
sudo docker build --no-cache -t sergeicu/matlab-mcr:v96 .

# Step 6: Map the binary dir and chmod it 
# e.g. 
bindir=/home/ch215616/war/compiler//magicsquare/for_redistribution_files_only
chmod -R ugo+rwx $bindir 

# Step 7: Verify that docker image has the correct mappting 
sudo docker run --rm -it -v $bindir:/execute sergeicu/matlab-mcr:v96 /bin/bash
ls /opt/mcr/v96
ls /execute 
bash execute/run_magicsquare.sh /opt/mcr/v96 5

# Step 8: Run docker image independently: 
sudo docker run --rm -it -v $bindir:/execute sergeicu/matlab-mcr:v96 /execute/run_magicsquare.sh /opt/mcr/v96 5


