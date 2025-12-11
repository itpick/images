{ mkImage, pkgs, lib, ... }:

# Pulumi - Infrastructure as Code
# https://www.pulumi.com/

mkImage {
  drv = pkgs.pulumi;
  name = "pulumi";
  tag = "v${pkgs.pulumi.version}";
  entrypoint = [ "${pkgs.pulumi}/bin/pulumi" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "Pulumi";
    "org.opencontainers.image.description" = "Modern infrastructure as code";
    "org.opencontainers.image.version" = pkgs.pulumi.version;
  };
}
