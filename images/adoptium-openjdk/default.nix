{ mkImage, pkgs, lib, ... }:

# adoptium-openjdk
# Container image packaging nixpkgs.jdk
mkImage {
  drv = pkgs.jdk;
  name = "adoptium-openjdk";
  tag = "v${pkgs.jdk.version}";
  entrypoint = [ "${pkgs.jdk}/bin/java" ];
  cmd = [ "-version" ];

  labels = {
    "org.opencontainers.image.title" = "adoptium-openjdk";
    "org.opencontainers.image.description" = "adoptium-openjdk container image (nixpkgs.jdk)";
    "org.opencontainers.image.version" = pkgs.jdk.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
