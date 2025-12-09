{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for bun:
# Packages available in nixpkgs:
#   pkgs.bun  # Fast all-in-one JavaScript runtime

mkImage {
  drv = pkgs.bun;
  name = "bun";
  tag = "v${pkgs.bun.version}";
  entrypoint = [ "${pkgs.bun}/bin/bun" ];
  cmd = [ "help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Bun";
    "org.opencontainers.image.description" = "Fast all-in-one JavaScript runtime, bundler, transpiler and package manager";
    "org.opencontainers.image.version" = pkgs.bun.version;
    "io.nix-containers.chart" = "bun";
  };
}
