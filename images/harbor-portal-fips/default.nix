{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# harbor-portal-fips
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
  name = "harbor-portal-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "harbor-portal-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "harbor-portal-fips";
      "org.opencontainers.image.description" = "harbor-portal-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
