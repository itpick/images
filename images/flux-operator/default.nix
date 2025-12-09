{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for flux-operator:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.tzdata  # tzdata (2025b-r2)
# Packages NOT in nixpkgs:
#   flux-operator (0.35.0-r1)
#   ld-linux (2.42-r4)

# Flux Operator - Kubernetes controller for managing Flux CD lifecycle
mkImage {
  drv = pkgs.fluxcd-operator;
  name = "flux-operator";
  tag = "v${pkgs.fluxcd-operator.version}";
  entrypoint = [ "${pkgs.fluxcd-operator}/bin/flux-operator" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [
    tzdata
  ];

  labels = {
    "org.opencontainers.image.title" = "Flux Operator";
    "org.opencontainers.image.description" = "Kubernetes controller for managing Flux CD lifecycle";
    "org.opencontainers.image.version" = pkgs.fluxcd-operator.version;
    "io.nix-containers.chart" = "flux-operator";
  };
}
