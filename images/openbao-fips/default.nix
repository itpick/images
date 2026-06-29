{ mkImage, pkgs, lib, ... }:

# openbao-fips
# Container image packaging nixpkgs.openbao
mkImage {
  drv = pkgs.openbao;
  name = "openbao-fips";
  tag = "v${pkgs.openbao.version}";
  entrypoint = [ (lib.getExe pkgs.openbao) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "openbao-fips";
    "org.opencontainers.image.description" = "openbao-fips container image (nixpkgs.openbao)";
    "org.opencontainers.image.version" = pkgs.openbao.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
