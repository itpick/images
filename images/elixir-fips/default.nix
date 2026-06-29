{ mkImage, pkgs, lib, ... }:

# elixir-fips
# Container image packaging nixpkgs.elixir
mkImage {
  drv = pkgs.elixir;
  name = "elixir-fips";
  tag = "v${pkgs.elixir.version}";
  entrypoint = [ (lib.getExe pkgs.elixir) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "elixir-fips";
    "org.opencontainers.image.description" = "elixir-fips container image (nixpkgs.elixir)";
    "org.opencontainers.image.version" = pkgs.elixir.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
