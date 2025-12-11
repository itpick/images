{ pkgs, lib, ... }:

# TODO: Add tests for gatus image
{
  name = "gatus";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gatus"
    exit 1
  '';
}
