{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-csi/external-provisioner

buildGoModule rec {
  pname = "csi-provisioner";
  version = "6.3.0";

  src = fetchFromGitHub {
    owner = "kubernetes-csi";
    repo = "external-provisioner";
    rev = "v${version}";
    hash = "sha256-akUg/j82I0VhSNHQ2n/OChiHwUkPvhpva329zh1Gce8=";
  };

  vendorHash = null;

  subPackages = [ "cmd/csi-provisioner" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X main.version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Sidecar container that watches Kubernetes PVC objects and triggers CreateVolume/DeleteVolume against CSI endpoint";
    homepage = "https://github.com/kubernetes-csi/external-provisioner";
    license = licenses.asl20;
  };
}
