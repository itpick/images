{ mkImage, pkgs, lib, ... }:

# adoptium-openjdk-25-jre
# Container image packaging nixpkgs.temurin-bin-25
mkImage {
  drv = pkgs.temurin-bin-25;
  name = "adoptium-openjdk-25-jre";
  tag = "v${pkgs.temurin-bin-25.version}";
  entrypoint = [ "${pkgs.temurin-bin-25}/bin/java" ];
  cmd = [ "-version" ];

  labels = {
    "org.opencontainers.image.title" = "adoptium-openjdk-25-jre";
    "org.opencontainers.image.description" = "adoptium-openjdk-25-jre container image (nixpkgs.temurin-bin-25)";
    "org.opencontainers.image.version" = pkgs.temurin-bin-25.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
