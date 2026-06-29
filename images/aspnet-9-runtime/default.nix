{ mkImage, pkgs, lib, ... }:

# aspnet-9-runtime
# Container image packaging nixpkgs.dotnet-aspnetcore_9
mkImage {
  drv = pkgs.dotnet-aspnetcore_9;
  name = "aspnet-9-runtime";
  tag = "v${pkgs.dotnet-aspnetcore_9.version}";
  entrypoint = [ "${pkgs.dotnet-aspnetcore_9}/bin/dotnet" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "aspnet-9-runtime";
    "org.opencontainers.image.description" = "aspnet-9-runtime container image (nixpkgs.dotnet-aspnetcore_9)";
    "org.opencontainers.image.version" = pkgs.dotnet-aspnetcore_9.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
