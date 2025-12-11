{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.act;
  name = "act";
  tag = "v${pkgs.act.version}";
  entrypoint = [ "${pkgs.act}/bin/act" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "act";
    "org.opencontainers.image.description" = "Run your GitHub Actions locally";
    "org.opencontainers.image.version" = pkgs.act.version;
    "io.nix-containers.chart" = "act";
  };
}
