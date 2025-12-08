{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.dex-oidc;
  name = "dex";
  tag = "v${pkgs.dex-oidc.version}";
  entrypoint = [ "${pkgs.dex-oidc}/bin/dex" ];
  cmd = [ "version" ];

  labels = {
    "org.opencontainers.image.title" = "Dex";
    "org.opencontainers.image.description" = "OpenID Connect Identity (OIDC) and OAuth 2.0 Provider";
    "org.opencontainers.image.version" = pkgs.dex-oidc.version;
    "io.nix-containers.chart" = "argocd";
  };
}
