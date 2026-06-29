{ mkImage, pkgs, lib, ... }:

# step-kms-plugin-fips
# Container image packaging nixpkgs.step-kms-plugin
mkImage {
  drv = pkgs.step-kms-plugin;
  name = "step-kms-plugin-fips";
  tag = "v${pkgs.step-kms-plugin.version}";
  entrypoint = [ (lib.getExe pkgs.step-kms-plugin) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "step-kms-plugin-fips";
    "org.opencontainers.image.description" = "step-kms-plugin-fips container image (nixpkgs.step-kms-plugin)";
    "org.opencontainers.image.version" = pkgs.step-kms-plugin.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
