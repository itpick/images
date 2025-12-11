{ mkImage, pkgs, lib, ... }:

# sbt - Build tool for Scala
# https://www.scala-sbt.org/

mkImage {
  drv = pkgs.sbt;
  name = "sbt";
  tag = "v${pkgs.sbt.version}";
  entrypoint = [ "${pkgs.sbt}/bin/sbt" ];
  cmd = [ "--version" ];

  extraPkgs = with pkgs; [ cacert jdk ];

  labels = {
    "org.opencontainers.image.title" = "sbt";
    "org.opencontainers.image.description" = "Interactive build tool for Scala, Java and more";
    "org.opencontainers.image.version" = pkgs.sbt.version;
  };
}
