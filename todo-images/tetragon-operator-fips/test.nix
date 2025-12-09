{ pkgs, lib, ... }:

# TODO: Add tests for tetragon-operator-fips image
{
  name = "tetragon-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tetragon-operator-fips"
    exit 1
  '';
}
