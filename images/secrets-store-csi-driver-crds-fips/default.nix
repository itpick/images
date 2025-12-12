{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# secrets-store-csi-driver-crds-fips
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
  name = "secrets-store-csi-driver-crds-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "secrets-store-csi-driver-crds-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "secrets-store-csi-driver-crds-fips";
      "org.opencontainers.image.description" = "secrets-store-csi-driver-crds-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
