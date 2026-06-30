{ mkImage, pkgs, lib, ... }:

# configurable-http-proxy
# Container image packaging nixpkgs.configurable-http-proxy
mkImage {
  drv = pkgs.configurable-http-proxy;
  name = "configurable-http-proxy";
  tag = "v${pkgs.configurable-http-proxy.version}";
  entrypoint = [ (lib.getExe pkgs.configurable-http-proxy) ];
  # Was `--help` (a one-shot). Run the proxy: it serves the public proxy on
  # :8000 and the management REST API on :8001. Bind both to all interfaces
  # (the defaults are localhost) so the kind-test probe can reach them. CHP
  # starts with no routes and is driven entirely via its API, so no config or
  # writable dir is needed; operators add routes (e.g. via JupyterHub).
  cmd = [
    "--ip" "0.0.0.0"
    "--port" "8000"
    "--api-ip" "0.0.0.0"
    "--api-port" "8001"
  ];

  labels = {
    "org.opencontainers.image.title" = "configurable-http-proxy";
    "org.opencontainers.image.description" = "configurable-http-proxy container image (nixpkgs.configurable-http-proxy)";
    "org.opencontainers.image.version" = pkgs.configurable-http-proxy.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
