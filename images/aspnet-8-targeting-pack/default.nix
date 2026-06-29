{ mkImage, pkgs, lib, ... }:

# aspnet-8-targeting-pack
# Container image packaging nixpkgs.dotnet-aspnetcore_8
mkImage {
  drv = pkgs.dotnet-aspnetcore_8;
  name = "aspnet-8-targeting-pack";
  tag = "v${pkgs.dotnet-aspnetcore_8.version}";
  entrypoint = [ "${pkgs.dotnet-aspnetcore_8}/bin/dotnet" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "aspnet-8-targeting-pack";
    "org.opencontainers.image.description" = "aspnet-8-targeting-pack container image (nixpkgs.dotnet-aspnetcore_8)";
    "org.opencontainers.image.version" = pkgs.dotnet-aspnetcore_8.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
