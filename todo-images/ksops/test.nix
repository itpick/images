{ pkgs, lib, ... }:

# TODO: Add tests for ksops image
{
  name = "ksops";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ksops"
    exit 1
  '';
}
