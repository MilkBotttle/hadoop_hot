#!/bin/bash 

# Unarchive
tar -xf /opt/mahout-0.14.0.tar.gz -c /opt
ln -s /opt/mahout-0.14.0 /opt/mahout

# Setup Config 

# Setup PATH
PROFILE=$(cat /root/.bashrc)
cat <<EOF
$PROFILE
export MAHOUT_HOME=/opt/mahout
export MAHOUT_CONF_DIR=$MAHOUT_HOME/conf
export PATH=$MAHOUT_HOME/conf:$MAHOUT_HOME/bin:$PATH
EOF

# Start
