{ pkgs, lib, ... }:

# TODO: Add tests for k6-operator-fips image
{
  name = "k6-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k6-operator-fips"
    exit 1
  '';
}
