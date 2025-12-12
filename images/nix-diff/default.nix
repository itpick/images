{ mkImage, pkgs, lib, ... }:

# nix-diff - Explain Nix derivation differences
# https://github.com/Gabriella439/nix-diff

mkImage {
  drv = pkgs.nix-diff;
  name = "nix-diff";
  tag = "v${pkgs.nix-diff.version}";
  entrypoint = [ "${pkgs.nix-diff}/bin/nix-diff" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nix-diff";
    "org.opencontainers.image.description" = "Explain why two Nix derivations differ";
    "org.opencontainers.image.version" = pkgs.nix-diff.version;
  };
}
