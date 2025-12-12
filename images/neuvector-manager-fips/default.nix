{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# neuvector-manager-fips
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
  name = "neuvector-manager-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "neuvector-manager-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "neuvector-manager-fips";
      "org.opencontainers.image.description" = "neuvector-manager-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
