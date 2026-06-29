{ mkImage, pkgs, lib, ... }:

# hugo-fips
# Container image packaging nixpkgs.hugo
mkImage {
  drv = pkgs.hugo;
  name = "hugo-fips";
  tag = "v${pkgs.hugo.version}";
  entrypoint = [ (lib.getExe pkgs.hugo) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "hugo-fips";
    "org.opencontainers.image.description" = "hugo-fips container image (nixpkgs.hugo)";
    "org.opencontainers.image.version" = pkgs.hugo.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
