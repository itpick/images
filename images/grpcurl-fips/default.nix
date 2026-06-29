{ mkImage, pkgs, lib, ... }:

# grpcurl-fips
# Container image packaging nixpkgs.grpcurl
mkImage {
  drv = pkgs.grpcurl;
  name = "grpcurl-fips";
  tag = "v${pkgs.grpcurl.version}";
  entrypoint = [ (lib.getExe pkgs.grpcurl) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "grpcurl-fips";
    "org.opencontainers.image.description" = "grpcurl-fips container image (nixpkgs.grpcurl)";
    "org.opencontainers.image.version" = pkgs.grpcurl.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
