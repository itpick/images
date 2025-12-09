{ pkgs, lib, ... }:

# TODO: Add tests for valkey-iamguarded image
{
  name = "valkey-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for valkey-iamguarded"
    exit 1
  '';
}
