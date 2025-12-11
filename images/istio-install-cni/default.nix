# istio-install-cni
# =============
# Istio CNI Plugin - Setup Kubernetes pod namespaces for traffic redirection
# https://github.com/istio/istio/tree/master/cni

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Istio CNI plugin redirects traffic to the sidecar proxy

let
  version = "1.28.1";
  istio-cni = buildGoModule {
    pname = "istio-cni";
    inherit version;

    src = fetchFromGitHub {
      owner = "istio";
      repo = "istio";
      rev = "${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cni/cmd/istio-cni" "cni/cmd/install-cni" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X istio.io/istio/pkg/version.buildVersion=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Istio CNI Plugin for traffic redirection";
      homepage = "https://github.com/istio/istio/tree/master/cni";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = istio-cni;
  name = "istio-install-cni";
  tag = version;
  entrypoint = [ "${istio-cni}/bin/install-cni" ];
  cmd = [];

  extraPkgs = with pkgs; [
    iptables       # For network rules
    iproute2       # For ip commands
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "Istio Install CNI";
    "org.opencontainers.image.description" = "Istio CNI plugin installer for Kubernetes";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "istio";
  };
}
