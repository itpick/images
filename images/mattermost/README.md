# mattermost

Community edition of Mattermost, a self-hostable chat service with file sharing, search, and integrations. It is designed as an internal chat for organisations and companies, and mostly markets itself as an open-source alternative to Slack and Microsoft Teams

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 10s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 382.99 MB |
| Uncompressed | ~957.49 MB |

## Usage

```bash
# Build the image
nix build .#mattermost

# Load into Docker
nix build .#load-mattermost-to-docker && ./result/bin/load-mattermost-to-docker
```
