{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.aws-load-balancer-controller;
  name = "aws-load-balancer-controller";
  tag = "v${pkgs.aws-load-balancer-controller.version}";
  entrypoint = [ "${pkgs.aws-load-balancer-controller}/bin/aws-load-balancer-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "AWS Load Balancer Controller";
    "org.opencontainers.image.description" = "Kubernetes controller for Elastic Load Balancers";
    "org.opencontainers.image.version" = pkgs.aws-load-balancer-controller.version;
    "io.nix-containers.chart" = "aws-load-balancer-controller";
  };
}
