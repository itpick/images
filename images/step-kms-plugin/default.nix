{ mkImage, pkgs, lib, ... }:

# step-kms-plugin - KMS plugin for step-ca
# https://github.com/smallstep/step-kms-plugin

mkImage {
  drv = pkgs.step-kms-plugin;
  name = "step-kms-plugin";
  tag = "v${pkgs.step-kms-plugin.version}";
  entrypoint = [ "${pkgs.step-kms-plugin}/bin/step-kms-plugin" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "step-kms-plugin";
    "org.opencontainers.image.description" = "KMS plugin for step-ca";
    "org.opencontainers.image.version" = pkgs.step-kms-plugin.version;
  };
}
