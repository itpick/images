{ mkImage, pkgs, lib, ... }:

# tetragon - eBPF-based security observability
# https://tetragon.io/

mkImage {
  drv = pkgs.tetragon;
  name = "tetragon";
  tag = "v${pkgs.tetragon.version}";
  entrypoint = [ "${pkgs.tetragon}/bin/tetragon" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "tetragon";
    "org.opencontainers.image.description" = "eBPF-based security observability and runtime enforcement";
    "org.opencontainers.image.version" = pkgs.tetragon.version;
  };
}
