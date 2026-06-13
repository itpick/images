{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/vmware-tanzu/velero-plugin-for-gcp

buildGoModule rec {
  pname = "velero-plugin-for-gcp";
  version = "1.14.1";

  src = fetchFromGitHub {
    owner = "vmware-tanzu";
    repo = "velero-plugin-for-gcp";
    rev = "v${version}";
    hash = "sha256-v7CDS3fzPu6yvP4FrAo33zi9/dgPMEm2NZao7vokE0E=";
  };

  vendorHash = "sha256-lsTRT2V/n3ViSQ6C9wkvsVZuRrXRpds0lGyJeIEgCBM=";

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
