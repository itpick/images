{ pkgs, lib, ... }:

# TODO: Add tests for openfga image
{
  name = "openfga";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for openfga"
    exit 1
  '';
}
