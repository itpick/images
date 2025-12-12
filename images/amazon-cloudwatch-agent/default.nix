{ mkImage, pkgs, lib, ... }:

# Amazon CloudWatch Agent - AWS metrics and logs collector
# https://github.com/aws/amazon-cloudwatch-agent

mkImage {
  drv = pkgs.amazon-cloudwatch-agent;
  name = "amazon-cloudwatch-agent";
  tag = "v${pkgs.amazon-cloudwatch-agent.version}";
  entrypoint = [ "${pkgs.amazon-cloudwatch-agent}/bin/amazon-cloudwatch-agent" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Amazon CloudWatch Agent";
    "org.opencontainers.image.description" = "Agent for collecting metrics and logs for AWS CloudWatch";
    "org.opencontainers.image.version" = pkgs.amazon-cloudwatch-agent.version;
  };
}
