# chisel
# =============
# Chisel - Fast TCP/UDP tunnel over HTTP
# https://github.com/jpillora/chisel
#
# Chisel is a fast TCP/UDP tunnel, transported over HTTP, secured via SSH.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.chisel;
  name = "chisel";
  tag = "v${pkgs.chisel.version}";
  entrypoint = [ "${pkgs.chisel}/bin/chisel" ];
  # Was `--help` (a one-shot). Run the tunnel server bound to all interfaces on
  # 8080 (>1024, nonroot-bindable); it generates an ephemeral key in memory and
  # waits for clients, so no config / writable dirs are needed. Operators add
  # --auth / --keyfile / --reverse as required.
  cmd = [ "server" "--host" "0.0.0.0" "--port" "8080" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Chisel";
    "org.opencontainers.image.description" = "Fast TCP/UDP tunnel over HTTP";
    "org.opencontainers.image.version" = pkgs.chisel.version;
    "io.nix-containers.image.upstream" = "https://github.com/jpillora/chisel";
    "io.nix-containers.image.category" = "networking";
    "io.nix-containers.image.aliases" = "chisel,tunnel,proxy";
  };
}
