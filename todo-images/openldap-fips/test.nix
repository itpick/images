{ pkgs, lib, ... }:

# TODO: Add tests for openldap-fips image
{
  name = "openldap-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for openldap-fips"
    exit 1
  '';
}
