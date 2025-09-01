{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

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
    };
  };
}