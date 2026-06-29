{ mkImage, pkgs, lib, ... }:

# dotnet-runtime-fips
# Container image packaging nixpkgs.dotnet-runtime
mkImage {
  drv = pkgs.dotnet-runtime;
  name = "dotnet-runtime-fips";
  tag = "v${pkgs.dotnet-runtime.version}";
  entrypoint = [ (lib.getExe pkgs.dotnet-runtime) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "dotnet-runtime-fips";
    "org.opencontainers.image.description" = "dotnet-runtime-fips container image (nixpkgs.dotnet-runtime)";
    "org.opencontainers.image.version" = pkgs.dotnet-runtime.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
