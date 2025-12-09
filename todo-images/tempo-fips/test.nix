{ pkgs, lib, ... }:

# TODO: Add tests for tempo-fips image
{
  name = "tempo-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tempo-fips"
    exit 1
  '';
}
