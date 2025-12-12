{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rekor-backfill-index-fips
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
  name = "rekor-backfill-index-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "rekor-backfill-index-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "rekor-backfill-index-fips";
      "org.opencontainers.image.description" = "rekor-backfill-index-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
