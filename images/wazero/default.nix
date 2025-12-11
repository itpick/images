{ mkImage, pkgs, lib, ... }:

# wazero - Zero dependency WebAssembly runtime for Go
# https://wazero.io/

mkImage {
  drv = pkgs.wazero;
  name = "wazero";
  tag = "v${pkgs.wazero.version}";
  entrypoint = [ "${pkgs.wazero}/bin/wazero" ];
  cmd = [ "version" ];

  labels = {
    "org.opencontainers.image.title" = "wazero";
    "org.opencontainers.image.description" = "Zero dependency WebAssembly runtime for Go developers";
    "org.opencontainers.image.version" = pkgs.wazero.version;
  };
}
