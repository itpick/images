{ mkImage, pkgs, lib, ... }:
# os-shell-nixchart — minimal shell toolbox for chart init containers.
# Used by many charts for chown / mkdir / volume-permissions kinds of work.
mkImage {
  drv = pkgs.buildEnv {
    name = "os-shell-nixchart-env";
    paths = with pkgs; [ bash coreutils util-linux findutils gnugrep gnused gawk cacert tzdata ];
  };
  name = "os-shell-nixchart";
  tag = "latest";
  entrypoint = [ "${pkgs.bash}/bin/bash" ];
  cmd = [];
  user = "1001:0";
  labels."org.opencontainers.image.title" = "os-shell-nixchart";
  labels."org.opencontainers.image.description" = "Minimal shell toolbox for nix-containers chart init containers";
  labels."io.nix-containers.chart" = "any";
}
