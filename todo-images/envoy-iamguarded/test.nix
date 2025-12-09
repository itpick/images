{ pkgs, lib, ... }:

# TODO: Add tests for envoy-iamguarded image
{
  name = "envoy-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for envoy-iamguarded"
    exit 1
  '';
}
