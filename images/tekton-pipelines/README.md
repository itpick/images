# tekton-pipelines

Tekton CLI (`tkn`) — command-line tool for working with Tekton resources on
Kubernetes. The `tkn` binary lets you create, list, and manage Tekton
Pipelines, Tasks, TaskRuns, PipelineRuns, and EventListeners from the terminal.

## This is the tkn CLI, NOT the Tekton controller

This image wraps `pkgs.tektoncd-cli` (the `tkn` binary) from nixpkgs.
It is **not** the Tekton Pipelines controller or webhook images. Those run
in-cluster and are distributed at:

```
gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/controller:vX.Y.Z
gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/webhook:vX.Y.Z
```

These images are hosted on Google Container Registry (`gcr.io`) under
`tekton-releases`, which requires authenticated pulls in some environments
and cannot be wrapped here without a pull secret. **That is a known gap.**
Use the official Tekton release manifests to deploy the controller:

```
kubectl apply -f \
  https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
```

## Source

- Upstream: https://github.com/tektoncd/cli
- nixpkgs: `pkgs.tektoncd-cli`

## Build

```
nix build .#tekton-pipelines
```

## Usage

```
docker run --rm -e KUBECONFIG=/kube/config \
  -v ~/.kube:/kube:ro \
  ghcr.io/nix-containers/tekton-pipelines tkn pipeline list
```
