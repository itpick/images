{ pkgs, lib, ... }:

# TODO: Add tests for postgres-fips image
{
  name = "postgres-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for postgres-fips"
    exit 1
  '';
}
