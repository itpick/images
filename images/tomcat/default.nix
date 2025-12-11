{ mkImage, pkgs, lib, ... }:

# Apache Tomcat - Java servlet container
# https://tomcat.apache.org/

mkImage {
  drv = pkgs.tomcat;
  name = "tomcat";
  tag = "v${pkgs.tomcat.version}";
  entrypoint = [ "${pkgs.tomcat}/bin/catalina.sh" ];
  cmd = [ "run" ];

  extraPkgs = with pkgs; [ openjdk21_headless bash coreutils ];

  labels = {
    "org.opencontainers.image.title" = "Apache Tomcat";
    "org.opencontainers.image.description" = "Java Servlet and JavaServer Pages implementation";
    "org.opencontainers.image.version" = pkgs.tomcat.version;
  };
}
