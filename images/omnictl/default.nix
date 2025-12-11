{ mkImage, pkgs, lib, ... }:

# omnictl - CLI for Sidero Omni Kubernetes management platform
# https://omni.siderolabs.com/

mkImage {
  drv = pkgs.omnictl;
  name = "omnictl";
  tag = "v${pkgs.omnictl.version}";
  entrypoint = [ "${pkgs.omnictl}/bin/omnictl" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "omnictl";
    "org.opencontainers.image.description" = "CLI for the Sidero Omni Kubernetes management platform";
    "org.opencontainers.image.version" = pkgs.omnictl.version;
  };
}
