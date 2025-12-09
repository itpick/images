{ pkgs, lib, ... }:

# TODO: Add tests for vector-fips image
{
  name = "vector-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vector-fips"
    exit 1
  '';
}
