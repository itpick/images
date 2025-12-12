{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gcp-compute-persistent-disk-csi-driver-fips
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "gcp-compute-persistent-disk-csi-driver-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gcp-compute-persistent-disk-csi-driver-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "gcp compute persistent disk csi driver fips";
      "org.opencontainers.image.description" = "gcp-compute-persistent-disk-csi-driver-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
