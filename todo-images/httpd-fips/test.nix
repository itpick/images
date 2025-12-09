{ pkgs, lib, ... }:

# TODO: Add tests for httpd-fips image
{
  name = "httpd-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for httpd-fips"
    exit 1
  '';
}
