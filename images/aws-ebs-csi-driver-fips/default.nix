{ mkImage, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

# AWS EBS CSI Driver (FIPS) - CSI driver for Amazon EBS with FIPS-compliant cryptography
# https://github.com/kubernetes-sigs/aws-ebs-csi-driver
# FIPS-compliant build for FedRAMP compliance

let
  version = "1.53.0";

  aws-ebs-csi-driver-fips = buildGoModule rec {
    pname = "aws-ebs-csi-driver-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "aws-ebs-csi-driver";
      rev = "v${version}";
      hash = "sha256-5BSbtGM9MnN8ifr8Q3yKMk1uO0lzdXBX4lMCCD3oWCA=";
    };

    vendorHash = null;  # Uses vendor directory

    subPackages = [ "cmd/main" ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X github.com/kubernetes-sigs/aws-ebs-csi-driver/pkg/driver.driverVersion=${version}"
    ];

    postInstall = ''
      mv $out/bin/main $out/bin/aws-ebs-csi-driver
    '';

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "AWS EBS CSI driver (FIPS) - CSI driver for Amazon EBS with FIPS-validated cryptography";
      homepage = "https://github.com/kubernetes-sigs/aws-ebs-csi-driver";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  };

in
mkImage {
  drv = aws-ebs-csi-driver-fips;
  name = "aws-ebs-csi-driver-fips";
  tag = "v${version}";
  entrypoint = [ "${aws-ebs-csi-driver-fips}/bin/aws-ebs-csi-driver" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert util-linux e2fsprogs xfsprogs ];

  labels = {
    "org.opencontainers.image.title" = "AWS EBS CSI Driver (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant CSI driver for Amazon EBS";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "aws-ebs-csi-driver";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
