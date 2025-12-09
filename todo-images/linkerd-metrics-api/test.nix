{ pkgs, lib, ... }:

# TODO: Add tests for linkerd-metrics-api image
{
  name = "linkerd-metrics-api";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for linkerd-metrics-api"
    exit 1
  '';
}
