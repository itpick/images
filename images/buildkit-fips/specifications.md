# buildkit-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 0 |
| Working directory | - |
| Entrypoint | buildkitd |
| CMD | - |
| Volumes | /var/lib/buildkit |
| Stop signal | - |
| Environment variables | BUILDKIT_SETUP_CGROUPV2_ROOT=1PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSS... |
