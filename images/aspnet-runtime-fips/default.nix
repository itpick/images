{ mkImage, pkgs, lib, ... }:

# aspnet-runtime-fips
# Container image packaging nixpkgs.dotnet-aspnetcore
mkImage {
  drv = pkgs.dotnet-aspnetcore;
  name = "aspnet-runtime-fips";
  tag = "v${pkgs.dotnet-aspnetcore.version}";
  entrypoint = [ "${pkgs.dotnet-aspnetcore}/bin/dotnet" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "aspnet-runtime-fips";
    "org.opencontainers.image.description" = "aspnet-runtime-fips container image (nixpkgs.dotnet-aspnetcore)";
    "org.opencontainers.image.version" = pkgs.dotnet-aspnetcore.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
