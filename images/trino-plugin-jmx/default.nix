{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# trino-plugin-jmx
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
  name = "trino-plugin-jmx";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "trino-plugin-jmx-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "trino plugin jmx";
      "org.opencontainers.image.description" = "trino-plugin-jmx container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
