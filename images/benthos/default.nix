{ mkImage, pkgs, lib, ... }:

# Benthos - Stream processing made operationally mundane
# https://www.benthos.dev/

let
  # benthos needs a config to run a stream. Bake a minimal self-contained
  # pipeline (generate -> drop) plus the HTTP endpoint on 0.0.0.0:4195, so the
  # image runs out of the box with no external systems. Operators mount their
  # own /etc/benthos/benthos.yaml.
  benthosConfig = pkgs.writeTextDir "etc/benthos/benthos.yaml" ''
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
  drv = pkgs.benthos;
  name = "benthos";
  tag = "v${pkgs.benthos.version}";
  entrypoint = [ "${pkgs.benthos}/bin/benthos" ];
  # Was `--help` (a one-shot). Run the stream defined by the baked config.
  cmd = [ "-c" "/etc/benthos/benthos.yaml" ];

  extraPkgs = [ pkgs.cacert benthosConfig ];

  labels = {
    "org.opencontainers.image.title" = "Benthos";
    "org.opencontainers.image.description" = "Fancy stream processing made operationally mundane";
    "org.opencontainers.image.version" = pkgs.benthos.version;
    "io.nix-containers.image.upstream" = "https://www.benthos.dev/";
    "io.nix-containers.image.category" = "data-flow";
    "io.nix-containers.image.aliases" = "benthos,bento,stream-processing";
  };
}
