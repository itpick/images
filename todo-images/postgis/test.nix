{ pkgs, lib, ... }:

# TODO: Add tests for postgis image
{
  name = "postgis";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for postgis"
    exit 1
  '';
}
