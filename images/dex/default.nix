{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for dex:
# Packages available in nixpkgs:
#   pkgs.dex  # dex (2.44.0-r6)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gomplate  # gomplate (4.3.3-r5)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)

mkImage {
  drv = pkgs.dex-oidc;
  name = "dex";
  tag = "v${pkgs.dex-oidc.version}";
  entrypoint = [ "${pkgs.dex-oidc}/bin/dex" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ gomplate ];

  labels = {
    "org.opencontainers.image.title" = "Dex";
    "org.opencontainers.image.description" = "OpenID Connect Identity (OIDC) and OAuth 2.0 Provider";
    "org.opencontainers.image.version" = pkgs.dex-oidc.version;
    "io.nix-containers.chart" = "argocd";
  };
}
