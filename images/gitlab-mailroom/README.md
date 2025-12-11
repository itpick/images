# gitlab-mailroom

GitLab Mailroom is a daemon that monitors IMAP and POP3 mailboxes for incoming emails and forwards them to GitLab. It enables email-based workflows such as creating issues via email, replying to issues, and Service Desk functionality

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#gitlab-mailroom

# Load into Docker
nix build .#load-gitlab-mailroom-to-docker && ./result/bin/load-gitlab-mailroom-to-docker
```
