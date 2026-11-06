{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-sigs/aws-ebs-csi-driver

buildGoModule rec {
  pname = "aws-ebs-csi-driver";
  version = "1.67.2";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = "aws-ebs-csi-driver";
    rev = "v${version}";
    hash = "sha256-lTVdiskU3n8797RtUR+n0jZitIJzauAjH49mGlBU/kA=";
  };

  proxyVendor = true;
  vendorHash = "sha256-b1lFUUTnEWmW9WyrYlNyTtsJXx0pZVp82wQRW0xOsnE=";

  subPackages = [ "cmd" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/kubernetes-sigs/aws-ebs-csi-driver/pkg/driver.driverVersion=${version}"
  ];

  postInstall = ''
    mv $out/bin/cmd $out/bin/aws-ebs-csi-driver
  '';

  doCheck = false;

  meta = with lib; {
    description = "CSI driver for Amazon EBS volumes";
    homepage = "https://github.com/kubernetes-sigs/aws-ebs-csi-driver";
    license = licenses.asl20;
  };
}
