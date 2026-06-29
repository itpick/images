{ mkImage, pkgs, lib, ... }:

# adoptium-openjdk-21-default-jvm
# Container image packaging nixpkgs.jdk21
mkImage {
  drv = pkgs.jdk21;
  name = "adoptium-openjdk-21-default-jvm";
  tag = "v${pkgs.jdk21.version}";
  entrypoint = [ "${pkgs.jdk21}/bin/java" ];
  cmd = [ "-version" ];

  labels = {
    "org.opencontainers.image.title" = "adoptium-openjdk-21-default-jvm";
    "org.opencontainers.image.description" = "adoptium-openjdk-21-default-jvm container image (nixpkgs.jdk21)";
    "org.opencontainers.image.version" = pkgs.jdk21.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
