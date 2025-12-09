{ pkgs, lib, ... }:

# TODO: Add tests for harbor-portal-fips image
{
  name = "harbor-portal-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for harbor-portal-fips"
    exit 1
  '';
}
