{ mkImage, pkgs, lib, ... }:

# dotnet-9-runtime
# Container image packaging nixpkgs.dotnet-runtime_9
mkImage {
  drv = pkgs.dotnet-runtime_9;
  name = "dotnet-9-runtime";
  tag = "v${pkgs.dotnet-runtime_9.version}";
  entrypoint = [ "${pkgs.dotnet-runtime_9}/bin/dotnet" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "dotnet-9-runtime";
    "org.opencontainers.image.description" = "dotnet-9-runtime container image (nixpkgs.dotnet-runtime_9)";
    "org.opencontainers.image.version" = pkgs.dotnet-runtime_9.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
