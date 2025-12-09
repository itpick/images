{ lib, fetchFromGitHub, buildGoModule }:

# Built from wolfi-dev/os kube-rbac-proxy.yaml
# https://github.com/brancz/kube-rbac-proxy

buildGoModule rec {
  pname = "kube-rbac-proxy";
  version = "0.20.1";

  src = fetchFromGitHub {
    owner = "brancz";
    repo = "kube-rbac-proxy";
    rev = "v${version}";
    hash = "sha256-pNhnhj0ooJf4HzQq6ry4M+9YNa1Cf0NSVE/Dfyrq2+Y=";
  };

  vendorHash = "sha256-FMynB4SdaVxTdonR3u7QZNumOZoViKGpCZa6lI1gl3Y=";

  subPackages = [ "." ];

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
}
