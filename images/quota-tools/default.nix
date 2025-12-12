{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# quota-tools
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
  name = "quota-tools";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "quota-tools-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "quota tools";
      "org.opencontainers.image.description" = "quota-tools container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
