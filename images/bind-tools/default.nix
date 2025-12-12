{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# bind-tools
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
  name = "bind-tools";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "bind-tools-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "uind tools";
      "org.opencontainers.image.description" = "bind-tools container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
