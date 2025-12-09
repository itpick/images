{ pkgs, lib, ... }:

# TODO: Add tests for step-ca-fips image
{
  name = "step-ca-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for step-ca-fips"
    exit 1
  '';
}
