{ pkgs, lib, ... }:

# TODO: Add tests for opencv image
{
  name = "opencv";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opencv"
    exit 1
  '';
}
