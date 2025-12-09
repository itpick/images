{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for cilium-cli:
# Packages available in nixpkgs:
#   pkgs.cilium-cli  # CLI to install, manage & troubleshoot Kubernetes clusters running Cilium

mkImage {
  drv = pkgs.cilium-cli;
  name = "cilium-cli";
  tag = "v${pkgs.cilium-cli.version}";
  entrypoint = [ "${pkgs.cilium-cli}/bin/cilium" ];
  cmd = [ "help" ];

  labels = {
    "org.opencontainers.image.title" = "Cilium CLI";
    "org.opencontainers.image.description" = "CLI to install, manage & troubleshoot Kubernetes clusters running Cilium";
    "org.opencontainers.image.version" = pkgs.cilium-cli.version;
    "io.nix-containers.chart" = "cilium";
  };
}
