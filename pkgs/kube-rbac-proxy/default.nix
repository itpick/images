{ lib, fetchFromGitHub, buildGoModule }:

# Built from wolfi-dev/os kube-rbac-proxy.yaml
# https://github.com/brancz/kube-rbac-proxy

buildGoModule rec {
  pname = "kube-rbac-proxy";
  version = "0.22.0";

  src = fetchFromGitHub {
    owner = "brancz";
    repo = "kube-rbac-proxy";
    rev = "v${version}";
    hash = "sha256-YjMD+5Le4kt4Y4+KIKK+kIw0oNURVU1l1l+mFpql8z4=";
  };

  vendorHash = "sha256-n7L7cW7Xe1TShLB60vSVI0kDgN9MJM8mRkS/08MSm9A=";

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
