{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# fluent-watcher-fips
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
  name = "fluent-watcher-fips";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "fluent-watcher-fips-root";
      paths = base.basePackages ++ fluentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "fluent watcher fips";
      "org.opencontainers.image.description" = "Fluent logging fluent-watcher-fips";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "fluent";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
