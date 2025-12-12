{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# temporal-admin-tools-fips
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
  name = "temporal-admin-tools-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "temporal-admin-tools-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "temporal-admin-tools-fips";
      "org.opencontainers.image.description" = "temporal-admin-tools-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
