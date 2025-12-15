# k8s-mig-manager Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 0 |
| Working directory | - |
| Entrypoint | nvidia-mig-manager |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | NVIDIA_DISABLE_REQUIRE=trueNVIDIA_DRIVER_CAPABILITIES=utilityNVIDIA_MIG_CONFIG_DEVICES=allNVIDIA_... |
