{ mkImage, buildGoModule, fetchFromGitHub, lib, pkgs, ... }:

# Kube State Metrics (FIPS) - Service that listens to Kubernetes API and generates metrics
# https://github.com/kubernetes/kube-state-metrics
# FIPS-compliant build for FedRAMP compliance

let
  version = "2.17.0";

  kube-state-metrics-fips = buildGoModule {
    pname = "kube-state-metrics-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kube-state-metrics";
      rev = "v${version}";
      hash = "sha256-zBSyj+LIuOvPGqQ7S8k9XZGdHQ8Yb7g0KYXqN7XGo/c=";
    };

    vendorHash = "sha256-oH25MZIHKTGtR8zDmYfMCmqTdL3kCxJFdY/NMbDDSJY=";

    subPackages = [ "." ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X k8s.io/kube-state-metrics/v2/pkg/version.Version=${version}"
      "-X k8s.io/kube-state-metrics/v2/pkg/version.Revision=nix-fips"
      "-X k8s.io/kube-state-metrics/v2/pkg/version.BuildDate=1970-01-01T00:00:00Z"
    ];

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "Kube State Metrics (FIPS) - Service that listens to Kubernetes API and generates metrics with FIPS-validated cryptography";
      homepage = "https://github.com/kubernetes/kube-state-metrics";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  };

in
mkImage {
  drv = kube-state-metrics-fips;
  name = "kube-state-metrics-fips";
  tag = "v${version}";
  entrypoint = [ "${kube-state-metrics-fips}/bin/kube-state-metrics" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [
    cacert
    tzdata
  ];

  labels = {
    "org.opencontainers.image.title" = "Kube State Metrics (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant service that listens to the Kubernetes API server and generates metrics";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
