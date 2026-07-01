{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-csi/external-resizer

buildGoModule rec {
  pname = "csi-resizer";
  version = "2.2.1";

  src = fetchFromGitHub {
    owner = "kubernetes-csi";
    repo = "external-resizer";
    rev = "v${version}";
    hash = "sha256-kjRiJt25hjnwwt53vBOXZLBKvoyQDkaMquISBdTPtRs=";
  };

  vendorHash = null;

  subPackages = [ "cmd/csi-resizer" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X main.version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Sidecar container that watches Kubernetes PVC objects and triggers ControllerExpandVolume against CSI endpoint";
    homepage = "https://github.com/kubernetes-csi/external-resizer";
    license = licenses.asl20;
  };
}
