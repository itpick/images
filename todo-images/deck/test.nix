{ pkgs, lib, ... }:

# TODO: Add tests for deck image
{
  name = "deck";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for deck"
    exit 1
  '';
}
