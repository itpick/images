{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# spire-controller-manager
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
  name = "spire-controller-manager";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "spire-controller-manager-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "spire-controller-manager";
      "org.opencontainers.image.description" = "spire-controller-manager container image";
    };
  };
}
