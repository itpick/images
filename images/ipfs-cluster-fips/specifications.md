# ipfs-cluster-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1000 |
| Working directory | - |
| Entrypoint | /sbin/tini -- /usr/local/bin/entrypoint.sh |
| CMD | daemon |
| Volumes | - |
| Stop signal | - |
| Environment variables | IPFS_CLUSTER_CONSENSUS=crdtIPFS_CLUSTER_PATH=/data/ipfs-clusterPATH=/usr/local/sbin:/usr/local/bi... |
