{ mkImage, pkgs, lib, ... }:

# gnupg-fips
# Container image packaging nixpkgs.gnupg
mkImage {
  drv = pkgs.gnupg;
  name = "gnupg-fips";
  tag = "v${pkgs.gnupg.version}";
  entrypoint = [ (lib.getExe pkgs.gnupg) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "gnupg-fips";
    "org.opencontainers.image.description" = "gnupg-fips container image (nixpkgs.gnupg)";
    "org.opencontainers.image.version" = pkgs.gnupg.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
