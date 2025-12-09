{ pkgs, lib, ... }:

# TODO: Add tests for unbound-mailcow image
{
  name = "unbound-mailcow";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for unbound-mailcow"
    exit 1
  '';
}
