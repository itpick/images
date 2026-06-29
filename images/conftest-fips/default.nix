{ mkImage, pkgs, lib, ... }:

# conftest-fips
# Container image packaging nixpkgs.conftest
mkImage {
  drv = pkgs.conftest;
  name = "conftest-fips";
  tag = "v${pkgs.conftest.version}";
  entrypoint = [ (lib.getExe pkgs.conftest) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "conftest-fips";
    "org.opencontainers.image.description" = "conftest-fips container image (nixpkgs.conftest)";
    "org.opencontainers.image.version" = pkgs.conftest.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
