{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for step-cli:
# Packages available in nixpkgs:
#   pkgs.step-cli  # Zero trust swiss army knife for working with X509, OAuth, JWT, OATH OTP, etc

mkImage {
  drv = pkgs.step-cli;
  name = "step-cli";
  tag = "v${pkgs.step-cli.version}";
  entrypoint = [ "${pkgs.step-cli}/bin/step" ];
  cmd = [ "help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "step-cli";
    "org.opencontainers.image.description" = "Zero trust swiss army knife for working with X509, OAuth, JWT, OATH OTP";
    "org.opencontainers.image.version" = pkgs.step-cli.version;
    "io.nix-containers.chart" = "step-certificates";
  };
}
