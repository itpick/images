{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# repmgr
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
  name = "repmgr";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "repmgr-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "repmgr";
      "org.opencontainers.image.description" = "repmgr container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
