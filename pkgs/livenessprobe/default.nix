{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-csi/livenessprobe

buildGoModule rec {
  pname = "livenessprobe";
  version = "2.19.0";

  src = fetchFromGitHub {
    owner = "kubernetes-csi";
    repo = "livenessprobe";
    rev = "v${version}";
    hash = "sha256-lJ8qWDwoX41cKPnITA7tVZl+VcxBoC19bY7fiQjVyKM=";
  };

  vendorHash = null;

  subPackages = [ "cmd/livenessprobe" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X main.version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "A sidecar container that can be included in CSI driver pods to enable liveness probe";
    homepage = "https://github.com/kubernetes-csi/livenessprobe";
    license = licenses.asl20;
  };
}
