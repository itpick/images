{ pkgs, lib, ... }:

# TODO: Add tests for aws-sigv4-proxy-fips image
{
  name = "aws-sigv4-proxy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-sigv4-proxy-fips"
    exit 1
  '';
}
