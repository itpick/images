{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# miniperl
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
  name = "miniperl";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "miniperl-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "miniperl";
      "org.opencontainers.image.description" = "miniperl container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
