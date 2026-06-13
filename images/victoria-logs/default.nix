{ mkImage, pkgs, lib, ... }:

# VictoriaLogs - User friendly log database from VictoriaMetrics
# https://docs.victoriametrics.com/victorialogs/
# Uses pkgs.victorialogs (separate VictoriaLogs repo, not the core VM monorepo)

mkImage {
  drv = pkgs.victorialogs;
  name = "victoria-logs";
  tag = "v${pkgs.victorialogs.version}";
  entrypoint = [ "${pkgs.victorialogs}/bin/victoria-logs" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaLogs";
    "org.opencontainers.image.description" = "Log management system from VictoriaMetrics";
    "org.opencontainers.image.version" = pkgs.victorialogs.version;
  };
}
