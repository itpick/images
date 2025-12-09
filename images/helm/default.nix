{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for helm:
# Packages available in nixpkgs:
#   pkgs.helm  # helm-4 (4.0.1-r2)

let
  helmPackages = with pkgs; [
    kubernetes-helm
    kubectl
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "helm";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "helm-root";
      paths = base.basePackages ++ helmPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath helmPackages}"
      "HELM_CONFIG_HOME=/home/nonroot/.config/helm"
      "HELM_DATA_HOME=/home/nonroot/.local/share/helm"
      "HELM_CACHE_HOME=/home/nonroot/.cache/helm"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Kubernetes package manager";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.kubernetes-helm.version;
      "io.nix-containers.image.upstream" = "https://helm.sh/";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "helm,kubernetes,k8s";
    };
  };
}