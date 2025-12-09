{ pkgs, lib, ... }:

# TODO: Add tests for image-factory-fips image
{
  name = "image-factory-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for image-factory-fips"
    exit 1
  '';
}
