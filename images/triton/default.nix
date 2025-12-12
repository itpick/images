{ mkImage, pkgs, lib, ... }:

# Triton - TritonDataCenter CLI
# https://www.tritondatacenter.com/

mkImage {
  drv = pkgs.triton;
  name = "triton";
  tag = "v${pkgs.triton.version}";
  entrypoint = [ "${pkgs.triton}/bin/triton" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Triton";
    "org.opencontainers.image.description" = "TritonDataCenter Client CLI";
    "org.opencontainers.image.version" = pkgs.triton.version;
  };
}
