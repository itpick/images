{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for kubesec:
# Packages available in nixpkgs:
#   pkgs.kubesec  # Security risk analysis tool for Kubernetes resources

mkImage {
  drv = pkgs.kubesec;
  name = "kubesec";
  tag = "v${pkgs.kubesec.version}";
  entrypoint = [ "${pkgs.kubesec}/bin/kubesec" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Kubesec";
    "org.opencontainers.image.description" = "Security risk analysis tool for Kubernetes resources";
    "org.opencontainers.image.version" = pkgs.kubesec.version;
    "io.nix-containers.chart" = "kubesec";
  };
}
