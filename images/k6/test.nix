{ pkgs, lib, ... }:

# TODO: Add tests for k6 image
{
  name = "k6";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k6"
    exit 1
  '';
}
