{ mkImage, pkgs, lib, ... }:

# OpenFGA - High performance authorization/permission engine
# https://openfga.dev/

mkImage {
  drv = pkgs.openfga;
  name = "openfga";
  tag = "v${pkgs.openfga.version}";
  entrypoint = [ "${pkgs.openfga}/bin/openfga" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [
    grpc-health-probe
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "OpenFGA";
    "org.opencontainers.image.description" = "High performance and flexible authorization/permission engine inspired by Google Zanzibar";
    "org.opencontainers.image.version" = pkgs.openfga.version;
  };
}
