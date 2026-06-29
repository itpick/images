{ mkImage, pkgs, lib, ... }:

# bash-fips
# Container image packaging nixpkgs.bash
mkImage {
  drv = pkgs.bash;
  name = "bash-fips";
  tag = "v${pkgs.bash.version}";
  entrypoint = [ (lib.getExe pkgs.bash) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "bash-fips";
    "org.opencontainers.image.description" = "bash-fips container image (nixpkgs.bash)";
    "org.opencontainers.image.version" = pkgs.bash.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
