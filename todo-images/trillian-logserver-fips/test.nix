{ pkgs, lib, ... }:

# TODO: Add tests for trillian-logserver-fips image
{
  name = "trillian-logserver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for trillian-logserver-fips"
    exit 1
  '';
}
