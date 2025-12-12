{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# msft-prod-packages
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
  name = "msft-prod-packages";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "msft-prod-packages-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "msft prod packages";
      "org.opencontainers.image.description" = "msft-prod-packages container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
