{ mkImage, pkgs, lib, ... }:

# rstudio-fips
# Container image packaging nixpkgs.rstudio
mkImage {
  drv = pkgs.rstudio;
  name = "rstudio-fips";
  tag = "v${pkgs.rstudio.version}";
  entrypoint = [ (lib.getExe pkgs.rstudio) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "rstudio-fips";
    "org.opencontainers.image.description" = "rstudio-fips container image (nixpkgs.rstudio)";
    "org.opencontainers.image.version" = pkgs.rstudio.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
