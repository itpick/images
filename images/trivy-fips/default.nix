{ mkImage, pkgs, lib, ... }:

# trivy-fips
# Container image packaging nixpkgs.trivy
mkImage {
  drv = pkgs.trivy;
  name = "trivy-fips";
  tag = "v${pkgs.trivy.version}";
  entrypoint = [ (lib.getExe pkgs.trivy) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "trivy-fips";
    "org.opencontainers.image.description" = "trivy-fips container image (nixpkgs.trivy)";
    "org.opencontainers.image.version" = pkgs.trivy.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
