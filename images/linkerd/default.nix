{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for linkerd:
# Packages available in nixpkgs:
#   pkgs.linkerd  # Simple Kubernetes service mesh

mkImage {
  drv = pkgs.linkerd;
  name = "linkerd-cli";
  tag = "v${pkgs.linkerd.version}";
  entrypoint = [ "${pkgs.linkerd}/bin/linkerd" ];
  cmd = [ "help" ];

  labels = {
    "org.opencontainers.image.title" = "Linkerd CLI";
    "org.opencontainers.image.description" = "Simple Kubernetes service mesh that improves security, observability and reliability";
    "org.opencontainers.image.version" = pkgs.linkerd.version;
    "io.nix-containers.chart" = "linkerd";
  };
}
