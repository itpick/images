{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.fluent-bit;
  name = "fluent-bit";
  tag = "v${pkgs.fluent-bit.version}";
  entrypoint = [ "${pkgs.fluent-bit}/bin/fluent-bit" ];
  cmd = [ "-c" "/fluent-bit/etc/fluent-bit.conf" ];

  labels = {
    "org.opencontainers.image.title" = "Fluent Bit";
    "org.opencontainers.image.description" = "Fast and lightweight log processor and forwarder";
    "org.opencontainers.image.version" = pkgs.fluent-bit.version;
    "io.nix-containers.chart" = "fluent-bit";
  };
}
