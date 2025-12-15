{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# temporal-server-schema
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
  name = "temporal-server-schema";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "temporal-server-schema-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "temporal server schema";
      "org.opencontainers.image.description" = "temporal-server-schema container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
