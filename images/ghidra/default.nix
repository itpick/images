{ mkImage, pkgs, lib, ... }:

# Ghidra - Software reverse engineering framework
# https://ghidra-sre.org/

mkImage {
  drv = pkgs.ghidra;
  name = "ghidra";
  tag = "v${pkgs.ghidra.version}";
  entrypoint = [ "${pkgs.ghidra}/bin/ghidra" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Ghidra";
    "org.opencontainers.image.description" = "Software reverse engineering framework";
    "org.opencontainers.image.version" = pkgs.ghidra.version;
  };
}
