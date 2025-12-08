{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.12.0";
  ingress-nginx = buildGoModule {
    pname = "ingress-nginx";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "ingress-nginx";
      rev = "controller-v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    subPackages = [ "cmd/nginx" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X k8s.io/ingress-nginx/version.RELEASE=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "NGINX Ingress Controller for Kubernetes";
      homepage = "https://github.com/kubernetes/ingress-nginx";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = ingress-nginx;
  name = "ingress-nginx";
  tag = "v${version}";
  entrypoint = [ "${ingress-nginx}/bin/nginx" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "NGINX Ingress Controller";
    "org.opencontainers.image.description" = "Kubernetes NGINX ingress controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "ingress-nginx";
  };
}
