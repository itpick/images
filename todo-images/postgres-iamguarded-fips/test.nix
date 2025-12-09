{ pkgs, lib, ... }:

# TODO: Add tests for postgres-iamguarded-fips image
{
  name = "postgres-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for postgres-iamguarded-fips"
    exit 1
  '';
}
