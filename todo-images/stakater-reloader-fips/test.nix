{ pkgs, lib, ... }:

# TODO: Add tests for stakater-reloader-fips image
{
  name = "stakater-reloader-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for stakater-reloader-fips"
    exit 1
  '';
}
