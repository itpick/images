{ pkgs, lib, ... }:

# TODO: Add tests for monstache image
{
  name = "monstache";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for monstache"
    exit 1
  '';
}
