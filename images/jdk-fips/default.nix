{ mkImage, pkgs, lib, ... }:

# jdk-fips
# Container image packaging nixpkgs.jdk
mkImage {
  drv = pkgs.jdk;
  name = "jdk-fips";
  tag = "v${pkgs.jdk.version}";
  entrypoint = [ (lib.getExe pkgs.jdk) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "jdk-fips";
    "org.opencontainers.image.description" = "jdk-fips container image (nixpkgs.jdk)";
    "org.opencontainers.image.version" = pkgs.jdk.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
