{ pkgs, lib, ... }:

# TODO: Add tests for objectstorage-sidecar-fips image
{
  name = "objectstorage-sidecar-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for objectstorage-sidecar-fips"
    exit 1
  '';
}
