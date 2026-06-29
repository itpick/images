{ mkImage, pkgs, lib, ... }:

# skopeo-fips
# Container image packaging nixpkgs.skopeo
mkImage {
  drv = pkgs.skopeo;
  name = "skopeo-fips";
  tag = "v${pkgs.skopeo.version}";
  entrypoint = [ (lib.getExe pkgs.skopeo) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "skopeo-fips";
    "org.opencontainers.image.description" = "skopeo-fips container image (nixpkgs.skopeo)";
    "org.opencontainers.image.version" = pkgs.skopeo.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
