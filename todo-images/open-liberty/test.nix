{ pkgs, lib, ... }:

# TODO: Add tests for open-liberty image
{
  name = "open-liberty";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for open-liberty"
    exit 1
  '';
}
