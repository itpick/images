{ mkImage, pkgs, lib, ... }:

# chart-testing-fips
# Container image packaging nixpkgs.chart-testing
mkImage {
  drv = pkgs.chart-testing;
  name = "chart-testing-fips";
  tag = "v${pkgs.chart-testing.version}";
  entrypoint = [ (lib.getExe pkgs.chart-testing) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "chart-testing-fips";
    "org.opencontainers.image.description" = "chart-testing-fips container image (nixpkgs.chart-testing)";
    "org.opencontainers.image.version" = pkgs.chart-testing.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
