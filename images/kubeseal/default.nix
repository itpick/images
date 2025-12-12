{ mkImage, pkgs, lib, ... }:

# kubeseal - Kubernetes Sealed Secrets
# https://github.com/bitnami-labs/sealed-secrets

mkImage {
  drv = pkgs.kubeseal;
  name = "kubeseal";
  tag = "v${pkgs.kubeseal.version}";
  entrypoint = [ "${pkgs.kubeseal}/bin/kubeseal" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "kubeseal";
    "org.opencontainers.image.description" = "Client-side tool for Sealed Secrets encryption";
    "org.opencontainers.image.version" = pkgs.kubeseal.version;
  };
}
