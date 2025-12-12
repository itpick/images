{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nats-box-fips
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
  name = "nats-box-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "nats-box-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nats-box-fips";
      "org.opencontainers.image.description" = "nats-box-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
