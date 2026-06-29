{ mkImage, pkgs, lib, ... }:

# fluent-bit-fips
# Container image packaging nixpkgs.fluent-bit
mkImage {
  drv = pkgs.fluent-bit;
  name = "fluent-bit-fips";
  tag = "v${pkgs.fluent-bit.version}";
  entrypoint = [ (lib.getExe pkgs.fluent-bit) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "fluent-bit-fips";
    "org.opencontainers.image.description" = "fluent-bit-fips container image (nixpkgs.fluent-bit)";
    "org.opencontainers.image.version" = pkgs.fluent-bit.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
