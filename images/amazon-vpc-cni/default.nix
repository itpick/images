{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.amazon-vpc-cni;
  name = "amazon-vpc-cni";
  tag = "v${pkgs.amazon-vpc-cni.version}";
  entrypoint = [ "${pkgs.amazon-vpc-cni}/bin/aws-cni" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert iptables iproute2 ];

  labels = {
    "org.opencontainers.image.title" = "Amazon VPC CNI";
    "org.opencontainers.image.description" = "Networking plugin for pod networking in Kubernetes using AWS ENIs";
    "org.opencontainers.image.version" = pkgs.amazon-vpc-cni.version;
  };
}
