{ pkgs, lib, ... }:

# TODO: Add tests for selenium-hub image
{
  name = "selenium-hub";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for selenium-hub"
    exit 1
  '';
}
