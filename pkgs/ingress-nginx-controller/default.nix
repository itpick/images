{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes/ingress-nginx

buildGoModule rec {
  pname = "ingress-nginx-controller";
  version = "1.14.1";

  src = fetchFromGitHub {
    owner = "kubernetes";
    repo = "ingress-nginx";
    rev = "controller-v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [
    "cmd/nginx"
    "cmd/dbg"
    "cmd/waitshutdown"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X k8s.io/ingress-nginx/version.RELEASE=v${version}"
  ];

  postInstall = ''
    mv $out/bin/nginx $out/bin/nginx-ingress-controller
  '';

  doCheck = false;

  meta = with lib; {
    description = "Ingress-NGINX Controller for Kubernetes";
    homepage = "https://kubernetes.github.io/ingress-nginx/";
    license = licenses.asl20;
  };
}
