{ mkImage, pkgs, lib, ... }:

# Atuin - Shell history replacement
# https://atuin.sh/

mkImage {
  drv = pkgs.atuin;
  name = "atuin";
  tag = "v${pkgs.atuin.version}";
  entrypoint = [ "${pkgs.atuin}/bin/atuin" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Atuin";
    "org.opencontainers.image.description" = "Shell history replacement with sync";
    "org.opencontainers.image.version" = pkgs.atuin.version;
  };
}
