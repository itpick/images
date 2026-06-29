{ mkImage, pkgs, lib, ... }:

# dotnet-9-sdk
# Container image packaging nixpkgs.dotnet-sdk_9
mkImage {
  drv = pkgs.dotnet-sdk_9;
  name = "dotnet-9-sdk";
  tag = "v${pkgs.dotnet-sdk_9.version}";
  entrypoint = [ "${pkgs.dotnet-sdk_9}/bin/dotnet" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "dotnet-9-sdk";
    "org.opencontainers.image.description" = "dotnet-9-sdk container image (nixpkgs.dotnet-sdk_9)";
    "org.opencontainers.image.version" = pkgs.dotnet-sdk_9.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
