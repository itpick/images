{ pkgs, lib, ... }:

# TODO: Add tests for envoy image
{
  name = "envoy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for envoy"
    exit 1
  '';
}
