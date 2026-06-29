{ mkImage, pkgs, lib, ... }:

# adoptium-jdk-fips
# Container image packaging nixpkgs.jdk
mkImage {
  drv = pkgs.jdk;
  name = "adoptium-jdk-fips";
  tag = "v${pkgs.jdk.version}";
  entrypoint = [ "${pkgs.jdk}/bin/java" ];
  cmd = [ "-version" ];

  labels = {
    "org.opencontainers.image.title" = "adoptium-jdk-fips";
    "org.opencontainers.image.description" = "adoptium-jdk-fips container image (nixpkgs.jdk)";
    "org.opencontainers.image.version" = pkgs.jdk.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
