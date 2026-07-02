{ mkImage, pkgs, lib, ... }:

# step-cli-fips - naming variant of step-cli (no FIPS claim).
#
# Same override as step-cli/default.nix — 0.30.2 → 0.30.6 to pull
# pgx v5.9.2 which patches CVE-2026-33815/33816.

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
  name = "step-cli-fips";
  tag = "v${stepcli.version}";
  entrypoint = [ "${stepcli}/bin/step" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "step-cli-fips";
    "org.opencontainers.image.description" = "step-cli-fips container image (step-cli 0.30.6)";
    "org.opencontainers.image.version" = stepcli.version;
    "io.nix-containers.source" = "nixpkgs+override";
  };
}
