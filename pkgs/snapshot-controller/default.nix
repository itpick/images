{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-csi/external-snapshotter

buildGoModule rec {
  pname = "snapshot-controller";
  version = "8.4.0";

  src = fetchFromGitHub {
    owner = "kubernetes-csi";
    repo = "external-snapshotter";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [
    "cmd/snapshot-controller"
    "cmd/csi-snapshotter"
    "cmd/snapshot-validation-webhook"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X main.version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "CSI snapshot controller and sidecar";
    homepage = "https://github.com/kubernetes-csi/external-snapshotter";
    license = licenses.asl20;
  };
}
