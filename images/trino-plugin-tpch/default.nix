{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# trino-plugin-tpch
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
  name = "trino-plugin-tpch";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "trino-plugin-tpch-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "trino plugin tpch";
      "org.opencontainers.image.description" = "trino-plugin-tpch container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
