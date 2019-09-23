#!/bin/bash 

# unarchive
tar -zxf /opt/spark-2.2.0-bin-hadoop2.7.tgz -C /opt
ln -s /opt/spark-2.4.4-bin-hadoop2.7 /opt/spark 

# Setup Config 
cat << EOF > /opt/spark/conf/spark-defaults.conf
spark.master                        yarn
spark.driver.memory                 512m
spark.yarn.am.memory                512m
spark.executor.memory               512m
spark.eventLog.enabled              true
spark.eventLog.dir                  hdfs://hadoop-master:9000/spark-logs
spark.history.fs.update.interval    10s
spark.history.ui.port               18080
EOF

# Setup PATH
PROFILE=$(cat /root/.bashrc)
cat <<EOF
$PROFILE
export SPARK_HOME=/opt/spark
export PATH=$SPARK_HOME/bin:$PATH 
export HADOOP_CONF_DIR=$HADOOP_HOME/hadoop/etc/hadoop
EOF

# Start 
source /root/.bashrc
/opt/spark/sbin/stop-master.sh
/opt/spark/sbin/start-master.sh

/opt/spark/sbin/stop-slave.sh spark://hadoop-master:7077
/opt/spark/sbin/start-slave.sh spark://hadoop-master:7077
