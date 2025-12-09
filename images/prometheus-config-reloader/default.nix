{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for prometheus-config-reloader:
# Packages NOT in nixpkgs:
#   prometheus-config-reloader (0.87.0-r1)

let
  version = "0.77.1";
  prometheus-config-reloader = buildGoModule {
    pname = "prometheus-config-reloader";
    inherit version;

    src = fetchFromGitHub {
      owner = "prometheus-operator";
      repo = "prometheus-operator";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    subPackages = [ "cmd/prometheus-config-reloader" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/prometheus-operator/prometheus-operator/pkg/version.Version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Prometheus config reloader sidecar";
      homepage = "https://github.com/prometheus-operator/prometheus-operator";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = prometheus-config-reloader;
  name = "prometheus-config-reloader";
  tag = "v${version}";
  entrypoint = [ "${prometheus-config-reloader}/bin/prometheus-config-reloader" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Config Reloader";
    "org.opencontainers.image.description" = "Watches and reloads Prometheus configuration";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
