{ pkgs, lib, ... }:

# TODO: Add tests for skopeo-fips image
{
  name = "skopeo-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for skopeo-fips"
    exit 1
  '';
}
