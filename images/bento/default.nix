# bento
# =============
# Bento - Stream processing made simple
# https://www.benthos.dev/
#
# Bento (formerly Benthos) is a high performance stream processor
# for mundane tasks like data routing and transformation.

{ mkImage, pkgs, lib, ... }:

let
  # bento needs a config to run a stream. Bake a minimal self-contained pipeline
  # (generate -> drop) plus the HTTP endpoint on 0.0.0.0:4195, so the image runs
  # out of the box with no external systems. Operators mount their own
  # /etc/bento/bento.yaml.
  bentoConfig = pkgs.writeTextDir "etc/bento/bento.yaml" ''
    http:
      address: 0.0.0.0:4195
    input:
      generate:
        mapping: 'root = "ping"'
        interval: 60s
    output:
      drop: {}
  '';

in
mkImage {
  drv = pkgs.bento;
  name = "bento";
  tag = "v${pkgs.bento.version}";
  entrypoint = [ "${pkgs.bento}/bin/bento" ];
  # Was `--help` (a one-shot). Run the stream defined by the baked config.
  cmd = [ "-c" "/etc/bento/bento.yaml" ];

  extraPkgs = [ pkgs.cacert bentoConfig ];

  labels = {
    "org.opencontainers.image.title" = "Bento";
    "org.opencontainers.image.description" = "High performance stream processor";
    "org.opencontainers.image.version" = pkgs.bento.version;
    "io.nix-containers.image.upstream" = "https://github.com/warpstreamlabs/bento";
    "io.nix-containers.image.category" = "data-flow";
    "io.nix-containers.image.aliases" = "bento,benthos,stream-processing";
  };
}
