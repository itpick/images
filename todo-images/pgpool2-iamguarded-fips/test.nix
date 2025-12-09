{ pkgs, lib, ... }:

# TODO: Add tests for pgpool2-iamguarded-fips image
{
  name = "pgpool2-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pgpool2-iamguarded-fips"
    exit 1
  '';
}
