{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "0.12.0";
  prometheus-adapter = buildGoModule {
    pname = "prometheus-adapter";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "prometheus-adapter";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X sigs.k8s.io/prometheus-adapter/pkg/adapter.version=${version}"
    ];

    subPackages = [ "cmd/adapter" ];

    postInstall = ''
      mv $out/bin/adapter $out/bin/prometheus-adapter
    '';

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes custom metrics adapter for Prometheus";
      homepage = "https://github.com/kubernetes-sigs/prometheus-adapter";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = prometheus-adapter;
  name = "prometheus-adapter";
  tag = "v${version}";
  entrypoint = [ "${prometheus-adapter}/bin/prometheus-adapter" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus Adapter";
    "org.opencontainers.image.description" = "Kubernetes custom metrics adapter for Prometheus";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus-adapter";
  };
}
