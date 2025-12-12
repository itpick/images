{ mkImage, pkgs, lib, ... }:

# k9s - Kubernetes CLI management
# https://k9scli.io/

mkImage {
  drv = pkgs.k9s;
  name = "k9s";
  tag = "v${pkgs.k9s.version}";
  entrypoint = [ "${pkgs.k9s}/bin/k9s" ];
  cmd = [ "version" ];

  labels = {
    "org.opencontainers.image.title" = "k9s";
    "org.opencontainers.image.description" = "Kubernetes CLI to manage clusters in style";
    "org.opencontainers.image.version" = pkgs.k9s.version;
  };
}
