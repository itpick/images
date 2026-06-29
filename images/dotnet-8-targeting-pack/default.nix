{ mkImage, pkgs, lib, ... }:

# dotnet-8-targeting-pack
# Container image packaging nixpkgs.dotnet-sdk_8
mkImage {
  drv = pkgs.dotnet-sdk_8;
  name = "dotnet-8-targeting-pack";
  tag = "v${pkgs.dotnet-sdk_8.version}";
  entrypoint = [ "${pkgs.dotnet-sdk_8}/bin/dotnet" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "dotnet-8-targeting-pack";
    "org.opencontainers.image.description" = "dotnet-8-targeting-pack container image (nixpkgs.dotnet-sdk_8)";
    "org.opencontainers.image.version" = pkgs.dotnet-sdk_8.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
