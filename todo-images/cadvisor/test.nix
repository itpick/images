{ pkgs, lib, ... }:

# TODO: Add tests for cadvisor image
{
  name = "cadvisor";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cadvisor"
    exit 1
  '';
}
