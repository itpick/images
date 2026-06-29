{ mkImage, pkgs, lib, ... }:

# karma-fips
# Container image packaging nixpkgs.karma
mkImage {
  drv = pkgs.karma;
  name = "karma-fips";
  tag = "v${pkgs.karma.version}";
  entrypoint = [ (lib.getExe pkgs.karma) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "karma-fips";
    "org.opencontainers.image.description" = "karma-fips container image (nixpkgs.karma)";
    "org.opencontainers.image.version" = pkgs.karma.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
