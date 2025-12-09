{ pkgs, lib, ... }:

# TODO: Add tests for nginx-s3-gateway-fips image
{
  name = "nginx-s3-gateway-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nginx-s3-gateway-fips"
    exit 1
  '';
}
