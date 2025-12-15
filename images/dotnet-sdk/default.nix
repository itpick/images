{ mkImage, pkgs, lib, ... }:

# .NET SDK - Development platform for building applications
# https://dotnet.microsoft.com/

mkImage {
  drv = pkgs.dotnet-sdk;
  name = "dotnet-sdk";
  tag = "v${pkgs.dotnet-sdk.version}";
  entrypoint = [ "${pkgs.dotnet-sdk}/bin/dotnet" ];
  cmd = [ "--info" ];
  buildType = "binary";

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = ".NET SDK";
    "org.opencontainers.image.description" = ".NET development platform";
    "org.opencontainers.image.version" = pkgs.dotnet-sdk.version;
  };
}
