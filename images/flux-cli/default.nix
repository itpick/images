{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for flux-cli:
# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.flux  # flux (2.7.5-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# Flux CLI - Command line tool for Flux CD
mkImage {
  drv = pkgs.fluxcd;
  name = "flux-cli";
  tag = "v${pkgs.fluxcd.version}";
  entrypoint = [ "${pkgs.fluxcd}/bin/flux" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [
    busybox
  ];

  labels = {
    "org.opencontainers.image.title" = "Flux CLI";
    "org.opencontainers.image.description" = "Command line tool for managing Flux CD";
    "org.opencontainers.image.version" = pkgs.fluxcd.version;
    "io.nix-containers.chart" = "flux2";
  };
}
