{ mkImage, pkgs, lib, ... }:

# HTTPie - Human-friendly HTTP client
# https://httpie.io/

mkImage {
  drv = pkgs.httpie;
  name = "httpie";
  tag = "v${pkgs.httpie.version}";
  entrypoint = [ "${pkgs.httpie}/bin/http" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "HTTPie";
    "org.opencontainers.image.description" = "Human-friendly command line HTTP client";
    "org.opencontainers.image.version" = pkgs.httpie.version;
  };
}
