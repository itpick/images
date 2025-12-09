{ pkgs, lib, ... }:

# TODO: Add tests for dnsdist image
{
  name = "dnsdist";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dnsdist"
    exit 1
  '';
}
