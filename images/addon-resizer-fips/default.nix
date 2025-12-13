{ mkImage, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

# Kubernetes Addon Resizer (FIPS) - Vertically scales addons based on cluster size
# https://github.com/kubernetes/autoscaler/tree/master/addon-resizer
# FIPS-compliant build for FedRAMP compliance

let
  version = "1.8.23";

  addon-resizer-fips = buildGoModule rec {
    pname = "addon-resizer-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "autoscaler";
      rev = "addon-resizer-${version}";
      hash = "sha256-QAMI26wITo7Pq2umdUFjA85aIG2dMFXVa8bCheO0TtE=";
    };

    vendorHash = null;  # Uses vendor directory

    sourceRoot = "source/addon-resizer";

    subPackages = [ "." ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X main.version=${version}"
    ];

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "Kubernetes addon resizer (FIPS) - vertically scales addons based on cluster size with FIPS-validated cryptography";
      homepage = "https://github.com/kubernetes/autoscaler/tree/master/addon-resizer";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  };

in
mkImage {
  drv = addon-resizer-fips;
  name = "addon-resizer-fips";
  tag = "v${version}";
  entrypoint = [ "${addon-resizer-fips}/bin/addon-resizer" ];
  cmd = [];

  extraPkgs = with pkgs; [
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "Kubernetes Addon Resizer (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant vertically scaling for Kubernetes addons based on cluster size";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
