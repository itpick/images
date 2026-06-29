{ mkImage, pkgs, lib, ... }:

# pdns-recursor-fips
# Container image packaging nixpkgs.pdns-recursor
mkImage {
  drv = pkgs.pdns-recursor;
  name = "pdns-recursor-fips";
  tag = "v${pkgs.pdns-recursor.version}";
  entrypoint = [ (lib.getExe pkgs.pdns-recursor) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "pdns-recursor-fips";
    "org.opencontainers.image.description" = "pdns-recursor-fips container image (nixpkgs.pdns-recursor)";
    "org.opencontainers.image.version" = pkgs.pdns-recursor.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
