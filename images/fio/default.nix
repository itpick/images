{ mkImage, pkgs, lib, ... }:

# fio - Flexible I/O tester
# https://fio.readthedocs.io/

mkImage {
  drv = pkgs.fio;
  name = "fio";
  tag = "v${pkgs.fio.version}";
  entrypoint = [ "${pkgs.fio}/bin/fio" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "fio";
    "org.opencontainers.image.description" = "Flexible I/O tester for benchmarking and stress testing";
    "org.opencontainers.image.version" = pkgs.fio.version;
  };
}
