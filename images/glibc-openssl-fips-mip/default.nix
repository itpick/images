{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# glibc-openssl-fips-mip
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
  name = "glibc-openssl-fips-mip";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "glibc-openssl-fips-mip-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "glibc-openssl-fips-mip";
      "org.opencontainers.image.description" = "glibc-openssl-fips-mip container image";
    };
  };
}
