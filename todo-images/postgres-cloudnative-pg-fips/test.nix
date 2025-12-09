{ pkgs, lib, ... }:

# TODO: Add tests for postgres-cloudnative-pg-fips image
{
  name = "postgres-cloudnative-pg-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for postgres-cloudnative-pg-fips"
    exit 1
  '';
}
