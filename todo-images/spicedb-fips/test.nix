{ pkgs, lib, ... }:

# TODO: Add tests for spicedb-fips image
{
  name = "spicedb-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spicedb-fips"
    exit 1
  '';
}
