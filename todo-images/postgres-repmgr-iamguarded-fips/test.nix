{ pkgs, lib, ... }:

# TODO: Add tests for postgres-repmgr-iamguarded-fips image
{
  name = "postgres-repmgr-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for postgres-repmgr-iamguarded-fips"
    exit 1
  '';
}
