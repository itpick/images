{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd-proxy-init
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
  name = "linkerd-proxy-init";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "linkerd-proxy-init-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "linkerd-proxy-init";
      "org.opencontainers.image.description" = "linkerd-proxy-init container image";
    };
  };
}
