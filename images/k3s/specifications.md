# k3s Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | - |
| Working directory | - |
| Entrypoint | /bin/k3s |
| CMD | agent |
| Volumes | /var/lib/cni/var/lib/kubelet/var/lib/rancher/k3s/var/log |
| Stop signal | - |
| Environment variables | CRI_CONFIG_PATH=/var/lib/rancher/k3s/agent/etc/crictl.yamlPATH=/usr/local/sbin:/usr/local/bin:/us... |
