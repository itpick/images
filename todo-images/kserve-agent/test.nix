{ pkgs, lib, ... }:

# TODO: Add tests for kserve-agent image
{
  name = "kserve-agent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kserve-agent"
    exit 1
  '';
}
