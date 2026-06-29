{ mkImage, pkgs, lib, ... }:

# dnsdist-fips
# Container image packaging nixpkgs.dnsdist
mkImage {
  drv = pkgs.dnsdist;
  name = "dnsdist-fips";
  tag = "v${pkgs.dnsdist.version}";
  entrypoint = [ (lib.getExe pkgs.dnsdist) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "dnsdist-fips";
    "org.opencontainers.image.description" = "dnsdist-fips container image (nixpkgs.dnsdist)";
    "org.opencontainers.image.version" = pkgs.dnsdist.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
