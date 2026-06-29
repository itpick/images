{ mkImage, pkgs, lib, ... }:

# regclient-fips
# Container image packaging nixpkgs.regclient
mkImage {
  drv = pkgs.regclient;
  name = "regclient-fips";
  tag = "v${pkgs.regclient.version}";
  entrypoint = [ (lib.getExe pkgs.regclient) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "regclient-fips";
    "org.opencontainers.image.description" = "regclient-fips container image (nixpkgs.regclient)";
    "org.opencontainers.image.version" = pkgs.regclient.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
