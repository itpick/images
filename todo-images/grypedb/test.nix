{ pkgs, lib, ... }:

# TODO: Add tests for grypedb image
{
  name = "grypedb";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grypedb"
    exit 1
  '';
}
