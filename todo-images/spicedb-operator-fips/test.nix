{ pkgs, lib, ... }:

# TODO: Add tests for spicedb-operator-fips image
{
  name = "spicedb-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spicedb-operator-fips"
    exit 1
  '';
}
