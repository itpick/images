{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for step-ca:
# Packages available in nixpkgs:
#   pkgs.step-ca  # Private certificate authority (X.509 & SSH) & ACME server

mkImage {
  drv = pkgs.step-ca;
  name = "step-ca";
  tag = "v${pkgs.step-ca.version}";
  entrypoint = [ "${pkgs.step-ca}/bin/step-ca" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "step-ca";
    "org.opencontainers.image.description" = "Private certificate authority & ACME server for secure automated certificate management";
    "org.opencontainers.image.version" = pkgs.step-ca.version;
    "io.nix-containers.chart" = "step-certificates";
  };
}
