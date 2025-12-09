{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-sql-fips image
{
  name = "crossplane-sql-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-sql-fips"
    exit 1
  '';
}
