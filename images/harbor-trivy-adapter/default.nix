# harbor-trivy-adapter
# =============
# Harbor Trivy Adapter - Vulnerability scanner adapter for Harbor
# https://github.com/goharbor/harbor-scanner-trivy

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Harbor Scanner Trivy provides vulnerability scanning via Trivy for Harbor registry

let
  version = "0.34.1";
  harbor-scanner-trivy = buildGoModule {
    pname = "harbor-scanner-trivy";
    inherit version;

    src = fetchFromGitHub {
      owner = "goharbor";
      repo = "harbor-scanner-trivy";
      rev = "v${version}";
      hash = "sha256-8KCgtTZWug/tb8slvWW2ZU+UtiH+VTT2lSIIcOxH0M0=";
    };

    vendorHash = "sha256-InLGaSg/jWMwZMLM5BNy3SyiM2XIGyq3FYtwdUdMQ58=";
    proxyVendor = true;  # Vendor directory is out of sync with go.mod

    subPackages = [ "cmd/scanner-trivy" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Harbor Scanner Trivy - Vulnerability scanner for Harbor";
      homepage = "https://github.com/goharbor/harbor-scanner-trivy";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = harbor-scanner-trivy;
  name = "harbor-trivy-adapter";
  tag = "v${version}";
  entrypoint = [ "${harbor-scanner-trivy}/bin/scanner-trivy" ];
  cmd = [];

  # Include trivy for actual scanning
  extraPkgs = with pkgs; [ cacert tzdata trivy ];

  env = {
    SCANNER_TRIVY_CACHE_DIR = "/home/scanner/.cache/trivy";
    SCANNER_LOG_LEVEL = "info";
  };

  labels = {
    "org.opencontainers.image.title" = "Harbor Trivy Adapter";
    "org.opencontainers.image.description" = "Vulnerability scanner adapter for Harbor using Trivy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "harbor";
  };
}
