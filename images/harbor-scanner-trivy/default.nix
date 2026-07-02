# harbor-scanner-trivy
# =============
# Harbor Scanner Trivy - Vulnerability scanner for Harbor
# https://github.com/goharbor/harbor-scanner-trivy

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Harbor Scanner Trivy provides vulnerability scanning via Trivy for Harbor registry

let
  version = "0.38.0";
  harbor-scanner-trivy = buildGoModule {
    pname = "harbor-scanner-trivy";
    inherit version;

    src = fetchFromGitHub {
      owner = "goharbor";
      repo = "harbor-scanner-trivy";
      rev = "v${version}";
      hash = "sha256-A70zU9JXBb1xdF+jOMg3JYyGv6SKII0JfGP6mQqIsR8=";
    };

    vendorHash = "sha256-pTCQYmA/Oym917JuFMzP4sZwkcWrTyAtMg2267SQ+yk=";
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
  name = "harbor-scanner-trivy";
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
    "org.opencontainers.image.title" = "Harbor Scanner Trivy";
    "org.opencontainers.image.description" = "Vulnerability scanner for Harbor using Trivy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "harbor";
  };
}
