{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# fluent-bit-plugin-loki
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
  name = "fluent-bit-plugin-loki";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "fluent-bit-plugin-loki-root";
      paths = base.basePackages ++ fluentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "fluent uit plugin loki";
      "org.opencontainers.image.description" = "Fluent logging fluent-bit-plugin-loki";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "fluent";
    };
  };
}
