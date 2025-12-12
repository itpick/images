{ mkImage, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

# Flux CLI (FIPS) - Command line tool for Flux CD with FIPS-compliant cryptography
# https://github.com/fluxcd/flux2
# FIPS-compliant build for FedRAMP compliance

let
  version = "2.7.5";

  flux-cli-fips = buildGoModule rec {
    pname = "flux-cli-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "flux2";
      rev = "v${version}";
      hash = "sha256-QQ/qpEVQBTaYzjqr5I+0wxGYI/pJrXV3cCLSZNE2m4s=";
    };

    vendorHash = "sha256-Qe2tFCGjMfn1y7LxHr6ksqKqQZN2B9jRGdMqXbcDgJk=";

    subPackages = [ "cmd/flux" ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X main.VERSION=${version}"
    ];

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    postInstall = ''
      # Rename binary from flux to match expected name
      mv $out/bin/flux $out/bin/flux || true
    '';

    meta = with lib; {
      description = "Flux CLI (FIPS) - Command line tool for Flux CD with FIPS-validated cryptography";
      homepage = "https://fluxcd.io/";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  };

in
mkImage {
  drv = flux-cli-fips;
  name = "flux-cli-fips";
  tag = "v${version}";
  entrypoint = [ "${flux-cli-fips}/bin/flux" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [
    busybox
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "Flux CLI (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant command line tool for managing Flux CD";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux2";
    "io.nix-containers.compliance" = "FIPS-140-2";
    "io.nix-containers.fips" = "true";
  };
}
