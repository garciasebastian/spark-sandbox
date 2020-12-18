#!/bin/bash

#Run this script ONCE on Cloudera VM
#This script prepares Cloudera VM 

yes | cp ./CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo

# upgrade spark python to work with python 3
sudo yum upgrade -y spark-python hive 
sudo yum install -y wget

# remove old derby jar so only one version is on spark's classpath
sudo rm /usr/lib/flume-ng/lib/derby-10.8.2.2.jar

# download and install anaconda for pandas, jupyter
rm -f Anaconda3-4.0.0-Linux-x86_64.sh
wget http://repo.continuum.io/archive/Anaconda3-4.0.0-Linux-x86_64.sh
bash Anaconda3-4.0.0-Linux-x86_64.sh

# _________when you see --More-- keep pressing SPACE BAR
# _________answer yes to all questions

# add spark-csv jars to classpath
echo export SPARK_CLASSPATH="$(pwd)/capstone/lib/spark-csv_2.10-1.5.0.jar:$(pwd)/capstone/lib/commons-csv-1.1.jar" >> ~/.bashrc

# set environment variables to load spark libs in jupyter
echo "export PYSPARK_DRIVER_PYTHON_OPTS=\"notebook\"" >> ~/.bashrc
echo "export PYSPARK_DRIVER_PYTHON=jupyter"  >> ~/.bashrc

source ~/.bashrc

jupyter notebook --generate-config
yes | cp jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

echo "Run 'source ~/.bashrc' to complete the setup."

