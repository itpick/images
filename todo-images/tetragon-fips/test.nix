{ pkgs, lib, ... }:

# TODO: Add tests for tetragon-fips image
{
  name = "tetragon-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tetragon-fips"
    exit 1
  '';
}
