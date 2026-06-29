{ mkImage, pkgs, lib, ... }:

# aspnet-9-targeting-pack
# Container image packaging nixpkgs.dotnet-aspnetcore_9
mkImage {
  drv = pkgs.dotnet-aspnetcore_9;
  name = "aspnet-9-targeting-pack";
  tag = "v${pkgs.dotnet-aspnetcore_9.version}";
  entrypoint = [ "${pkgs.dotnet-aspnetcore_9}/bin/dotnet" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "aspnet-9-targeting-pack";
    "org.opencontainers.image.description" = "aspnet-9-targeting-pack container image (nixpkgs.dotnet-aspnetcore_9)";
    "org.opencontainers.image.version" = pkgs.dotnet-aspnetcore_9.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
