{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-csi/external-attacher

buildGoModule rec {
  pname = "csi-attacher";
  version = "4.12.0";

  src = fetchFromGitHub {
    owner = "kubernetes-csi";
    repo = "external-attacher";
    rev = "v${version}";
    hash = "sha256-Q1/r/V1j++rwiqjZQ7CvHO5+DWLiqBN2X3rL7QQJgdc=";
  };

  vendorHash = null;

  subPackages = [ "cmd/csi-attacher" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X main.version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Sidecar container that watches Kubernetes VolumeAttachment objects and triggers ControllerPublish/Unpublish against CSI endpoint";
    homepage = "https://github.com/kubernetes-csi/external-attacher";
    license = licenses.asl20;
  };
}
