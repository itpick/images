{ mkImage, pkgs, lib, ... }:

# nano - Simple text editor
# https://www.nano-editor.org/

mkImage {
  drv = pkgs.nano;
  name = "nano";
  tag = "v${pkgs.nano.version}";
  entrypoint = [ "${pkgs.nano}/bin/nano" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nano";
    "org.opencontainers.image.description" = "Small, user-friendly console text editor";
    "org.opencontainers.image.version" = pkgs.nano.version;
  };
}
