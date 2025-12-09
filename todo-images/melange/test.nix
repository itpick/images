{ pkgs, lib, ... }:

# TODO: Add tests for melange image
{
  name = "melange";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for melange"
    exit 1
  '';
}
