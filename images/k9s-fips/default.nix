{ mkImage, pkgs, lib, ... }:

# k9s-fips
# Container image packaging nixpkgs.k9s
mkImage {
  drv = pkgs.k9s;
  name = "k9s-fips";
  tag = "v${pkgs.k9s.version}";
  entrypoint = [ (lib.getExe pkgs.k9s) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "k9s-fips";
    "org.opencontainers.image.description" = "k9s-fips container image (nixpkgs.k9s)";
    "org.opencontainers.image.version" = pkgs.k9s.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
