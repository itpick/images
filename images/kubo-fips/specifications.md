# kubo-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | - |
| Entrypoint | /sbin/tini -- /usr/local/bin/start_ipfs |
| CMD | daemon --migrate=true --agent-version-suffix=docker |
| Volumes | - |
| Stop signal | - |
| Environment variables | IPFS_PATH=/data/ipfsPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSRC_DIR=/kub... |
