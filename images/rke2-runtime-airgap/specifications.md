# rke2-runtime-airgap Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 0 |
| Working directory | - |
| Entrypoint | bin/rke2 |
| CMD | - |
| Volumes | /var/lib/cni/var/lib/kubelet/var/lib/rancher/rke2/var/log |
| Stop signal | - |
| Environment variables | KUBECONFIG=/etc/rancher/rke2/rke2.yamlPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbi... |
