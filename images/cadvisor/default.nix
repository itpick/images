{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for cadvisor:
# Packages available in nixpkgs:
#   pkgs.cadvisor  # cadvisor (0.54.1-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)

mkImage {
  drv = pkgs.cadvisor;
  name = "cadvisor";
  tag = "v${pkgs.cadvisor.version}";
  entrypoint = [ "${pkgs.cadvisor}/bin/cadvisor" ];
  cmd = [ "-logtostderr" ];
  user = "0:0";  # cadvisor needs root for container metrics

  labels = {
    "org.opencontainers.image.title" = "cAdvisor";
    "org.opencontainers.image.description" = "Analyzes resource usage and performance characteristics of running containers";
    "org.opencontainers.image.version" = pkgs.cadvisor.version;
    "io.nix-containers.chart" = "cadvisor";
  };
}
