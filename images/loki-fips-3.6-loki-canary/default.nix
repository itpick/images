{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# loki-fips-3.6-loki-canary
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
  name = "loki-fips-3.6-loki-canary";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "loki-fips-3.6-loki-canary-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "loki fips 3.6 loki canary";
      "org.opencontainers.image.description" = "loki-fips-3.6-loki-canary container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
