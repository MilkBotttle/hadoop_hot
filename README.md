# Hadoop Cluster Deploy
HOT for deploy Hadoop cluster.
This template will deploy hadoop cluster with 1+n nodes.

## Quick Start
> Auto scaling hadoop cluster boot from image
1. Edit `environments/auto-scale-env.yaml`
2. Create stack
```
openstack stack create  -t auto_scale_hadoop.yaml \
                        -e environments/resource_environment.yaml \
                        -e environments/auto-scale-env.yaml \
                        auto-scale-hadoop --wait
```
> Auto scaling hadoop cluster boot from volume
> Don't forget the volume_size parameter
1. Edit `environments/auto-scale-env-from-volume.yaml`
2. Create stack
```
openstack stack create  -t auto_scale_hadoop_from_volume.yaml \
                        -e environments/resource_environment.yaml \
                        -e environments/auto-scale-env-from-volume.yaml \
                        auto-scale-hadoop-from-volume --wait
```
## Parameter Description
> If the parameter no default description there is required parameter.
* CoolDown: Scaling cooldown period, in seconds. (default: 300)
* UseCpuAlarm: Enable cpu alarm, if set to false scaling will not happen. (default: false)
* CpuMaxThreshold: Max cpu threshold to trigger alarm. (default: 80)
* CpuMinThreshold: Min cpu threshold to trigger alarm. (default: 5)
* AutoScalingUpAdjustment: Each time scaling up size of adjustment. (default: 1, min: 1)
* AutoScalingDownAdjustment: Each time scaling down size of adjustment. (default: -1, max: -1)
* EvaluationPeriods: Number of periods to evaluate over scaling. (default: 1)
* SlaveSizeMax: slave nodes max size.
* SlaveSizeMin: slave nodes min size. (default: 1)
* key_name: Keystone key pair name
* flavor: hadoop node used nova flavor
* image: hadoop node used galnce image
* private_net: hadoop node used private network.
* public_net: hadoop master node used public network.
* volume_size: volume size for hadoop node, if used boot from volume
* enable_spark: enable spark on master
* enable_hive: enable hive on master
* enable_mahout: enable mahout on master
