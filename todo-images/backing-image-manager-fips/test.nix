{ pkgs, lib, ... }:

# TODO: Add tests for backing-image-manager-fips image
{
  name = "backing-image-manager-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for backing-image-manager-fips"
    exit 1
  '';
}
