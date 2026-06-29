{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for thanos:
# Packages available in nixpkgs:
#   pkgs.thanos  # thanos (0.40.1-r1)

mkImage {
  drv = pkgs.thanos;
  name = "thanos";
  tag = "v${pkgs.thanos.version}";
  entrypoint = [ "${pkgs.thanos}/bin/thanos" ];
  # Was `--help` (a one-shot). Run the Querier — the one thanos component that
  # needs no object-store config or local storage. It starts with zero upstream
  # Store endpoints (an empty querier that simply returns no data) and serves
  # its HTTP UI/API + gRPC immediately, so it stays up under the kind-test
  # probe. The HTTP/gRPC flags already default to 0.0.0.0 (set them explicitly
  # to document the ports). Operators pick a component (query/store/sidecar/...)
  # and add --endpoint / object-store config.
  cmd = [
    "query"
    "--http-address=0.0.0.0:10902"
    "--grpc-address=0.0.0.0:10901"
  ];

  labels = {
    "org.opencontainers.image.title" = "Thanos";
    "org.opencontainers.image.description" = "Highly available Prometheus setup with long-term storage";
    "org.opencontainers.image.version" = pkgs.thanos.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
