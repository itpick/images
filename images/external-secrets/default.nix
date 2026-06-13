{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.external-secrets;
  name = "external-secrets";
  tag = "v${pkgs.external-secrets.version}";
  entrypoint = [ "${pkgs.external-secrets}/bin/external-secrets" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "External Secrets Operator";
    "org.opencontainers.image.description" = "Kubernetes operator that integrates external secret management systems";
    "org.opencontainers.image.version" = pkgs.external-secrets.version;
    "io.nix-containers.chart" = "external-secrets";
  };
}
