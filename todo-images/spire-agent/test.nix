{ pkgs, lib, ... }:

# TODO: Add tests for spire-agent image
{
  name = "spire-agent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spire-agent"
    exit 1
  '';
}
