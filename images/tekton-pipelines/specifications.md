# Specifications: tekton-pipelines

- **Base:** scratch (nixpkgs `pkgs.tektoncd-cli`, nixpkgs-wrapped)
- **Build strategy:** nixpkgs Go package (pre-built in nixpkgs)
- **Entrypoint:** `${pkgs.tektoncd-cli}/bin/tkn`
- **User:** 1000:1000 (non-root)
- **Ports:** none exposed by default (CLI tool; talks to Kubernetes API)
- **Persistent dirs:** none required (stateless CLI)
- **Required env:** `KUBECONFIG` or mount `~/.kube/config` (kubeconfig for cluster access)
- **Version tracked:** via `pkgs.tektoncd-cli.version` in nixpkgs
- **Known gap:** Tekton Pipelines controller image (`gcr.io/tekton-releases/...`) requires authenticated GAR pulls and is not wrapped here; deploy via official release manifests
