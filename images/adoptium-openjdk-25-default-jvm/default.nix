{ mkImage, pkgs, lib, ... }:

# adoptium-openjdk-25-default-jvm
# Container image packaging nixpkgs.temurin-bin-25
mkImage {
  drv = pkgs.temurin-bin-25;
  name = "adoptium-openjdk-25-default-jvm";
  tag = "v${pkgs.temurin-bin-25.version}";
  entrypoint = [ "${pkgs.temurin-bin-25}/bin/java" ];
  cmd = [ "-version" ];

  labels = {
    "org.opencontainers.image.title" = "adoptium-openjdk-25-default-jvm";
    "org.opencontainers.image.description" = "adoptium-openjdk-25-default-jvm container image (nixpkgs.temurin-bin-25)";
    "org.opencontainers.image.version" = pkgs.temurin-bin-25.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
