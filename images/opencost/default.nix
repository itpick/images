{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# opencost
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
  name = "opencost";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "opencost-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "opencost";
      "org.opencontainers.image.description" = "opencost container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
