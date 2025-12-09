{ pkgs, lib, ... }:

# TODO: Add tests for electric image
{
  name = "electric";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for electric"
    exit 1
  '';
}
