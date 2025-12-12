{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vector-fips
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
  name = "vector-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "vector-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "vector-fips";
      "org.opencontainers.image.description" = "vector-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
