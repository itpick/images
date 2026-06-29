{ mkImage, pkgs, lib, ... }:

# jdk-crac
# Container image packaging nixpkgs.jdk
mkImage {
  drv = pkgs.jdk;
  name = "jdk-crac";
  tag = "v${pkgs.jdk.version}";
  entrypoint = [ "${pkgs.jdk}/bin/java" ];
  cmd = [ "-version" ];

  labels = {
    "org.opencontainers.image.title" = "jdk-crac";
    "org.opencontainers.image.description" = "jdk-crac container image (nixpkgs.jdk)";
    "org.opencontainers.image.version" = pkgs.jdk.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
