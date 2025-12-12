{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# regclient-regsync
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
  name = "regclient-regsync";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "regclient-regsync-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "regclient regsync";
      "org.opencontainers.image.description" = "regclient-regsync container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
