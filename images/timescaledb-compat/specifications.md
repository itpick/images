# timescaledb-compat Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | / |
| Entrypoint | docker-entrypoint.sh |
| CMD | postgres |
| Volumes | - |
| Stop signal | - |
| Environment variables | DOCKER_PG_LLVM_DEPS=llvm19-dev 		clang19GOSU_VERSION=1.19LANG=en_US.utf8PATH=/usr/local/sbin:/usr... |
