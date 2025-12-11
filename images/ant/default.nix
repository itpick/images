{ mkImage, pkgs, lib, ... }:

# Apache Ant - Java build tool
# https://ant.apache.org/

mkImage {
  drv = pkgs.ant;
  name = "ant";
  tag = "v${pkgs.ant.version}";
  entrypoint = [ "${pkgs.ant}/bin/ant" ];
  cmd = [ "-version" ];

  extraPkgs = with pkgs; [
    openjdk21_headless
    bash
    coreutils
  ];

  labels = {
    "org.opencontainers.image.title" = "Apache Ant";
    "org.opencontainers.image.description" = "Java-based build tool with XML configuration";
    "org.opencontainers.image.version" = pkgs.ant.version;
  };
}
