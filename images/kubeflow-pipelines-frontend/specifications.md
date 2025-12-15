# kubeflow-pipelines-frontend Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 65532 |
| Working directory | - |
| Entrypoint | - |
| CMD | node ./server/dist/server.js ./client 3000 |
| Volumes | - |
| Stop signal | - |
| Environment variables | API_SERVER_ADDRESS=http://localhost:3001PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/s... |
