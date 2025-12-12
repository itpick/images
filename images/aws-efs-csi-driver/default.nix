{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.aws-efs-csi-driver;
  name = "aws-efs-csi-driver";
  tag = "v${pkgs.aws-efs-csi-driver.version}";
  entrypoint = [ "${pkgs.aws-efs-csi-driver}/bin/aws-efs-csi-driver" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert nfs-utils ];

  labels = {
    "org.opencontainers.image.title" = "AWS EFS CSI Driver";
    "org.opencontainers.image.description" = "CSI driver for Amazon EFS";
    "org.opencontainers.image.version" = pkgs.aws-efs-csi-driver.version;
    "io.nix-containers.chart" = "aws-efs-csi-driver";
  };
}
