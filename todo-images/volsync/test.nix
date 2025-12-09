{ pkgs, lib, ... }:

# TODO: Add tests for volsync image
{
  name = "volsync";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for volsync"
    exit 1
  '';
}
