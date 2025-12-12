{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# loki-canary-fips
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
  name = "loki-canary-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "loki-canary-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "loki-canary-fips";
      "org.opencontainers.image.description" = "loki-canary-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
