{ pkgs, lib, ... }:

# TODO: Add tests for step-issuer-fips image
{
  name = "step-issuer-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for step-issuer-fips"
    exit 1
  '';
}
