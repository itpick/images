{ pkgs, lib, ... }:

# TODO: Add tests for percona-server-mongodb-operator-fips image
{
  name = "percona-server-mongodb-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for percona-server-mongodb-operator-fips"
    exit 1
  '';
}
