{ mkImage, pkgs, lib, ... }:

# gitaly-fips
# Container image packaging nixpkgs.gitaly
mkImage {
  drv = pkgs.gitaly;
  name = "gitaly-fips";
  tag = "v${pkgs.gitaly.version}";
  entrypoint = [ (lib.getExe pkgs.gitaly) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "gitaly-fips";
    "org.opencontainers.image.description" = "gitaly-fips container image (nixpkgs.gitaly)";
    "org.opencontainers.image.version" = pkgs.gitaly.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
