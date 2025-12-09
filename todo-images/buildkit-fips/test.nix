{ pkgs, lib, ... }:

# TODO: Add tests for buildkit-fips image
{
  name = "buildkit-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for buildkit-fips"
    exit 1
  '';
}
