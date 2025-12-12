{ mkImage, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

# External Secrets Operator (FIPS) - Kubernetes operator with FIPS-compliant cryptography
# https://github.com/external-secrets/external-secrets
# FIPS-compliant build for FedRAMP compliance

let
  version = "1.1.1";

  external-secrets-fips = buildGoModule rec {
    pname = "external-secrets-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "external-secrets";
      repo = "external-secrets";
      rev = "v${version}";
      hash = "sha256-JF3HdYPTK+kERoG71Qh9gq3Sl0YqQWlGnMU97bIiTPo=";
    };

    vendorHash = null;  # Uses vendor directory

    subPackages = [ "." ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X github.com/external-secrets/external-secrets/pkg/version.Version=${version}"
    ];

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "External Secrets Operator (FIPS) - Kubernetes operator with FIPS-validated cryptography";
      homepage = "https://external-secrets.io/";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  };

in
mkImage {
  drv = external-secrets-fips;
  name = "external-secrets-fips";
  tag = "v${version}";
  entrypoint = [ "${external-secrets-fips}/bin/external-secrets" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "External Secrets Operator (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant Kubernetes operator that integrates external secret management systems";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "external-secrets";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
