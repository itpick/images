{ pkgs, lib, ... }:

# TODO: Add tests for cedar image
{
  name = "cedar";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cedar"
    exit 1
  '';
}
