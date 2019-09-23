#!/bin/bash 

# Unarchive
tar -zxf /opt/apache-hive-3.1.2-bin.tar.gz -C /opt
ln -s /opt/apache-hive-3.1.2-bin /opt/hive

# Setup Config 
cat << EOF > /opt/hive/conf/hive-site.xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration> 
<property>
   <name>javax.jdo.option.ConnectionURL</name>
   <value>jdbc:mysql://localhost:3306/hive?createDatabaseIfNotExist=true</value>
   <description>JDBC connect string for a JDBC metastore </description>
</property> 
<property>
   <name>javax.jdo.option.ConnectionDriverName</name>
   <value>com.mysql.jdbc.Driver</value>
</property>

<property>
   <name>javax.jdo.option.ConnectionUserName</name>
   <value>root</value>
</property>

<property>
   <name>javax.jdo.option.ConnectionPassword</name>
   <value>root</value>
</property>

<property>      
        <name>hive.querylog.location</name>     
        <value>/opt/hive/tmp</value>   
</property>    

<property>      
        <name>hive.exec.local.scratchdir</name>     
        <value>/opt/hive/tmp</value>   
</property>   

<property>   
        <name>hive.downloaded.resources.dir</name>     
        <value>/opt/hive/tmp</value>   
</property>

<property>
        <name>datanucleus.schema.autoCreateAll</name>
        <value>true</value>
</property>

</configuration>
EOF

cat << EOF > /root/.my.cnf
[mysql]
user=root
host=localhost
password='root'
socket=/var/lib/mysql/mysql.sock

[client]
user=root
host=localhost
password='root'
socket=/var/lib/mysql/mysql.sock

[mysqldump]
user=root
host=localhost
password='root'
socket=/var/lib/mysql/mysql.sock

[mysqladmin]
user=root
host=localhost
password='root'
socket=/var/lib/mysql/mysql.sock

[mysqlcheck]
user=root
host=localhost
password='root'
socket=/var/lib/mysql/mysql.sock
EOF 

# Setup PATH
PROFILE=$(cat /root/.bashrc)
cat <<EOF
$PROFILE
export HIVE_HOME=/opt/hive
export HIVE_CONF_DIR=/opt/hive/conf
EOF

# Start
source /root/.bashrc
schematool -initSchema -dbType mysql
