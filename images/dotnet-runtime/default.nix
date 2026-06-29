{ mkImage, pkgs, lib, ... }:

# dotnet-runtime
# Container image packaging nixpkgs.dotnet-runtime
mkImage {
  drv = pkgs.dotnet-runtime;
  name = "dotnet-runtime";
  tag = "v${pkgs.dotnet-runtime.version}";
  entrypoint = [ (lib.getExe pkgs.dotnet-runtime) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "dotnet-runtime";
    "org.opencontainers.image.description" = "dotnet-runtime container image (nixpkgs.dotnet-runtime)";
    "org.opencontainers.image.version" = pkgs.dotnet-runtime.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
