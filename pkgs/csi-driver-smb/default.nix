{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-csi/csi-driver-smb

buildGoModule rec {
  pname = "csi-driver-smb";
  version = "1.19.1";

  src = fetchFromGitHub {
    owner = "kubernetes-csi";
    repo = "csi-driver-smb";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [ "cmd/smbplugin" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/kubernetes-csi/csi-driver-smb/pkg/smb.driverVersion=${version}"
  ];

  postInstall = ''
    mv $out/bin/smbplugin $out/bin/smbcsi
  '';

  doCheck = false;

  meta = with lib; {
    description = "CSI driver for Kubernetes SMB support";
    homepage = "https://github.com/kubernetes-csi/csi-driver-smb";
    license = licenses.asl20;
  };
}
