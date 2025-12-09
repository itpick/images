{ pkgs, lib, ... }:

# TODO: Add tests for vt image
{
  name = "vt";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vt"
    exit 1
  '';
}
