{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-csi/node-driver-registrar

buildGoModule rec {
  pname = "csi-node-driver-registrar";
  version = "2.15.0";

  src = fetchFromGitHub {
    owner = "kubernetes-csi";
    repo = "node-driver-registrar";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [ "cmd/csi-node-driver-registrar" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X main.version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Sidecar container that registers a CSI driver with the kubelet";
    homepage = "https://github.com/kubernetes-csi/node-driver-registrar";
    license = licenses.asl20;
  };
}
