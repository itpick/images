{ pkgs, lib, ... }:

# TODO: Add tests for prism image
{
  name = "prism";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prism"
    exit 1
  '';
}
