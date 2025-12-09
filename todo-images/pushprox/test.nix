{ pkgs, lib, ... }:

# TODO: Add tests for pushprox image
{
  name = "pushprox";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pushprox"
    exit 1
  '';
}
