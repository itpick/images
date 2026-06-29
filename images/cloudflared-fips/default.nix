{ mkImage, pkgs, lib, ... }:

# cloudflared-fips
# Container image packaging nixpkgs.cloudflared
mkImage {
  drv = pkgs.cloudflared;
  name = "cloudflared-fips";
  tag = "v${pkgs.cloudflared.version}";
  entrypoint = [ (lib.getExe pkgs.cloudflared) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "cloudflared-fips";
    "org.opencontainers.image.description" = "cloudflared-fips container image (nixpkgs.cloudflared)";
    "org.opencontainers.image.version" = pkgs.cloudflared.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
