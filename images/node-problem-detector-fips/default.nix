{ mkImage, pkgs, lib, ... }:

# node-problem-detector-fips
# Container image packaging nixpkgs.node-problem-detector
mkImage {
  drv = pkgs.node-problem-detector;
  name = "node-problem-detector-fips";
  tag = "v${pkgs.node-problem-detector.version}";
  entrypoint = [ (lib.getExe pkgs.node-problem-detector) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "node-problem-detector-fips";
    "org.opencontainers.image.description" = "node-problem-detector-fips container image (nixpkgs.node-problem-detector)";
    "org.opencontainers.image.version" = pkgs.node-problem-detector.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
