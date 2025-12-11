{ pkgs, lib, ... }:

# TODO: Add tests for terraform image
{
  name = "terraform";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for terraform"
    exit 1
  '';
}
