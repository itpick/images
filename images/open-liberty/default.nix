{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# open-liberty
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "open-liberty";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "open-liberty-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "open-liberty";
      "org.opencontainers.image.description" = "open-liberty container image";
    };
  };
}
