{ mkImage, pkgs, lib, ... }:

# WireMock - API mock server
# https://wiremock.org/

mkImage {
  drv = pkgs.wiremock;
  name = "wiremock";
  tag = "v${pkgs.wiremock.version}";
  entrypoint = [ "${pkgs.wiremock}/bin/wiremock" ];
  cmd = [];

  extraPkgs = with pkgs; [ openjdk21_headless ];

  labels = {
    "org.opencontainers.image.title" = "WireMock";
    "org.opencontainers.image.description" = "Flexible API mocking for testing and development";
    "org.opencontainers.image.version" = pkgs.wiremock.version;
  };
}
