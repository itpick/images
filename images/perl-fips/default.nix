{ mkImage, pkgs, lib, ... }:

# perl-fips
# Container image packaging nixpkgs.perl
mkImage {
  drv = pkgs.perl;
  name = "perl-fips";
  tag = "v${pkgs.perl.version}";
  entrypoint = [ (lib.getExe pkgs.perl) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "perl-fips";
    "org.opencontainers.image.description" = "perl-fips container image (nixpkgs.perl)";
    "org.opencontainers.image.version" = pkgs.perl.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
