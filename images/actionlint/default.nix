{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.actionlint;
  name = "actionlint";
  tag = "v${pkgs.actionlint.version}";
  entrypoint = [ "${pkgs.actionlint}/bin/actionlint" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "actionlint";
    "org.opencontainers.image.description" = "Static checker for GitHub Actions workflow files";
    "org.opencontainers.image.version" = pkgs.actionlint.version;
    "io.nix-containers.chart" = "actionlint";
  };
}
