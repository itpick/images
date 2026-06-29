{ mkImage, pkgs, lib, ... }:

# corretto-21-default-jdk
# Container image packaging nixpkgs.corretto21
mkImage {
  drv = pkgs.corretto21;
  name = "corretto-21-default-jdk";
  tag = "v${pkgs.corretto21.version}";
  entrypoint = [ "${pkgs.corretto21}/bin/java" ];
  cmd = [ "-version" ];

  labels = {
    "org.opencontainers.image.title" = "corretto-21-default-jdk";
    "org.opencontainers.image.description" = "corretto-21-default-jdk container image (nixpkgs.corretto21)";
    "org.opencontainers.image.version" = pkgs.corretto21.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
