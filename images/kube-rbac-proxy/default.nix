{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "0.18.0";
  kube-rbac-proxy = buildGoModule {
    pname = "kube-rbac-proxy";
    inherit version;

    src = fetchFromGitHub {
      owner = "brancz";
      repo = "kube-rbac-proxy";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes RBAC authorizing HTTP proxy";
      homepage = "https://github.com/brancz/kube-rbac-proxy";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = kube-rbac-proxy;
  name = "kube-rbac-proxy";
  tag = "v${version}";
  entrypoint = [ "${kube-rbac-proxy}/bin/kube-rbac-proxy" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "kube-rbac-proxy";
    "org.opencontainers.image.description" = "Kubernetes RBAC authorizing HTTP proxy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kube-prometheus-stack,dragonfly-operator";
  };
}
