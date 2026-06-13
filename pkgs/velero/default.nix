{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/vmware-tanzu/velero

buildGoModule rec {
  pname = "velero";
  version = "1.18.1";

  src = fetchFromGitHub {
    owner = "vmware-tanzu";
    repo = "velero";
    rev = "v${version}";
    hash = "sha256-YByxKkuRBqGET5kVw7cDv8nTR9v1ITFr52t/vpm6gJI=";
  };

  vendorHash = "sha256-piwYYMuYenJY4TsjH8+ozPwam12+ZlTJF2fiQ/Dkb+A=";

  subPackages = [
    "cmd/velero"
    "cmd/velero-restore-helper"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/vmware-tanzu/velero/pkg/buildinfo.Version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Backup and migrate Kubernetes applications and their persistent volumes";
    homepage = "https://velero.io/";
    license = licenses.asl20;
  };
}
