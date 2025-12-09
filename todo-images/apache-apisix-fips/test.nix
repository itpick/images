{ pkgs, lib, ... }:

# TODO: Add tests for apache-apisix-fips image
{
  name = "apache-apisix-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for apache-apisix-fips"
    exit 1
  '';
}
