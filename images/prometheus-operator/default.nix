{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for prometheus-operator:
# Packages NOT in nixpkgs:
#   prometheus-operator (0.87.0-r2)

let
  version = "0.77.1";
  prometheus-operator = buildGoModule {
    pname = "prometheus-operator";
    inherit version;

    src = fetchFromGitHub {
      owner = "prometheus-operator";
      repo = "prometheus-operator";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

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
      description = "Prometheus Operator creates/configures/manages Prometheus clusters atop Kubernetes";
      homepage = "https://github.com/prometheus-operator/prometheus-operator";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = prometheus-operator;
  name = "prometheus-operator";
  tag = "v${version}";
  entrypoint = [ "${prometheus-operator}/bin/prometheus-operator" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Operator";
    "org.opencontainers.image.description" = "Kubernetes operator for Prometheus";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
