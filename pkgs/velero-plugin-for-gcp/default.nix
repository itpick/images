{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/vmware-tanzu/velero-plugin-for-gcp

buildGoModule rec {
  pname = "velero-plugin-for-gcp";
  version = "1.14.2";

  src = fetchFromGitHub {
    owner = "vmware-tanzu";
    repo = "velero-plugin-for-gcp";
    rev = "v${version}";
    hash = "sha256-sYYXDe6A8T/8VTPM2L0aL3nSraxm2SyMu/6wiilPF8E=";
  };

  vendorHash = "sha256-hM7ddZaFQBOFKM1gqpNoHxx4hoJNmGtf5EdcFXOe7L8=";

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Plugins to support Velero on Google Cloud Platform (GCP)";
    homepage = "https://github.com/vmware-tanzu/velero-plugin-for-gcp";
    license = licenses.asl20;
  };
}
