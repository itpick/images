{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.victoriametrics;
  name = "victoria-logs";
  tag = "v${pkgs.victoriametrics.version}";
  entrypoint = [ "${pkgs.victoriametrics}/bin/victoria-logs" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaLogs";
    "org.opencontainers.image.description" = "Log management system from VictoriaMetrics";
    "org.opencontainers.image.version" = pkgs.victoriametrics.version;
  };
}
