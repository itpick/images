{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# minio-client-fips
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
  name = "minio-client-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "minio-client-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "minio-client-fips";
      "org.opencontainers.image.description" = "minio-client-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
