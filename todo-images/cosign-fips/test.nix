{ pkgs, lib, ... }:

# TODO: Add tests for cosign-fips image
{
  name = "cosign-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cosign-fips"
    exit 1
  '';
}
