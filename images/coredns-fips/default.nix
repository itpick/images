{ mkImage, pkgs, lib, ... }:

# coredns-fips
# Container image packaging nixpkgs.coredns
mkImage {
  drv = pkgs.coredns;
  name = "coredns-fips";
  tag = "v${pkgs.coredns.version}";
  entrypoint = [ (lib.getExe pkgs.coredns) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "coredns-fips";
    "org.opencontainers.image.description" = "coredns-fips container image (nixpkgs.coredns)";
    "org.opencontainers.image.version" = pkgs.coredns.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
