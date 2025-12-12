{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mongos
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
  name = "mongos";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "mongos-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "mongos";
      "org.opencontainers.image.description" = "mongos container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
