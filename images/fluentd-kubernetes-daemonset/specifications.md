# fluentd-kubernetes-daemonset Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 0 |
| Working directory | /home/fluent |
| Entrypoint | tini -- /fluentd/entrypoint.sh |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | BUNDLE_SILENCE_ROOT_WARNING=1FLUENTD_CONF=fluent.confFLUENTD_DISABLE_BUNDLER_INJECTION=1GEM_HOME=... |
