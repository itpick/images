{ pkgs, lib, ... }:

# TODO: Add tests for emissary image
{
  name = "emissary";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for emissary"
    exit 1
  '';
}
