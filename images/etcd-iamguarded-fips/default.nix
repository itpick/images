{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# etcd-iamguarded-fips
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
  name = "etcd-iamguarded-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "etcd-iamguarded-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "etcd-iamguarded-fips";
      "org.opencontainers.image.description" = "etcd-iamguarded-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
