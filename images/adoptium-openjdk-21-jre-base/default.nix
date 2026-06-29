{ mkImage, pkgs, lib, ... }:

# adoptium-openjdk-21-jre-base
# Container image packaging nixpkgs.jdk21
mkImage {
  drv = pkgs.jdk21;
  name = "adoptium-openjdk-21-jre-base";
  tag = "v${pkgs.jdk21.version}";
  entrypoint = [ "${pkgs.jdk21}/bin/java" ];
  cmd = [ "-version" ];

  labels = {
    "org.opencontainers.image.title" = "adoptium-openjdk-21-jre-base";
    "org.opencontainers.image.description" = "adoptium-openjdk-21-jre-base container image (nixpkgs.jdk21)";
    "org.opencontainers.image.version" = pkgs.jdk21.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
