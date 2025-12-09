{ pkgs, lib, ... }:

# TODO: Add tests for mysql-fips image
{
  name = "mysql-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mysql-fips"
    exit 1
  '';
}
