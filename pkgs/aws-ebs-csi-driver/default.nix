{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-sigs/aws-ebs-csi-driver

buildGoModule rec {
  pname = "aws-ebs-csi-driver";
  version = "1.62.0";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = "aws-ebs-csi-driver";
    rev = "v${version}";
    hash = "sha256-icBhilkR55c6J7mn4NYpO2C8Pq2j4LXRmgt+dCJ89yg=";
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
