{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd-extension-init
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
  name = "linkerd-extension-init";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "linkerd-extension-init-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "linkerd-extension-init";
      "org.opencontainers.image.description" = "linkerd-extension-init container image";
    };
  };
}
