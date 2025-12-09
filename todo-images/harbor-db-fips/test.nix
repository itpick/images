{ pkgs, lib, ... }:

# TODO: Add tests for harbor-db-fips image
{
  name = "harbor-db-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for harbor-db-fips"
    exit 1
  '';
}
