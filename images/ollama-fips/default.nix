{ mkImage, pkgs, lib, ... }:

# ollama-fips
# Container image packaging nixpkgs.ollama
mkImage {
  drv = pkgs.ollama;
  name = "ollama-fips";
  tag = "v${pkgs.ollama.version}";
  entrypoint = [ (lib.getExe pkgs.ollama) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "ollama-fips";
    "org.opencontainers.image.description" = "ollama-fips container image (nixpkgs.ollama)";
    "org.opencontainers.image.version" = pkgs.ollama.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
