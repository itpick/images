{ pkgs, lib, ... }:

# TODO: Add tests for kibana-iamguarded image
{
  name = "kibana-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kibana-iamguarded"
    exit 1
  '';
}
