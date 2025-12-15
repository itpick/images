{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd-cni-plugin
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
  name = "linkerd-cni-plugin";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "linkerd-cni-plugin-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "linkerd-cni-plugin";
      "org.opencontainers.image.description" = "linkerd-cni-plugin container image";
    };
  };
}
