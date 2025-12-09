{ pkgs, lib, ... }:

# TODO: Add tests for duckdb-fips image
{
  name = "duckdb-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for duckdb-fips"
    exit 1
  '';
}
