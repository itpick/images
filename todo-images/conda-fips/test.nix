{ pkgs, lib, ... }:

# TODO: Add tests for conda-fips image
{
  name = "conda-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for conda-fips"
    exit 1
  '';
}
