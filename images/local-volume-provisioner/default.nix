{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# local-volume-provisioner
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
  name = "local-volume-provisioner";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "local-volume-provisioner-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "local-volume-provisioner";
      "org.opencontainers.image.description" = "local-volume-provisioner container image";
    };
  };
}
