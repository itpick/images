{ pkgs, lib, ... }:

# TODO: Add tests for zot image
{
  name = "zot";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for zot"
    exit 1
  '';
}
