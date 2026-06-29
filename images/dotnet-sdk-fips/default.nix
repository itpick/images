{ mkImage, pkgs, lib, ... }:

# dotnet-sdk-fips
# Container image packaging nixpkgs.dotnet-sdk
mkImage {
  drv = pkgs.dotnet-sdk;
  name = "dotnet-sdk-fips";
  tag = "v${pkgs.dotnet-sdk.version}";
  entrypoint = [ (lib.getExe pkgs.dotnet-sdk) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "dotnet-sdk-fips";
    "org.opencontainers.image.description" = "dotnet-sdk-fips container image (nixpkgs.dotnet-sdk)";
    "org.opencontainers.image.version" = pkgs.dotnet-sdk.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
