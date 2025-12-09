{ pkgs, lib, ... }:

# TODO: Add tests for objectstorage-controller-fips image
{
  name = "objectstorage-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for objectstorage-controller-fips"
    exit 1
  '';
}
