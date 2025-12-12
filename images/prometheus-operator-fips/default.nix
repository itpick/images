{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for prometheus-operator-fips:
# Packages NOT in nixpkgs:
#   prometheus-operator (0.87.0-r2)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

let
  version = "0.77.1";
  prometheus-operator-fips = buildGoModule {
    pname = "prometheus-operator-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "prometheus-operator";
      repo = "prometheus-operator";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash - vendor directory inconsistent
    };

    vendorHash = null;  # TODO: Update after first build

    # Enable FIPS mode via BoringCrypto
    env = {
      CGO_ENABLED = "1";
      GOEXPERIMENT = "boringcrypto";
    };

    ldflags = [
      "-s" "-w"
      "-X github.com/prometheus-operator/prometheus-operator/pkg/version.Version=${version}"
    ];

    subPackages = [ "cmd/operator" ];

    postInstall = ''
      mv $out/bin/operator $out/bin/prometheus-operator
    '';

    doCheck = false;

    meta = with lib; {
      description = "Prometheus Operator creates/configures/manages Prometheus clusters atop Kubernetes (FIPS-enabled)";
      homepage = "https://github.com/prometheus-operator/prometheus-operator";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = prometheus-operator-fips;
  name = "prometheus-operator-fips";
  tag = "v${version}";
  entrypoint = [ "${prometheus-operator-fips}/bin/prometheus-operator" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Operator FIPS";
    "org.opencontainers.image.description" = "Kubernetes operator for Prometheus with FIPS 140-2 validated cryptography";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
    "io.nix-containers.image.fips" = "true";
    "io.nix-containers.image.compliance" = "FIPS-140-2";
  };
}
