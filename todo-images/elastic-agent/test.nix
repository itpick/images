{ pkgs, lib, ... }:

# TODO: Add tests for elastic-agent image
{
  name = "elastic-agent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for elastic-agent"
    exit 1
  '';
}
