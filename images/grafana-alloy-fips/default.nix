{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# grafana-alloy-fips
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
  name = "grafana-alloy-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "grafana-alloy-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "grafana alloy fips";
      "org.opencontainers.image.description" = "grafana-alloy-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
