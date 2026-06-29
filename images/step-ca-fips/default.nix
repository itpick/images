{ mkImage, pkgs, lib, ... }:

# step-ca-fips
# Container image packaging nixpkgs.step-ca
mkImage {
  drv = pkgs.step-ca;
  name = "step-ca-fips";
  tag = "v${pkgs.step-ca.version}";
  entrypoint = [ (lib.getExe pkgs.step-ca) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "step-ca-fips";
    "org.opencontainers.image.description" = "step-ca-fips container image (nixpkgs.step-ca)";
    "org.opencontainers.image.version" = pkgs.step-ca.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
