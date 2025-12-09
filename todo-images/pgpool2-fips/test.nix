{ pkgs, lib, ... }:

# TODO: Add tests for pgpool2-fips image
{
  name = "pgpool2-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pgpool2-fips"
    exit 1
  '';
}
