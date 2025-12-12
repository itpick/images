{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nextcloud-server-fips
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
  name = "nextcloud-server-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "nextcloud-server-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nextcloud-server-fips";
      "org.opencontainers.image.description" = "nextcloud-server-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
