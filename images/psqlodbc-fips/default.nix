{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# psqlodbc-fips
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
  name = "psqlodbc-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "psqlodbc-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "psqlodbc-fips";
      "org.opencontainers.image.description" = "psqlodbc-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
