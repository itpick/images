{ mkImage, pkgs, lib, ... }:

# code-server-fips
# Container image packaging nixpkgs.code-server
mkImage {
  drv = pkgs.code-server;
  name = "code-server-fips";
  tag = "v${pkgs.code-server.version}";
  entrypoint = [ (lib.getExe pkgs.code-server) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "code-server-fips";
    "org.opencontainers.image.description" = "code-server-fips container image (nixpkgs.code-server)";
    "org.opencontainers.image.version" = pkgs.code-server.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
