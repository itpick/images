{ pkgs, lib, ... }:

# TODO: Add tests for apache-hop-fips image
{
  name = "apache-hop-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for apache-hop-fips"
    exit 1
  '';
}
