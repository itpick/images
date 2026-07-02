{ mkImage, pkgs, lib, ... }:

# step-cli - zero trust swiss army knife for X509, OAuth, JWT, OATH OTP
# https://github.com/smallstep/cli
#
# nixpkgs step-cli 0.30.2 bundles jackc/pgx v5.8.0 with 2 critical CVEs
# (CVE-2026-33815 / CVE-2026-33816, both fixed in pgx 5.9.0+). Override
# to 0.30.6 which pulls pgx v5.9.2.

let
  stepcli = pkgs.step-cli.overrideAttrs (o: rec {
    version = "0.30.6";
    src = pkgs.fetchFromGitHub {
      owner = "smallstep";
      repo = "cli";
      rev = "v${version}";
      hash = "sha256-OJNG4GWolYLO2KlsnwNANcNWaPTxJ3wpSWNrdzjyYAs=";
    };
    vendorHash = "sha256-DTFp9K5iiS50QuD2knN/8miYb2k/7O1d3GyEf79i69Q=";
  });
in
mkImage {
  drv = stepcli;
  name = "step-cli";
  tag = "v${stepcli.version}";
  entrypoint = [ "${stepcli}/bin/step" ];
  cmd = [ "help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "step-cli";
    "org.opencontainers.image.description" = "Zero trust swiss army knife for working with X509, OAuth, JWT, OATH OTP";
    "org.opencontainers.image.version" = pkgs.step-cli.version;
    "io.nix-containers.chart" = "step-certificates";
  };
}
