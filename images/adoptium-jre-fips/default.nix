{ mkImage, pkgs, lib, ... }:

# adoptium-jre-fips
# Container image packaging nixpkgs.jdk
mkImage {
  drv = pkgs.jdk;
  name = "adoptium-jre-fips";
  tag = "v${pkgs.jdk.version}";
  entrypoint = [ "${pkgs.jdk}/bin/java" ];
  cmd = [ "-version" ];

  labels = {
    "org.opencontainers.image.title" = "adoptium-jre-fips";
    "org.opencontainers.image.description" = "adoptium-jre-fips container image (nixpkgs.jdk)";
    "org.opencontainers.image.version" = pkgs.jdk.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
