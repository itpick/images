{ pkgs, lib, ... }:

# TODO: Add tests for envoy-gateway image
{
  name = "envoy-gateway";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for envoy-gateway"
    exit 1
  '';
}
