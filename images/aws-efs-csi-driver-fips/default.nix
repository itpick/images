{ mkImage, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

# AWS EFS CSI Driver (FIPS) - CSI driver for Amazon EFS with FIPS-compliant cryptography
# https://github.com/kubernetes-sigs/aws-efs-csi-driver
# FIPS-compliant build for FedRAMP compliance

let
  version = "2.1.15";

  aws-efs-csi-driver-fips = buildGoModule rec {
    pname = "aws-efs-csi-driver-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "aws-efs-csi-driver";
      rev = "v${version}";
      sha256 = "0000000000000000000000000000000000000000000000000000";  # PLACEHOLDER: Run nix-prefetch-url to get actual hash
    };

    vendorHash = null;  # Uses vendor directory in the repository

    subPackages = [ "." ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X github.com/kubernetes-sigs/aws-efs-csi-driver/pkg/driver.driverVersion=${version}"
    ];

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "AWS EFS CSI Driver (FIPS) - Container Storage Interface driver for Amazon EFS with FIPS-validated cryptography";
      homepage = "https://github.com/kubernetes-sigs/aws-efs-csi-driver";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  };

in
mkImage {
  drv = aws-efs-csi-driver-fips;
  name = "aws-efs-csi-driver-fips";
  tag = "v${version}";
  entrypoint = [ "${aws-efs-csi-driver-fips}/bin/aws-efs-csi-driver" ];
  cmd = [];

  extraPkgs = with pkgs; [
    cacert
    nfs-utils
  ];

  labels = {
    "org.opencontainers.image.title" = "AWS EFS CSI Driver (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant CSI driver for Amazon EFS";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "aws-efs-csi-driver";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
