# Kind Cluster Testing Framework

This framework tests nix-containers images using Kind (Kubernetes in Docker) with Helm chart deployments.

## Prerequisites

- Nix with flakes enabled
- Docker

## Directory Structure

```
kind-tests/
├── flake.nix           # Nix flake definition
├── README.md           # This file
├── configs/
│   └── kind-config.yaml    # Kind cluster configuration
├── scripts/
│   └── helpers.sh          # Bash helper functions
└── charts/
    ├── infrastructure/     # Infrastructure chart tests
    ├── ml-platform/        # ML platform chart tests
    ├── gitops/             # GitOps chart tests
    ├── security/           # Security chart tests
    ├── observability/      # Observability chart tests
    ├── service-mesh/       # Service mesh chart tests
    └── backup/             # Backup chart tests
```

## Quick Start

```bash
# Enter dev shell with all tools
nix develop

# Or run commands directly:

# Create Kind cluster
nix run .#setup

# Load a nix image into the cluster
nix run .#load-image -- nix-containers-test prometheus ../images

# Run all tests
nix run .#run-tests

# Run specific category tests
nix run .#run-tests -- nix-containers-test security
nix run .#run-tests -- nix-containers-test observability

# Cleanup
nix run .#teardown
```

## Using the Dev Shell

```bash
nix develop

# Now you have access to:
kind-setup [cluster-name]              # Create Kind cluster
kind-teardown [cluster-name]           # Delete Kind cluster
kind-load-image <cluster> <image>      # Load nix image
kind-run-tests [cluster] [category]    # Run tests
```

## Test Categories

### Infrastructure
- alloy
- cert-manager
- cloudnative-pg
- crossplane
- dragonfly-operator
- external-dns
- keda
- node-local-dns
- prometheus-adapter
- reflector
- reloader
- rook-ceph
- snapshot-controller
- spegel

### ML Platform
- spark-operator
- kubeflow-trainer
- apache-nifi
- mlflow

### GitOps
- argocd

### Security
- vault
- kyverno
- external-secrets

### Observability
- alloy
- kube-prometheus-stack
- loki
- tempo

### Service Mesh
- istio-base
- istiod

### Backup
- velero

## Adding New Tests

1. Create a test script in the appropriate `charts/<category>/` directory
2. Follow the naming convention: `test-<chart-name>.sh`
3. Use the provided helper functions from `scripts/helpers.sh`
4. Update this README with the new chart

## Test Output

Test results are written to:
- `results/test-results.json` - Machine-readable results
- `results/test-results.log` - Human-readable log

## CI integration

The `.github/workflows/test-images-charts.yml` workflow runs these chart
tests on PRs. It reverse-looks-up the changed images from
`chart-image-mapping.nix` via `tests/kind-tests/chart-routing.nix`, then
runs only the affected chart tests in parallel.

To test a specific chart on demand from the GitHub UI:
1. Actions → "Test Images on Helm Charts" → Run workflow
2. Enter comma-separated chart names (e.g. `alloy,reflector,vault`)
