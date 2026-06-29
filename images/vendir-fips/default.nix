{ mkImage, pkgs, lib, ... }:

# vendir-fips
# Container image packaging nixpkgs.vendir
mkImage {
  drv = pkgs.vendir;
  name = "vendir-fips";
  tag = "v${pkgs.vendir.version}";
  entrypoint = [ (lib.getExe pkgs.vendir) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "vendir-fips";
    "org.opencontainers.image.description" = "vendir-fips container image (nixpkgs.vendir)";
    "org.opencontainers.image.version" = pkgs.vendir.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
