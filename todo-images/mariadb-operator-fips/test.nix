{ pkgs, lib, ... }:

# TODO: Add tests for mariadb-operator-fips image
{
  name = "mariadb-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mariadb-operator-fips"
    exit 1
  '';
}
