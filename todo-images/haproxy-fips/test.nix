{ pkgs, lib, ... }:

# TODO: Add tests for haproxy-fips image
{
  name = "haproxy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for haproxy-fips"
    exit 1
  '';
}
