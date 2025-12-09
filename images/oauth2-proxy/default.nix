{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for oauth2-proxy:
# Packages available in nixpkgs:
#   pkgs.oauth2-proxy  # oauth2-proxy (7.13.0-r2)

mkImage {
  drv = pkgs.oauth2-proxy;
  name = "oauth2-proxy";
  tag = "v${pkgs.oauth2-proxy.version}";
  entrypoint = [ "${pkgs.oauth2-proxy}/bin/oauth2-proxy" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "OAuth2 Proxy";
    "org.opencontainers.image.description" = "Reverse proxy that provides authentication with various providers";
    "org.opencontainers.image.version" = pkgs.oauth2-proxy.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
