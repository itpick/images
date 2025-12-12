{ mkImage, pkgs, lib, ... }:

# wget - File retrieval tool
# https://www.gnu.org/software/wget/

mkImage {
  drv = pkgs.wget;
  name = "wget";
  tag = "v${pkgs.wget.version}";
  entrypoint = [ "${pkgs.wget}/bin/wget" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "wget";
    "org.opencontainers.image.description" = "Tool for retrieving files using HTTP, HTTPS, and FTP";
    "org.opencontainers.image.version" = pkgs.wget.version;
  };
}
