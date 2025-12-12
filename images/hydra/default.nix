{ mkImage, pkgs, lib, ... }:

# Hydra - Nix-based continuous build system
# https://nixos.org/hydra/

mkImage {
  drv = pkgs.hydra;
  name = "hydra";
  tag = "v${pkgs.hydra.version}";
  entrypoint = [ "${pkgs.hydra}/bin/hydra-eval-jobs" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Hydra";
    "org.opencontainers.image.description" = "Nix-based continuous build system";
    "org.opencontainers.image.version" = pkgs.hydra.version;
  };
}
