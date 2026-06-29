{ mkImage, pkgs, lib, ... }:

# adoptium-jdk
# Container image packaging nixpkgs.jdk
mkImage {
  drv = pkgs.jdk;
  name = "adoptium-jdk";
  tag = "v${pkgs.jdk.version}";
  entrypoint = [ "${pkgs.jdk}/bin/java" ];
  cmd = [ "-version" ];

  labels = {
    "org.opencontainers.image.title" = "adoptium-jdk";
    "org.opencontainers.image.description" = "adoptium-jdk container image (nixpkgs.jdk)";
    "org.opencontainers.image.version" = pkgs.jdk.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
