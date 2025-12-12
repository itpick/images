{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:


# Chainguard SBOM packages for alertmanager-fips:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   alertmanager (0.27.0-r10)
#   ld-linux (2.42-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

let
  version = pkgs.prometheus-alertmanager.version;

  alertmanager-fips = buildGoModule {
    pname = "alertmanager-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "alertmanager";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash
    };

    vendorHash = null;  # TODO: Update after first build

    # Enable FIPS mode via BoringCrypto
    env = {
      CGO_ENABLED = "1";
      GOEXPERIMENT = "boringcrypto";
    };

    ldflags = [
      "-s" "-w"
      "-X github.com/prometheus/common/version.Version=${version}"
      "-X github.com/prometheus/common/version.Revision=unknown"
      "-X github.com/prometheus/common/version.Branch=unknown"
      "-X github.com/prometheus/common/version.BuildUser=nix"
      "-X github.com/prometheus/common/version.BuildDate=unknown"
    ];

    subPackages = [ "cmd/alertmanager" "cmd/amtool" ];

    doCheck = false;

    meta = with lib; {
      description = "Prometheus Alertmanager handles alerts sent by Prometheus (FIPS-enabled)";
      homepage = "https://github.com/prometheus/alertmanager";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = alertmanager-fips;
  name = "alertmanager-fips";
  tag = "v${version}";
  entrypoint = [ "${alertmanager-fips}/bin/alertmanager" ];
  cmd = [ "--help" ];

  env = {
    ALERTMANAGER_DATA_DIR = "/alertmanager";
  };

  labels = {
    "org.opencontainers.image.title" = "Alertmanager FIPS";
    "org.opencontainers.image.description" = "Prometheus Alertmanager handles alerts sent by Prometheus with FIPS 140-2 validated cryptography";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
    "io.nix-containers.image.fips" = "true";
    "io.nix-containers.image.compliance" = "FIPS-140-2";
  };
}
