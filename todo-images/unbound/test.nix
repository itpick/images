{ pkgs, lib, ... }:

# TODO: Add tests for unbound image
{
  name = "unbound";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for unbound"
    exit 1
  '';
}
