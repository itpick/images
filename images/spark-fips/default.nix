{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# spark-fips
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
  name = "spark-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "spark-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "spark-fips";
      "org.opencontainers.image.description" = "spark-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
