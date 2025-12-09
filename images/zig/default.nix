{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for zig:
# Packages available in nixpkgs:
#   pkgs.zig  # General-purpose programming language and target platform

mkImage {
  drv = pkgs.zig;
  name = "zig";
  tag = "v${pkgs.zig.version}";
  entrypoint = [ "${pkgs.zig}/bin/zig" ];
  cmd = [ "help" ];

  labels = {
    "org.opencontainers.image.title" = "Zig";
    "org.opencontainers.image.description" = "General-purpose programming language and target platform";
    "org.opencontainers.image.version" = pkgs.zig.version;
    "io.nix-containers.chart" = "zig";
  };
}
