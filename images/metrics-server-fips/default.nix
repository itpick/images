{ mkImage, buildGoModule, fetchFromGitHub, lib, pkgs, ... }:

# Metrics Server (FIPS) - Scalable and efficient source of container resource metrics
# https://github.com/kubernetes-sigs/metrics-server
# FIPS-compliant build for FedRAMP compliance

let
  version = "0.7.0";

  metrics-server-fips = buildGoModule {
    pname = "metrics-server-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "metrics-server";
      rev = "v${version}";
      hash = "sha256-UgltnGkzAtUfuXzNfnNWOGIKC7IUi6Yy0YZuOgyNSaA=";
    };

    proxyVendor = true;
    vendorHash = "sha256-v662+2TxUoGhRA6mmeL1nVUKjxePL/8oYpi3YOGFnTw=";

    subPackages = [ "cmd/metrics-server" ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X sigs.k8s.io/metrics-server/pkg/version.gitVersion=v${version}"
    ];

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "Metrics Server (FIPS) - Scalable and efficient source of container resource metrics with FIPS-validated cryptography";
      homepage = "https://github.com/kubernetes-sigs/metrics-server";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  };

in
mkImage {
  drv = metrics-server-fips;
  name = "metrics-server-fips";
  tag = "v${version}";
  entrypoint = [ "${metrics-server-fips}/bin/metrics-server" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Kubernetes Metrics Server (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant scalable and efficient source of container resource metrics";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "metrics-server";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
