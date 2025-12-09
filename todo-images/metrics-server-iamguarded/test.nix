{ pkgs, lib, ... }:

# TODO: Add tests for metrics-server-iamguarded image
{
  name = "metrics-server-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for metrics-server-iamguarded"
    exit 1
  '';
}
