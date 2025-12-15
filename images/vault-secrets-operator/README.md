# vault-secrets-operator

Vault Secrets Operator (VSO) allows Pods to consume Vault secrets natively from Kubernetes Secrets

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vault-secrets-operator

# Load into Docker
nix build .#load-vault-secrets-operator-to-docker && ./result/bin/load-vault-secrets-operator-to-docker
```
