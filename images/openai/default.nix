{ mkImage, pkgs, lib, ... }:

# openai
# Container image packaging nixpkgs.openai
mkImage {
  drv = pkgs.openai;
  name = "openai";
  tag = "v${pkgs.openai.version}";
  entrypoint = [ (lib.getExe pkgs.openai) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "openai";
    "org.opencontainers.image.description" = "openai container image (nixpkgs.openai)";
    "org.opencontainers.image.version" = pkgs.openai.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
