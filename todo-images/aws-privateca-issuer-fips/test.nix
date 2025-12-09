{ pkgs, lib, ... }:

# TODO: Add tests for aws-privateca-issuer-fips image
{
  name = "aws-privateca-issuer-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-privateca-issuer-fips"
    exit 1
  '';
}
