{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# fluentd-kubernetes-daemonset
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "fluentd-kubernetes-daemonset";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "fluentd-kubernetes-daemonset-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "fluentd-kubernetes-daemonset";
      "org.opencontainers.image.description" = "fluentd-kubernetes-daemonset container image";
    };
  };
}
