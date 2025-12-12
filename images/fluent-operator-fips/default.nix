{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# fluent-operator-fips
# Fluent logging component

let
  version = "3.2.0";
  
  fluentPkgs = with pkgs; [
    fluentd
    bash
    coreutils
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "fluent-operator-fips";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "fluent-operator-fips-root";
      paths = base.basePackages ++ fluentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "fluent operator fips";
      "org.opencontainers.image.description" = "Fluent logging fluent-operator-fips";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "fluent";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
