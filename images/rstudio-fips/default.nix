{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rstudio-fips
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
  name = "rstudio-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "rstudio-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "rstudio-fips";
      "org.opencontainers.image.description" = "rstudio-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
