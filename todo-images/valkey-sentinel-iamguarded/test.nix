{ pkgs, lib, ... }:

# TODO: Add tests for valkey-sentinel-iamguarded image
{
  name = "valkey-sentinel-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for valkey-sentinel-iamguarded"
    exit 1
  '';
}
