{ pkgs, lib, ... }:

# TODO: Add tests for dfc image
{
  name = "dfc";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dfc"
    exit 1
  '';
}
