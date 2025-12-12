{ mkImage, pkgs, lib, ... }:

# OWASP ZAP - Web application security scanner
# https://www.zaproxy.org/

mkImage {
  drv = pkgs.zap;
  name = "zap";
  tag = "v${pkgs.zap.version}";
  entrypoint = [ "${pkgs.zap}/bin/zap" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "OWASP ZAP";
    "org.opencontainers.image.description" = "Web application security scanner";
    "org.opencontainers.image.version" = pkgs.zap.version;
  };
}
