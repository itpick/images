{ pkgs, lib, ... }:

# TODO: Add tests for os-shell-iamguarded image
{
  name = "os-shell-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for os-shell-iamguarded"
    exit 1
  '';
}
