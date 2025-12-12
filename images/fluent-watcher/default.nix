{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# fluent-watcher
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
  name = "fluent-watcher";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "fluent-watcher-root";
      paths = base.basePackages ++ fluentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "fluent watcher";
      "org.opencontainers.image.description" = "Fluent logging fluent-watcher";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "fluent";
    };
  };
}
