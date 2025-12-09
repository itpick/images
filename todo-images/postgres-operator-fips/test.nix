{ pkgs, lib, ... }:

# TODO: Add tests for postgres-operator-fips image
{
  name = "postgres-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for postgres-operator-fips"
    exit 1
  '';
}
