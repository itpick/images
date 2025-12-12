{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# e2fsprogs-extra
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "e2fsprogs-extra";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "e2fsprogs-extra-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "e2fsprogs extra";
      "org.opencontainers.image.description" = "e2fsprogs-extra container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
