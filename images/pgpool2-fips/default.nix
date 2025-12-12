{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pgpool2-fips
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
  name = "pgpool2-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "pgpool2-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "pgpool2-fips";
      "org.opencontainers.image.description" = "pgpool2-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
