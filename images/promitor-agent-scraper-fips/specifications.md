# promitor-agent-scraper-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 65532 |
| Working directory | /app |
| Entrypoint | dotnet Promitor.Agents.Scraper.dll |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=falsePATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin... |
