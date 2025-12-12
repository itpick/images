{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/vmware-tanzu/velero

buildGoModule rec {
  pname = "velero";
  version = "1.17.1";

  src = fetchFromGitHub {
    owner = "vmware-tanzu";
    repo = "velero";
    rev = "v${version}";
    hash = "sha256-ZVnYHBcnYOCBFJ9wyvMDrRIf3NyDV1Zqqf7e6JbA+go=";
  };

  vendorHash = "sha256-AuvJmHRAmxKduP6q7k81GapGbGLS4x7cwccSnZWvPwI=";

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
