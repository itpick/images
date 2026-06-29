{ mkImage, pkgs, lib, ... }:

# dotnet-8-runtime
# Container image packaging nixpkgs.dotnet-runtime_8
mkImage {
  drv = pkgs.dotnet-runtime_8;
  name = "dotnet-8-runtime";
  tag = "v${pkgs.dotnet-runtime_8.version}";
  entrypoint = [ "${pkgs.dotnet-runtime_8}/bin/dotnet" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "dotnet-8-runtime";
    "org.opencontainers.image.description" = "dotnet-8-runtime container image (nixpkgs.dotnet-runtime_8)";
    "org.opencontainers.image.version" = pkgs.dotnet-runtime_8.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
