{ pkgs, lib, ... }:

# TODO: Add tests for haproxy-iamguarded-fips image
{
  name = "haproxy-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for haproxy-iamguarded-fips"
    exit 1
  '';
}
