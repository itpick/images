{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# longhorn-share-manager-fips
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
  name = "longhorn-share-manager-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "longhorn-share-manager-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "longhorn-share-manager-fips";
      "org.opencontainers.image.description" = "longhorn-share-manager-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
