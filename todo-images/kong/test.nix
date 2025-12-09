{ pkgs, lib, ... }:

# TODO: Add tests for kong image
{
  name = "kong";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kong"
    exit 1
  '';
}
