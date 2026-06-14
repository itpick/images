# kubectl-dev

`kubectl` plus the operational toolkit you typically want when shelling into a
cluster: bash, kustomize, helm, jq, yq, curl, sops, age, vim, dig, openssl,
etc. Replaces multi-tool bundles like `alpine/k8s` for interactive cluster
work.

## Source

- Upstream kubectl: <https://kubernetes.io/>
- All bundled tools are stock nixpkgs derivations; see `default.nix` for the
  full list.

## Build

```
nix build .#kubectl-dev
```

## Published tags

- `ghcr.io/nix-containers/images/kubectl-dev:latest` — most recent
- `ghcr.io/nix-containers/images/kubectl-dev:v<kubectl-version>-dev` —
  version-pinned (e.g. `:v1.34.2-dev`)

## Usage examples

Drop into a cluster-ops shell:

```
docker run --rm -it -v ~/.kube:/home/nonroot/.kube \
  ghcr.io/nix-containers/images/kubectl-dev:latest
```

Run as a Kubernetes debug pod:

```
kubectl run dev --rm -it --image=ghcr.io/nix-containers/images/kubectl-dev:latest -- bash
```

## Related

- `kubectl` — just the CLI, no shell or extra tools. Use this for slim
  scripted invocations (CI pipelines, init containers).
- `kubectl-bash-completion` — kubectl + bash completion only.
