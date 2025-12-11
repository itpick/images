# trivy-adapter
# =============
# Harbor Scanner Trivy - Scanner adapter for Harbor registry
# https://github.com/aquasecurity/harbor-scanner-trivy

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Chainguard SBOM packages for trivy-adapter:
# Packages available in nixpkgs:
#   pkgs.trivy  # trivy (0.68.1-r0)

let
  version = "0.31.4";
  harbor-scanner-trivy = buildGoModule {
    pname = "harbor-scanner-trivy";
    inherit version;

    src = fetchFromGitHub {
      owner = "aquasecurity";
      repo = "harbor-scanner-trivy";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/scanner-trivy" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Harbor Scanner Trivy - vulnerability scanner adapter for Harbor registry";
      homepage = "https://github.com/aquasecurity/harbor-scanner-trivy";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = harbor-scanner-trivy;
  name = "trivy-adapter";
  tag = "v${version}";
  entrypoint = [ "${harbor-scanner-trivy}/bin/scanner-trivy" ];
  cmd = [];

  extraPkgs = with pkgs; [
    trivy      # Trivy scanner binary
    cacert     # SSL certificates
  ];

  env = {
    SCANNER_TRIVY_CACHE_DIR = "/home/scanner/.cache/trivy";
    SCANNER_LOG_LEVEL = "info";
  };

  labels = {
    "org.opencontainers.image.title" = "Harbor Scanner Trivy";
    "org.opencontainers.image.description" = "Trivy vulnerability scanner adapter for Harbor registry";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "harbor";
  };
}
