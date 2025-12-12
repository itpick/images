{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# grpc-health-probe-fips
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
  name = "grpc-health-probe-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "grpc-health-probe-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "grpc health proue fips";
      "org.opencontainers.image.description" = "grpc-health-probe-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
