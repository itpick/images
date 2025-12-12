{ mkImage, pkgs, lib, ... }:

# OpenSSH - SSH protocol implementation
# https://www.openssh.com/

mkImage {
  drv = pkgs.openssh;
  name = "openssh";
  tag = "v${pkgs.openssh.version}";
  entrypoint = [ "${pkgs.openssh}/bin/ssh" ];
  cmd = [ "-V" ];

  labels = {
    "org.opencontainers.image.title" = "OpenSSH";
    "org.opencontainers.image.description" = "SSH protocol implementation";
    "org.opencontainers.image.version" = pkgs.openssh.version;
  };
}
