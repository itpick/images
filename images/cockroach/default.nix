{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cockroach
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
  name = "cockroach";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cockroach-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "cockroach";
      "org.opencontainers.image.description" = "cockroach container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
