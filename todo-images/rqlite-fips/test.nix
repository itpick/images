{ pkgs, lib, ... }:

# TODO: Add tests for rqlite-fips image
{
  name = "rqlite-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rqlite-fips"
    exit 1
  '';
}
