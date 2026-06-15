{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kubectl + cluster-operations toolkit, tagged kubectl-dev.
#
# Replaces multi-tool bundles like alpine/k8s for interactive cluster work
# (kubectl exec into a debug pod, ad-hoc kustomize/helm runs, secrets edits).
# Bundles kubectl with a shell and the tools you typically reach for in a
# cluster shell — but stays as light as is reasonable.

let
  devPackages = with pkgs; [
    # Kubernetes
    kubectl
    kustomize
    kubernetes-helm

    # Shell + core utilities
    bash
    coreutils
    findutils
    gnused
    gnugrep
    gnutar
    gzip
    less

    # Network / debug
    curl
    wget
    bind            # dig, nslookup
    iputils         # ping
    openssl         # cert inspection
    netcat-gnu

    # JSON / YAML
    jq
    yq-go

    # Secrets handling
    sops
    age

    # Editor
    vim
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];
in
nix2container.buildImage {
  name = "kubectl-dev";
  tag  = "v${pkgs.kubectl.version}-dev";

  copyToRoot = [
    (buildEnv {
      name  = "kubectl-dev-root";
      paths = base.basePackages ++ devPackages ++ [ userEnv ];
    })
  ];

  config = {
    Entrypoint = [ "${pkgs.bash}/bin/bash" ];
    Cmd        = [];
    User       = nonRoot.userString;
    WorkingDir = "/home/${nonRoot.user.name}";
    Env = [
      "KUBECONFIG=/home/${nonRoot.user.name}/.kube/config"
      "HOME=/home/${nonRoot.user.name}"
      "LANG=C.UTF-8"
      "TERM=xterm-256color"
    ];
    Labels = {
      "org.opencontainers.image.title"       = "kubectl-dev";
      "org.opencontainers.image.description" = "kubectl + cluster-ops toolkit (bash, kustomize, helm, jq, yq, curl, sops, age, vim) for interactive cluster work";
      "org.opencontainers.image.url"         = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source"      = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor"      = "nix-containers";
      "org.opencontainers.image.version"     = "v${pkgs.kubectl.version}-dev";
      "io.nix-containers.image.upstream"     = "https://kubernetes.io/";
      "io.nix-containers.image.category"     = "devops-tool";
      "io.nix-containers.image.aliases"      = "kubectl-dev,k8s-toolkit,cluster-shell";
      "io.nix-containers.image.variant"      = "dev-bundle";
    };
  };
}
