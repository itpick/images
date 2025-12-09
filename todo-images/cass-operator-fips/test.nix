{ pkgs, lib, ... }:

# TODO: Add tests for cass-operator-fips image
{
  name = "cass-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cass-operator-fips"
    exit 1
  '';
}
