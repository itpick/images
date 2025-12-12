{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dstat
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
  name = "dstat";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dstat-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dstat";
      "org.opencontainers.image.description" = "dstat container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
