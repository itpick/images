# External DNS

Configure external DNS servers for Kubernetes Ingresses and Services automatically.

## Description

This image provides external-dns, a Kubernetes controller that synchronizes Kubernetes Services and Ingresses with DNS providers like AWS Route53, Google Cloud DNS, and many others. Automates DNS record management for Kubernetes applications.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/external-dns:latest

# Show help
docker run --rm ghcr.io/nix-containers/images/external-dns:latest --help

# Run with configuration (requires appropriate cloud credentials)
docker run --rm ghcr.io/nix-containers/images/external-dns:latest --source=service --provider=aws
```

### Build Locally with Nix

```bash
# Build the image
nix build .#external-dns

# Load to Docker
nix run .#external-dns.copyTo -- docker-daemon:external-dns:latest

# Run tests
nix run .#external-dns-test
```

## What's Included

- external-dns binary (v0.16.1)
- Statically compiled Go binary
- Minimal runtime environment
- Non-root execution

## Supported DNS Providers

- AWS Route53
- Google Cloud DNS
- Azure DNS
- Cloudflare
- DigitalOcean
- And many more...

## Use Cases

- Automatic DNS management for Kubernetes services
- Synchronizing Ingress resources with DNS
- Multi-cloud DNS automation
- GitOps-compatible DNS workflows

## Kubernetes Deployment

Deploy as a controller in your Kubernetes cluster with appropriate RBAC permissions and cloud provider credentials. Refer to the upstream documentation for provider-specific configuration.

## Upstream

- **external-dns**: https://github.com/kubernetes-sigs/external-dns
- **Documentation**: https://kubernetes-sigs.github.io/external-dns/
- **Tutorials**: https://github.com/kubernetes-sigs/external-dns/tree/master/docs/tutorials