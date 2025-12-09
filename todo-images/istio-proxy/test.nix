{ pkgs, lib, ... }:

# TODO: Add tests for istio-proxy image
{
  name = "istio-proxy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for istio-proxy"
    exit 1
  '';
}
