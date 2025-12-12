{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# headlamp-fips
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
  name = "headlamp-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "headlamp-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "headlamp-fips";
      "org.opencontainers.image.description" = "headlamp-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
