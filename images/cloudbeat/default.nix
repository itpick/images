{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cloudbeat
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
  name = "cloudbeat";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cloudbeat-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cloudueat";
      "org.opencontainers.image.description" = "cloudbeat container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
