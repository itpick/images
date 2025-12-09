{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for flux:
# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.fluxcd  # flux (2.7.5-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

mkImage {
  drv = pkgs.fluxcd;
  name = "flux";
  tag = "v${pkgs.fluxcd.version}";
  entrypoint = [ "${pkgs.fluxcd}/bin/flux" ];
  cmd = [ "help" ];

  labels = {
    "org.opencontainers.image.title" = "Flux CD";
    "org.opencontainers.image.description" = "Open and extensible continuous delivery solution for Kubernetes";
    "org.opencontainers.image.version" = pkgs.fluxcd.version;
    "io.nix-containers.chart" = "flux";
  };
}
