{ mkImage, pkgs, lib, ... }:

# curl-fips
# Container image packaging nixpkgs.curl
mkImage {
  drv = pkgs.curl;
  name = "curl-fips";
  tag = "v${pkgs.curl.version}";
  entrypoint = [ (lib.getExe pkgs.curl) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "curl-fips";
    "org.opencontainers.image.description" = "curl-fips container image (nixpkgs.curl)";
    "org.opencontainers.image.version" = pkgs.curl.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
