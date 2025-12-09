{ pkgs, lib, ... }:

# TODO: Add tests for frr image
{
  name = "frr";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for frr"
    exit 1
  '';
}
