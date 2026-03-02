{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/vmware-tanzu/velero-plugin-for-gcp

buildGoModule rec {
  pname = "velero-plugin-for-gcp";
  version = "1.13.1";

  src = fetchFromGitHub {
    owner = "vmware-tanzu";
    repo = "velero-plugin-for-gcp";
    rev = "v${version}";
    hash = "sha256-qG4Ux85Uc6eWENPeOUokL+k+kh4lHt56sMtZ3c45fZc=";
  };

  vendorHash = "sha256-MqRW5KFHrCMzVZwWEr1aL0R8Tc93K/ROO31WNaw643o=";

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
