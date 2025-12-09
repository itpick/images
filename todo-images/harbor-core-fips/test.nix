{ pkgs, lib, ... }:

# TODO: Add tests for harbor-core-fips image
{
  name = "harbor-core-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for harbor-core-fips"
    exit 1
  '';
}
