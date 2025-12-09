{ pkgs, lib, ... }:

# TODO: Add tests for pvc-autoresizer-fips image
{
  name = "pvc-autoresizer-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pvc-autoresizer-fips"
    exit 1
  '';
}
