{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-sigs/aws-efs-csi-driver

buildGoModule rec {
  pname = "aws-efs-csi-driver";
  version = "3.3.0";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = "aws-efs-csi-driver";
    rev = "v${version}";
    hash = "sha256-tcq8l/WDjo0PGjyN2JcDCMOoVEKx2hW7lMqmaVpB8i0=";
  };

  vendorHash = null;

  subPackages = [ "cmd" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/kubernetes-sigs/aws-efs-csi-driver/pkg/driver.driverVersion=${version}"
  ];

  postInstall = ''
    mv $out/bin/cmd $out/bin/aws-efs-csi-driver
  '';

  doCheck = false;

  meta = with lib; {
    description = "CSI driver for Amazon EFS";
    homepage = "https://github.com/kubernetes-sigs/aws-efs-csi-driver";
    license = licenses.asl20;
  };
}
