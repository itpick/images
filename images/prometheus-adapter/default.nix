{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for prometheus-adapter:
# Packages NOT in nixpkgs:
#   prometheus-adapter (0.12.0-r18)

let
  version = "0.12.0";
  prometheus-adapter = buildGoModule {
    pname = "prometheus-adapter";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "prometheus-adapter";
      rev = "v${version}";
      hash = "sha256-GNAfrDWVyl0SiIJ+cHYxaLGAwvsHpwhVp4ieGGleXWk=";
    };

    proxyVendor = true;
    vendorHash = "sha256-k6nWWe6anWVD40pv/mF6CNqWgJDhD1ttXOuWk3pAUto=";

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
mkImage {
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
