{ pkgs, lib, ... }:

# TODO: Add tests for atlantis image
{
  name = "atlantis";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for atlantis"
    exit 1
  '';
}
