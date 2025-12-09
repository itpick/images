{ pkgs, lib, ... }:

# TODO: Add tests for pgbouncer-iamguarded-fips image
{
  name = "pgbouncer-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pgbouncer-iamguarded-fips"
    exit 1
  '';
}
