{ pkgs, lib, ... }:

# TODO: Add tests for regclient-regbot image
{
  name = "regclient-regbot";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for regclient-regbot"
    exit 1
  '';
}
