{ pkgs, lib, ... }:

# TODO: Add tests for openbao-fips image
{
  name = "openbao-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for openbao-fips"
    exit 1
  '';
}
