{ mkImage, pkgs, lib, ... }:

# prism
# Container image packaging nixpkgs.prism
mkImage {
  drv = pkgs.prism;
  name = "prism";
  tag = "v${pkgs.prism.version}";
  entrypoint = [ (lib.getExe pkgs.prism) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "prism";
    "org.opencontainers.image.description" = "prism container image (nixpkgs.prism)";
    "org.opencontainers.image.version" = pkgs.prism.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
