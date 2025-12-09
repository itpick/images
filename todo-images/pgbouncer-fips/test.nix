{ pkgs, lib, ... }:

# TODO: Add tests for pgbouncer-fips image
{
  name = "pgbouncer-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pgbouncer-fips"
    exit 1
  '';
}
