{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.aws-ebs-csi-driver;
  name = "aws-ebs-csi-driver";
  tag = "v${pkgs.aws-ebs-csi-driver.version}";
  entrypoint = [ "${pkgs.aws-ebs-csi-driver}/bin/aws-ebs-csi-driver" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert util-linux e2fsprogs xfsprogs ];

  labels = {
    "org.opencontainers.image.title" = "AWS EBS CSI Driver";
    "org.opencontainers.image.description" = "CSI driver for Amazon EBS";
    "org.opencontainers.image.version" = pkgs.aws-ebs-csi-driver.version;
    "io.nix-containers.chart" = "aws-ebs-csi-driver";
  };
}
