{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for kubernetes-helm:
# Packages available in nixpkgs:
#   pkgs.helm  # helm-4 (4.0.1-r2)

let
  # kubernetes-helm packages
  kubernetes_helmPackages = with pkgs; [
    kubernetes-helm
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "kubernetes-helm";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "kubernetes-helm-root";
      paths = base.basePackages ++ kubernetes_helmPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath kubernetes_helmPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "The package manager for Kubernetes";
      "org.opencontainers.image.version" = pkgs.kubernetes-helm.version;
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://helm.sh/";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "helm,kubernetes,k8s,package-manager";
    };
  };
}
