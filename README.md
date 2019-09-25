# Hadoop Cluster Deploy
HOT for deploy Hadoop cluster.

## Quick Start
> Boot from image
1. Edit `env.yaml`
2. Create Stack
`openstack stack create -t hadoop_cluster.yaml -e env.yaml hadoop-cluster --wait`
> Boot from volume
1. Edit `volume_env.yaml`
2. Create Stack
`openstack stack create -t hadoop_cluster_from_volume.yaml -e volume_env.yaml hadoop-cluster-from-volume --wait`
