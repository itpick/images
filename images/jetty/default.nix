{ mkImage, pkgs, lib, ... }:

# Eclipse Jetty - Java HTTP server and Servlet container
# https://www.eclipse.org/jetty/

mkImage {
  drv = pkgs.jetty;
  name = "jetty";
  tag = "v${pkgs.jetty.version}";
  entrypoint = [ "${pkgs.jetty}/bin/jetty.sh" ];
  cmd = [ "run" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Eclipse Jetty";
    "org.opencontainers.image.description" = "Java HTTP server and Servlet container";
    "org.opencontainers.image.version" = pkgs.jetty.version;
  };
}
