{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# corretto-21-jre
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
  name = "corretto-21-jre";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "corretto-21-jre-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "binary";
      "io.nix-containers.build-method" = "Pre-built binary packaged with Nix";
      "org.opencontainers.image.title" = "corretto 21 jre";
      "org.opencontainers.image.description" = "corretto-21-jre container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
