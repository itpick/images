{ mkImage, pkgs, lib, ... }:

# go-fips
# Container image packaging nixpkgs.go
mkImage {
  drv = pkgs.go;
  name = "go-fips";
  tag = "v${pkgs.go.version}";
  entrypoint = [ (lib.getExe pkgs.go) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "go-fips";
    "org.opencontainers.image.description" = "go-fips container image (nixpkgs.go)";
    "org.opencontainers.image.version" = pkgs.go.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
