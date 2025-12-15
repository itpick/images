{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rook-ceph-fips
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
  name = "rook-ceph-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "rook-ceph-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "rook-ceph-fips";
      "org.opencontainers.image.description" = "rook-ceph-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
