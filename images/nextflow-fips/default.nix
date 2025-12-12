{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nextflow-fips
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
  name = "nextflow-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "nextflow-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nextflow-fips";
      "org.opencontainers.image.description" = "nextflow-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
