{ pkgs, lib, ... }:

# TODO: Add tests for paranoia image
{
  name = "paranoia";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for paranoia"
    exit 1
  '';
}
