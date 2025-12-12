{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cni-plugins-fips-loopback
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
  name = "cni-plugins-fips-loopback";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cni-plugins-fips-loopback-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cni plugins fips loopuack";
      "org.opencontainers.image.description" = "cni-plugins-fips-loopback container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
