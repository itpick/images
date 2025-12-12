{ mkImage, pkgs, lib, ... }:

# grpcurl - Command-line gRPC client
# https://github.com/fullstorydev/grpcurl

mkImage {
  drv = pkgs.grpcurl;
  name = "grpcurl";
  tag = "v${pkgs.grpcurl.version}";
  entrypoint = [ "${pkgs.grpcurl}/bin/grpcurl" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "grpcurl";
    "org.opencontainers.image.description" = "Command-line tool for interacting with gRPC servers";
    "org.opencontainers.image.version" = pkgs.grpcurl.version;
  };
}
